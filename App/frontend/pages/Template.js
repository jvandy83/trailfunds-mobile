import React from 'react';
import { StatusBar } from 'expo-status-bar';
import { View, Text } from 'react-native';

import { PageContainer } from '../components/layout/PageContainer';

import { defaults } from '../styles/frontendStyles';

export const Template = ({ navigation }) => {
	return (
		<View>
			<PageContainer styleProp={[defaults.background]}>
				<Text>Template Page</Text>
				<StatusBar style='auto' />
			</PageContainer>
		</View>
	);
}

