# Use Ubuntu 22.04 base
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install base tools and locale
RUN apt update && apt install -y \
    locales \
    curl \
    gnupg2 \
    lsb-release \
    build-essential \
    git \
    wget \
    vim \
    sudo \
    software-properties-common

RUN locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Add ROS 2 Humble sources
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
    | gpg --dearmor -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" \
    > /etc/apt/sources.list.d/ros2.list

# Install ROS 2 and other dependencies
RUN apt update && apt install -y \
    ros-humble-desktop \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    libserial-dev \
    python3-colcon-common-extensions \
    python3-pip

# Create a non-root user
RUN useradd -m -s /bin/bash user && \
    echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER user
WORKDIR /home/user

# Source ROS on shell startup
RUN echo "source /opt/ros/humble/setup.bash" >> /home/user/.bashrc

# Create the workspace structure
RUN mkdir -p /home/user/ros2_ws/src

# Copy the entire project into the container workspace
COPY --chown=user:user packages/ /home/user/ros2_ws/src/

WORKDIR /home/user/ros2_ws

# Source and default to bash
CMD ["/bin/bash"]

