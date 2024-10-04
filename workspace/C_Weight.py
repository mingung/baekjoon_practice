# ���� ���� �� ����ġ ũ�� �м�
for i in range(len(layer_names)):
    layer = net.getLayer(i + 1)
    print(f"Layer {i + 1} (Type: {layer.type}):")
    
    try:
        # ����ġ Ȯ��
        weights = net.getParam(i + 1, 0)
        print(f"  Weights shape: {weights.shape}")
        print(f"  Weights data: {weights}")
    except cv2.error as e:
        print(f"  No weights for this layer.")


###############################################################

# ù ��° ���̾� ����ġ ���
print(f"First convolutional layer weights shape: {layer_1_weights.shape}")
print(f"First convolutional layer weights: {layer_1_weights}")