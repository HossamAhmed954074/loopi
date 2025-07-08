# Bus Booking Application

A modern and user-friendly **Bus Booking App** built with **Flutter**. This app allows users to easily browse bus routes, book tickets, view routes on maps, get places information, and make payments for their bookings. It leverages **BLoC** for state management, **Firebase** for authentication and data storage, and integrates **Google Maps SDK**, **Places API**, and multiple **payment gateways** for a seamless experience.

## Features

- **Browse Routes**: View available bus routes, schedules, and seat availability.
- **Book Tickets**: Reserve tickets for your desired route and time.
- **Maps Integration**: View bus routes on Google Maps and get directions.
- **Places API**: Automatically detect and suggest places for departure and arrival.
- **User Authentication**: Register, log in, and manage accounts using Firebase Authentication.
- **Payment Integration**: Make payments using various methods like **Stripe**, **PayPal**, or **Google Pay**.
- **Real-time Updates**: Get real-time updates on bus availability, ticket bookings, and payment status.
- **Firestore Database**: Store and retrieve user data, routes, bookings, and payment history.

## Technologies Used

- **Flutter**: The mobile framework used to build the app.
- **Dart**: Programming language used.
- **BLoC**: State management solution for managing app states efficiently.
- **Firebase**: For backend services, including authentication and Firestore database.
- **Google Maps SDK**: For displaying bus routes on maps and viewing location-based information.
- **Places API**: For location suggestions, such as departure and arrival points.
- **Stripe / PayPal / Google Pay**: For payment integration.

## Installation

### Prerequisites

Before running the project, make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- An IDE like **Android Studio** or **VSCode**.
- Firebase account and setup for authentication and Firestore (steps below).

### Firebase Setup

1. **Create a Firebase Project**:
   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Create a new Firebase project and follow the steps to configure your app (Android/iOS).
   - Add your **google-services.json** (for Android) and **GoogleService-Info.plist** (for iOS) to your project.

2. **Enable Firebase Authentication**:
   - In the Firebase Console, enable Firebase Authentication (Email/Password or Google Sign-In).

3. **Enable Firestore**:
   - Set up Firestore to store your routes, user bookings, and other data.

4. **Enable Payment Methods** (Stripe/PayPal):
   - Set up **Stripe** or **PayPal** in the Firebase Console to handle payments (you will need API keys).

### Steps to Run the Project Locally

1. **Clone the repository**:
    ```bash
    git clone https://github.com/HossamAhmed954074/loopi.git
    ```

2. **Navigate to the project directory**:
    ```bash
    cd loopi
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Set up Firebase**:
    - Make sure you've followed the Firebase setup above to link Firebase with your project.
    - Add your **google-services.json** and **GoogleService-Info.plist** to the respective platform directories.

5. **Run the app**:
    - For **Android**:
      ```bash
      flutter run
      ```
    - For **iOS** (on macOS):
      ```bash
      flutter run
      ```

## Usage

Once the app is running:

- **Browse Routes**: View available bus routes and schedules. The app uses the Google Maps SDK to show the route and display available bus stations.
- **Book Tickets**: Select a route, choose your seat, and proceed with booking. You can use Firebase Authentication to sign in and store your booking data.
- **Maps Integration**: Visualize the bus routes on Google Maps and get directions for pickup and drop-off points.
- **Places API**: Automatically detect and suggest places for departure and arrival.
- **Payment Methods**: Pay for your ticket using Stripe, PayPal, or Google Pay. The payment gateway is integrated with Firebase to store transaction details.
- **Real-time Updates**: Receive notifications and real-time updates for your bookings, payments, and route status.

## BLoC Architecture

This app uses the **BLoC** (Business Logic Component) pattern for managing the application state. It ensures that the business logic is separated from the UI, making the app scalable and maintainable.

### Key BLoC Components:

- **Authentication Bloc**: Manages the authentication state (sign in, sign out).
- **Booking Bloc**: Manages the booking state (available routes, seat selection, ticket booking).
- **Payment Bloc**: Manages the payment process (Stripe/PayPal integration).
- **Map Bloc**: Manages the state of Google Maps (route visualization, location suggestions).

## Contributing

We welcome contributions to improve this app! If you'd like to help out, please fork the repository, make your changes, and submit a pull request.

### How to Contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push to your fork (`git push origin feature-name`).
5. Open a pull request.

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for more details.

## Contact

For any questions, feel free to contact me:

- Email: eltohamehossam@gmail.com
- LinkedIn: www.linkedin.com/in/hossam-ahmed-ab4987248


---

Thank you for checking out **Bus Booking App**! We hope you enjoy using the app and contributing to its development.
