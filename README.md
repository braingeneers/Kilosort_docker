# Kilosort Docker

Containerized **Kilosort 2** spike-sorting environment for reproducible GPU-based electrophysiology data analysis.  
This image provides a fully configured MATLAB + CUDA so you can run Kilosort 2 locally or on a cluster without manual setup.

---

### What It Does
- Runs **Kilosort 2** inside a Docker container with NVIDIA GPU acceleration  
- Supports input/output volume mounting for raw data and results  
- Compatible with **Phy** for manual curation  
- Optional Kubernetes (`k8s/`) manifests for large-scale batch jobs  

---

### File Structure

docker/   → Dockerfiles for Kilosort2 builds   \
matlab/   → Precompiled MATLAB runtime for KS2 \
src/      → KS2 scripts, configs, and utilities

---

### Quick Start

```bash
# Build the image
docker build -f docker/Dockerfile.kilosort2 -t kilosort2:latest .

# Run Kilosort2 on a dataset
docker run --rm --gpus all \
  -v /path/to/data:/input \
  -v /path/to/output:/output \
  kilosort2:latest \
  matlab -batch "run('/opt/kilosort/run_kilosort2.m')"


