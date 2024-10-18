import cv2
import numpy as np

# Yolo 모델 로드
net = cv2.dnn.readNet("C:/Users/alsrn/workspace/yolov3.weights", "C:/Users/alsrn/workspace/yolov3.cfg")
classes = []
with open("C:/Users/alsrn/workspace/coco.names", "r") as f:
    classes = [line.strip() for line in f.readlines()]

# 네트워크의 모든 레이어 이름을 가져오기
layer_names = net.getLayerNames()
output_layers = [layer_names[i - 1] for i in net.getUnconnectedOutLayers().flatten()]

# 이미지 로드
img = cv2.imread("C:/Users/alsrn/workspace/sample1.jpg")
img = cv2.resize(img, None, fx=0.4, fy=0.4)
height, width, channels = img.shape

# 객체 탐지 전처리
blob = cv2.dnn.blobFromImage(img, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
net.setInput(blob)

# 모든 레이어의 출력 크기를 확인 및 최대 값 찾기
for i, layer_name in enumerate(layer_names):
    # Conv 레이어만 확인
    if "conv" in layer_name:
        net.setInput(blob)  # Reset input for each layer
        output = net.forward(layer_name)

        # 출력 크기 확인
        print(f"Output size of {layer_name}: {output.shape}")
        
        # 최대값 찾기
        max_value = np.max(output)
        max_index = np.unravel_index(np.argmax(output), output.shape)
        
        print(f"Max value in {layer_name}: {max_value} at index {max_index}")

# 결과 이미지 출력
cv2.imshow("Image", img)
cv2.waitKey(0)
cv2.destroyAllWindows()
