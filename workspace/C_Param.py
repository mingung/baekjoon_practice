
# Layer 2�� BatchNorm �Ķ���͸� ����
gamma = net.getParam(2, 0)  # scale ��
beta = net.getParam(2, 1)   # shift ��
mean = net.getParam(2, 2)   # mean ��
var = net.getParam(2, 3)    # variance ��

print("BatchNorm parameters for Layer 2:")
print(f"Gamma (Scale): {gamma}")
print(f"Beta (Shift): {beta}")
print(f"Mean: {mean}")
print(f"Variance: {var}")