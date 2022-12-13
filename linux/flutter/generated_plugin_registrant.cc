//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <image_compression_flutter/image_compression_flutter_plugin.h>
#include <isar_flutter_libs/isar_flutter_libs_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) image_compression_flutter_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ImageCompressionFlutterPlugin");
  image_compression_flutter_plugin_register_with_registrar(image_compression_flutter_registrar);
  g_autoptr(FlPluginRegistrar) isar_flutter_libs_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "IsarFlutterLibsPlugin");
  isar_flutter_libs_plugin_register_with_registrar(isar_flutter_libs_registrar);
}
