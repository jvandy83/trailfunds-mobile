import { useState } from 'react';

import { useDispatch } from 'react-redux';

import {
	View,
	Image,
	TextInput,
	StyleSheet,
	Pressable,
	Text,
} from 'react-native';

import { Svg, Path, G } from 'react-native-svg';

import { useSignUpMutation, useLoginMutation } from '../services/api';

import { PrimaryButton } from '../styles/frontendStyles';

import { saveToken, setAuth } from '../reduxStore/features/auth/authSlice';

import {
	mountains,
	logo,
	googleIcon,
	facebookIcon,
	appleIcon,
} from '../assets/images';

export const SignIn = () => {
	const [newUser, setNewUser] = useState(false);
	const [values, setValues] = useState({});

	const [signUp, { isLoading, error, isSuccess, data }] = useSignUpMutation();
	// create alias due to multiple mutations
	// being called in the same module
	const [login, { isLoading: isLoginLoading, error: loginError }] =
		useLoginMutation();

	const dispatch = useDispatch();

	if (isLoading || isLoginLoading) {
		return (
			<View>
				<Text>Loading...</Text>
			</View>
		);
	}

	if (error || loginError) {
		const errorStatus = error || loginError;
		console.log(errorStatus.status);
		console.error(JSON.stringify(errorStatus.data));
	}

	const handleSubmit = async () => {
		if (newUser) {
			// calling unwrap makes the return
			// value available ready immediately
			signUp(values)
				.unwrap()
				.then(({ currentUser, accessToken }) => {
					saveToken('accessToken', accessToken);
					dispatch(setAuth({ token: accessToken, currentUser, isNew: true }));
				})
				.catch((err) => console.error(err));
		} else {
			login({ email: 'Bobdole@gmail.com', password: 'password' })
				.unwrap()
				.then(({ currentUser, accessToken }) => {
					console.log(currentUser);
					console.log(accessToken);
					saveToken('accessToken', accessToken);
					dispatch(setAuth({ token: accessToken, currentUser, isNew: false }));
				})
				.catch((err) => console.error(err));
		}
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
				<View
					style={{
						width: 200,
						height: 300,
						position: 'absolute',
						top: 200,
						left: 15,
					}}
				>
					<Svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 38.81 44.29'>
						<Path
							d='M24.91 18.22h-2.27V7.3h8.87c4.03 0 7.3-3.27 7.3-7.3s-5.55 0-5.55 0H7.3C3.27 0 0 3.27 0 7.3l14.8.06v36.93a7.84 7.84 0 0 0 7.84-7.84V25.59h9.63c0-4.07-3.3-7.36-7.36-7.36Z'
							style={{
								fill: '#5cc093',
							}}
						/>
					</Svg>
				</View>
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
								value={values.firstName || ''}
								onChangeText={(text) => handleChange(text, 'firstName')}
							/>
						</View>
						<View style={{ paddingVertical: 6, paddingHorizontal: 30 }}>
							<TextInput
								style={styles.loginInput}
								placeholder='last name'
								value={values.lastName || ''}
								onChangeText={(text) => handleChange(text, 'lastName')}
							/>
						</View>
					</View>
				)}
				<View style={{ paddingVertical: 6, paddingHorizontal: 30 }}>
					<TextInput
						style={styles.loginInput}
						placeholder='E-mail'
						value={values.email || ''}
						autoComplete='email'
						onChangeText={(text) => handleChange(text, 'email')}
					/>
				</View>
				<View style={{ paddingVertical: 6, paddingHorizontal: 30 }}>
					<TextInput
						style={styles.loginInput}
						placeholder='Password'
						value={values.password || ''}
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
