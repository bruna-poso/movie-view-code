# Movie App (Work in Progress)

**The Movie App is an iOS application crafted with Swift, using UIKit, ViewCode, and following the MVC architecture. It shows a cool list of popular movies for you to check out.**

<img src="https://github.com/bruna-poso/movie-view-code/blob/main/Images-readme/HomeScreen.png" alt="Home Screen" width="290" height="600">

**Key Features:**

* Language: Swift
* UI Framework: UIKit
* Layout: ViewCode for a programmatic and responsive UI design.
* Architecture: MVC (Model-View-Controller) for a structured and modular codebase.

**Unit Testing:**
Unit tests are implemented using Quick and Nimble frameworks, establishing a dependable testing suite for various components. Nimble Snapshots are utilized for capturing and verifying visual changes, ensuring consistent and expected UI behavior. To ensure successful snapshot tests, they need to be run on an iPhone 15 Pro Max.

**TMDB API Integration:**
This app integrates with The Movie Database (TMDB) API to fetch movie information. To use this feature, you need to create a TMDB account, generate an API key, and replace the placeholder token in the ConfigUrl.swift file located in the MovieViewCode/Network/ directory. Follow the instructions in the [TMDB API](https://developer.themoviedb.org/reference/intro/getting-started).
.

**Note:**
The Movie App is still a work in progress. Right now, it's in Portuguese, and we're updating it to make it even better. Stay tuned for more cool features!
