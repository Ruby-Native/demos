import { Head, router } from "@inertiajs/react"
import HabitForm from "~/components/HabitForm"

export default function Edit({ habit, errors }) {
  function handleDelete() {
    if (confirm("Delete this habit? This cannot be undone.")) {
      router.delete(`/habits/${habit.id}`)
    }
  }

  return (
    <>
      <Head title="Edit habit" />
      <div className="px-4 pt-6 pb-4">
        <h1 className="text-2xl font-bold text-gray-900">Edit habit</h1>
      </div>
      <div className="px-4">
        <HabitForm
          habit={habit}
          action={`/habits/${habit.id}`}
          method="patch"
          errors={errors}
        />
        <button
          onClick={handleDelete}
          className="w-full mt-4 text-red-600 text-sm font-medium py-2 hover:text-red-700 transition-colors"
        >
          Delete habit
        </button>
      </div>
    </>
  )
}
