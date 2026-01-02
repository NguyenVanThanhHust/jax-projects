FROM nvcr.io/nvidia/jax:25.10-py3

RUN pip install einops \
    dm-haiku \
    matplotlib \
    scikit-learn \
    chex \
    grain \
    flax \
    ml_dtypes \
    optax \
    orbax-checkpoint \
    orbax-export \
    jupyterlab \
    ipywidgets

# 1. Create a group and user
# -g 1001: specific Group ID
# -u 1001: specific User ID
RUN groupadd -g 1001 appuser && \
    useradd -r -u 1001 -g appuser appuser

# 2. Set up the working directory
WORKDIR /app

# 3. Copy files and change ownership to the new user
COPY --chown=appuser:appuser . .

# 4. Switch to the non-root user
USER appuser