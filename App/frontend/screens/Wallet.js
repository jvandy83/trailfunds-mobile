import React, { useRef, useCallback, useMemo, useEffect } from 'react';
import {
	Text,
	View,
	TouchableOpacity,
	StyleSheet,
	Image,
	ScrollView,
} from 'react-native';

import {
	useGetCurrentBalanceQuery,
	useGetTransactionsQuery,
} from '../services/api';

import { useIsFocused } from '@react-navigation/native';

import {
	BottomSheetModal,
	BottomSheetModalProvider,
} from '@gorhom/bottom-sheet';

import uuid from 'react-native-uuid';

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

	const { data, error, isLoading } = useGetCurrentBalanceQuery({
		skip: !useIsFocused(),
	});

	const {
		data: transactionData,
		error: transactionError,
		isLoading: transactionLoading,
	} = useGetTransactionsQuery({ skip: !useIsFocused() });

	const renderItem = useCallback((item) => {
		console.log(item);
		return (
			<View key={uuid.v4()} style={styles.itemContainer}>
				<View
					style={{
						flexDirection: 'row',
						alignItems: 'center',
					}}
				>
					<View>
						<Text style={{ fontWeight: 'bold' }}>{item.trail.name}</Text>
						<Text style={{ fontWeight: 'bold' }}>{item.trail_org.name}</Text>
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
		);
	}, []);

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

	console.log('currentBalanceData inside Wallet!!!!!: ', data);
	console.log('transactionData inside Wallet!!!!!: ', transactionData);

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
						{isLoading ? '' : `$${data}.00`}
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
						onPress={() => navigation.navigate('WalletRefill')}
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
						<View>{transactionData.map(renderItem)}</View>
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
