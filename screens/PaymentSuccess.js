import { useRef, useCallback, useMemo } from 'react';

import { StyleSheet, Text, View } from 'react-native';

import { useNavigation, useFocusEffect } from '@react-navigation/native';

import { useGetTransactionQuery } from '../services/api';

import {
	BottomSheetModal,
	BottomSheetModalProvider,
} from '@gorhom/bottom-sheet';

import { PrimaryButton } from '../styles/frontendStyles';

import { faCheckCircle } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-native-fontawesome';

export const PaymentSuccess = ({ route }) => {
	const bottomSheetModalRef = useRef(null);

	const { transactionId } = route.params;

	const { navigate } = useNavigation();

	const { data, isLoading, error } = useGetTransactionQuery(transactionId);

	const handleSheetChanges = useCallback((index) => {
		// this keeps modal from closing all the way
		// and leaving the screen
		bottomSheetModalRef.current?.present();
	}, []);

	const snapPoints = useMemo(() => ['12%', '30%', '60%']);

	useFocusEffect(() => bottomSheetModalRef.current?.present());

	if (isLoading) {
		return <Text>Loading...</Text>;
	}

	if (error) {
		console.error(error.data);
	}

	return (
		<View style={styles.centeredView}>
			<View style={{ marginBottom: 20 }}>
				<FontAwesomeIcon size={60} icon={faCheckCircle} />
			</View>
			<Text style={styles.header}>Payment Successful</Text>
			<Text style={styles.subHeader}>Thank you for your help!</Text>
			<View style={styles.details}>
				<Text style={styles.detailTitle}>Confirmation Number:</Text>
				<Text style={styles.detailText}>{data.confirmation_number}</Text>
			</View>
			<PrimaryButton
				color='white'
				onPress={() => navigate('Wallet', { fromScreen: 'PaymentSuccess' })}
				text='Done'
			/>
			<BottomSheetModalProvider>
				<BottomSheetModal
					style={{
						elevation: 5,
						shadowColor: 'rgba(0, 0, 0, 0.3)',
						shadowOpacity: 0.8,
						shadowRadius: 6,
						shadowOffset: {
							height: 1,
							width: 1,
						},
					}}
					ref={bottomSheetModalRef}
					index={1}
					snapPoints={snapPoints}
					onChange={handleSheetChanges}
				>
					<View style={styles.contentContainer}>
						<Text
							style={{
								fontSize: 30,
								fontWeight: 'bold',
								color: '#59C092',
								marginBottom: 20,
							}}
						>
							Receipt
						</Text>
						<View
							style={{
								flexDirection: 'row',
								alignItems: 'center',
								justifyContent: 'space-between',
								paddingVertical: 10,
							}}
						>
							<Text style={{ fontWeight: 'bold' }}>Date:</Text>
							<View style={{ flexDirection: 'row' }}>
								<Text style={{ paddingRight: 8 }}>{` ${new Date(
									data.created_at,
								).toLocaleDateString()}`}</Text>
								<Text>{` ${new Date(
									data.created_at,
								).toLocaleTimeString()}`}</Text>
							</View>
						</View>
						<View
							style={{
								flexDirection: 'row',
								alignItems: 'center',
								justifyContent: 'space-between',
								paddingVertical: 10,
							}}
						>
							<Text style={{ fontWeight: 'bold' }}>Trail:</Text>
							<Text>{data.trail.name}</Text>
						</View>
						<View
							style={{
								flexDirection: 'row',
								alignItems: 'center',
								justifyContent: 'space-between',
								paddingVertical: 10,
							}}
						>
							<Text style={{ fontWeight: 'bold' }}>Trail Org:</Text>
							<Text>{data.trail_org.name}</Text>
						</View>
						<View
							style={{
								flexDirection: 'row',
								alignItems: 'center',
								justifyContent: 'space-between',
								paddingVertical: 10,
							}}
						>
							<Text style={{ fontWeight: 'bold' }}>Donation Amount</Text>
							<Text>{`$${data.amount / 100}.00`}</Text>
						</View>
						<View
							style={{
								flexDirection: 'row',
								alignItems: 'center',
								justifyContent: 'space-between',
								paddingVertical: 10,
							}}
						>
							<Text style={{ fontWeight: 'bold' }}>Confirmation Number</Text>
							<Text>{data.confirmation_number}</Text>
						</View>
					</View>
				</BottomSheetModal>
			</BottomSheetModalProvider>
		</View>
	);
};

const styles = StyleSheet.create({
	contentContainer: {
		paddingVertical: '5%',
		paddingHorizontal: '10%',
	},
	centeredView: {
		paddingTop: '40%',
		width: '100%',
		height: '100%',
		alignItems: 'center',
		flexGrow: 1,
	},
	header: {
		marginBottom: '5%',
		fontSize: 32,
		fontWeight: 'bold',
	},
	subHeader: {
		marginBottom: '10%',
		textAlign: 'center',
		color: '#59C092',
		fontWeight: '600',
		fontSize: 18,
	},
	details: { alignItems: 'center' },
	detailTitle: { fontWeight: 'bold', marginBottom: '3%' },
	detailText: { marginBottom: '5%' },
});
