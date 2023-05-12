import React, { useRef, useState, useEffect, useCallback } from 'react';

import { View, Text } from 'react-native';

import * as Location from 'expo-location';

import MapView from 'react-native-map-clustering'; // For some reason this must be on it's own line
import { Marker } from 'react-native-maps';

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

export const Map = () => {
	const [radius, setRadius] = useState('5');

	const mapRef = useRef(null);

	const { location } = useSelector((state) => state.location);

	console.log('***location inside map***: ', location);

	const { data, error, isLoading } = useGetTrailsNearMeQuery({
		lat: location.latitude,
		lon: location.longitude,
		radius,
	});

	const renderMarker = useCallback(
		({ latitude, longitude, name }) => (
			<Marker
				coordinate={{
					latitude,
					longitude,
				}}
				title={name}
				key={uuid.v4()}
			/>
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

	console.log('***data***: ', data);

	return (
		<View style={{ position: 'relative' }}>
			<MapView
				provider={MapView.PROVIDER_GOOGLE}
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
