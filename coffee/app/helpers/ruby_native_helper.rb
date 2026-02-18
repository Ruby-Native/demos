module RubyNativeHelper
  def native_back_button(**options)
    return unless native_app?
    options[:class] = [options[:class], "native-back-button text-coffee-800 dark:text-coffee-100"].compact.join(" ")
    icon = tag.svg(
      tag.path(d: "M15 19l-7-7 7-7", fill: "none", stroke: "currentColor", "stroke-width": "2", "stroke-linecap": "round", "stroke-linejoin": "round"),
      xmlns: "http://www.w3.org/2000/svg",
      class: "w-6 h-6",
      viewBox: "0 0 24 24",
      fill: "none"
    )
    link_to icon, "#", onclick: "webkit.messageHandlers.rubyNative.postMessage({action: 'back'}); return false;", **options
  end
end
