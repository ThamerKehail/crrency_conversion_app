**Currency Conversion App**
Welcome to the Currency Conversion App! This project is a currency converter application built using Cubit state management, clean architecture principles, and utilizes specific libraries for image loading and local data storage.

* Table of Contents
* Project Overview
* Build Instructions
* Architecture Design
* Image Loader Library
* Database
* Project Overview
`This currency conversion application allows users to convert between different currencies. It incorporates Cubit state management for robust and predictable state handling, follows clean architecture principles for a modular and maintainable codebase, and uses specific libraries for efficient image loading and local data storage.
`
Build Instructions
To build the project, follow these steps:

Clone the repository:

bash
Copy code
git clone https://github.com/your-username/currency-converter.git
Navigate to the project directory:

bash
Copy code
cd currency-converter
Install dependencies:

bash
Copy code
flutter pub get
Run the application:

bash
Copy code
flutter run
Architecture Design
The app is designed following the clean architecture principles, which separates the application into distinct layers: presentation, domain, and data. Additionally, Cubit state management is used to manage the app's state in a predictable and testable way. This architecture promotes code reusability, maintainability, and testability.

Why Clean Architecture?
Clean architecture allows for a clear separation of concerns, making the codebase modular and easier to maintain. It enables unit testing of individual components and ensures that business logic remains independent of external frameworks.

Why Cubit State Management?
Cubit provides a clean and simple way to manage the state in Flutter applications. It facilitates a reactive programming approach, making it easy to handle complex state transitions and keeping the UI in sync with the application's state.

Image Loader Library
The app utilizes the "cached_network_image" library for efficient loading and caching of images. This library is chosen for the following reasons:

Caching: "cached_network_image" provides built-in caching mechanisms, reducing the need to repeatedly download images from the network.

Performance: It optimizes image loading and rendering, resulting in a smoother user experience.

Flexibility: The library supports various image formats and network sources, making it adaptable to different scenarios.

Database
Hive is employed as the local database for storing and retrieving data in the app. Hive is chosen for the following reasons:

Performance: Hive is a lightweight and fast NoSQL database that performs well in mobile applications, ensuring efficient data storage and retrieval.

Flutter Integration: Hive is designed to work seamlessly with Flutter, providing a native and efficient database solution for Flutter applications.

Simplicity: The simple API and schema-less nature of Hive make it easy to work with, especially in the context of a currency conversion app with relatively straightforward data requirements.

Feel free to explore, contribute, and enhance the Currency Conversion App! If you have any questions or feedback, please reach out to us. Happy coding!






