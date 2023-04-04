import { View, Text, Image } from 'react-native';

import mountains from '../assets/images/mountains.avif';

export const SignIn = () => {
	return (
		<View>
			<View>
				<Image
					source={mountains}
					style={{ height: '100%', width: '100%' }}
					resize='center'
				></Image>
			</View>
			<View></View>
			<Text>Sign in</Text>
		</View>
	);
};
