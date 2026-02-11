import { Head, Link } from "@inertiajs/react"

export default function Index({ habits }) {
  return (
    <>
      <Head title="Habits" />
      <div className="px-4 pt-6 pb-2 flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Habits</h1>
        <Link
          href="/habits/new"
          className="bg-indigo-600 text-white text-sm font-medium rounded-lg px-3 py-1.5 hover:bg-indigo-700 transition-colors"
        >
          New habit
        </Link>
      </div>

      <div className="mt-2 divide-y divide-gray-100">
        {habits.length === 0 ? (
          <div className="px-4 py-12 text-center">
            <p className="text-gray-500">No habits yet. Create one to get started.</p>
          </div>
        ) : (
          habits.map((habit) => (
            <Link
              key={habit.id}
              href={`/habits/${habit.id}/edit`}
              className="flex items-center gap-3 px-4 py-3 bg-white hover:bg-gray-50 transition-colors"
            >
              <div
                className="w-3 h-3 rounded-full shrink-0"
                style={{ backgroundColor: habit.color }}
              />
              <div className="flex-1 min-w-0">
                <p className="text-base text-gray-900">{habit.name}</p>
                {habit.description && (
                  <p className="text-sm text-gray-500 truncate">{habit.description}</p>
                )}
              </div>
              <span className="text-sm text-gray-400 shrink-0">
                {habit.completions_this_week}x this week
              </span>
            </Link>
          ))
        )}
      </div>
    </>
  )
}
