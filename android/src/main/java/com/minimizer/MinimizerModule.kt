package com.minimizer

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule

@ReactModule(name = MinimizerModule.NAME)
class MinimizerModule(reactContext: ReactApplicationContext) :
  NativeMinimizerSpec(reactContext) {

  override fun getName(): String {
    return NAME
  }

  override fun exit(): Void{
    // Implement the exit functionality here
    // This could be closing the app, or any other logic you want to implement
    // For example, you might want to call System.exit(0) to terminate the app
    System.exit(0)
  }

  override fun minimize(): Void {
    // Implement the minimize functionality here
    // This could be sending the app to the background or minimizing it
    // For example, you might want to use an Intent to minimize the app
    val intent = reactApplicationContext.packageManager.getLaunchIntentForPackage(reactApplicationContext.packageName)
    intent?.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
    reactApplicationContext.startActivity(intent)
  }

  override fun goBack(): Void{
        Activity activity = this.reactContext.getCurrentActivity();
        activity.moveTaskToBack(true);
  }
  

  companion object {
    const val NAME = "Minimizer"
  }
}
