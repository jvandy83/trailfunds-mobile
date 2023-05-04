let pushToken = null;

export const fetchPushToken = () => {
	// console.log(typeof pushToken);
	// console.log('***push token inside fetchPushToken***: ', pushToken);
	return pushToken;
};

export const setPushToken = (token) => {
	// console.log('***push token inside setPushToken***: ', token);
	pushToken = token;
};
