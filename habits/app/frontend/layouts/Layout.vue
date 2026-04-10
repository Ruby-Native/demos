<script setup>
import { usePage } from "@inertiajs/vue3"
import { computed } from "vue"
import { NativeTabs } from "ruby-native/vue"
import Navbar from "~/components/Navbar.vue"
import Flash from "~/components/Flash.vue"

const page = usePage()
const userSignedIn = computed(() => page.props.user_signed_in)
</script>

<template>
  <div class="min-h-screen bg-gray-50">
    <NativeTabs v-if="userSignedIn" />
    <Navbar />
    <div class="pt-12 native-inset">
      <Flash />
      <main class="max-w-lg mx-auto">
        <slot />
      </main>
    </div>
  </div>
</template>
