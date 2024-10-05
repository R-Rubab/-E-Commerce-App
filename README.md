
---

# E-Commerce App Documentation

## Getting Started

## Table of Contents

1. [Project Overview](#project-overview)
2. [User Interface Layout](#user-interface-layout)
3. [Technologies Used](#technologies-used)
4. [Project Structure](#project-structure)
5. [Design Decisions](#design-decisions)
6. [State Management (Bloc)](#state-management-bloc)
7. [Firebase Integration](#firebase-integration)
   - [Authentication](#authentication)
   - [Firestore](#firestore)
   - [Storage](#storage)
8. [How to Run the App](#how-to-run-the-app)
9. [Advanced Features](#advanced-features)
10. [Conclusion](#conclusion)

## Project Overview

The E-Commerce application allows users to browse products, add items to a cart, and proceed to checkout. It integrates Firebase services for authentication, data storage, and product management. The app uses Flutter for the frontend, Firebase for backend services, Bloc for state management, and Clean Architecture principles.

## Technologies Used

- **Flutter**: For building the user interface.
- **Firebase**:
  - Firestore: To store product and user data.
  - Authentication: To handle user sign-in and registration.
  - Storage: To store images of products.
- **Bloc**: For handling the app's state.
- **Clean Architecture**: For structuring the code into layers and ensuring scalability.

## User Interface Layout:
Below is the UI implementation for E-Commerce:
<table>
    <tbody>
        <tr>
            <th colspan="4" align="center">E-Commerce Application Using Flutter</th>
        </tr>
        <tr>
            <td><img width="300" height="440" alt="img1" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/1.png"></td>
            <td><img width="300" height="440" alt="img2" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/2.png"></td>
            <td><img width="300" height="440" alt="img3" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/3.png"></td>
            <td><img width="300" height="440" alt="img33" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/3.1.png"></td>
        </tr>
        <tr>
            <td><img width="300" height="440" alt="img4" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/4.png"></td>
            <td><img width="300" height="440" alt="img5" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/5.png"></td>
            <td><img width="300" height="440" alt="img6" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/6.png"></td>
            <td><img width="300" height="440" alt="img7" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/7.png"></td>
        </tr>
        <tr>
            <td><img width="300" height="440" alt="img8" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/8.png"></td>
            <td><img width="300" height="440" alt="img9" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/9.png"></td>
            <td><img width="300" height="440" alt="img10" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/10.png"></td>
            <td><img width="300" height="440" alt="img11" src="https://github.com/R-Rubab/-E-Commerce-App/blob/main/UI%20IMAGES/11.png"></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <a href="https://github.com/R-Rubab/-E-Commerce-App">
                    <img src="https://github-readme-stats.vercel.app/api/pin/?username=R-Rubab&repo=-E-Commerce-App&theme=dracula" alt="Storage" />
                </a>
            </td>
        </tr>
    </tbody>
</table>


## Packaged
```
  1. firebase_auth
  2. firebase_core
  3. cloud_firestore
  4. flutter_svg
  5. flutter_bloc
  6. dartz
  7. get_it
  8. flutter_screenutil
  9. google_fonts
  10. curved_navigation_bar
```

## Project Structure

The project follows the Clean Architecture, which divides the code into different layers:

1. **Data Layer**: Handles the interaction with Firebase (Firestore, Authentication, Storage) and external APIs.
2. **Domain Layer**: Contains the business logic, use cases, and entity definitions.
3. **Presentation Layer**: Consists of the user interface and state management logic (Bloc).
4. **Application Layer**: Manages dependency injection and app initialization.

```
lib/
├── common/
│   ├── bloc/
│   ├── helper/
│   ├── widgets/
├── core/
│   ├── configs/
│   ├── constants/
│   ├── useCase/
├── data/
│   ├── auth/
|   |   ├── entity
|   |   ├── repository
|   |   ├── source
│   ├── category/
|   |   ├── entity
|   |   ├── repository
|   |   ├── source
│   ├── order/
|   |   ├── entity
|   |   ├── repository
|   |   ├── source
│   ├── product/
|   |   ├── entity
|   |   ├── repository
|   |   ├── source
├── domain/
│   ├── auth/ 
|   |   ├── entity
|   |   ├── repository
|   |   ├── usecases
│   ├── category/
|   |   ├── entity
|   |   ├── repository
|   |   ├── usecases
│   ├── order/
|   |   ├── entity
|   |   ├── repository
|   |   ├── usecases
│   ├── product/
|   |   ├── entity
|   |   ├── repository
|   |   ├── usecases
├── presentation/
│   ├── blocs/
│   ├── screens/
│   ├── widgets/
├── app/
│   ├── service.dart
│   ├── firebase_options.dart
│   ├── main.dart
```

## Design Decisions

1. **Clean Architecture**: This architecture was chosen to ensure scalability and separation of concerns. It allows for easy maintenance and adding new features without affecting other layers.
2. **Bloc State Management**: Bloc was selected to manage the state effectively and facilitate testing and debugging. It provides a clear separation of business logic from the UI.

## State Management (Bloc)

Bloc (Business Logic Component) is used to manage the state across the app. All user interactions, such as authentication, product loading, and cart management, are handled through Bloc.

Each feature in the app has its own Bloc that handles events, states, and the associated logic. For example:

- **AuthenticationBloc** handles user login, registration, and sign-out.
- **ProductBloc** manages product fetching and filtering.
- **CartBloc** handles adding/removing items from the cart and checking out.

### For Instance:

```dart
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;

  ProductBloc(this._repository) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final products = await _repository.getAllProducts();
      emit(ProductLoaded(products));
    } catch (_) {
      emit(ProductError('Failed to load products'));
    }
  }
}
```

## Firebase Integration

### Authentication

Firebase Authentication is used for user registration, login, and managing user sessions. We have implemented Google Sign-In and email/password authentication.

### Firestore

Firestore is used to store all product data and user details. It is structured in a way to allows real-time data fetching for product listings, user orders, and cart data.

### Storage

Firebase Storage is used to store images of products that are then displayed in the app.

### Example Firebase Integration:

```dart
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Fetching products from Firestore
Future<List<Product>> getAllProducts() async {
  final snapshot = await _firestore.collection('products').get();
  return snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
}
```

## How to Run the App

1. **Pre-requisites**:

   - Install Flutter SDK.
   - Create a Firebase project and enable Authentication, Firestore, and Storage.
   - Set up Firebase in your Flutter project by following the official [Firebase documentation](https://firebase.flutter.dev/docs/overview).

2. **Clone the Project**:

   ```bash
   git clone https://github.com/your-repo/ecommerce-app.git
   cd ecommerce-app
   ```

3. **Set up Firebase**:

   - Add your `google-services.json` file (for Android) and `GoogleService-Info.plist` (for iOS) to the respective folders in the project.

4. **Install Dependencies**:

   ```bash
   flutter pub get
   ```

5. **Run the App**:
   - For Android:
     ```bash
     flutter run
     ```
   - For iOS:
     ```bash
     flutter run
     ```

## Advanced Features

1. **Real-Time Data Updates**: The app uses Firestore's real-time update features to display live product updates.
2. **Advanced Animations**: Custom animations have been added for product listing and cart transitions.
3. **Responsive Design**: The app is responsive and works across various screen sizes, including tablets and mobile phones.



## Conclusion

The E-Commerce app was built using modern technologies like Flutter, Firebase, Bloc, and Clean Architecture. This approach ensures a scalable, maintainable, and feature-rich application that can be easily extended with new functionalities in the future.

---


```
😊Crafted and Designed by Rubab.❤️
```
