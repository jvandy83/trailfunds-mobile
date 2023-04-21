import { useState } from 'react';
import { useFocusEffect } from '@react-navigation/native';

export const useIsFocused = () => {
	const [isFocused, setFocused] = useState(false);

	useFocusEffect(() => {
		setFocused(true);
		return () => setFocused(false);
	});

	return isFocused;
};
