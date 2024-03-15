const isProtectedRoute = (endpoint) =>
  !unProtectedRoutesOrRefreshRoutes.includes(endpoint);

export const fetchCredentials = (credentials) => credentials;

export const authHeaders =
  async (headers, { getState, endpoint }) =>
  (fetchCredentials) => {
    const { idToken } = fetchCredentials;
    if (isProtectedRoute(endpoint)) {
      headers.set("Authorization", `Bearer ${idToken}`);
    }
    return headers;
  };
