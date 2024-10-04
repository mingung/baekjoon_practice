import cv2
import numpy as np

# YOLO 모델 로드
net = cv2.dnn.readNet("C:/Users/alsrn/workspace/yolov3.weights", "C:/Users/alsrn/workspace/yolov3.cfg")
classes = []
with open("C:/Users/alsrn/workspace/coco.names", "r") as f:
    classes = [line.strip() for line in f.readlines()]

layer_names = net.getLayerNames()
unconnected_out_layers = net.getUnconnectedOutLayers()
output_layers = [layer_names[i - 1] for i in unconnected_out_layers.flatten()]
colors = np.random.uniform(0, 255, size=(len(classes), 3))

# 비디오 캡처
cap = cv2.VideoCapture('C:/Users/alsrn/workspace/test.MP4')

if not cap.isOpened():
    print("Error: Could not open video.")
    exit()

while True:
    ret, img = cap.read()
    if not ret:
        print("End of video or unable to read the frame.")
        break  # 비디오가 끝나면 루프 종료

    height, width = img.shape[:2]

    # YOLO 객체 탐지
    blob = cv2.dnn.blobFromImage(img, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
    net.setInput(blob)
    outs = net.forward(output_layers)

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

    for i in range(len(boxes)):
        if i in indexes:
            x, y, w, h = boxes[i]
            label = str(classes[class_ids[i]])
            color = colors[class_ids[i]]
            cv2.rectangle(img, (x, y), (x + w, y + h), color, 2)
            cv2.putText(img, label, (x, y + 30), cv2.FONT_HERSHEY_PLAIN, 3, color, 3)

    # 결과 이미지 출력
    cv2.imshow("Image", img)

    # 'q' 키를 눌러 종료
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# 자원 해제
cap.release()
cv2.waitKey(0)
cv2.destroyAllWindows()
