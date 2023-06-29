import pandas as pd
import numpy as np
import matplotlib as plt
import seaborn as sns
plt.style.use('ggplot')
pd.set_option('display.max_colwidth', None) #Dispaly full questions
pd.set_option('max_columns', 200)
#records - where my tables are stored (can I store multipletables in 1 variable? search later)
records.shape
records.head(5)
records.columns
records.dtypes
records.describe
#check for null values
records.isna().sum()

