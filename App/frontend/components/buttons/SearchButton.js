import { View, TouchableOpacity, Text } from 'react-native';
import { AntDesign } from '@expo/vector-icons';

export const SearchButton = ({
	searchAnimationHandler,
	mapStyles,
	defaults,
}) => {
	return (
		<View style={mapStyles.map_column}>
			<TouchableOpacity onPress={searchAnimationHandler}>
				<View style={mapStyles.search}>
					<AntDesign name='search1' size={36} color='white' />
					<Text style={defaults.white_text}>SEARCH</Text>
				</View>
			</TouchableOpacity>
		</View>
	);
};
