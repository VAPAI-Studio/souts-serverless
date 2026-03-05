# Start from an official RunPod ComfyUI worker image
# Choose a specific version tag from the RunPod Docker Hub repo (e.g., -sdxl, -base)
FROM runpod/worker-comfyui:5.2.0-base

# Install any required system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set environment variable for Hugging Face cache to use the persistent volume
ENV HF_HOME=/runpod-volume/models/huggingface

# --- Custom Nodes Installation (Example) ---
# Install custom nodes by cloning their repositories into the custom_nodes directory
RUN git clone https://github.com /comfyui/custom_nodes/ComfyUI_Node_Manager
# Add other custom nodes here

# --- Model Symlinking / Configuration ---
# The RunPod handler script typically manages symlinking models from /runpod-volume/models
# You might need to add an extra_model_paths.yaml file to tell ComfyUI where to look for models
# that the default handler doesn't cover.
# ADD extra_model_paths.yaml /comfyui/extra_model_paths.yaml

# The default entrypoint in the base image handles the rest of the startup process,
# including mounting the network volume to /runpod-volume.
