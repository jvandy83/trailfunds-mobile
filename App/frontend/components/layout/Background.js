import { Animated } from 'react-native';

export const Background = ({ backgroundColor, scale }) => {
	return (
		<Animated.View
			style={{
				width: 75,
				height: 75,
				borderRadius: '100%',
				backgroundColor,
				opacity: 0.9,
				transform: [{ scale }],
			}}
		/>
	);
};
