let pushToken = null;

export const fetchPushToken = () => {
	return pushToken;
};

export const setPushToken = (token) => {
	pushToken = token;
};
