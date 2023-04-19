import React from 'react';
import { StatusBar } from 'expo-status-bar';
import { View, Text } from 'react-native';

import { MainLayout } from '../components/layout/MainLayout';

import { defaults } from '../styles/frontendStyles';

export const Template = ({ navigation }) => {
	return (
		<View>
			<MainLayout styleProp={[defaults.background]}>
				<Text>Template Page</Text>
				<StatusBar style='auto' />
			</MainLayout>
		</View>
	);
};
