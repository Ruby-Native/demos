import { Head, Link, router } from "@inertiajs/react"

export default function Show({ user }) {
  function handleSignOut() {
    router.delete("/session")
  }

  return (
    <>
      <Head title="Profile" />
      <div className="px-4 pt-6">
        <h1 className="text-2xl font-bold text-gray-900">Profile</h1>
        <div className="mt-6 space-y-4">
          <div>
            <p className="text-sm text-gray-500">Name</p>
            <p className="text-base text-gray-900">{user.name || "Not set"}</p>
          </div>
          <div>
            <p className="text-sm text-gray-500">Email</p>
            <p className="text-base text-gray-900">{user.email}</p>
          </div>
        </div>

        <div className="mt-8 space-y-3">
          <Link
            href="/profile/edit"
            className="block w-full text-center bg-indigo-600 text-white rounded-lg px-4 py-2.5 font-medium hover:bg-indigo-700 transition-colors"
          >
            Edit profile
          </Link>
          <button
            onClick={handleSignOut}
            className="w-full text-red-600 text-sm font-medium py-2 hover:text-red-700 transition-colors"
          >
            Sign out
          </button>
        </div>
      </div>
    </>
  )
}
