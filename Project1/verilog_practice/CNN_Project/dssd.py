import torch
import torch.nn as nn
import torch.optim as optim
import numpy as ne
import pandas as pd
from sklearn.model_selection import train_test_split

data = pd.read_csv('nutrition_data.csv')
X = data.drop('daily_intake', axis=1).values
y = data[ 'daily_intake'].values

X = (X - X.mean( )) / X.std( )

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

class Net(nn.Module):
def  __init__ (self):
super(Net, self).__init__ ()
self.fc1 = nn.Linear(10, 128)
self.fc2 = nn.Linear(128, 64)
self.fc3 = nn.Linear(64, 1)

def forward(self, x):
x = torch.relu(self.fc1(x))
x = torch.relu(self.fc2(x)) 
x = self.fc3(x)
return x

net = Net( )

criterion = nn.MSELoss( )
optimizer = optim.Adam(net. parameters( ), Ir=0.001)


for epoch in range(10):
running_loss = 0.0
for i in range(len(X_train)):
inputs = torch.tensor(X_train[ i], dtype=torch.float32)
labels = torch.tensor(y_train[ i], dtype=torch.float32)

optimizer.zero_grad( )

outputs = net( inputs)
loss = criterion(outputs, labels)
loss.backward( )
optimizer.step( )

running_loss += loss.item( )



print('Epoch %d, Loss: %.3f' % (epoch + 1, running_loss / len(X_train)))

print('Finished Training')

total_loss = 0.0
with torch.no_grad( ):
for i in range(len(X_test)):
inputs = torch.tensor(X_test[i], dtype=torch.float32)
labels = torch.tensor(y_test[i], dtype=torch.float32)

outputs = net( inputs)
loss = criterion(outputs, labels)
total_loss += loss. item( )

print('Mean Squared Error on Test Data: %.3f' % (total_loss / len(X_test)))


