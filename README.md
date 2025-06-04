# flutter_tutorial_april

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Featuress

Welcome Screen -> login and sign up button 
Sign in -> Email and Password, 
Sign up -> Email and Password, user name, phone 
Home Screen -> categories, my tasks, profile 
task creation 
profile screen


ui
domain
data 
config
├─── utils
├─── routing
## Folder Structure
lib
├─┬─ ui
│ ├─┬─ core
│ │ ├─┬─ ui
│ │ │ └─── <shared widgets>
│ │ └─── themes
│ └─┬─ <FEATURE NAME>
│   ├─┬─ view_model
│   │ └─── <view_model class>.dart
│   └─┬─ widgets
│     ├── <feature name>_screen.dart
│     └── <other widgets>
├─┬─ domain
│ └─┬─ models
│   └─── <model name>.dart
├─┬─ data
│ ├─┬─ repositories
│ │ └─── <repository class>.dart
│ ├─┬─ services
│ │ └─── <service class>.dart
│ └─┬─ model
│   └─── <api model class>.dart
├─── config
├─── utils
├─── routing
├─── main_staging.dart
├─── main_development.dart
└─── main.dart

// The test folder contains unit and widget tests
test
├─── data
├─── domain
├─── ui
└─── utils

// The testing folder contains mocks other classes need to execute tests
testing
├─── fakes
└─── models

## Button Widget usage

 ButtonWidget(title: 'Login', onPressed: () {}),
              const SizedBox(
                height: 10,
              ),

              ButtonWidget(title: 'Sign Up', onPressed: () {}),

## Textfiled Widget usage


              InputTextWidget(
                hintTex: 'Enter your email',
                controller: TextEditingController(),
                textInputType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email, color: Colors.grey),
              ),
              InputTextWidget(
                hintTex: 'Enter your email',
                controller: TextEditingController(),
                textInputType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.visibility, color: Colors.grey),
              ),

## event Card

              const EventCardWidget(
                  title: 'Read a book about UI', timings: '09:00 - 11:00 AM'),
              const EventCardWidget(
                  backgroundColor: Colors.blue,
                  title: 'Read a book about UI',
                  timings: '09:00 - 11:00 AM'),
              const EventCardWidget(
                  title: 'Read a book about UI', timings: '09:00 - 11:00 AM'),
              const EventCardWidget(
                  backgroundColor: Colors.blue,
                  title: 'Read a book about UI',
                  timings: '09:00 - 11:00 AM'),

##  category card
              const CategoryCard(
                  title: "Web Design", subtitle: "356236", count: 10),
              const CategoryCard(
                  title: "Web Design", subtitle: "356236", count: 60),

##  Task Card
               TaskCard(
                  title: 'title',
                  description: 'description',
                  timings: 'timings',
                  onPressed: () {})