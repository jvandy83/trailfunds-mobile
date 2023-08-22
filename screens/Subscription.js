import React, { useState, useEffect } from 'react';
import { Text, View, Linking } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { useAddSubscriptionMutation } from '../services/api';
import { PrimaryButton, SecondaryButton } from '../styles/frontendStyles';
import { MainLayout } from '../components/layout/MainLayout';

export const Subscription = ({ route }) => {
	const { trailId } = route.params;
	const [subscriptionPlan, setSubscriptionPlan] = useState({
		basic: 'prod_OTpYhdZkemNTI0',
		premium: 'prod_OTpY3ruCpktlQL',
	});
	const [sessionId, setSessionId] = useState('');
	const [checkoutSuccess, setCheckoutSuccess] = useState({
		success: false,
		url: '',
	});
	const { navigate } = useNavigation();
	const [addSubscription, { isSuccess }] = useAddSubscriptionMutation();
	const handleSubscriptionClick = async (productId) => {
		try {
			const { data } = await addSubscription(productId);
			setSessionId(data.session_id);
			setCheckoutSuccess((prev) => ({
				...prev,
				success: true,
				url: data.url,
			}));
			console.log('data in subscription: ', data);
		} catch (error) {
			console.error(error);
		}
	};
	useEffect(() => {
		checkoutSuccess.success &&
			Linking.openURL(checkoutSuccess.url).catch((err) =>
				console.error('An error occurred', err),
			);
		() => setCheckoutSuccess(false);
	}, [checkoutSuccess]);
	return (
		<MainLayout
			styleProp={{
				height: '100%',
				width: '100%',
				alignItems: 'center',
				justifyContent: 'center',
			}}
		>
			<View style={{ alignItems: 'center', paddingHorizontal: 30 }}>
				<View>
					<View>
						<View>
							<Text>Basic plan</Text>
							<Text>$5.00 / month</Text>
						</View>
					</View>
					{/* Add a hidden field with the lookup_key of your Price */}
					<PrimaryButton
						onPress={() => handleSubscriptionClick(subscriptionPlan.basic)}
						text='Checkout'
						color='white'
					/>
				</View>
				<View>
					<View>
						<View>
							<Text>Premium plan</Text>
							<Text>$20.00 / month</Text>
						</View>
					</View>
					{/* Add a hidden field with the lookup_key of your Price */}
					<PrimaryButton
						onPress={() => handleSubscriptionClick(subscriptionPlan.premium)}
						text='Checkout'
						color='white'
					/>
				</View>
				<SecondaryButton
					text='Go Back'
					color='black'
					backgroundColor='transparent'
					onPress={() => navigate('Trail', { trailId })}
				/>
			</View>
		</MainLayout>
	);
};

// import React, { useState, useEffect } from 'react';
// import './App.css';

// const ProductDisplay = () => (
// 	<section>
// 		<div className='product'>
// 			<Logo />
// 			<div className='description'>
// 				<h3>Starter plan</h3>
// 				<h5>$20.00 / month</h5>
// 			</div>
// 		</div>
// 		<form action='/create-checkout-session' method='POST'>
// 			{/* Add a hidden field with the lookup_key of your Price */}
// 			<input type='hidden' name='lookup_key' value='{{PRICE_LOOKUP_KEY}}' />
// 			<button id='checkout-and-portal-button' type='submit'>
// 				Checkout
// 			</button>
// 		</form>
// 	</section>
// );

// const SuccessDisplay = ({ sessionId }) => {
// 	return (
// 		<section>
// 			<div className='product Box-root'>
// 				<Logo />
// 				<div className='description Box-root'>
// 					<h3>Subscription to starter plan successful!</h3>
// 				</div>
// 			</div>
// 			<form action='/create-portal-session' method='POST'>
// 				<input
// 					type='hidden'
// 					id='session-id'
// 					name='session_id'
// 					value={sessionId}
// 				/>
// 				<button id='checkout-and-portal-button' type='submit'>
// 					Manage your billing information
// 				</button>
// 			</form>
// 		</section>
// 	);
// };

// const Message = ({ message }) => (
// 	<section>
// 		<p>{message}</p>
// 	</section>
// );

// export default function App() {
// 	let [message, setMessage] = useState('');
// 	let [success, setSuccess] = useState(false);
// 	let [sessionId, setSessionId] = useState('');

// 	useEffect(() => {
// 		// Check to see if this is a redirect back from Checkout
// 		const query = new URLSearchParams(window.location.search);

// 		if (query.get('success')) {
// 			setSuccess(true);
// 			setSessionId(query.get('session_id'));
// 		}

// 		if (query.get('canceled')) {
// 			setSuccess(false);
// 			setMessage(
// 				"Order canceled -- continue to shop around and checkout when you're ready.",
// 			);
// 		}
// 	}, [sessionId]);

// 	if (!success && message === '') {
// 		return <ProductDisplay />;
// 	} else if (success && sessionId !== '') {
// 		return <SuccessDisplay sessionId={sessionId} />;
// 	} else {
// 		return <Message message={message} />;
// 	}
// }

// const Logo = () => (
// 	<svg
// 		xmlns='http://www.w3.org/2000/svg'
// 		xmlnsXlink='http://www.w3.org/1999/xlink'
// 		width='14px'
// 		height='16px'
// 		viewBox='0 0 14 16'
// 		version='1.1'
// 	>
// 		<defs />
// 		<g id='Flow' stroke='none' strokeWidth='1' fill='none' fillRule='evenodd'>
// 			<g
// 				id='0-Default'
// 				transform='translate(-121.000000, -40.000000)'
// 				fill='#E184DF'
// 			>
// 				<path
// 					d='M127,50 L126,50 C123.238576,50 121,47.7614237 121,45 C121,42.2385763 123.238576,40 126,40 L135,40 L135,56 L133,56 L133,42 L129,42 L129,56 L127,56 L127,50 Z M127,48 L127,42 L126,42 C124.343146,42 123,43.3431458 123,45 C123,46.6568542 124.343146,48 126,48 L127,48 Z'
// 					id='Pilcrow'
// 				/>
// 			</g>
// 		</g>
// 	</svg>
// );
