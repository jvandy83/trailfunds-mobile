import React, {
	useCallback,
	useMemo,
	useRef,
	useEffect,
	useState,
} from 'react';

import {
	View,
	Text,
	StyleSheet,
	TextInput,
	Pressable,
	ScrollView,
	SafeAreaView,
} from 'react-native';

import { useNavigation } from '@react-navigation/native';

import { Picker } from '@react-native-picker/picker';

import {
	BottomSheetModal,
	BottomSheetModalProvider,
} from '@gorhom/bottom-sheet';

import { TrailLocation } from './TrailLocation';

import axios from 'axios';

import uuid from 'react-native-uuid';

export const TrailDataBottomSheet = ({
	data,
	initialLocation,
	setRadius,
	radius,
}) => {
	// ref
	const bottomSheetModalRef = useRef(null);

	const [queryData, setQueryData] = useState([]);

	const [loadingTrails, setLoadingTrails] = useState(false);

	const [selectedRadiusValue, setSelectedRadiusValue] = useState(radius);

	const { navigate } = useNavigation();

	const searchTrails = async (data) => {
		setLoadingTrails(true);
		try {
			const res = await axios.get(
				`https://trailfunds.ngrok.dev/api/v1/trails/search-trails?query=${data}`,
			);
			setQueryData(res.data);
			setLoadingTrails(false);
		} catch (error) {
			console.error(error);
		}
	};

	const handleSearchQuery = (text) => {
		searchTrails(text);
	};

	const handleSheetChanges = useCallback((index) => {
		// this keeps modal from closing all the way
		// and leaving the screen
		bottomSheetModalRef.current?.present();
	}, []);

	const renderTrails = useCallback(
		(trail) => (
			<TrailLocation
				trail={trail}
				onPress={() => navigate('Trail', { trailId: trail.id })}
				initialLoc={initialLocation}
				key={uuid.v4()}
			/>
		),
		[],
	);

	const renderPicker = () => {
		const arr = [];
		let i = 0;
		while (i < 50) {
			i++;
			arr.push(i);
		}
		return arr.map((num) => (
			<Picker.Item key={uuid.v4()} label={`${num}`} value={`${num}`} />
		));
	};

	const snapPoints = useMemo(() => ['25%', '50%', '75%'], []);

	useEffect(() => {
		bottomSheetModalRef.current?.present();
	}, []);

	// renders
	return (
		<BottomSheetModalProvider>
			<View style={styles.container}>
				<BottomSheetModal
					ref={bottomSheetModalRef}
					index={1}
					snapPoints={snapPoints}
					onChange={handleSheetChanges}
				>
					<ScrollView style={{ flexGrow: 1 }}>
						<View style={{ paddingTop: 40, paddingHorizontal: 30 }}>
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
							<View>
								{loadingTrails ? (
									<Text>Loading...</Text>
								) : (
									queryData.trails?.map(renderTrails)
								)}
							</View>
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
								<View>{data.trails.map(renderTrails)}</View>
							</SafeAreaView>
						</View>
					</ScrollView>
				</BottomSheetModal>
			</View>
		</BottomSheetModalProvider>
	);
};

const styles = StyleSheet.create({
	container: {
		padding: 24,
		justifyContent: 'center',
	},
});
