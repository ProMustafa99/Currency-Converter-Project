# Currency Converter App

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

## before running the project, you need to install the dependencies by running the following command:
# dart run build_runner build --delete-conflicting-outputs


# How Build the project

In the user interface (UI) layer, develop your UI elements, screens, and controllers. Within the domain layer, specify use cases and repositories. Finally, in the data layer, establish data sources, repositories, and models.

# Use BLoC for state management: 

In the architecture of our application, we have adopted the BLoC (Business Logic Component) design pattern for managing state and handling user interactions. BLoC architecture offers a clear separation of concerns, making it an ideal choice for structuring complex applications like ours. Below are the justifications for choosing BLoC as our design pattern :

1. **Reusability and Scalability**: BLoC promotes the reuse of business logic across different parts of the application. By encapsulating business logic in separate components, we can easily reuse them across multiple screens or features. This reusability facilitates scalability as our application grows in complexity.

2. **Predictable State Management**: BLoC provides a predictable and centralized approach to managing application state. With BLoC, changes to the application state are handled in a deterministic manner through streams of data. This predictability simplifies debugging and ensures a consistent user experience.

3. **Testability**: BLoC architecture facilitates unit testing of business logic independently of the UI layer. Since business logic is decoupled from the presentation layer, we can write comprehensive unit tests to verify the behavior of our application's features, ensuring robustness and reliability.

# clear architectural design pattern for this project? 

Key Features of the Chosen Design Pattern:

1. **Separation of Concerns**: The architecture ensures a clear distinction between layers, enhancing maintainability.
  
2. **Testability**: Business logic is isolated, facilitating efficient unit testing.

3. **Flexibility**: Components can be modified independently, minimizing ripple effects.

4. **Dependency Inversion**: Adherence to the Dependency Inversion Principle fosters modular code development.

5. **Maintainability**: The organized structure promotes easier navigation and comprehension of code.

6. **Easier Collaboration**: Different teams can work on distinct layers autonomously, fostering collaboration.

7. **Code Reusability**: Encourages the creation of reusable components, enhancing efficiency in development.

8. **Scalability**: Provides a solid foundation for building scalable applications.

# why Choice CachedNetworkImage Library for image caching 

Opting for cacheNetworkImage provides a robust caching mechanism, enabling the local storage of fetched images. This improvement enhances user experience by reducing the necessity to fetch images repeatedly from the network, leading to faster load times and decreased data usage. Furthermore, the library furnishes offline support, permitting users to access previously loaded images even when offline. This feature proves especially beneficial for applications operating in environments with intermittent or restricted network connectivity.


# Choice of SQLite Library for Local Storage

The decision to utilize the SQLite library for local storage in our project is based on several key factors that align with our development requirements and goals:

1. **Robustness and Reliability**: SQLite is a well-established, lightweight, and self-contained database engine that is known for its reliability. It provides robust data storage capabilities, ensuring the integrity and durability of our application's data.

2. **Cross-Platform Compatibility**: SQLite is cross-platform and widely supported, making it an ideal choice for projects targeting multiple platforms such as iOS, Android, and web. This ensures consistent data storage and retrieval mechanisms across different environments.


 
