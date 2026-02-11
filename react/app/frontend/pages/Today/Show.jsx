import { Head } from "@inertiajs/react"
import HabitRow from "~/components/HabitRow"

export default function Show({ date, habits, completed_count, total_count }) {
  return (
    <>
      <Head title="Today" />
      <div className="px-4 pt-6 pb-2">
        <p className="text-sm text-gray-500">{date}</p>
        <h1 className="text-2xl font-bold text-gray-900 mt-1">Today</h1>
        <p className="text-sm text-gray-500 mt-1">
          {completed_count} of {total_count} completed
        </p>
      </div>

      <div className="mt-2 divide-y divide-gray-100">
        {habits.length === 0 ? (
          <div className="px-4 py-12 text-center">
            <p className="text-gray-500">No habits yet.</p>
            <a href="/habits/new" className="text-indigo-600 text-sm font-medium mt-2 inline-block">
              Create your first habit
            </a>
          </div>
        ) : (
          habits.map((habit) => <HabitRow key={habit.id} habit={habit} />)
        )}
      </div>
    </>
  )
}
