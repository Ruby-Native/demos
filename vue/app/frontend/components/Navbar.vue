<script setup>
import { Link, usePage } from "@inertiajs/vue3"
import { computed } from "vue"

const page = usePage()
const nativeApp = computed(() => page.props.nativeApp)
const userSignedIn = computed(() => page.props.user_signed_in)
</script>

<template>
  <nav v-if="!nativeApp && userSignedIn" class="fixed top-0 left-0 right-0 z-10 bg-white border-b border-gray-200 px-4 py-3">
    <div class="max-w-lg mx-auto flex items-center justify-between">
      <Link href="/today" class="text-lg font-semibold text-gray-900">
        Habits
      </Link>
      <div class="flex items-center gap-4">
        <Link href="/today" class="text-sm text-gray-600 hover:text-gray-900">
          Today
        </Link>
        <Link href="/habits" class="text-sm text-gray-600 hover:text-gray-900">
          Habits
        </Link>
        <Link href="/profile" class="text-sm text-gray-600 hover:text-gray-900">
          Profile
        </Link>
      </div>
    </div>
  </nav>
</template>
