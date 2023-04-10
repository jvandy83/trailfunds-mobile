import {
	Pressable,
	View,
	Text,
	StyleSheet,
	ImageBackground,
} from 'react-native';

import { useDispatch } from 'react-redux';

import { loggedOut } from '../../reduxStore/features/auth/authSlice';

import { PrimaryButton } from '../../styles/frontendStyles';

import profilePic from '../../assets/images/profile-pic.jpeg';

export const CustomDrawerContent = ({ navigation }) => {
	const dispatch = useDispatch();

	return (
		<View style={styles.customContentContainer}>
			<View style={styles.header}>
				<View>
					<ImageBackground
						resizeMode='cover'
						borderRadius={100}
						style={styles.headerImage}
						source={profilePic}
					/>
					<Text style={styles.headerText}>Maeve</Text>
				</View>
			</View>
			<View style={styles.navigation}>
				<Pressable
					style={styles.contentItem}
					onPress={() => {
						// Navigate using the `navigation` prop that you received
						navigation.navigate('Dashboard');
					}}
				>
					<Text style={styles.contentText}>Home</Text>
				</Pressable>
				<Pressable
					style={styles.contentItem}
					onPress={() => {
						// Navigate using the `navigation` prop that you received
						navigation.navigate('Wallet');
					}}
				>
					<Text style={styles.contentText}>Wallet</Text>
				</Pressable>
				<Pressable
					style={styles.contentItem}
					onPress={() => {
						// Navigate using the `navigation` prop that you received
						navigation.navigate('Trail Map');
					}}
				>
					<Text style={styles.contentText}>Map</Text>
				</Pressable>
				<Pressable
					style={styles.contentItem}
					onPress={() => {
						// Navigate using the `navigation` prop that you received
						navigation.navigate('About');
					}}
				>
					<Text style={styles.contentText}>About Trail Funds</Text>
				</Pressable>
				<Pressable
					style={styles.contentItem}
					onPress={() => {
						// Navigate using the `navigation` prop that you received
						navigation.navigate('Help');
					}}
				>
					<Text style={styles.contentText}>Help</Text>
				</Pressable>
			</View>
			<View style={styles.footer}>
				<PrimaryButton
					onPress={() => dispatch(loggedOut())}
					text='Log Out'
					color='white'
				/>
			</View>
		</View>
	);
};

const styles = StyleSheet.create({
	customContentContainer: {
		flex: 1,
	},
	header: {
		paddingVertical: 50,
		justifyContent: 'center',
		alignItems: 'center',
		backgroundColor: '#59C092',
	},
	headerImage: {
		width: 110,
		height: 110,
	},
	headerText: {
		textAlign: 'center',
		fontSize: 20,
		fontWeight: 'bold',
		paddingTop: 24,
	},
	contentItem: {
		//...
		width: '100%',
		paddingLeft: 24,
		paddingVertical: 16,
		borderBottomWidth: 0.5,
		borderBottomColor: 'grey',
	},
	contentText: {
		fontSize: 16,
		fontWeight: 'bold',
	},
	footer: {
		flex: 1,
		height: 100,
		alignItems: 'center',
		justifyContent: 'center',
	},
});
