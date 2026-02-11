import { useState } from "react"

function csrfToken() {
  return document.querySelector('meta[name="csrf-token"]')?.content
}

export default function HabitRow({ habit }) {
  const [completed, setCompleted] = useState(habit.completed)

  async function toggle() {
    const previous = completed
    setCompleted(!completed)

    try {
      const response = await fetch(`/habits/${habit.id}/completion/toggle`, {
        method: "POST",
        headers: {
          "X-CSRF-Token": csrfToken(),
          "Accept": "application/json",
        },
      })
      if (!response.ok) setCompleted(previous)
    } catch {
      setCompleted(previous)
    }
  }

  return (
    <button
      onClick={toggle}
      className="w-full flex items-center gap-3 px-4 py-3 bg-white hover:bg-gray-50 transition-colors"
    >
      <div
        className={`w-7 h-7 rounded-full border-2 flex items-center justify-center transition-colors shrink-0 ${
          completed ? "border-transparent" : "border-gray-300"
        }`}
        style={completed ? { backgroundColor: habit.color } : {}}
      >
        {completed && (
          <svg className="w-4 h-4 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M5 13l4 4L19 7" />
          </svg>
        )}
      </div>
      <span className={`text-base ${completed ? "text-gray-400 line-through" : "text-gray-900"}`}>
        {habit.name}
      </span>
    </button>
  )
}
