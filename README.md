# Flutter Clean Portfolio Template

A clean, modern, and highly-customizable portfolio template built with Flutter.
Designed with Clean Architecture principles, ensuring that data is detached from the UI so you can easily update your information from central config files.

## Features
- **Centralized Configuration:** Edit your name, bio, skills, and projects in one place.
- **Theme Driven:** Single source of truth for colors, gradients, and typography.
- **Responsive Design:** Works flawlessly on Mobile, Tablet, and Desktop Web.
- **Tasteful Animations:** Fade, slide, and hover scale animations out of the box.
- **Clean Architecture-inspired:** Organized codebase for high maintainability.

## How to Customize

This portfolio is built to be "configured, not hacked". Here are the files you need to change to make it your own:

### 1. General Info & Social Links
Open `lib/config/app_config.dart`.
Change the variables like `name`, `role`, `bio`, and social URLs (`githubUrl`, etc.).
The entire app will instantly reflect your new info.

### 2. Colors & Theme
Open `lib/config/theme_config.dart`.
- Change the `primary` color to alter the accent and glow effect of the app.
- Modify the `backgroundGradient` or text colors to match your brand.
- The UI uses these variables globally. No need to touch specific UI widgets.

### 3. Skills
Open `lib/config/skill_config.dart`.
Add, remove, or modify your skills through the `SkillConfig` lists.
Each skill can have its own `glowColor` for a nice visual pop!

### 4. Projects
Open `lib/config/project_config.dart`.
Update the list of projects with your own works, images, and repository links.

## Running the App

1. Ensure you have Flutter installed.
2. Run `flutter pub get` to download dependencies.
3. Run `flutter run -d chrome` to preview the web version, or run it on a mobile emulator.

Enjoy your new, ownable portfolio!
