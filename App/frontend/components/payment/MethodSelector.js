import { Platform, StyleSheet, View, Text, Pressable } from 'react-native';

export const MethodSelector = ({ onPress, paymentMethod }) => {
	const paymentMethodLabel = paymentMethod?.label;
	// ...
	return (
		<View style={{ marginVertical: 48, width: '75%' }}>
			<Text
				style={{
					fontSize: 14,
					letterSpacing: 1.5,
					color: 'black',
					textTransform: 'uppercase',
				}}
			>
				Select payment method
			</Text>
			{/* If there's no paymentMethod selected, show the options */}
			{!paymentMethodLabel && (
				<Pressable
					onPress={onPress}
					style={{
						flexDirection: 'row',
						paddingVertical: 8,
						alignItems: 'center',
					}}
				>
					{Platform.select({
						ios: <Text style={styles.boldText}>Apple Pay</Text>,
						android: <Text style={styles.boldText}>Google Pay</Text>,
					})}

					<View style={[styles.selectButton, { marginLeft: 16 }]}>
						<Text style={[styles.boldText, { color: '#007DFF' }]}>Card</Text>
					</View>
				</Pressable>
			)}
			{/* If there's a paymentMethod selected, show it */}
			{!!paymentMethodLabel && (
				<Pressable
					onPress={onPress}
					style={{
						flexDirection: 'row',
						justifyContent: 'space-between',
						alignItems: 'center',
						paddingVertical: 8,
					}}
				>
					{paymentMethodLabel.toLowerCase().includes('apple') && (
						<Text style={styles.boldText}>Apple Pay</Text>
					)}
					{paymentMethodLabel.toLowerCase().includes('google') && (
						<Text style={styles.boldText}>Google Pay</Text>
					)}
					{!paymentMethodLabel.toLowerCase().includes('google') &&
						!paymentMethodLabel.toLowerCase().includes('apple') && (
							<View style={[styles.selectButton, { marginRight: 16 }]}>
								<Text style={[styles.boldText, { color: '#007DFF' }]}>
									{paymentMethodLabel}
								</Text>
							</View>
						)}
					<Text style={[styles.boldText, { color: '#007DFF', flex: 1 }]}>
						Change payment method
					</Text>
				</Pressable>
			)}
		</View>
	);
};

const styles = StyleSheet.create({
	// ...
	buyButton: {
		backgroundColor: '#007DFF',
		paddingHorizontal: 32,
		paddingVertical: 16,
		borderRadius: 8,
	},
	textButton: {
		paddingHorizontal: 32,
		paddingVertical: 16,
		borderRadius: 8,
		color: '#007DFF',
	},
	selectButton: {
		borderColor: '#007DFF',
		paddingHorizontal: 32,
		paddingVertical: 16,
		borderRadius: 8,
		borderWidth: 2,
	},
	boldText: {
		fontSize: 17,
		fontWeight: '700',
	},
});
