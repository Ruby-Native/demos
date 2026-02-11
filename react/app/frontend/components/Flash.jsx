import { usePage } from "@inertiajs/react"
import { useState, useEffect } from "react"

export default function Flash() {
  const { flash } = usePage().props
  const [visible, setVisible] = useState(false)

  const message = flash?.notice || flash?.alert
  const isAlert = !!flash?.alert

  useEffect(() => {
    if (message) {
      setVisible(true)
      const timer = setTimeout(() => setVisible(false), 4000)
      return () => clearTimeout(timer)
    }
  }, [message])

  if (!visible || !message) return null

  return (
    <div
      className={`px-4 py-3 text-sm font-medium ${
        isAlert
          ? "bg-red-50 text-red-800 border-b border-red-200"
          : "bg-green-50 text-green-800 border-b border-green-200"
      }`}
    >
      <div className="max-w-lg mx-auto">{message}</div>
    </div>
  )
}
