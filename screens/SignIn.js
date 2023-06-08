import { useState, useEffect } from 'react';

import { useDispatch } from 'react-redux';

import {
	View,
	Image,
	TextInput,
	StyleSheet,
	Pressable,
	Text,
	Platform,
	KeyboardAvoidingView,
	Keyboard,
} from 'react-native';

import { saveToken, setAuth } from '../reduxStore/features/auth/authSlice';

import { Svg, Path, G } from 'react-native-svg';

import { useSignUpMutation, useLoginMutation } from '../services/api';

import { HideKeyboard } from '../components/hideKeyboard';

import { PrimaryButton } from '../styles/frontendStyles';

import {
	mountains,
	googleIcon,
	facebookIcon,
	appleIcon,
} from '../assets/images';

export const SignIn = () => {
	const [newUser, setNewUser] = useState(false);
	const [values, setValues] = useState({});

	const [keyboardIsShowing, setKeyboardIsShowing] = useState(false);

	const [signUp, { isLoading, error }] = useSignUpMutation();
	// create alias due to multiple mutations
	// being called in the same module
	const [login, { isLoading: isLoginLoading, error: loginError }] =
		useLoginMutation();

	const dispatch = useDispatch();

	const handleSubmit = async () => {
		if (newUser) {
			// calling unwrap makes the return
			// value available ready immediately
			signUp({ ...values, isNew: true })
				.unwrap()
				.then(({ currentUser, accessToken }) => {
					saveToken('accessToken', accessToken);
					dispatch(setAuth({ token: accessToken, currentUser }));
				})
				.catch((error) => console.error(error.detail));
		} else {
			login({
				email: 'bryan@bryanwachs.com',
				password: '1234',
				isNew: false,
			})
				.unwrap()
				.then(({ currentUser, accessToken }) => {
					saveToken('accessToken', accessToken);
					dispatch(setAuth({ token: accessToken, currentUser }));
				})
				.catch((error) => console.error(error.detail));
		}
	};

	const handleChange = (text, inputType) => {
		setValues((prev) => ({
			...prev,
			[inputType]: text,
		}));
	};

	useEffect(() => {
		const keyboardDidHideListener = Keyboard.addListener(
			'keyboardDidHide',
			() => {
				setKeyboardIsShowing(false);
			},
		);
		const keyboardDidShowListener = Keyboard.addListener(
			'keyboardDidShow',
			() => {
				setKeyboardIsShowing(true);
			},
		);
		return () => {
			keyboardDidHideListener.remove();
			keyboardDidShowListener.remove();
		};
	}, []);

	if (isLoading || isLoginLoading) {
		return (
			<View>
				<Text>Loading...</Text>
			</View>
		);
	}

	if (error || loginError) {
		const errorStatus = error || loginError;
		console.log(errorStatus.detail);
	}

	return (
		<KeyboardAvoidingView
			behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
			style={{ backgroundColor: '#fff' }}
		>
			<HideKeyboard>
				<View style={{ marginBottom: keyboardIsShowing && '80%' }}>
					{keyboardIsShowing ? (
						<View
							style={{
								position: 'relative',
								backgroundColor: '#fff',
								height: '100%',
								width: '100%',
							}}
						></View>
					) : (
						<View>
							<Image
								source={mountains}
								style={{ height: '100%', width: '100%' }}
								resize='center'
							/>
						</View>
					)}
					<Text
						style={{
							position: 'absolute',
							fontSize: 30,
							fontWeight: 'bold',
							color: '#414d59',
							top: '52%',
							right: 40,
							zIndex: 800,
							textShadowOffset: { width: 2, height: 2 },
							textShadowColor: 'rgba(0, 0, 0, 0.4)',
							textShadowRadius: 5,
						}}
					>
						{`${newUser ? 'Sign Up' : 'Log In'}`}
					</Text>
					{!keyboardIsShowing && (
						<View
							style={{
								position: 'absolute',
							}}
						>
							<Svg
								style={{
									marginTop: '25%',
								}}
								width={1024}
								height={768}
								viewbox='0 0 100 100'
							>
								<G>
									<Path
										id='svg_1'
										fill='white'
										stroke='white'
										d='m0,80q100,-130, 200,0t250,0l0,800l-500,0l0,-100l0,770l0,-700l0,-70l0,100l0,-80l0,30l0,-20l0,-20l0,-10z'
									/>
								</G>
							</Svg>
						</View>
					)}
					<View
						style={{
							width: keyboardIsShowing ? 50 : 200,
							height: keyboardIsShowing ? 75 : 350,
							position: 'absolute',
							marginTop: keyboardIsShowing ? '12%' : '32%',
							left: 15,
							zIndex: 200,
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
								<View
									style={{
										paddingVertical: '1.5%',
										paddingHorizontal: 30,
									}}
								>
									<TextInput
										style={styles.loginInput}
										placeholder='first name'
										value={values.firstName || ''}
										onChangeText={(text) => handleChange(text, 'firstName')}
									/>
								</View>
								<View
									style={{ paddingVertical: '1.5%', paddingHorizontal: 30 }}
								>
									<TextInput
										style={styles.loginInput}
										placeholder='last name'
										value={values.lastName || ''}
										onChangeText={(text) => handleChange(text, 'lastName')}
									/>
								</View>
							</View>
						)}
						<View style={{ paddingVertical: '1.5%', paddingHorizontal: 30 }}>
							<TextInput
								style={styles.loginInput}
								placeholder='E-mail'
								value={values.email || ''}
								autoComplete='email'
								onChangeText={(text) => handleChange(text, 'email')}
							/>
						</View>
						<View style={{ paddingVertical: '1.5%', paddingHorizontal: 30 }}>
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
									<View
										style={{
											flexDirection: 'row',
											marginTop: 20,
										}}
									>
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
			</HideKeyboard>
		</KeyboardAvoidingView>
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
