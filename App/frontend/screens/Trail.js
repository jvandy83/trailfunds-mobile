import { useRef, useState, useEffect } from 'react';

import { View, Text } from 'react-native';

import * as Location from 'expo-location';
import MapView from 'react-native-map-clustering';
import { Marker } from 'react-native-maps';

import { useGetTrailQuery } from '../services/api';

import { MainLayout } from '../components/layout/MainLayout';

import { PrimaryButton, SecondaryButton } from '../styles/frontendStyles';

import { defaults } from '../styles/frontendStyles';

import { mapStyles } from '../styles/mapStyles';

export const Trail = ({ route, navigation }) => {
	const mapRef = useRef(null);

	const { trailId } = route.params;

	useEffect(() => {
		(async () => {
			try {
				const { status } = await Location.requestForegroundPermissionsAsync();
				if (status !== 'granted') return;
			} catch (error) {
				console.error(error);
			}
		})();
	}, []);

	const { data, isLoading, error } = useGetTrailQuery(trailId);

	if (isLoading) {
		return (
			<View>
				<Text>Loading...</Text>
			</View>
		);
	}

	if (error) {
		console.error(error);
	}

	const initialLocation = {
		latitude: data.trail.latitude,
		longitude: data.trail.longitude,
		latitudeDelta: 0.1,
		longitudeDelta: 0.1,
	};

	mapRef.current?.animateToRegion(initialLocation);

	return (
		<MainLayout styleProp={defaults.background}>
			<View
				style={{
					width: 250,
					height: 250,
					borderRadius: 100,
					marginBottom: 20,
				}}
			>
				<View style={{ borderRadius: 100, overflow: 'hidden' }}>
					<MapView
						provider={MapView.PROVIDER_GOOGLE}
						ref={mapRef}
						style={mapStyles.map}
						showsUserLocation={true}
						// onRegionChangeComplete={setLocation}
						initialRegion={initialLocation}
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
						<Marker
							coordinate={{
								latitude: data.trail.latitude,
								longitude: data.trail.longitude,
							}}
							title={data.trail.name}
						/>
					</MapView>
				</View>
			</View>
			<View style={{ alignItems: 'center', width: '90%' }}>
				<Text
					style={{
						fontWeight: 'bold',
						fontSize: 30,
						paddingVertical: 20,
						color: '#59C092',
						textAlign: 'center',
					}}
				>
					{data.trail.name}
				</Text>
				<Text>
					<Text style={{ fontWeight: 'bold', fontSize: 16 }}>Trail Org:</Text>
					<Text style={{ fontSize: 16 }}> COPMOBA</Text>
				</Text>
			</View>
			<View style={{ alignItems: 'center', marginTop: 30 }}>
				<PrimaryButton
					text='Donate $1'
					color='white'
					onPress={() => navigation.navigate('Donate')}
				/>
			</View>
			<View style={{ alignItems: 'center' }}>
				<SecondaryButton
					text='Custom Amount'
					color='white'
					onPress={() =>
						navigation.navigate('Donate', { trailId: data.trail.id })
					}
				/>
			</View>
		</MainLayout>
	);
};
