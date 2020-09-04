package com.example.open_app;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import android.content.Context;
import android.content.Intent;

/** OpenAppPlugin */
public class OpenAppPlugin implements FlutterPlugin, MethodCallHandler {
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    final MethodChannel channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "open_app");
    context = flutterPluginBinding.getApplicationContext();
    channel.setMethodCallHandler(this);
  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "open_app");
    channel.setMethodCallHandler(new OpenAppPlugin());
  }


  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("openApp")) {
      String packageName = call.argument("package_name").toString();
      result.success(openApp(packageName));
    } if (call.method.equals("isInstalledApp")) {
      String packageName = call.argument("package_name").toString();
      result.success(isInstalledApp(packageName));
    } else {
      result.notImplemented();
    }
  }

  private Boolean openApp(String packageName) {
    try {
      Intent intent = context.getPackageManager().getLaunchIntentForPackage(packageName);
      
      if (intent != null) {
        context.startActivity(intent);
        return true;
      }

      return false;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  private Boolean isInstalledApp(String packageName) {
    try {
      context.getPackageManager().getPackageInfo(packageName, 0);
      return true;
    } catch (Exception e) {
      return false;
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
  }
}
