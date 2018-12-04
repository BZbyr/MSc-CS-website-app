# flutter_app_hku

A new Flutter application for COMP7509 Smart Phone Apps Developmnet Group Project.

## Getting Started

### Install fultter
 
See fullter official website for details [flutter_install](https://flutter.io/docs/get-started/install).

### Run

1. Launch `iOS Simulator` or `Android Virtual Device`

2. Check that the device is running.
```
    flutter devices
```
3. Run the app with the following command:
```
    flutter run
```
After the app build completes, you’ll see the starter app on your device.

## Structure


```
.
│
├── lib                     // Source Code
│   ├── routes              // all page implementation in here
│   │   ├── about           
│   │   ├── admission
│   │   ├── alumni
│   │   ├── curriculum
│   │   │   └── overview
│   │   └── newsevents
│   └── widgets             // widgets library
│       ├── drawerWidget.dart    // General drawer component
│       ├── homePage.dart        // Home Page
│       ├── swiper.dart          // General picture swiper viewer component
│       └── tabWidget.dart       // General tab component
└── res
    └── images             // images resource 
        ├── alumniActivity
        ├── logos
        ├── news
        ├── pic
        ├── students
        │   └── work
        └── teachers

```
