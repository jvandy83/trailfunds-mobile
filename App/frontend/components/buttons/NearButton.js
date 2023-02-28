import { View, TouchableOpacity, Text } from 'react-native';
import { Octicons } from '@expo/vector-icons';

export const NearButton = ({ mapStyles, defaults, nearAnimationHandler }) => {
	return (
		<View style={mapStyles.map_column}>
			<TouchableOpacity onPress={nearAnimationHandler}>
				<View style={mapStyles.near}>
					<Octicons name='location' size={36} color='white' />
					<Text style={defaults.white_text}>NEAR</Text>
				</View>
			</TouchableOpacity>
		</View>
	);
};
