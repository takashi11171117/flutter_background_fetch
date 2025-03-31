# CHANGELOG

## 1.3.8 &mdash; 2025-03-20
* [Android] Update gradle config.  Default compileSdkVersion 34

## 1.3.7 &mdash; 2024-09-09
* [Android] Removed unused `import` related to Flutter V1 embedding.

## 1.3.6 &mdash; 2024-09-06
* [Android] Remove unrequired dependency `appcompat`.
* [Android] Bump default `androidx.lifecycle:lifecycle-runtime` version to `2.7.0`.
* [Android] Add `@NonNull` annotations to flutter plugin methods.
* [Android] Enable `multidex` in Android /example.

## 1.3.5 &mdash; 2024-05-27
* Update analysis_options.yaml for pub.dev.  There are no code changes from 1.3.4.

## 1.3.4 &mdash; 2024-05-03
* Change return-type of `BackgroundFetch.finish` from `void` to `Future<void>`.

## 1.3.3 &mdash; 2024-04-22
* [iOS] Code-sign `TSBackgroundFetch.xcframework` with new Apple Organization (*9224-2932 Quebec Inc*) certificate.

## 1.3.2 &mdash; 2024-03-23
* [iOS] codesign `TSBackgroundFetch.xcframework`.
* [iOS] Add `PrivacyInfo.xcprivacy` into `.podfile` config.
  
## 1.3.1 &mdash; 2024-03-20
* [iOS] Move `PrivacyInfo` -> `TSBackgroundFetch.xcframework`.

