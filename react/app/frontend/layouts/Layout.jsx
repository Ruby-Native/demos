import { usePage } from "@inertiajs/react"
import Navbar from "~/components/Navbar"
import Flash from "~/components/Flash"

export default function Layout({ children }) {
  const { user_signed_in } = usePage().props

  return (
    <div className="min-h-screen bg-gray-50">
      {user_signed_in && <div data-native-tabs data-native-push hidden />}
      <Navbar />
      <div className="pt-12">
        <Flash />
        <main className="max-w-lg mx-auto">{children}</main>
      </div>
    </div>
  )
}
