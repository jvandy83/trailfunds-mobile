let getAccessTokenSilently = null;

export const sec = {
  getAccessToken: () => getAccessToken,
  setAccessToken: (func) => (getAccessToken = func),
};
