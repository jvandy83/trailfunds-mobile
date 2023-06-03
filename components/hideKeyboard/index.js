import { TouchableWithoutFeedback, Keyboard } from 'react-native';

export const HideKeyboard = ({ children }) => (
	<TouchableWithoutFeedback onPress={() => Keyboard.dismiss()}>
		{children}
	</TouchableWithoutFeedback>
);
