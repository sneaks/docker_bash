#!/bin/bash
# docker-init.sh - Shell profile deployer for Jojo's Docker containers

PROFILE_DIR="$HOME/docker/docker_bash"

function usage() {
  echo "🚀 docker-init.sh"
  echo "Usage:"
  echo "  $0 --inject <container-name>   Inject shell profile into a running container"
  echo "  $0 --copy <target-directory>   Copy shell profile into a Docker project folder"
  echo "  $0 --help                      Show this help message"
  exit 1
}

function inject_into_container() {
  local container="$1"
  echo "🔄 Injecting shell profile into container: $container"

  docker cp "$PROFILE_DIR/.bashrc" "$container:/root/.bashrc"
  docker cp "$PROFILE_DIR/.aliases" "$container:/root/.aliases"
  docker cp "$PROFILE_DIR/.bash_profile" "$container:/root/.bash_profile"
  docker cp "$PROFILE_DIR/.motd.sh" "$container:/root/.motd.sh"
  docker exec "$container" chmod +x /root/.motd.sh

  echo "✅ Profile loaded. Open a shell with: docker exec -it $container bash"
}

function copy_to_context() {
  local target="$1"
  echo "📁 Copying shell profile into: $target"

  cp "$PROFILE_DIR/.bashrc" "$target/.bashrc"
  cp "$PROFILE_DIR/.aliases" "$target/.aliases"
  cp "$PROFILE_DIR/.bash_profile" "$target/.bash_profile"
  cp "$PROFILE_DIR/.motd.sh" "$target/.motd.sh"

  echo "✅ Profile files copied. Add COPY commands in your Dockerfile:"
  echo "COPY .bashrc /root/.bashrc"
  echo "COPY .aliases /root/.aliases"
  echo "COPY .bash_profile /root/.bash_profile"
  echo "COPY .motd.sh /root/.motd.sh"
}

# Main logic
case "$1" in
  --inject)
	[ -z "$2" ] && usage
	inject_into_container "$2"
	;;
  --copy)
	[ -z "$2" ] && usage
	copy_to_context "$2"
	;;
  --help|-h)
	usage
	;;
  *)
	usage
	;;
esac