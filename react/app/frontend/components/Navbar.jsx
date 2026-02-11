import { Link, usePage } from "@inertiajs/react"

export default function Navbar() {
  const { native_app, user_signed_in, title } = usePage().props

  if (native_app) {
    function goBack(e) {
      e.preventDefault()
      webkit.messageHandlers.rubyNative.postMessage({ action: "back" })
    }

    return (
      <nav className="fixed top-0 left-0 right-0 z-10 bg-white border-b border-gray-200 px-4 py-3">
        <div className="relative flex items-center justify-center">
          <a href="#" onClick={goBack} className="native-back-button absolute left-0 text-indigo-600">
            <svg className="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2.5}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
            </svg>
          </a>
          <h1 className="text-lg font-semibold text-gray-900">
            {title || "Habits"}
          </h1>
        </div>
      </nav>
    )
  }

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
