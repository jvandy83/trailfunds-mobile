import React, { useRef } from 'react';

import { StyleSheet, View } from 'react-native';

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
	const mapRef = useRef(null);
	let MarkerKey = 0;
	let raw = Object.entries(TrailData);
	let parsed = raw[3][1];
	console.log('Rendering parent map component');
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
					provider={'google'}
					ref={mapRef}
					style={mapStyles.map}
					showsUserLocation={true}
					// onRegionChangeComplete={setLocation}
					initialRegion={INITIAL_REGION}
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
					{parsed.map(({ type, properties, geometry }) => (
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

