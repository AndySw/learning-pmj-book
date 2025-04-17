# 📘 learning-pmj-book

A development playground for working through the **7th Edition** of *Learning PHP, MySQL & JavaScript*.

This project is designed for hands-on learning and experimentation, with a focus on modern containerised development using Docker.

---

## 🚀 Project Overview

- **Purpose**: Follow along with the examples and exercises in the book, iterating on code and experimenting freely.
- **Environment**: Isolated LAMP stack (Linux, Apache, MySQL, PHP) using Docker Compose.
- **Tooling**: Uses `make` to control Docker Desktop and streamline setup tasks.
- **Code Location**: The `src/` directory is mounted directly into the Apache container for immediate changes and testing.

---

## 🛠️ Prerequisites

Before getting started, ensure you have the following installed on your system:

- [Docker Desktop for Linux](https://docs.docker.com/desktop/install/linux-install/)
- [GNU Make](https://www.gnu.org/software/make/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## 🧪 How to Use

### 🔧 Start the Environment

```bash
make start
