# [APK](https://github.com/maranix/tif_assignment/raw/main/app-release.apk)

## Screenshots
<p align="center">
<image src="screenshots/1.png?raw=true" width=32% />
<image src="screenshots/2.png?raw=true" width=32%/>
<image src="screenshots/3.png?raw=true" width=32% />
<image src="screenshots/4.png?raw=true" width=32%/>
<image src="screenshots/5.png?raw=true" width=32% />
<image src="screenshots/6.png?raw=true" width=32%/>
<image src="screenshots/7.png?raw=true" width=32%/>
</p>

## Demo
https://github.com/maranix/tif_assignment/assets/59292838/93f39cc3-f0e1-4985-b959-288286e9e8bb

## Tech Stack

- Flutter 3.10
- Dart 3.0
- BLoC
- Equatable
- http
- intl
- flutter_svg

## Project Structure

```
src
├── app
│   ├── app.dart
├── data
│   ├── model
│   │   ├── ......
│   │   ├── model.dart
│   └── repository
│       ├── ......
│       ├── base.dart
│       └── repository.dart
├── features
│   ├── ......
│   ├── features.dart
├── presentation
│   ├── home
│       ├── ......
│   │   ├── home.dart
│   └── widgets
│       ├── ......
│       └── widgets.dart
│   ├── presentation.dart
├── ui
│   ├── ......
│   └── ui.dart
└── utils
│   ├── ......
    └── utils.dart
```

**Folders and Their Purpose:**

1. **app**: Contains core application files.
    - `app.dart`: Main entry point of the application.

2. **data**: Manages data-related operations, including data models and repositories.
    - `model`: Holds data models related to filters, listings, and search.
    - `repository`: Contains repository classes that interact with data sources like APIs or databases.
    - `base.dart`: Base class/interface for repositories.

3. **features**: Organizes different feature modules of the application, each having its own bloc for state management.
    - `home`: Feature module for the home screen.
    - `event`: Feature module for handling event related functionality.
    - `search`: Feature module for search functionality.

4. **presentation**: Handles the presentation layer of the application, including UI components and widgets organized by features.
    - `home`: UI components related to the home screen.
    - `event`: UI components related to event screen.
    - `search`: UI components related to search functionality.
    - `widgets`: Shared UI widgets used across different presentation modules.

5. **ui**: Contains files related to the user interface, such as color constants, padding constants, theme definitions, and UI-related constants.

6. **utils**: Contains utility files, including extensions and other functionalities.
    - `extensions`: Holds custom extension methods for various purposes.
    - `utils.dart`: Barrel file for clean imports.

## Architecture & Design Decisions

- Used BLoC library for state management.
- Implemented a slightly modified version of the recommended Layered Architecture for BLoC library to manage the app's state and separate concerns effectively.
- Took advantage of latest Dart 3.0 features such as Class Modifiers to clearly depict the purpose of the classes. Such as interface, sealed, final and base modifiers respectively.
- Structured the project in an efficient and easy to understand layout.
- Separated the theme and style related concerns into different libraries effectively.
- Used ThemeExtensions to apply custom styles, colors, paddings, spacings to achieve a pixel perfect UI Layout.

## Setup Instructions

To run this project locally, follow these steps:

1. Clone the repository: `git clone https://github.com/maranix/tif_assignment`
2. Navigate to the project directory: `cd tif_assignment`
3. Ensure you have Flutter and Dart SDK installed. If not, you can download them from the official Flutter website.
5. Install project dependencies: `flutter pub get`
6. Run the project on your preferred device or emulator: `flutter run`

## Future Scope

This project can be enhanced further in many ways:

1. Some of the widgets can be optimized to be more reusable.
2. A better responsive layout style such as Dual/Two Pane widget can further increase the user experience.
3. The code can be more descriptive by nature and it self by optimizing the utility functions and name of the variables and functions as well.
4. Comments can be added to increase the readability of the code and its purpose (although it is fine for now since it is not that complicated).
5. Different Layout style can be displayed to the used by using responsive widget such as LayoutBuilder.

## License

This project is licensed under the MIT License.

## Contact

For any inquiries or questions, you can reach me at ramanverma4183@gmail.com
