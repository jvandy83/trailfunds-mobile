import { useRef, useCallback, useMemo } from 'react';

import { StyleSheet, Text, View } from 'react-native';

import { useNavigation, useFocusEffect } from '@react-navigation/native';

import {
	BottomSheetModal,
	BottomSheetModalProvider,
} from '@gorhom/bottom-sheet';

import { PrimaryButton } from '../styles/frontendStyles';

import { faCheckCircle } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-native-fontawesome';

export const PaymentSuccess = () => {
	const bottomSheetModalRef = useRef(null);

	const navigation = useNavigation();

	const handleSheetChanges = useCallback((index) => {
		// this keeps modal from closing all the way
		// and leaving the screen
		bottomSheetModalRef.current?.present();
	}, []);

	const snapPoints = useMemo(() => ['25%', '30%', '60%']);

	useFocusEffect(() => bottomSheetModalRef.current?.present());

	return (
		<View style={styles.centeredView}>
			<View style={{ marginBottom: 20 }}>
				<FontAwesomeIcon size={60} icon={faCheckCircle} />
			</View>
			<Text style={styles.header}>Payment Successful</Text>
			<Text style={styles.subHeader}>Thank you for your help!</Text>
			<View style={styles.details}>
				<Text style={styles.detailHeader}>Confirmation Number:</Text>
				<Text style={styles.detailText}>5749000045f8f8</Text>
			</View>
			<PrimaryButton
				color='white'
				onPress={() =>
					navigation.navigate('Wallet', { fromScreen: 'PaymentSuccess' })
				}
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
								<Text
									style={{ paddingRight: 8 }}
								>{` ${new Date().toLocaleDateString()}`}</Text>
								<Text>{` ${new Date().toLocaleTimeString()}`}</Text>
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
							<Text>Heatherwood Trail</Text>
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
							<Text>COPMOBA</Text>
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
							<Text>$2.00</Text>
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
							<Text>5749000045f8f8</Text>
						</View>
					</View>
				</BottomSheetModal>
			</BottomSheetModalProvider>
		</View>
	);
};

const styles = StyleSheet.create({
	contentContainer: {
		paddingVertical: 30,
		paddingHorizontal: 30,
	},
	itemContainer: {
		flexDirection: 'row',
		justifyContent: 'space-between',
		alignItems: 'center',
		paddingHorizontal: 10,
		marginVertical: 10,
	},
	centeredView: {
		paddingTop: 180,
		width: '100%',
		height: '100%',
		alignItems: 'center',
		flexGrow: 1,
	},
	header: {
		marginBottom: 15,
		fontSize: 32,
		fontWeight: 'bold',
	},
	subHeader: {
		marginBottom: 60,
		textAlign: 'center',
		color: '#59C092',
		fontWeight: 600,
		fontSize: 18,
	},
	details: { alignItems: 'center' },
	detailHeader: { fontWeight: 'bold', marginBottom: 8 },
	detailText: { marginBottom: 15 },
});
