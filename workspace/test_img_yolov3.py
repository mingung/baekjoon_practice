import cv2
import numpy as np
# -*- coding: utf-8 -*-

# Yolo 모델 로드
net = cv2.dnn.readNet("C:/Users/alsrn/workspace/yolov3.weights", "C:/Users/alsrn/workspace/yolov3.cfg")
classes = []
with open("C:/Users/alsrn/workspace/coco.names", "r") as f:
    classes = [line.strip() for line in f.readlines()]

layer_names = net.getLayerNames()

# net.getUnconnectedOutLayers()의 반환 값이 스칼라일 가능성 처리
unconnected_out_layers = net.getUnconnectedOutLayers()

# 인덱싱 방식 수정
output_layers = [layer_names[i - 1] for i in unconnected_out_layers.flatten()]
colors = np.random.uniform(0, 255, size=(len(classes), 3))

# 이미지 로드
img = cv2.imread("C:/Users/alsrn/workspace/sample1.jpg")
img = cv2.resize(img, None, fx=0.4, fy=0.4)
height, width, channels = img.shape

# 객체 탐지
blob = cv2.dnn.blobFromImage(img, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
net.setInput(blob)
outs = net.forward(output_layers)

# 화면에 결과 표시
class_ids = []
confidences = []
boxes = []
for out in outs:
    for detection in out:
        scores = detection[5:]
        class_id = np.argmax(scores)
        confidence = scores[class_id]
        if confidence > 0.5:
            # 객체 탐지
            center_x = int(detection[0] * width)
            center_y = int(detection[1] * height)
            w = int(detection[2] * width)
            h = int(detection[3] * height)

            # 좌표 계산
            x = int(center_x - w / 2)
            y = int(center_y - h / 2)

            boxes.append([x, y, w, h])
            confidences.append(float(confidence))
            class_ids.append(class_id)

# Non-maximum suppression 적용
indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)
font = cv2.FONT_HERSHEY_PLAIN
for i in range(len(boxes)):
    if i in indexes:
        x, y, w, h = boxes[i]
        label = str(classes[class_ids[i]])
        color = colors[class_ids[i]]
        cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
        cv2.putText(img, label, (x, y + 30), font, 3, color, 3)


#############################################

            # Check Point #

#############################################

# 결과 이미지 출력
cv2.imshow("Image", img)
cv2.waitKey(0)
cv2.destroyAllWindows()