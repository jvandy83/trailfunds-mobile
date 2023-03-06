import React from 'react';
import { StatusBar } from 'expo-status-bar';
import { View } from 'react-native';
import { defaults } from '../styles/frontendStyles';
import { LinearGradient } from 'expo-linear-gradient';

function PAGENAME({ navigation }) {
	return (
		<View>
			<LinearGradient
				colors={['#59C0922C', '#FAFDFCF9', '#FFFFFF']}
				style={[defaults.background]}
			>
				<StatusBar style='auto' />
			</LinearGradient>
		</View>
	);
}

export default PAGENAME;
