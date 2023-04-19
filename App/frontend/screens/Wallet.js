import React, { useRef, useCallback, useMemo, useEffect } from 'react';
import {
	Text,
	View,
	TouchableOpacity,
	StyleSheet,
	Image,
	ScrollView,
} from 'react-native';

import { useGetUserQuery } from '../services/api';

import { MainLayout } from '../components/layout/MainLayout';

import {
	BottomSheetModal,
	BottomSheetModalProvider,
} from '@gorhom/bottom-sheet';

import uuid from 'react-native-uuid';

import { defaults } from '../styles/frontendStyles';

import { forrestService } from '../assets/images';

const mockData = [
	{
		name: 'Lunch Loops',
		trailService: 'National Forest Service',
		amount: '5',
	},
	{
		name: '18 Rd Trails',
		trailService: 'National Forest Service',
		amount: '2',
	},
	{
		name: 'Kokopelli Trail',
		trailService: 'National Forest Service',
		amount: '1',
	},
];

export const Wallet = ({ navigation }) => {
	const bottomSheetModalRef = useRef(null);

	const { data, error, isLoading } = useGetUserQuery();

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

	const renderItem = useCallback(
		(item) => (
			<View key={uuid.v4()} style={styles.itemContainer}>
				<View
					style={{
						flexDirection: 'row',
						alignItems: 'center',
					}}
				>
					<View style={{ paddingRight: 8 }}>
						<Image style={{ width: 24, height: 24 }} source={forrestService} />
					</View>
					<View>
						<Text style={{ fontWeight: 'bold' }}>{item.name}</Text>
						<Text style={{ fontWeight: 'bold' }}>{item.trailService}</Text>
					</View>
				</View>
				<Text
					style={{
						fontSize: 28,
						fontWeight: 'bold',
						color: '#59C092',
					}}
				>
					{`$${item.amount}`}
				</Text>
			</View>
		),
		[],
	);

	// callbacks
	const handleSheetChanges = useCallback((index) => {
		// this keeps modal from closing all the way
		// and leaving the screen
		bottomSheetModalRef.current?.present();
	}, []);

	const snapPoints = useMemo(() => ['25%', '40%', '60%']);

	useEffect(() => {
		bottomSheetModalRef.current?.present();
	}, []);

	return (
		<View style={{ position: 'relative' }}>
			<View
				style={{
					paddingTop: 180,
					width: '100%',
					height: '100%',
					backgroundColor: '#59C0922C',
					alignItems: 'center',
					flexGrow: 1,
				}}
			>
				<View
					style={{
						height: 200,
						width: '80%',
						alignItems: 'center',
						justifyContent: 'center',
						backgroundColor: '#59C092',
						borderRadius: 20,
						elevation: 5,
						shadowColor: 'rgba(0, 0, 0, 0.3)',
						shadowOpacity: 0.8,
						shadowRadius: 6,
						shadowOffset: {
							height: 1,
							width: 1,
						},
					}}
				>
					<Text
						style={{
							color: 'white',
							fontSize: 55,
							fontWeight: 'bold',
						}}
					>
						$10.00
					</Text>
				</View>

				<View
					style={{
						flexDirection: 'row',
						alignItems: 'center',
						justifyContent: 'space-around',
						width: '80%',
						paddingTop: 30,
					}}
				>
					<TouchableOpacity
						onPress={() => navigation.navigate('Donate')}
						style={{
							alignItems: 'center',
							borderRadius: 100,
							paddingVertical: 14,
							backgroundColor: '#59C092',
							width: '40%',
						}}
					>
						<Text style={{ color: 'white', fontWeight: 'bold' }}>
							Add Funds
						</Text>
					</TouchableOpacity>
					<TouchableOpacity
						style={{
							alignItems: 'center',
							borderRadius: 100,
							paddingVertical: 14,
							width: '50%',
							paddingHorizontal: 10,
							borderColor: 'black',
							borderWidth: 1,
						}}
					>
						<Text>Change Design</Text>
					</TouchableOpacity>
				</View>
			</View>

			<BottomSheetModalProvider>
				<BottomSheetModal
					ref={bottomSheetModalRef}
					index={1}
					snapPoints={snapPoints}
					onChange={handleSheetChanges}
				>
					<ScrollView contentContainerStyle={styles.contentContainer}>
						<View>
							<Text
								style={{
									fontSize: 30,
									fontWeight: 'bold',
									color: '#59C092',
									marginBottom: 20,
								}}
							>
								Transactions
							</Text>
						</View>
						<View>{mockData.map(renderItem)}</View>
					</ScrollView>
				</BottomSheetModal>
			</BottomSheetModalProvider>
		</View>
	);
};

const styles = StyleSheet.create({
	contentContainer: {
		paddingHorizontal: 30,
		paddingVertical: 30,
	},
	itemContainer: {
		flexDirection: 'row',
		justifyContent: 'space-between',
		alignItems: 'center',
		paddingHorizontal: 10,
		marginVertical: 10,
	},
});
