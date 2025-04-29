import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

# Data
V_GS = [0.2, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4]  # 10 points
I_D = [0, 0, 111.002e-9, 1.004e-3, 1.004e-3, 1.004e-3, 1.004e-3, 1.004e-3, 1.004e-3, 0]

# Remove zero current points
V_GS_clean = []
sqrt_ID_clean = []

for vgs, id_val in zip(V_GS, I_D):
    if id_val > 0:
        V_GS_clean.append(vgs)
        sqrt_ID_clean.append(np.sqrt(id_val))

# Convert to arrays
V_GS_clean = np.array(V_GS_clean).reshape(-1, 1)
sqrt_ID_clean = np.array(sqrt_ID_clean)

# Fit line
model = LinearRegression()
model.fit(V_GS_clean, sqrt_ID_clean)

# Get slope and intercept
m = model.coef_[0]
c = model.intercept_

# Calculate Vth and Kn
Vth = -c / m
Kn = 2 * m**2

# Print results
print(f"Vth = {Vth:.3f} V")
print(f"Kn = {Kn:.3e} A/V^2")

# Plot
plt.scatter(V_GS_clean, sqrt_ID_clean, color='blue', label='Data')
plt.plot(V_GS_clean, model.predict(V_GS_clean), color='red', label='Fit')
plt.xlabel('Vgs (V)')
plt.ylabel('sqrt(Id) (A^0.5)')
plt.title('MOSFET Square Root Plot')
plt.legend()
plt.grid(True)
plt.show()
