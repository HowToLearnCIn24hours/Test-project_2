import pandas as pd
import numpy as np
import matplotlib as plt
import seaborn as sns
plt.style.use('ggplot')
pd.options.display.max_columns = 10
df = pd.read_csv('C://Users/Me/source/repos/Data-analytics-portfolio-project/source/LGBT_Survey_uniteddata.csv')
#checking the shape of a dataframe
df.shape
df.head(5)
#checking what columns I have in a table
df.columns
#columns types
df.dtypes
#check for null values
df.isna().sum()

