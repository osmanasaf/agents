# API Integration Rules

## API Client Structure
- Centralized API configuration
- Typed request/response
- Interceptors for auth and errors
- Environment-based URLs

```typescript
// api/client.ts
import axios from 'axios'

const apiClient = axios.create({
  baseURL: import.meta.env.VITE_API_URL,
  timeout: 30000,
  headers: {
    'Content-Type': 'application/json'
  }
})

// Auth interceptor
apiClient.interceptors.request.use((config) => {
  const token = localStorage.getItem('token')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})

// Error interceptor
apiClient.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      // Handle unauthorized
    }
    return Promise.reject(error)
  }
)
```

## API Module Structure
```
src/api/
├── client.ts         # Axios instance
├── auth.api.ts       # Auth endpoints
├── users.api.ts      # User endpoints
├── products.api.ts   # Product endpoints
└── index.ts          # Re-exports
```

## API Function Patterns
```typescript
// api/users.api.ts
export const usersApi = {
  async getAll(params?: PaginationParams): Promise<PaginatedResponse<User>> {
    const { data } = await apiClient.get('/users', { params })
    return data
  },
  
  async getById(id: string): Promise<User> {
    const { data } = await apiClient.get(`/users/${id}`)
    return data
  },
  
  async create(user: CreateUserDTO): Promise<User> {
    const { data } = await apiClient.post('/users', user)
    return data
  },
  
  async update(id: string, user: UpdateUserDTO): Promise<User> {
    const { data } = await apiClient.put(`/users/${id}`, user)
    return data
  },
  
  async delete(id: string): Promise<void> {
    await apiClient.delete(`/users/${id}`)
  }
}
```

## Error Handling
```typescript
// types/errors.ts
interface ApiError {
  code: string
  message: string
  details?: Record<string, string[]>
}

// Composable for error handling
export function useApiError() {
  const error = ref<ApiError | null>(null)
  
  function handleError(e: unknown) {
    if (axios.isAxiosError(e)) {
      error.value = e.response?.data as ApiError
    } else {
      error.value = { code: 'UNKNOWN', message: 'Unexpected error' }
    }
  }
  
  return { error, handleError }
}
```

## Environment Variables
```env
# .env.development
VITE_API_URL=http://localhost:8080/api

# .env.production
VITE_API_URL=https://api.production.com
```

## Best Practices
- ✅ Always type API responses
- ✅ Handle loading and error states
- ✅ Use environment variables for URLs
- ✅ Centralize error handling
- ❌ Never hardcode API URLs
- ❌ Never expose credentials in frontend
