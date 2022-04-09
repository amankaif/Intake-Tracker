# Code Quality Guidelines
Everyone contributing to this project must adhere to the code quality guidlines as provided by this document. If sub-par quality code is contributed then you would be asked to refactor your code and/or your commit may be deleted. This may lead to significant delays in the development process, so adhere to these guidelines.

This is necessary as a team of 10+ members will be working on this project.


## Naming Conventions
As per Dart/Flutter standards:
- `UpperCamelCase` for classes, enums, and typedefs.
- `lowerCamelCase` for variables, constants, and parameter (named & unnamed).
- `lower_snake_case` for libraries, packages, folders, and source files.
- `_underscore_at_begining` for private variables. Do not have unnecessary private variables.
- Prefer short variables over longer ones. But DO NOT compromise on giving meaningful names. Remember a longer descript variable name is always better than a shorter non-descript variable name.

## Comments
Write comments explaining what your function, method, or class does only when it is necessary to do. But also keep in mind that you must write comments, and not shy away from them, when it is necessary to do so.

Just remember that good code is self-documenting, but this does not mean that you should never comment your code.


## Folder Structure
Proper segregation of code must be ensured by everyone.
- The `lib` folder should only contain one file, the `main.dart` file. All other pages must have a separate folder, inside the `lib` folder.
- Each folder inside the `lib` folder, must be a **self contained** module representing a page of the app.
- Each of the such folders must have a barrel file for easy export and appropriately named sub-folders, as per requirements, for the following:
    - `bloc` for state management code
    - `view` for the page UI code
    - `widgets` for self-contained UI componenets' code
    - `models` for the data models, i.e. classes
    - `utils` for utility classes and/or modules
- For bloc naming conventions refer to the <a href="https://bloclibrary.dev/#/blocnamingconventions">official docs</a> for bloc.


## Constants & Theming
- DO NOT hard-code string values, colors, and paddings/margins for the UI.
- Maintain an app-wide `constants` folder in the `lib` folder, i.e. one place.
- Inside the `constants` folder maintain two files:
    - `ui_strings.dart` for static text displayed in the UI.
    - `ui_decoration.dart` for color and paddings/margins etc.
- The colors defined in `ui_decoration.dart` must be used in the `MaterialApp` theming options ONLY (exceptions could be made on a case-by-case basis, if justifiable)
- Colors to componenets in the UI code must ONLY be provided using `Theme.of(context)./*... your code */`
- Padding and margins should ONLY be defined using scalar multiples of `kDefaultPadding`/`kDefaultMargin` defined in the `ui_decoration.dart` file.


## Strict Separation of UI & Logic
Under no circumstance should intermingling of UI code and logic code may be permitted. This can lead to a boat full of bugs, and if indulged in consistently may require a complete rewrite of the app in the later stages of development. I repeat, DO NOT let this happen at ANY COST. This is the single most important item in this checklist.

Use a state management library like <a href="https://bloclibrary.dev/">Bloc</a>, and the design patterns which come along with it. Bloc will make separation of UI & logic trivial.


## Imports & Exports
- Each folder & sub-folder under `lib` must have a barrel file.
- Essentialy if you are in a folder and the name of that folder is not `lib`, then you probably should make a barrel file.
- Imports inside a `.dart` file must be made in the following order, by the follwoing categories of the import. Each category of import must be separated by an empty line.
    - Dart language imports
    - Flutter modules imports
    - Third party libraries' imports
    - Local files' imports (MAKE SURE that you are giving relative paths for these)
    - `part` statements

```dart
/* Example of import ordering and style */
import 'dart:math'; // dart language import. Begining with 'dart:'
                    // empty line
import 'package:flutter/material.dart'; // flutter modules
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart'; // third party library

import './bloc/feature_bloc.dart'; // local files, NOTE: relative paths
import './models/my_model.dart';
import '../constants/ui_decoration.dart';

part './something.dart'; // part statement at end

// your code ...
```

## State Management
- DO NOT manage state with `setState`. Avoid it, and stateful widgets unless required for some UI effect. Otherwise, always use stateless widgets with bloc.
- Use <a href="https://bloclibrary.dev/">bloc</a> to manage state. This will make separation of UI & logic trivial.
- An exception to using bloc may be made, on a case-by-case basis, in lieu of <a href="https://pub.dev/packages/provider">Provider</a>. This is likely to be very rare though.


## Dependency Management
This is trivial in dart/flutter so not much work needed. But DO ensure the following:
- Use version `>=2.10.3 <3.0.0` for flutter.
- Use version `>=2.16.1 <3.0.0` for the dart sdk.
- Remove unused dependencies from the `pubspec.yaml` file.
- Make use of the `dev-dependencies` section to add packages which are only needed during the development of the app, and are not required to be compiled and shiped to the end-user.
- ALWAYS put the version number next to a dependency in the `pubspec.yaml` file.

DO:
```yaml
firebase_auth: ^3.3.11
```
DO NOT:
```yaml
firebase_auth:
```


## Data Layer (Data Dependency Injection)
Refer to the <a href="https://bloclibrary.dev/#/architecture?id=data-layer">architecture page</a> of official bloc documentation. Also give it a read though for some other great helpful tips.
