# Portainer Docker Compose Setup

## Overview
This Docker Compose file is used to set up and run Portainer, an open-source tool for container management, in a Docker environment. Portainer provides a user-friendly interface for managing Docker containers, images, networks, and more.

## Prerequisites
- Docker and Docker Compose installed on your system.
- Basic understanding of Docker and containerization.

## Configuration Details
- **Network**: Custom bridge network `portainer` with the subnet `10.1.0.0/24`.
- **Service**: The `portainer` service uses the latest Portainer Community Edition image.
- **Volumes**: Binds the Docker socket and a named volume `portainer_data` for persistent storage.
- **Ports**: Exposes Portainer on ports `8000` and `9443`.
- **Environment Variables**: Sets timezone to `America/New_York`.
- **Restart Policy**: Configured to always restart unless stopped manually.

## Usage
1. **Clone the Compose File**: Download the Docker Compose file to your local system.
2. **Customization (Optional)**: 
   - **Timezone**: Change `TZ=America/New_York` to your local timezone.
   - **Network Settings**: If needed, modify the subnet under `networks`.
   - **Port Mapping**: Change the `ports` if the default ports are already in use.
3. **Run Portainer**: Navigate to the directory containing the compose file and run:
```
docker-compose up -d
```
   
Access Portainer: Open a web browser and navigate to `http://<server-ip>:9443`

## Customization
Users should review and modify the following before running the compose file:
- Timezone: Set the correct timezone for accurate log timestamps.
- Network Configuration: Adjust the subnet and IP address if they conflict with your existing network.
- Port Mapping: Change the ports if necessary to avoid conflicts with other services.
- Volume Persistence: Ensure the volume mapping aligns with your desired data persistence strategy.

## Support

For any issues or questions regarding this Docker Compose setup, please refer to the Portainer documentation or raise an issue in the repository where this compose file is hosted.

