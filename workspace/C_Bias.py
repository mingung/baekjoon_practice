# 첫 번째 레이어의 파라미터 수 확인
layer_1_params = net.getLayer(1).blobs  # 첫 번째 레이어의 파라미터 블롭 가져오기

# 가중치가 존재하는지 확인
if len(layer_1_params) > 0:
    layer_1_weights = net.getParam(1, 0)  # 첫 번째 레이어의 weight
    print(f"First convolutional layer weights shape: {layer_1_weights.shape}")
    print(f"First convolutional layer weights: {layer_1_weights}")
else:
    print("First layer does not contain weights.")

# bias가 존재하는지 확인
if len(layer_1_params) > 1:
    layer_1_bias = net.getParam(1, 1)  # 첫 번째 레이어의 bias
    print(f"First convolutional layer bias shape: {layer_1_bias.shape}")
    print(f"First convolutional layer bias: {layer_1_bias}")
else:
    print("First layer does not contain bias.")
