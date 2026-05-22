DinoApp is a lightweight, high-performance iOS application built entirely with programmatic UIKit. It dynamically fetches, decodes, and displays rich paleontological data about dinosaurs, utilizing advanced layout architectures and modern networking practices.

Screenshots:
<img width="3460" height="1434" alt="Screens" src="https://github.com/user-attachments/assets/322ff326-ae0a-4e21-9cd3-6e2bcf615649" />

Key Features:
* **Asynchronous Networking:** Integrated a robust data-fetching layer utilizing `URLSession` to fetch live JSON payloads from remote servers.
* **Safe Data Parsing:** Implemented strict decoupled data models conforming to the `Decodable` protocol for seamless JSON-to-object translation.
* **Programmatic UI Layout:** Built entirely without Storyboards or XIBs. All interfaces, custom cells, and view hierarchies are constructed purely via code using **Auto Layout** anchors.
* **Advanced UI Components:** Dynamic navigation managed by `UINavigationController`, featuring highly optimized custom cell recycling within `UITableView` and `UICollectionView`.
* **Clean Architecture:** Separated concerns between the networking service layer and View Controllers to ensure code maintainability and scalability.

Language: Swift: 6.03
UI Framework: UIKit (Programmatic UI, Autolayout)
Tools: Xcode 16.2, Homebrew, Github
