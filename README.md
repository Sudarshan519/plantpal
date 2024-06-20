# plantpal
A new Flutter project.

### Project Setup

##### Clone this repository

``` shell
git clone repourl
```

##### Go to the project directory

``` shell
cd repo
```

### Separating flavors
# Dev For Development Server
```bash
flutter build apk -t lib/main_dev.dart #--flavor=dev --debug
```
# Stg for Staging Server
```bash
flutter build apk -t lib/main_stg.dart #--flavor=stg --debug
```
# Live for Production Server
```bash
flutter build apk -t lib/main_prod.dart #--flavor=prod --debug
flutter build apk -t lib/main_prod.dart #--flavor=prod --release
flutter build appbundle -t lib/main_prod.dart #--flavor=prod --release
```
##### Get all the packages

``` shell
flutter pub get
```

### To Generate auto generated freezed union and other auto generated.

# Execute 
```dart
flutter pub run build_runner build --delete-conflicting-outputs

```

### To generate and update locale file and translations
Export each sheet to tsv and put them inside gen/tsv_files
then run:
```dart
dart run gen/generate.dart
flutter gen-l10n
flutter pub get
```

### To push tags
git tag 1.0.8+25
git push --tags
##### Run the project

``` shell 
flutter run
## or simply press ` F5 key` if you are using VSCode
```


### Genterate launcher icons

``` dart
flutter pub run flutter_launcher_icons:main
```


###  Native Splash generation
``` dart
flutter pub run flutter_native_splash:create
```