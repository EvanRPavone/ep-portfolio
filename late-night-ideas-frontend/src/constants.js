export const API_URL = process.env.NODE_ENV === "test" 
                        ? "http://mocked-api-url" 
                        : import.meta.env.FRONTEND_API_URL;