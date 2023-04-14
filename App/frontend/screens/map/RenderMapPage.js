import React, { useRef, useState, useEffect } from 'react';

import { StyleSheet, View, Text } from 'react-native';

import * as Location from 'expo-location';

import MapView from 'react-native-map-clustering'; // For some reason this must be on it's own line
import { Marker } from 'react-native-maps';

import { mapStyles } from '../../styles/mapStyles';

import TrailData from '../../assets/data/TrailData.json';

const INITIAL_REGION = {
	latitude: 39.081311,
	longitude: -108.55511,
	latitudeDelta: 0.1,
	longitudeDelta: 0.1,
};

export const RenderMapPage = ({ children }) => {
	const [initialLocation, setInitialLocation] = useState({});

	const mapRef = useRef(null);

	let MarkerKey = 0;

	let raw = Object.entries(TrailData);

	const trailData = raw[3][1];

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
				console.log('***cords***: ', coords);
				const userRegion = {
					latitude: coords.latitude,
					longitude: coords.longitude,
					latitudeDelta: 0.1,
					longitudeDelta: 0.1,
				};
				setInitialLocation(userRegion);
				mapRef.current?.animateToRegion(userRegion);
				console.log('--- Location Set ---');
			} catch (error) {
				console.error(error);
			}
		})();
	}, []);

	console.log('initialLocation: ', initialLocation);

	if (!initialLocation.latitude) {
		return (
			<View>
				<Text>Loading...</Text>
			</View>
		);
	}

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
					{trailData.map(({ properties, geometry }) => (
						<Marker
							coordinate={{
								latitude: geometry['coordinates'][1],
								longitude: geometry['coordinates'][0],
							}}
							title={properties['Name']}
							key={(MarkerKey += 1)}
						/>
					))}
				</MapView>
				{children}
			</View>
		</View>
	);
};
