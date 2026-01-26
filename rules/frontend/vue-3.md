# Vue 3 Rules

## Composition API First
- Use `<script setup>` syntax for all components
- Prefer `ref()` and `reactive()` over Options API
- Use `computed()` for derived state
- Use `watch()` and `watchEffect()` for side effects

```vue
<!-- GOOD: Composition API -->
<script setup lang="ts">
import { ref, computed } from 'vue'

const count = ref(0)
const doubled = computed(() => count.value * 2)
</script>

<!-- BAD: Options API for new code -->
<script>
export default {
  data() { return { count: 0 } }
}
</script>
```

## TypeScript Required
- All components must use TypeScript
- Define props with `defineProps<T>()` and types
- Define emits with `defineEmits<T>()`
- Use interfaces for complex types

```typescript
interface User {
  id: string
  name: string
  email: string
}

const props = defineProps<{
  user: User
  isActive?: boolean
}>()

const emit = defineEmits<{
  update: [user: User]
  delete: [id: string]
}>()
```

## Component Naming
- PascalCase for component files: `UserProfile.vue`
- Multi-word component names: `BaseButton.vue`, `AppHeader.vue`
- Prefix base components: `Base`, `App`, `The`
- Feature components: `FeatureName + Purpose`

## Props & Events
- Props: camelCase in script, kebab-case in template
- Events: camelCase with descriptive names
- Always define prop types
- Required vs optional must be explicit

## Reactivity Best Practices
- Never destructure reactive objects
- Use `toRefs()` when destructuring props
- Avoid `.value` in templates
- Use `shallowRef()` for large objects

## Template Rules
- Max 100 lines per template
- Use `v-if` over `v-show` for conditional rendering
- Always provide `key` for `v-for`
- Avoid complex expressions in templates

```vue
<!-- BAD -->
<div v-for="item in items.filter(i => i.active)">

<!-- GOOD -->
<div v-for="item in activeItems" :key="item.id">
```

## Component Size
- Max 300 lines per SFC
- Extract logic to composables if >150 lines script
- Split large templates into child components

## State Management
- Use Pinia for global state
- Local state with `ref()` / `reactive()`
- Avoid prop drilling more than 2 levels
- Use `provide/inject` for deep dependencies
