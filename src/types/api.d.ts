interface ApiResponse<T> {
  error?: FetchBaseQueryError | SerializedError;
  message?: string;
  status?: number;
  data: T;
}
