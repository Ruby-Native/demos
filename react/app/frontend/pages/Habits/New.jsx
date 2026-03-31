import { Head, usePage } from "@inertiajs/react"
import { NativeNavbar, NativeSubmitButton } from "ruby_native/react"
import HabitForm from "~/components/HabitForm"

export default function New({ habit, errors }) {
  const { nativeApp } = usePage().props

  return (
    <>
      <Head title="New habit" />
      <NativeNavbar title="New habit">
        <NativeSubmitButton title="Create" />
      </NativeNavbar>
      {!nativeApp && (
        <div className="px-4 pt-6 pb-4">
          <h1 className="text-2xl font-bold text-gray-900">New habit</h1>
        </div>
      )}
      <div className="px-4">
        <HabitForm habit={habit} action="/habits" errors={errors} />
      </div>
    </>
  )
}
