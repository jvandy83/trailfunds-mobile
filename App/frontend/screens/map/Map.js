import React, { useRef, useState, useEffect } from 'react';

import { StyleSheet, View, Text } from 'react-native';

import * as Location from 'expo-location';

import MapView from 'react-native-map-clustering'; // For some reason this must be on it's own line
import { Marker } from 'react-native-maps';

import { useGetTrailsNearMeQuery } from '../../services/api';

import { mapStyles } from '../../styles/mapStyles';

import TrailData from '../../assets/data/TrailData.json';

const INITIAL_REGION = {
	latitude: 39.081311,
	longitude: -108.55511,
	latitudeDelta: 0.1,
	longitudeDelta: 0.1,
};

let MARKER_KEY = 0;

let RAW_DATA = Object.entries(TrailData);

const TRAIL_DATA = RAW_DATA[3][1];

export const Map = ({ children }) => {
	const [initialLocation, setInitialLocation] = useState({});

	const mapRef = useRef(null);

	const { data, error, isLoading } = useGetTrailsNearMeQuery(
		{
			lat: initialLocation.latitude,
			lon: initialLocation.longitude,
			radius: 3,
		},
		{ skip: !initialLocation.latitude },
		{ refetchOnMountOrArgChange: true },
	);

	useEffect(() => {
		(async () => {
			try {
				const { status } = await Location.requestForegroundPermissionsAsync();
				if (status !== 'granted') return;
			} catch (error) {
				console.error(error);
			}
			try {
				const { coords } = await Location.getCurrentPositionAsync({
					accuracy: 6,
				});
				const userRegion = {
					latitude: coords.latitude,
					longitude: coords.longitude,
					latitudeDelta: 0.1,
					longitudeDelta: 0.1,
				};
				setInitialLocation(userRegion);
				mapRef.current?.animateToRegion(userRegion);
			} catch (error) {
				console.error(error);
			}
		})();
	}, []);

	if (!initialLocation.latitude || isLoading) {
		return (
			<View>
				<Text>Loading...</Text>
			</View>
		);
	}

	if (error) {
		console.error(error);
	}

	console.log(data);

	return (
		<View style={mapStyles.mapContainer}>
			<View
				style={StyleSheet.create({
					width: '100%',
					height: '100%',
					borderColor: '#80998e',
					borderTopWidth: 2,
				})}
			>
				<MapView
					provider={MapView.PROVIDER_GOOGLE}
					ref={mapRef}
					style={mapStyles.map}
					showsUserLocation={true}
					// onRegionChangeComplete={setLocation}
					initialRegion={initialLocation || INITIAL_REGION}
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
					{TRAIL_DATA.map(({ properties, geometry }) => (
						<Marker
							coordinate={{
								latitude: geometry['coordinates'][1],
								longitude: geometry['coordinates'][0],
							}}
							title={properties['Name']}
							key={(MARKER_KEY += 1)}
						/>
					))}
				</MapView>
			</View>
		</View>
	);
};
