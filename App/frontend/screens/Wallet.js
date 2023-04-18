import React, { useRef, useCallback, useMemo } from 'react';
import { Text, View, TouchableOpacity, StyleSheet, Image } from 'react-native';

import { useGetUserQuery } from '../services/api';

import { PageContainer } from '../components/layout/PageContainer';

import BottomSheet, { BottomSheetScrollView } from '@gorhom/bottom-sheet';

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
	const sheetRef = useRef(null);

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
			<View key={item.name} style={styles.itemContainer}>
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
	const handleSheetChange = useCallback((index) => {
		// console.log('handleSheetChange', index);
	}, []);

	const snapPoints = useMemo(() => ['25%', '50%', '75%'], []);

	return (
		<PageContainer styleProp={defaults.background}>
			<View style={{ width: '80%', marginTop: -250 }}>
				<View
					style={{
						height: 200,
						width: '100%',
						backgroundColor: '#59C092',
						borderRadius: 20,
						shadowColor: 'rgba(0, 0, 0, 0.3)',
						shadowOpacity: 0.8,
						shadowRadius: 6,
						shadowOffset: {
							height: 1,
							width: 1,
						},
					}}
				></View>

				<View
					style={{
						position: 'relative',
						flexDirection: 'row',
						justifyContent: 'space-around',
						width: '100%',
						marginVertical: 30,
						fontWeight: 'bold',
					}}
				>
					<Text
						style={{
							position: 'absolute',
							bottom: 145,
							left: 50,
							color: 'white',
							fontSize: 55,
							fontWeight: 'bold',
						}}
					>
						$10.00
					</Text>
					<View
						style={{
							flexDirection: 'row',
							alignItems: 'center',
							justifyContent: 'space-around',
						}}
					>
						<TouchableOpacity
							onPress={navigation.navigate('Donate')}
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
			</View>
			<View style={styles.container}>
				<BottomSheet
					ref={sheetRef}
					index={1}
					snapPoints={snapPoints}
					onChange={handleSheetChange}
				>
					<BottomSheetScrollView
						contentContainerStyle={styles.contentContainer}
					>
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
						{mockData.map(renderItem)}
					</BottomSheetScrollView>
				</BottomSheet>
			</View>
		</PageContainer>
	);
};

const styles = StyleSheet.create({
	container: {
		position: 'absolute',
		left: 0,
		right: 0,
		bottom: 0,
		height: '100%',
		shadowColor: 'rgba(0, 0, 0, 0.3)',
		shadowOpacity: 0.8,
		shadowRadius: 6,
		shadowOffset: {
			height: 1,
			width: 1,
		},
	},
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
