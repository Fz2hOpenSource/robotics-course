# Sim-to-Real Transfer

## The Reality Gap

Differences between simulation and reality:
- Physics model inaccuracies
- Sensor noise and delays
- Actuator nonlinearities

## Domain Randomization

Randomize simulation parameters during training:

```python
sim_params = {
    'gravity': random.uniform(9.7, 9.81),
    'friction': random.uniform(0.5, 1.5),
    'sensor_noise': random.uniform(0.01, 0.1)
}
```

## System Identification

Learn real robot parameters:
1. Collect real-world data
2. Fit simulation parameters
3. Refine model

## Progressive Fine-tuning

1. Train in simulation
2. Fine-tune on real robot (limited data)
3. Progressive domain adaptation

---

*[← Back to Index](index.md)*
