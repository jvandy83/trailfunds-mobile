import React, { useRef, useState, useEffect, useCallback } from 'react';

import { View, Text } from 'react-native';

import { useNavigation } from '@react-navigation/native';

import * as Location from 'expo-location';

import MapView, { PROVIDER_GOOGLE } from 'react-native-map-clustering'; // For some reason this must be on it's own line
import { Marker, Callout } from 'react-native-maps';

import { useSelector } from 'react-redux';

import { TrailDataBottomSheet } from './TrailDataBottomSheet';

import { useGetTrailsNearMeQuery } from '../../services/api';

import uuid from 'react-native-uuid';

import { mapStyles } from '../../styles/mapStyles';

// if you don't set your coordinates
// in your ios/android simulator
// to return your location from
// Location.getCurrentPositionAsync
// INITIAL_REGION will be used

const INITIAL_REGION = {
	latitude: 39.081311,
	longitude: -108.55511,
	latitudeDelta: 0.1,
	longitudeDelta: 0.1,
};

const INITIAL_RADIUS = '5';

export const Map = () => {
	const [radius, setRadius] = useState(INITIAL_RADIUS);

	const mapRef = useRef(null);

	const { location } = useSelector((state) => state.location);

	const navigation = useNavigation();

	const { data, error, isLoading } = useGetTrailsNearMeQuery({
		lat: location.latitude,
		lon: location.longitude,
		radius,
	});

	const handleCalloutPress = (id) => {
		navigation.navigate('Trail', { trailId: id });
	};

	const renderMarker = useCallback(
		({ latitude, longitude, name, id }) => (
			<Marker
				coordinate={{
					latitude,
					longitude,
				}}
				title={name}
				key={uuid.v4()}
			>
				<Callout onPress={() => handleCalloutPress(id)}>
					<View styles={{ width: 10 }}>
						<Text>{name}</Text>
					</View>
				</Callout>
			</Marker>
		),
		[],
	);

	useEffect(() => {
		(async () => {
			try {
				const { status } = await Location.requestForegroundPermissionsAsync();
				if (status === 'granted') {
					mapRef.current?.animateToRegion(location);
				} else {
					alert('Permission to access location was denied');
				}
			} catch (error) {
				console.error(error);
			}
		})();
	}, []);

	if (isLoading || !data) {
		return (
			<View
				style={{
					display: 'flex',
					justifyContent: 'center',
					alignItems: 'center',
				}}
			>
				<Text>Loading...</Text>
			</View>
		);
	}

	if (error) {
		console.error(error.detail);
	}

	return (
		<View style={{ position: 'relative' }}>
			<MapView
				provider={PROVIDER_GOOGLE}
				ref={mapRef}
				style={mapStyles.map}
				showsUserLocation={true}
				// onRegionChangeComplete={setLocation}
				initialRegion={location || INITIAL_REGION}
				loadingEnabled={true}
				loadingIndicatorColor='#666666'
				loadingBackgroundColor='#eeeeee'
				moveOnMarkerPress={false}
				showsCompass={true}
				showsPointsOfInterest={false}
				customMapStyle={[
					{ featureType: 'poi', stylers: [{ visibility: 'off' }] },
					{ featureType: 'transit', stylers: [{ visibility: 'off' }] },
				]}
			>
				{data.trails.map(renderMarker)}
			</MapView>
			<TrailDataBottomSheet
				radius={radius}
				data={data}
				setRadius={setRadius}
				locationData={location}
			/>
		</View>
	);
};
