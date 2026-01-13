<template>
  <component
    :is="elementType"
    role="button"
    class="inline-flex items-center rounded border-2 border-slate-700 bg-slate-700 px-4 py-2 text-white transition hover:border-slate-600 hover:bg-slate-600"
    v-bind="attrs"
  >
    <slot />
  </component>
</template>

<script setup lang="ts">
const props = defineProps({
  as: {
    type: String,
    default: 'button',
  },
});

const elementType = computed(() => props.as);

const attrs = computed(() => {
  const { as, ...attrs } = props;
  return attrs;
});
</script>
