# 계층 정보 및 가중치 크기 분석
for i in range(len(layer_names)):
    layer = net.getLayer(i + 1)
    print(f"Layer {i + 1} (Type: {layer.type}):")
    
    try:
        # 가중치 확인
        weights = net.getParam(i + 1, 0)
        print(f"  Weights shape: {weights.shape}")
        print(f"  Weights data: {weights}")
    except cv2.error as e:
        print(f"  No weights for this layer.")


###############################################################

# 첫 번째 레이어 가중치 출력
print(f"First convolutional layer weights shape: {layer_1_weights.shape}")
print(f"First convolutional layer weights: {layer_1_weights}")