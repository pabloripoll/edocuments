# Vue3 FAQs

Senior-level Vue 3 interview FAQs with concise, practical answers.

---

## 1) What are the main improvements in Vue 3 over Vue 2?

Vue 3 introduces the Composition API, better TypeScript support, improved performance, smaller bundle size, multiple root nodes in templates, Teleport, Fragments, Suspense, and a more modular internal architecture. It also improves reactivity and makes large-scale code organization easier.

---

## 2) What is the Composition API, and why would you use it?

The Composition API is a way to organize component logic by feature rather than by options like `data`, `methods`, and `computed`. It is especially useful for complex components because it improves reuse, TypeScript inference, and readability for large codebases. It also avoids logic scattering across options.

---

## 3) What is the difference between the Composition API and the Options API?

The Options API organizes code by component option (`data`, `methods`, `computed`, etc.), while the Composition API organizes code by concern or feature. The Options API is simpler for small components, but the Composition API scales better for complex logic and reuse. Many teams use both depending on context.

---

## 4) How does reactivity work in Vue 3?

Vue 3 uses a Proxy-based reactivity system. Objects wrapped with `reactive()` or values wrapped with `ref()` are tracked automatically, and dependent effects re-run when those values change. This is more flexible and performant than Vue 2’s `Object.defineProperty` approach.

---

## 5) What is the difference between `ref()` and `reactive()`?

`ref()` is used for primitive values and returns an object with a `.value` property. `reactive()` is used for objects and makes them deeply reactive. In practice, `ref()` is often preferred for primitives and for consistency when building reusable Composition API logic.

---

## 6) When should you use `computed()`?

Use `computed()` for derived state that depends on reactive sources. It caches results until dependencies change, making it efficient for expensive calculations or transformation logic. It should be used instead of methods when the value is purely derived from reactive inputs.

---

## 7) What are `watch()` and `watchEffect()`, and how are they different?

`watch()` observes specific reactive sources and runs when they change. It is more explicit and gives control over old and new values. `watchEffect()` automatically tracks any reactive dependency used inside its callback and runs immediately. Use `watch()` when you know exactly what to observe; use `watchEffect()` for automatic dependency tracking.

---

## 8) How do lifecycle hooks work in Vue 3?

Lifecycle hooks allow you to run code at specific stages of a component’s existence, such as `onMounted`, `onUpdated`, and `onUnmounted`. In the Composition API, these hooks are called inside `setup()`. They are commonly used for subscriptions, fetching data, timers, and cleanup.

---

## 9) What is `setup()` in Vue 3?

`setup()` is the entry point for Composition API logic. It runs before the component is created and is where you define reactive state, computed values, watchers, and lifecycle hooks. It replaces much of the logic that used to live in `data`, `methods`, and `created`.

---

## 10) What are composables?

Composables are reusable functions that encapsulate reactive logic and state using the Composition API. They help share behavior across components without mixins’ drawbacks. A composable should usually focus on a single concern, such as pagination, authentication, or form handling.

---

## 11) Why are composables better than mixins?

Composables avoid naming collisions, make dependencies explicit, and are easier to type and test. Mixins can create implicit behavior and conflict when multiple mixins define the same properties. Composables are generally more maintainable and predictable.

---

## 12) What is the purpose of `provide` and `inject`?

`provide` and `inject` allow dependency passing down a component tree without prop drilling. They are useful for shared context like theme, localization, form state, or service objects. They should be used carefully to avoid hidden dependencies, especially in large applications.

---

## 13) What is the purpose of `Teleport`?

`Teleport` renders content outside the current component hierarchy, usually in `body` or a dedicated DOM node. It is commonly used for modals, dropdowns, tooltips, and overlays where z-index and layout constraints matter.

---

## 14) What is `Suspense` in Vue 3?

`Suspense` is used to manage asynchronous dependencies in a component tree, such as async setup or lazy-loaded components. It lets you show fallback content while async work is pending. It is useful in some SSR and async component scenarios, though its usage depends on the app architecture.

---

## 15) How does the Vue 3 template compiler improve performance?

Vue 3’s compiler generates more optimized render functions and uses patch flags to skip unnecessary diffing. It can better identify static and dynamic parts of templates, improving runtime efficiency. The result is faster updates and smaller overhead in many cases.

---

## 16) What are fragments in Vue 3?

Fragments allow components to have multiple root elements in templates. In Vue 2, a component needed a single root node. Fragments make templates more flexible and reduce unnecessary wrapper elements.

---

## 17) How does Vue 3 handle TypeScript better than Vue 2?

Vue 3 was designed with TypeScript in mind. The Composition API makes typing reusable logic easier, and refs/reactive state integrate more naturally with type inference. This leads to better DX, more reliable refactoring, and fewer runtime errors in larger codebases.

---

## 18) What is the difference between `v-if` and `v-show`?

`v-if` conditionally mounts and unmounts elements, so it is better when the condition changes infrequently. `v-show` only toggles CSS visibility and is better when you need frequent toggling. Use `v-if` for structural conditions and `v-show` for visibility toggles.

---

## 19) How do you manage state in a Vue 3 application?

For local component state, use `ref` and `reactive`. For shared state, use composables, `provide/inject`, or a store like Pinia. Senior-level architecture typically prefers Pinia for global application state and composables for reusable feature logic.

---

## 20) What is Pinia, and why is it commonly used with Vue 3?

Pinia is the recommended state management library for Vue 3. It is lightweight, TypeScript-friendly, and has a simpler API than Vuex. It supports modular stores, devtools integration, and a clean Composition API style, making it a strong fit for modern Vue applications.

---

If you want, I can also give you:
- **20 more advanced Vue 3 senior questions**
- **Vue 3 interview questions with code examples**
- **a comparison of Vue 3 vs React for senior interviews**
- **a Vue 3 + Pinia + TypeScript senior cheat sheet**