# Android Setup

There are no longer any extras setup instructions for Android.

If you'd installed a *previous version* (`< 1.5.0`), you can remove those previous setup instructions now (when using `background_fetch >= 1.5.0`)

Otherwise, there's nothing more to do for *Android Setup*.

## `AndroidManifest`

##### :open_file_folder: `android/app/src/main/AndroidManifest.xml`:

```diff
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    package="com.example.helloworld">

    <application
-        tools:replace="android:label"
         android:name="io.flutter.app.FlutterApplication"
         android:label="flutter_background_geolocation_example"
         android:icon="@mipmap/ic_launcher">
</manifest>

```

## :open_file_folder: `android/build.gradle` / `android/build.gradle.kts`

#### `build.gradle`

```diff
allprojects {
    repositories {
        google()
        mavenCentral()
-       // [required] background_fetch
-       maven { url "${project(':background_fetch').projectDir}/libs" }
    }
}
```

#### `build.gradle.kts`


```diff
allprojects {
    repositories {
        google()
        mavenCentral()
-       // [required] background_fetch
-       maven(url = "${project(":background_fetch").projectDir}/libs")
    }
}
```
