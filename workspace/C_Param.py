
# Layer 2의 BatchNorm 파라미터를 추출
gamma = net.getParam(2, 0)  # scale 값
beta = net.getParam(2, 1)   # shift 값
mean = net.getParam(2, 2)   # mean 값
var = net.getParam(2, 3)    # variance 값

print("BatchNorm parameters for Layer 2:")
print(f"Gamma (Scale): {gamma}")
print(f"Beta (Shift): {beta}")
print(f"Mean: {mean}")
print(f"Variance: {var}")