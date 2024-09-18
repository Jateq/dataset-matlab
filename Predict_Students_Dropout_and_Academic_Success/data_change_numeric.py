import pandas as pd

data = pd.read_csv('data.csv', delimiter=';')
print(data.head())

target_mapping = {
    'Dropout': 1,
    'Graduate': 2,
    'Enrolled': 3
}

data['Target'] = data['Target'].map(target_mapping)
print(data.head())
data.to_csv('updated_dataset.csv', index=False)

