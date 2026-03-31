import { Link, usePage } from "@inertiajs/react"

export default function Navbar() {
  const { nativeApp, user_signed_in } = usePage().props

  if (nativeApp) return null
  if (!user_signed_in) return null

  return (
    <nav className="fixed top-0 left-0 right-0 z-10 bg-white border-b border-gray-200 px-4 py-3">
      <div className="max-w-lg mx-auto flex items-center justify-between">
        <Link href="/today" className="text-lg font-semibold text-gray-900">
          Habits
        </Link>
        <div className="flex items-center gap-4">
          <Link href="/today" className="text-sm text-gray-600 hover:text-gray-900">
            Today
          </Link>
          <Link href="/habits" className="text-sm text-gray-600 hover:text-gray-900">
            Habits
          </Link>
          <Link href="/profile" className="text-sm text-gray-600 hover:text-gray-900">
            Profile
          </Link>
        </div>
      </div>
    </nav>
  )
}
