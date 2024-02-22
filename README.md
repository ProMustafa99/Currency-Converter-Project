# Currency Converter App

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

## before running the project, you need to install the dependencies by running the following command:

# How Build the project

In the user interface (UI) layer, develop your UI elements, screens, and controllers. Within the domain layer, specify use cases and repositories. Finally, in the data layer, establish data sources, repositories, and models.

# Use BLoC for state management: 

In the architecture of our application, we have adopted the BLoC (Business Logic Component) design pattern for managing state and handling user interactions. BLoC architecture offers a clear separation of concerns, making it an ideal choice for structuring complex applications like ours. Below are the justifications for choosing BLoC as our design pattern :

1. **Reusability and Scalability**: BLoC promotes the reuse of business logic across different parts of the application. By encapsulating business logic in separate components, we can easily reuse them across multiple screens or features. This reusability facilitates scalability as our application grows in complexity.

2. **Predictable State Management**: BLoC provides a predictable and centralized approach to managing application state. With BLoC, changes to the application state are handled in a deterministic manner through streams of data. This predictability simplifies debugging and ensures a consistent user experience.

3. **Testability**: BLoC architecture facilitates unit testing of business logic independently of the UI layer. Since business logic is decoupled from the presentation layer, we can write comprehensive unit tests to verify the behavior of our application's features, ensuring robustness and reliability.
