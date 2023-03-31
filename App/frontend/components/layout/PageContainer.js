import { LinearGradient } from 'expo-linear-gradient';

export const PageContainer = ({ children, styleProp }) => {
	return (
		<LinearGradient
			colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']}
			style={styleProp}
		>
			{children}
		</LinearGradient>
	);
};