## 1.3.0 &mdash; 2024-03-19
* [iOS] Implement new [iOS Privacy Manifest](https://developer.apple.com/documentation/bundleresources/privacy_manifest_files?language=objc)

## 1.2.4 &mdash; 2024-03-07
* [iOS] Remove reference to symbol `BGHealthResearchTask` for now

## 1.2.3 &mdash; 2024-02-09
* [iOS] ensure `scheduleTask` callback is executed on main-thread.
* [Android] Update Android Setup Instructions for `flutter >= 3.19.0` (New Android Architecture).

## 1.2.2 &mdash; 2024-01-09
* [iOS] Only allow registration of `BGProcessingTasks` (*Permitted background task scheduler identifiers*) in `Info.plist` which are prefixed with `com.transistorsoft`.  Any other task identifier will be ignored.
* [Android] Remove deprecated `registerWith` V1 flutter plugin architecture.

## [1.2.1] &mdash; 2023-08-20
* [Android] Detect and dispose of duplicate events.  Android `JobService` has a bug for devices running <= Android M where multiple `backgrou
nd-fetch` events could fire within the same second.

## 1.2.0 - 2023-07-30
* [Android] Android 14 (SDK 34) support..
* [Android] Android 14 support:  When using `forceAlarmManager: true`, you must now optionally add the permission `android.permission.SCHEDULE_EXACT_ALARM` to your `AndroidManifest` to schedule **exact** alarms.  Otherwise `AlarmManager` will use **in-exact** alarms.
:open_file_folder: `AndroidManifest`.   **NOTE** You must include the permission **exactly as-shown** with __`android:minSdkVersion="34"`__.
```xml
<manifest>
    <!-- [background-fetch] OPTIONAL:  allows forceAlarmManager: true to use exact alarms -->
    <uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" android:maxSdkVersion="33" />
    .
    .
    .
</manifest>
```

* [Android] Fix an issue booting the app with `flutter run` with screen off where plugin incorrectly detects the app is headless.

## 1.1.6 - 2023-05-03
* [Android] Gradle v8 now requires `namespace` attribute in gradle files.

## 1.1.5 - 2023-02-16
* [Android] Fix NPE in `mEventChannelTask` in certain situations.  See #322.

## 1.1.4 - 2022-01-28
* [Android] [Fix] Add a null-check in didDetachFromEngine, fixing a reported null-pointer exception.
* [Android] [Added] Log the jobId when .scheduleTask is called so that developers can simulate events with `adb shell`.

## 1.1.3 - 2023-01-10
* [Android] Fix error `FlutterJNI was detached from native C++` when Android back button is pressed.  In this case, Flutter detaches the `MainActivity` from the app and headless-mode was not being detected.

## 1.1.2 - 2022-10-27
* [Android] add `@pragma('vm:entry-point')` to lib's `_headlessCallbackDispatcher`, required for *release* builds on Flutter >= 3.3.0.

## 1.1.1 - 2022-09-30
* [Android] Use `LifecycleManager` for modern headless-detection instead of legacy mechanism requiring permission `GET_TASKS`.

## 1.1.0 - 2022-04-06
* [iOS] Fix type-error when .start() raises an error (#281)
* [Android] Better error-handling when headlessTask is registered incorrectly (#242)
* [Android] Android 12 compatibility:  Add new required permission android.permission.SCHEDULE_EXACT_ALARM

## 1.0.3 - 2021-11-24
* [Fixed][Android] Fix typo related to requiredNetworkType, causing null pointer error.

## 1.0.2 - 2021-11-10
* [Changed][Android] Remove deprectated `jcenter` repository.  Replaced with `mavenCentral`.

## 1.0.1 - 2021-06-30
* [Changed][Android] Allow multiple calls to .configure to allow re-configuring the fetch task.  Existing task will be cancelled and a new periodic fetch task re-scheduled according to new config.
* [Changed][Android] Ignore initial fetch task fired immediately.
* [Changed][Android] `android:exported="false"` on `BootReceiver` to resolve reported security analysis.

## 1.0.0 - 2021-06-09
* Release 1.0.0-nullsafety.3 as 1.0.0

## 1.0.0-nullsafety.3 - 2021-06-09
* [Fixed][Android] null check in FetchStreamHandler that mEventSink != null
* [Changed][Android] Add new logic block to isMainActivityActive:  compare launchActivityName with task.baseActivity.getClassName()

## 1.0.0-nullsafety.2 - 2021-04-01
* [Fixed][Android] Flutter 2 broke Android Headless Task with Null-pointer exception.

## 1.0.0-nullsafety.1 - 2021-02-18
* [Fixed][Android] Fix `java.lang.NullPointerException: Attempt to invoke virtual method 'java.lang.String com.transistorsoft.tsbackgroundfetch.BGTask.getTaskId()' on a null object reference`

## 1.0.0-nullsafety.0 - 2021-02-15
* [Changed] Implement [null-safety](https://dart.dev/null-safety) (Thanks to @GinoTerlouw).

## 0.7.0 - 2021-02-11
* [Added][iOS] Implement two new iOS options for `BackgroundFetch.scheduleTask`:
    - `bool requiresNetworkConnectivity`
    - `bool requiresCharging` (previously Android-only).
    
* [Changed][iOS] Migrate `TSBackgroundFetch.framework` to new `.xcframework` for *MacCatalyst* support with new Apple silcon.

### :warning: Breaking Change:  Requires `cocoapods >= 1.10+`.

*iOS'* new `.xcframework` requires *cocoapods >= 1.10+*:

```bash
$ pod --version
// if < 1.10.0
$ sudo gem install cocoapods
```

* [Added] task-timeout callback.  `BackgroundFetch.configure` now accepts a 3rd argument `onTimeout` callback.  This callback will be executed when the operating system has signalled your task has expired before your task has called `BackgroundFetch.finish(taskId)`.  You must stop whatever you're task is doing and execute `BackgroundFetch.finish(taskId)` immediately.
```dart
BackgroundFetch.configure(BackgroundFetchConfig(
  minimumFetchInterval: 15
), (String taskId) {  // <-- task callback.
  print("[BackgroundFetch] taskId: $taskId");
  BackgroundFetch.finish(taskId);
}, (String taskId) {  // <-- NEW:  task-timeout callback.
  // This task has exceeded its allowed running-time.  You must stop what you're doing immediately finish(taskId)
  print("[BackgroundFetch] TIMEOUT taskId: $taskId");
  BackgroundFetch.finish(taskId);
});
```

### :warning: [Android] Breaking Change For Android Headless-task
- Since the registered Android headless-task (`BackgroundFetch.registerHeadlessTask`) can only receive a single parameter, your headless-task will now receive a `HeadlessTask task` instance rather than `String taskId` **in order to differentiate task-timeout events**.

__OLD__
```dart
void myBackgroundFetchHeadlessTask(String taskId) async { // <-- OLD:  String taskId
  print("[BackgroundFetch] Headless task: $taskId");
  BackgroundFetch.finish(taskId);
}
BackgroundFetch.registerHeadlessTask(myBackgroundFetchHeadlessTask);
```
__NEW__
```dart
void myBackgroundFetchHeadlessTask(HeadlessTask task) async { // <-- NEW:  HeadlessTask now provided.
  String taskId = task.taskId;    // <-- NEW:  Get taskId from HeadlessTask
  bool isTimeout = task.timeout;  // <-- NEW:  true if this task has timed-out.
  if (isTimeout) {
    // This task has exceeded its allowed running-time.  You must stop what you're doing immediately finish(taskId)
    print("[BackgroundFetch] Headless TIMEOUT: $taskId");
    BackgroundFetch.finish(taskId);
    return;
  }
  print("[BackgroundFetch] Headless task: $taskId");
  BackgroundFetch.finish(taskId);
}
BackgroundFetch.registerHeadlessTask(myBackgroundFetchHeadlessTask);
```

## 0.6.0 - 2020-06-11
* [Fixed][Android] `com.android.tools.build:gradle:4.0.0` no longer allows "*direct local aar dependencies*".  The Android Setup now requires a custom __`maven url`__ to be added to your app's root __`android/build.gradle`__:

```diff
allprojects {
    repositories {
        google()
        jcenter()
+       maven {
+           // [required] background_fetch
+           url "${project(':background_fetch').projectDir}/libs"
+       }
    }
}
```

## 0.5.6
* [Fixed][Android] using `forceAlarmManager: true` fails to restart fetch events after reboot.
* [Fixed] Android check `wakeLock.isHeld()` before executing `wakeLock.release()`.

## 0.5.5 - 2020-03-24
* [Fixed] [iOS] bug with `start` plugin after executing `stop`.

## 0.5.4 - 2020-02-22

* [Fixed] [Android] Add `@Keep` annotation to `HeadlessTask.java` to prevent minifying this classs in release builds since the SDK uses reflection to find this class.

## 0.5.3 - 2020-02-21
* [Fixed] [Android] `stopOnTerminate` not cancelling scheduled job / Alarm when fired task fired after terminate.

## 0.5.2 - 2020-02-20
* [Android] Fix Android NPE in `hasTaskId` for case where plugin is installed first time in had previous version of plugin

## 0.5.1 - 2020-02-19

## Minor Breaking Change for iOS Setup 

* [iOS] It's no longer necessary to `registerBGProcessingTask` in `AppDelegate.m` for tasks registered for use with `#scheduleTask`.  The SDK now reads the App `.plist` and automatically registers those tasks found in  *"Permitted background task scheduler identifiers"*.  Remove **all** code in your `AppDelegate.m` that references `TSBackgroundFetch`.
![](https://dl.dropboxusercontent.com/s/t5xfgah2gghqtws/ios-setup-permitted-identifiers.png?dl=1)


## 0.5.0 - 2020-02-03
* [Added] [Android] New option `forceAlarmManager` for bypassing `JobScheduler` mechanism in favour of `AlarmManager` for more precise scheduling task execution.
* [Changed] Migrate iOS deprecated "background-fetch" API to new [BGTaskScheduler](https://developer.apple.com/documentation/backgroundtasks/bgtaskscheduler?language=objc).  See new required steps in iOS Setup.
* [Added] Added new `BackgroundFetch.scheduleTask` method for scheduling custom "onehot" and periodic tasks in addition to the default fetch-task.
```dart
BackgroundFetch.configure(BackgroundFetchConfig(
  minimumFetchInterval: 15,
  stopOnTerminate: false
), (String taskId) {  // <-- [NEW] taskId provided to Callback
  print("[BackgroundFetch] taskId: $taskId");
  switch(taskId) {
    case 'foo':
      // Handle scheduleTask 'foo'
      break;
    default:
      // Handle default fetch event.
      break;
  }
  BackgroundFetch.finish(taskId);  // <-- [NEW] Provided taskId to #finish method.
});

// This event will end up in Callback provided to #configure above.
BackgroundFetch.scheduleTask(TaskConfig(
  taskId: 'foo',  //<-- required
  delay: 60000,
  periodic: false  
));
```

## Breaking Changes
* With the introduction of ability to execute custom tasks via `#scheduleTask`, all tasks are executed in the Callback provided to `#configure`.  As a result, this Callback is now provided an argument `String taskId`.  This `taskId` must now be provided to the `#finish` method, so that the SDK knows *which* task is being `#finish`ed.

```dart
BackgroundFetch.configure(BackgroundFetchConfig(
  minimumFetchInterval: 15,
  stopOnTerminate: false
), (String taskId) {  // <-- [NEW] taskId provided to Callback
  print("[BackgroundFetch] taskId: $taskId");
  BackgroundFetch.finish(taskId);  // <-- [NEW] Provided taskId to #finish method.
});
```

And with the Headless Task, as well:
```dart
/// This "Headless Task" is run when app is terminated.
void backgroundFetchHeadlessTask(String taskId) async {  // <-- 1.  Headless task receives String taskId
  print("[BackgroundFetch] Headless event received: $taskId");
  
  BackgroundFetch.finish(taskId);  // <-- 2.  #finish with taskId here as well.
}

void main() {
  // Enable integration testing with the Flutter Driver extension.
  // See https://flutter.io/testing/ for more info.
  runApp(new MyApp());

  // Register to receive BackgroundFetch events after app is terminated.
  // Requires {stopOnTerminate: false, enableHeadless: true}
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}
``` 


## 0.4.0 - 2019-12-17
* [Changed] Upgrade to new Flutter Plugin API "V2".  Requires flutter sdk version 1.12.  See [Upgrading pre 1.12 Android Projects](https://github.com/flutter/flutter/wiki/Upgrading-pre-1.12-Android-projects)

## 0.3.2 - 2019-10-06
* [Fixed] Resolve Android StrictMode violations; typically from accessing SharedPreferences on main-thread.

## 0.3.1 - 2019-09-20
* Fix error `FlutterMain.findBundleAppPath()`.  The plugin modified a deprecated API for flutter 1.9.1, breaking those on previous flutter versions.  Will use deprecated API for now.

## 0.3.0 - 2019-09-18
* Implement Android `JobInfo` constraints.
* Fix `NSLog` warnings casting to `long`
* Default `startOnBoot: true` in example

## 0.2.0 - 2019-03-15
* Use AndroidX.

## 0.1.2 - 2019-02-28
* Fixed bug with setting `jobServiceClass` using a reference to `HeadlessJobService.class`.  This crashes devices < api 21, since Android's `JobService` wasn't available until then.  Simply provide the class name as a `String`.

## 0.1.1 - 2018-11-21
* Fixed issue with Android headless config.

## 0.1.0

* First working implementation

## 0.0.1

* First working implementation
