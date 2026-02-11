export default function NativeMeta({ nativeForm }) {
  if (!nativeForm) return null
  return <div data-native-form hidden />
}
