# Frontend Rules

- Vue 3 Composition API with `<script setup>`; TypeScript required, strict mode, no `any`.
- Component naming: PascalCase, multi-word; keep templates simple; avoid complex expressions.
- Props/emits typed; avoid destructuring reactive objects; use `toRefs` when needed.
- State: Pinia for global; keep stores small; mutations via actions; avoid store cycles.
- Router: lazy-load routes, use named routes, validate params, provide 404.
- API integration: centralized client, typed responses, timeouts, env-based URLs, auth/error interceptors.
- Security: never use `v-html` with user input; no sensitive data in console/localStorage; HTTPS only.
- Testing: unit for composables/utils/stores, component tests for UI behavior, E2E for critical flows.
