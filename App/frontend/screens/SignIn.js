import { useState } from 'react';

import {
	View,
	Image,
	TextInput,
	StyleSheet,
	Pressable,
	Text,
} from 'react-native';

import { Svg, Path, G } from 'react-native-svg';

import { useSignUpMutation } from '../services/api/auth';

import { PrimaryButton } from '../styles/frontendStyles';

import {
	mountains,
	logo,
	googleIcon,
	facebookIcon,
	appleIcon,
} from '../assets/images';

export const SignIn = ({ navigation }) => {
	const [newUser, setNewUser] = useState(false);
	const [values, setValues] = useState({ email: '', password: '' });
	const [signUp, result] = useSignUpMutation();

	const handleSubmit = () => {
		signUp(values)
			.unwrap()
			.then((data) => {
				console.log('data inside thenable signup function: ', data);
				const { id, isNew } = data;
				navigation.navigate('Dashboard', { userId: id, isNew });
			})
			.catch((rejected) => console.error(rejected));
	};

	const handleChange = (text, inputType) => {
		setValues((prev) => ({
			...prev,
			[inputType]: text,
		}));
	};
	return (
		<View>
			<View>
				<Image
					source={mountains}
					style={{ height: '100%', width: '100%' }}
					resize='center'
				/>
			</View>
			<Text
				style={{
					position: 'absolute',
					fontSize: 30,
					fontWeight: 'bold',
					color: '#59C092',
					top: 456,
					right: 40,
					zIndex: 800,
					textShadowOffset: { width: 2, height: 2 },
					textShadowColor: 'rgba(0, 0, 0, 0.2)',
					textShadowRadius: 10,
				}}
			>
				{`${newUser ? 'Sign Up' : 'Log In'}`}
			</Text>
			<View
				style={{
					position: 'absolute',
					zIndex: 100,
				}}
			>
				<Svg
					style={{ transform: [{ translateY: 300 }] }}
					width={1024}
					height={768}
					viewbox='0 0 100 100'
				>
					<G>
						<Path
							id='svg_1'
							fill='white'
							stroke='white'
							d='m0,80q100,-130 200,0t200,0l0,500l-500,0l0,-100l0,770l0,-700l0,-70l0,100l0,-80l0,30l0,-20l0,-20l0,-10z'
						/>
					</G>
				</Svg>
				<Image
					source={logo}
					style={{
						width: 200,
						height: 300,
						position: 'absolute',
						top: 200,
						left: 15,
					}}
					resize='center'
				/>
			</View>
			<View
				style={{
					position: 'absolute',
					zIndex: 500,
					width: '100%',
					height: '50%',
					bottom: -80,
				}}
			>
				{newUser && (
					<View>
						<View style={{ paddingVertical: 6, paddingHorizontal: 30 }}>
							<TextInput
								style={styles.loginInput}
								placeholder='first name'
								value={values.firstName}
								onChangeText={(text) => handleChange(text, 'firstName')}
							/>
						</View>
						<View style={{ paddingVertical: 6, paddingHorizontal: 30 }}>
							<TextInput
								style={styles.loginInput}
								placeholder='last name'
								value={values.lastName}
								onChangeText={(text) => handleChange(text, 'lastName')}
							/>
						</View>
					</View>
				)}
				<View style={{ paddingVertical: 6, paddingHorizontal: 30 }}>
					<TextInput
						style={styles.loginInput}
						placeholder='E-mail'
						value={values.email}
						autoComplete='email'
						onChangeText={(text) => handleChange(text, 'email')}
					/>
				</View>
				<View style={{ paddingVertical: 6, paddingHorizontal: 30 }}>
					<TextInput
						style={styles.loginInput}
						placeholder='Password'
						value={values.password}
						autoComplete='password-new'
						secureTextEntry={true}
						onChangeText={(text) => handleChange(text, 'password')}
					/>
				</View>
				<View style={{ alignItems: 'center' }}>
					<PrimaryButton
						onPress={handleSubmit}
						text={`${!newUser ? 'Log in' : 'Sign up'}`}
						color='white'
					/>
					{newUser && (
						<Pressable onPress={() => setNewUser(false)}>
							<Text style={{ fontWeight: 'bold' }}>Log In</Text>
						</Pressable>
					)}
					{!newUser && (
						<View style={{ alignItems: 'center' }}>
							<View style={{ flexDirection: 'row' }}>
								<Pressable
									onPress={() => setNewUser(true)}
									style={{
										borderRadius: 100,
										paddingVertical: 10,
										paddingHorizontal: 20,
										borderWidth: 1,
										borderColor: 'black',
										margin: 4,
									}}
								>
									<View style={{ alignItems: 'center' }}>
										<Text>New User</Text>
									</View>
								</Pressable>
								<Pressable
									style={{
										backgroundColor: 'black',
										borderRadius: 100,
										paddingVertical: 10,
										paddingHorizontal: 20,
										borderWidth: 1,
										borderColor: 'black',
										backgroundColor: 'black',
										margin: 4,
									}}
								>
									<View style={{ alignItems: 'center' }}>
										<Text style={{ color: 'white' }}>Forgot Password</Text>
									</View>
								</Pressable>
							</View>
							<View
								style={{
									flexDirection: 'row',
									alignItems: 'center',
								}}
							>
								<View
									style={{
										borderBottomColor: 'black',
										borderBottomWidth: 1,
										paddingVertical: 10,
										paddingHorizontal: 10,
										width: '30%',
									}}
								/>
								<Text
									style={{
										transform: [{ translateY: 9 }],
										paddingHorizontal: 3,
									}}
								>
									OR
								</Text>
								<View
									style={{
										borderBottomColor: 'black',
										borderBottomWidth: 1,
										paddingVertical: 10,
										paddingHorizontal: 10,
										width: '30%',
									}}
								/>
							</View>
							<View style={{ flexDirection: 'row', marginTop: 20 }}>
								<Image
									source={googleIcon}
									style={{ width: 50, height: 50, marginHorizontal: 30 }}
									resize='center'
								/>
								<Image
									source={appleIcon}
									style={{ width: 50, height: 50, marginHorizontal: 30 }}
									resize='center'
								/>
								<Image
									source={facebookIcon}
									style={{ width: 50, height: 50, marginHorizontal: 30 }}
									resize='center'
								/>
							</View>
						</View>
					)}
				</View>
			</View>
		</View>
	);
};

const styles = StyleSheet.create({
	loginInput: {
		backgroundColor: 'white',
		paddingVertical: 10,
		paddingHorizontal: 20,
		borderRadius: 100,
		borderColor: 'rgba(0, 0, 0, 0.2)',
		borderWidth: 1,
	},
});
