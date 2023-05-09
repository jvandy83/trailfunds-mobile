import { View, Text, TouchableOpacity } from 'react-native';

import { useSelector } from 'react-redux';

import { useGetDistanceFromMeQuery } from '../../services/api';

export const TrailLocation = ({ trail, onPress }) => {
	const { location } = useSelector((state) => state.location);

	const { data, error, isLoading } = useGetDistanceFromMeQuery(
		{
			nearLat: location.latitude,
			nearLon: location.longitude,
			farLat: trail.latitude,
			farLon: trail.longitude,
		},
		{ skip: !location.latitude, refetchOnMountOrArgChange: true },
	);

	if (isLoading) {
		return (
			<View>
				<Text>Loading...</Text>
			</View>
		);
	}

	if (error) {
		console.error(error.data);
	}

	const formattedDistance = Math.round(data * 10) / 10;

	return (
		<TouchableOpacity onPress={onPress} style={{ paddingVertical: 10 }}>
			<View
				style={{
					flexDirection: 'row',
					alignItems: 'center',
					justifyContent: 'space-between',
				}}
			>
				<Text style={{ fontWeight: '600', fontSize: 14, paddingRight: 4 }}>
					{trail.name}
				</Text>
				<Text style={{ fontWeight: '600', fontSize: 14 }}>
					{formattedDistance}
				</Text>
			</View>
		</TouchableOpacity>
	);
};
