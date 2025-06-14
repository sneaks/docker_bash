PROFILE_DIR := $(HOME)/docker/docker_bash

# 🐳 Inject profile into a running container
inject:
	@echo "📦 Injecting profile into container: $(NAME)"
	docker cp $(PROFILE_DIR)/.bashrc $(NAME):/root/.bashrc
	docker cp $(PROFILE_DIR)/.aliases $(NAME):/root/.aliases
	docker cp $(PROFILE_DIR)/.bash_profile $(NAME):/root/.bash_profile
	docker cp $(PROFILE_DIR)/.motd.sh $(NAME):/root/.motd.sh
	docker exec $(NAME) chmod +x /root/.motd.sh
	@echo "✅ docker_bash profile injected into '$(NAME)'"

# 📁 Copy profile into a Docker project folder
copy:
	@echo "📁 Copying profile into directory: $(DIR)"
	cp $(PROFILE_DIR)/.bashrc $(DIR)/
	cp $(PROFILE_DIR)/.aliases $(DIR)/
	cp $(PROFILE_DIR)/.bash_profile $(DIR)/
	cp $(PROFILE_DIR)/.motd.sh $(DIR)/
	@echo "✅ docker_bash profile copied into '$(DIR)'"

# 💡 Show help
help:
	@echo "🚀 docker_bash Makefile Commands:"
	@echo "  make inject NAME=container_name     # Injects profile into a running container"
	@echo "  make copy DIR=target_directory      # Copies profile into a local project directory"