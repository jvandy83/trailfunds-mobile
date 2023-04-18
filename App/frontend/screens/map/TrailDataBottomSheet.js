import React, { useCallback, useMemo, useRef, useState } from 'react';

import {
	View,
	Text,
	StyleSheet,
	TextInput,
	Pressable,
	SafeAreaView,
} from 'react-native';

import { useNavigation } from '@react-navigation/native';

import { Picker } from '@react-native-picker/picker';

import BottomSheet, { BottomSheetScrollView } from '@gorhom/bottom-sheet';

import { TrailLocation } from './TrailLocation';

import uuid from 'react-native-uuid';

import axios from 'axios';

export const TrailDataBottomSheet = ({
	data,
	initialLocation,
	setRadius,
	radius,
}) => {
	// ref
	const bottomSheetRef = useRef(null);

	const [queryData, setQueryData] = useState([]);

	const [selectedRadiusValue, setSelectedRadiusValue] = useState(radius);

	const { navigate } = useNavigation();

	const searchTrails = async (data) => {
		try {
			const res = await axios.get(
				`https://trailfunds.ngrok.dev/api/v1/trails/search-trails?query=${data}`,
			);
			setQueryData(res.data);
		} catch (error) {
			console.log(error);
		}
	};

	const handleSearchQuery = (text) => {
		searchTrails(text);
	};

	const handleSheetChanges = useCallback((index) => {
		// console.log('handleSheetChanges', bottomSheetModalRef.current);
	}, []);

	const renderTrail = useCallback((trail) => {
		return (
			<TrailLocation
				trail={trail}
				onPress={() => navigate('Trail', { trailId: trail.id })}
				initialLoc={initialLocation}
				key={uuid.v4()}
			/>
		);
	}, []);

	const renderPicker = () => {
		const arr = [];
		let i = 0;
		while (i < 50) {
			i++;
			arr.push(i);
		}
		return arr.map((num) => <Picker.Item label={`${num}`} value={`${num}`} />);
	};

	const snapPoints = useMemo(() => ['25%', '50%', '75%'], []);

	return (
		<View style={styles.container}>
			<BottomSheet
				ref={bottomSheetRef}
				index={1}
				snapPoints={snapPoints}
				onChange={handleSheetChanges}
			>
				<BottomSheetScrollView>
					<View style={{ paddingVertical: 30, paddingHorizontal: 30 }}>
						<Text
							style={{
								fontSize: 30,
								fontWeight: 'bold',
								color: '#59C092',
							}}
						>
							Find A Trail
						</Text>
						<TextInput
							placeholder='Search'
							onChangeText={(text) => handleSearchQuery(text)}
							style={{
								marginVertical: 15,
								paddingVertical: 10,
								paddingHorizontal: 20,
								borderWidth: 1,
								borderColor: 'rgba(0, 0, 0, 0.2)',
								borderRadius: 100,
							}}
						/>
						<View>{queryData.trails?.map(renderTrail)}</View>
						<View
							style={{
								flexDirection: 'row',
								justifyContent: 'space-around',
								paddingVertical: 20,
							}}
						>
							<Pressable
								style={{
									borderBottomColor: '#59C092',
									borderBottomWidth: 2,
								}}
							>
								<Text
									style={{
										fontSize: 16,
										color: '#59C092',
									}}
								>
									Favorite
								</Text>
							</Pressable>
							<Pressable>
								<Text style={{ fontSize: 16 }}>Recent</Text>
							</Pressable>
						</View>
						<View
							style={{
								flexDirection: 'row',
								justifyContent: 'space-between',
								alignItems: 'center',
								marginBottom: 40,
								height: 60,
								overflow: 'hidden',
							}}
						>
							<Text
								style={{
									fontSize: 20,
									fontWeight: 'bold',
									color: '#59C092',
								}}
							>
								Trails Near Me
							</Text>
							<View
								style={{
									flexDirection: 'row',
									justifyContent: 'center',
									alignItems: 'center',
								}}
							>
								<Picker
									style={{ width: '50%' }}
									selectedValue={selectedRadiusValue}
									onValueChange={(itemValue, itemIndex) => {
										setSelectedRadiusValue(itemValue);
										setRadius(itemValue);
									}}
								>
									{renderPicker()}
								</Picker>
								<Text style={{ fontSize: 16 }}>mi</Text>
							</View>
						</View>
						<SafeAreaView>
							<View>{data.trails.map(renderTrail)}</View>
						</SafeAreaView>
					</View>
				</BottomSheetScrollView>
			</BottomSheet>
		</View>
	);
};

const styles = StyleSheet.create({
	container: {
		position: 'absolute',
		bottom: 0,
		right: 0,
		left: 0,
		height: '100%',
		padding: 24,
		justifyContent: 'center',
	},
	contentContainer: {
		alignItems: 'center',
	},
});
