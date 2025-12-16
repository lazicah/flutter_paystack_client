/// Stub for converting Dart functions when JS interop is unavailable.
typedef JSExportedDartFunction = Function;

extension ToJsInterop on Function {
  JSExportedDartFunction get toJS => this;
}
