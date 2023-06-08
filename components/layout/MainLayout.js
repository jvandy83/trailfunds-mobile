import { Platform } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { LinearGradient } from 'expo-linear-gradient';

export const MainLayout = ({ children, styleProp }) => {
	const insets = useSafeAreaInsets();

	return (
		<LinearGradient
			colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']}
			style={{
				...styleProp,
				paddingTop: insets.top,
				paddingBottom: insets.bottom,
				paddingLeft: insets.left,
				paddingRight: insets.right,
			}}
		>
			{children}
		</LinearGradient>
	);
};
