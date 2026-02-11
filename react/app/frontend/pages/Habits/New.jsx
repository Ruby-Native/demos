import { Head } from "@inertiajs/react"
import HabitForm from "~/components/HabitForm"

export default function New({ habit, errors }) {
  return (
    <>
      <Head title="New habit" />
      <div className="px-4 pt-6 pb-4">
        <h1 className="text-2xl font-bold text-gray-900">New habit</h1>
      </div>
      <div className="px-4">
        <HabitForm habit={habit} action="/habits" errors={errors} />
      </div>
    </>
  )
}
