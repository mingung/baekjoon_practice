# ���̾� �̸� �� �ε��� ���
layer_names = net.getLayerNames()
print("Total number of layers: ", len(layer_names))
for idx, name in enumerate(layer_names):
    print(f"Layer {idx + 1}: {name}")

##############################################################33

# ���̾� ���� ���
layer_type = net.getLayer(2).type
print(f"Layer 2 type: {layer_type}")