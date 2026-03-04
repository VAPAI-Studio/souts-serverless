# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve unknown_registry node: PerpNegGuider — no aux_id (GitHub repo) provided, skipping
# Could not resolve unknown_registry node: Power Lora Loader (rgthree) — no aux_id (GitHub repo) provided, skipping

# download models into comfyui
RUN comfy model download --url https://huggingface.co/lzyvegetable/FLUX.1-dev/resolve/main/flux1-dev.safetensors --relative-path models/diffusion_models --filename flux1-dev.safetensors
RUN comfy model download --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors --relative-path models/text_encoders --filename t5xxl_fp8_e4m3fn.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/stable-diffusion-3.5-fp8/resolve/main/text_encoders/clip_l.safetensors --relative-path models/text_encoders --filename clip_l.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors
# COPY input/ /comfyui/input/
