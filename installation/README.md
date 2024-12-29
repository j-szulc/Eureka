# Environment installation

It should be enough to run the following command as root, inside the folder that contains the `install.sh` script:
```bash
bash install.sh
```
Note: The script assumes running as root and inside Ubuntu/Debian based systems. It installs various packages so do not run it on a production or your personal machine. Use a Docker container or a VM instead.

## After installation

After installation you should be able to run IsaacGymEnvs:
```bash
micromamba run -n eureka python -m isaacgymenvs.train task=Cartpole
```
or Eureka (inside the folder with the `eureka.py` script):
```bash
export OPENAI_API_KEY=...
micromamba run -n eureka python eureka.py env=shadow_hand sample=16 iteration=5 stateful=True model=gpt-3.5-turbo
```