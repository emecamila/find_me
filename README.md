# FindMe - Flutter Mobile Application

## Description

FindMe is a mobile application built using **Flutter** that allows users to search for and explore a list of randomly generated people. The app fetches random user data from the [RandomUser.me API](https://randomuser.me/), providing an engaging way to explore user profiles. It includes features such as dynamic search, filtering, infinite scrolling, and detailed user profiles.The app  The app uses **Riverpod** for state management and integrates **Google Maps** to visualize user locations.

This app is designed following the **Clean Architecture** principles to separate concerns, increase testability, and improve maintainability. The project is structured into layers that allow for easy modification, extensibility, and testing of different components independently.


## Features

### 1. **Search Functionality**
   - Users can search for people by their **name** (e.g., search for "sa" to find both "Isabela" and "Sam Porter").
   - The search updates in real-time as the user types, with results dynamically filtered based on the input text.

### 2. **Infinite Scrolling**
   - As the user scrolls down the list of people, additional user profiles are automatically fetched and displayed.
   - This feature ensures that users can keep exploring the list without needing to manually load more content.

### 3. **User Profile Details**
   - Each user profile contains key information like their **gender**, **name**, **username**, **nationality**, **age**, **email**, **phone**, and **location**.
   - The user can tap on any individual to view more details such as their **location on the map** and **full name**.

### 4. **Map Integration**
   - The app displays user locations on a map using **Google Maps**.
   - When a user is selected, their location is shown on the map.
   - The app uses latitude and longitude coordinates to plot the user on the map.

### 5. **Refreshable User List**
   - The user list can be refreshed by pulling down at the top of the screen, allowing for updated data or simply to reload the list.

### 6. **Filter Modal (Optional)**
   - There is an option to apply additional filters when searching for users. For example, users can filter by gender.
   - Tapping the filter icon in the search bar brings up a modal where filters can be applied.

### 7. **Responsive UI**
   - The app's user interface is responsive, adjusting its layout depending on the screen size and device type (phones, tablets).
   - The UI is optimized to provide a seamless experience on both Android and iOS devices.

### 8. **Multilingual Support (English and Spanish)**
   - The app supports both **English** and **Spanish** languages.
   - Users can easily switch between languages by tapping a button located at the top of the **Home Screen**.
   - The UI elements, such as buttons, labels, and error messages, will update according to the selected language.

---

## Usage

### 1. **Search for Users**
   - **Start typing** in the search bar to look for users. You can type the **full name** or even just **partial letters**.
   - For example, typing "sa" will return results that include **"Isabela"** and **"Fernan Torres"**.
   - The search results update dynamically as you type, filtering out irrelevant names in real-time.

### 2. **Infinite Scroll**
   - As you scroll through the list of users, the app will automatically load more profiles when you reach the bottom of the list. This is powered by infinite scrolling, making it easy to explore a large set of users without manually loading additional pages.

### 3. **View Detailed User Profile**
   - **Tap on a user** to view their profile details, including:  
   - Full Name  
   - Gender  
   - Username  
   - Nationality  
   - Age  
   - Email Address  
   - Phone Number  
   - Location (Address and Coordinates)  
   - A **map** showing their geographical location based on latitude and longitude.

### 4. **Filter Users (Optional)**
   - Tap the **filter icon** in the search bar to open a **bottom sheet modal** that allows you to apply filters (e.g., location-based filters or sorting).
   - This feature is useful if you want to narrow down the list of users based on certain criteria, such as filtering by city or age range.

### 5. **Pull to Refresh**
   - You can **pull down** on the user list to refresh the data, reloading the list with new or updated information.
