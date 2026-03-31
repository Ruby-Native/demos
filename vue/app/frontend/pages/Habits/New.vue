<script setup>
import { Head, usePage } from "@inertiajs/vue3"
import { computed } from "vue"
import { NativeNavbar, NativeSubmitButton } from "ruby_native/vue"
import HabitForm from "~/components/HabitForm.vue"

const page = usePage()
const nativeApp = computed(() => page.props.nativeApp)

defineProps({
  habit: Object,
  errors: Array,
})
</script>

<template>
  <Head title="New habit" />
  <NativeNavbar title="New habit">
    <NativeSubmitButton title="Create" />
  </NativeNavbar>
  <div v-if="!nativeApp" class="px-4 pt-6 pb-4">
    <h1 class="text-2xl font-bold text-gray-900">New habit</h1>
  </div>
  <div class="px-4">
    <HabitForm :habit="habit" action="/habits" :errors="errors" />
  </div>
</template>
