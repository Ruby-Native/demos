module RubyNativeHelper
  def native_back_button(text = nil, **options)
    return unless native_app?
    options[:class] = [options[:class], "native-back-button"].compact.join(" ")
    content = text || content_tag(:i, nil, class: "bi bi-chevron-left fs-5", style: "-webkit-text-stroke: 1px;")
    link_to content, "#", onclick: "webkit.messageHandlers.rubyNative.postMessage({action: 'back'}); return false;", **options
  end
end
