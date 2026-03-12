<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![GNU Affero General Public License v3.0 License][license-shield]][license-url]

<div align="center">
  <h3 align="center">Jelle Buning's Portfolio</h3>
  <p align="center">
    A personal portfolio application.
    <br />
    <a href="https://jellebuning.github.io/portfolio/">View Live</a>
    ·
    <a href="https://github.com/JelleBuning/portfolio/issues">Report Bug</a>
    ·
    <a href="https://github.com/JelleBuning/portfolio/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#features">Features</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>



## About The Project

A personal portfolio application built with Flutter, designed to showcase professional projects, technical skills, and experience. The application features a responsive UI design that adapts seamlessly across different screen sizes and devices.

### Features

* **Responsive Design:** Optimized UI that adapts to mobile, tablet, and desktop viewports
* **Project Showcase:** Detailed presentation of professional work and technical projects
* **Skills Display:** Comprehensive overview of technical expertise and competencies
* **Professional Experience:** Timeline and description of professional background
* **Modern Architecture:** Built with Flutter's best practices and design patterns for maximum maintainability

### Built With

* [Flutter](https://flutter.dev)
* [Dart](https://dart.dev)

## Getting Started

Setting up this project on your local machine is straightforward and will enable you to fully utilize its capabilities. This guide will walk you through the necessary steps to get everything running smoothly.

Before beginning, ensure that your development environment is properly configured. Having the required software and dependencies installed will prevent common issues and streamline the process.

### Installation

#### Option 1: Clone and Run Locally

1. Clone the repository:
   ```bash
   git clone https://github.com/JelleBuning/portfolio.git
   cd portfolio
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run -d chrome  # For web
   # or
   flutter run           # For mobile/desktop
   ```

#### Option 2: Docker Compose (if available)

This installation method utilizes Docker Compose for a streamlined setup. Ensure you have Docker and Docker Compose installed on your system.

1. **Create a `docker-compose.yml` file:**

   Create a new file named `docker-compose.yml` in a directory of your choice. Copy and paste the following content into it:

   ```yaml
   version: '3.4'
   name: portfolio
   services:
     portfolio:
       container_name: "portfolio"
       image: ghcr.io/JelleBuning/portfolio
   ```

2. **Run Docker Compose:**

   In the same directory as your `docker-compose.yml` file, execute the following command:

   ```bash
   docker-compose up -d
   ```

   This command will download the necessary images, create the containers, and start them in detached mode.

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b features/feature-title`)
3. Commit your Changes (`git commit -m 'Added feature'`)
4. Push to the Branch (`git push origin features/feature-title`)
5. Open a Pull Request


<!-- LICENSE -->
## License

This project is open source and available under the terms specified in the repository.


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/JelleBuning/portfolio.svg?style=for-the-badge
[contributors-url]: https://github.com/JelleBuning/portfolio/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/JelleBuning/portfolio.svg?style=for-the-badge
[forks-url]: https://github.com/JelleBuning/portfolio/network/members
[stars-shield]: https://img.shields.io/github/stars/JelleBuning/portfolio.svg?style=for-the-badge
[stars-url]: https://github.com/JelleBuning/portfolio/stargazers
[issues-shield]: https://img.shields.io/github/issues/JelleBuning/portfolio.svg?style=for-the-badge
[issues-url]: https://github.com/JelleBuning/portfolio/issues
[license-shield]: https://img.shields.io/github/license/JelleBuning/sentinel.svg?style=for-the-badge
[license-url]: https://github.com/JelleBuning/sentinel/blob/master/LICENSE