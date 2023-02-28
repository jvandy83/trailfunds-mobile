import { View, TouchableOpacity, Text } from 'react-native';
import { AntDesign } from '@expo/vector-icons';
export const LikeButton = ({ likeAnimationHandler, defaults, mapStyles }) => {
	return (
		<View style={mapStyles.map_column}>
			<TouchableOpacity onPress={likeAnimationHandler}>
				<View style={mapStyles.like}>
					<AntDesign name='hearto' size={36} color='white' />
					<Text style={defaults.white_text}>LIKED</Text>
				</View>
			</TouchableOpacity>
		</View>
	);
};
