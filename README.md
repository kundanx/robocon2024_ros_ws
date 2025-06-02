# ABU Robocon 2024 – ROS 2 Codebase

This repository contains the complete ROS 2 (Humble) workspace used by Team [Your Team Name] in ABU Robocon 2024 held in Vietnam.

## 🏆 Competition Theme
See [`docs/competition_theme.md`](docs/competition_theme.md) for full details.

## 🧱 Workspace Overview

- ROS Distro: Humble
- Base Image: Ubuntu 22.04
- Tools: BehaviorTree.CPP, Nav2, Serial Comm, OAK-D integration

## 📦 Included Packages

| Package               | Description                                    | Link |
|-----------------------|------------------------------------------------|------|
| `action_pkg`          | Custom action definitions for control flows   | [Repo](https://github.com/youruser/action_pkg) |
| `behaviour_plugins`   | BehaviorTree.CPP nodes + shared C++/Py lib    | [Repo](https://github.com/youruser/behaviour_plugins) |
| `dev_pi_communicate`  | Serial and telemetry comms with dev boards    | [Repo](https://github.com/youruser/dev_pi_communicate) |
| `line_follower`       | Line-following behavior logic + BT nodes      | [Repo](https://github.com/youruser/line_follower) |
| `oakd_msgs`           | Custom messages for OAK-D vision system       | [Repo](https://github.com/youruser/oakd_msgs) |

More details are available in [`docs/package_overview.md`](docs/package_overview.md)

## 🐳 Docker Setup

```bash
git clone --recurse-submodules https://github.com/youruser/robocon2024_ros2_ws
cd robocon2024_ros2_ws
docker build -t robocon2024 .
docker run -it robocon2024

