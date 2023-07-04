import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import matplotlib.colors as mcolors
np.random.seed(19680801)
plt.style.use('Solarize_Light2')
pd.options.display.max_columns = 10
df = pd.read_csv('C://Users/Me/source/repos/Data-analytics-portfolio-project/source/LGBT_Survey_uniteddata.csv')
#checking the shape of a dataframe
df.shape
df.head(5)
#checking what columns I have in a table
df.columns
#columns types
df.dtypes
#info about dataframe
df.info()
#check for null values
df.isna().sum()
#drop null values in answers column
df.drop(df[df.answer == 'null'].index, inplace=True)
#check for unique values in answers column
df.answer.unique()
#The safest and the most dangerous(uncomfortable) countries for LGBT people
#"In the last 12 months, in the country where you live, have you personally felt discriminated against or harassed because of being perceived as Lesbian/Gay/Bisexual/Transgender/on the grounds of gender/on the grounds of sexual orientation?
danger_countriues_df = df.loc[df.question_code.str.contains('c2')]
danger_countriues_df.answer.unique()
danger_countriues_df.question_code.unique()
score_c2 = {'Yes':0.5, 'No':1, 'Don`t know':0}
danger_countriues_df_copy = danger_countriues_df.copy()
danger_countriues_df_copy['score'] = danger_countriues_df_copy.answer.map(score_c2).mul(danger_countriues_df_copy.percentage)
danger_countriues_df_copy = danger_countriues_df_copy.drop('percentage', axis=1)
mean_values = danger_countriues_df_copy.groupby('CountryCode', as_index=False)[['score']].mean()
mean_values = mean_values.sort_values('score', ascending=False)
#chart
plt.rcParams['font.size'] = 14
plt.rcParams['figure.figsize'] = (10, 15)
plt.rcParams['figure.facecolor'] = '#00000000'
plt.title('Safest and  most dangerous countries for LGBT people', size = 20)
from matplotlib import interactive
interactive(True)
ax = sns.barplot(x='score', y='CountryCode', data = mean_values)
plt.show()
#pie chart with percantage of lesbians, gays, bi, trans people who answered "yes" 
fig, ax = plt.subplots()
ax.pie(
#Discrimination against trans people in EU
#Most dangerous countries to live in for trans people
#Social acceptance of trans people
#Everyday life difficulties lgbt people face
#Everyday life difficulties trans people face
#Political support of trans people
#In your opinion, how widespread is offensive language about lesbian, gay, bisexual and/or transgender people by politicians in the country where you live? (Transgender people)
polit_sup_df = df.loc[df.question_code.str.contains('b1_a')]
trans_sup_df = polit_sup_df.loc[df.subset.str.contains('Transgender')]
score_b1_a = {"Very widespread": 1, "Fairly widespread": 0.75, "Fairly rare": 0.5, "Very rare": 0.25, "Don`t know": 0}
trans_sup_df_copy = trans_sup_df.copy()
trans_sup_df_copy['score'] = trans_sup_df_copy.answer.map(score_b1_a).mul(trans_sup_df_copy.percentage)
trans_sup_df_copy = trans_sup_df_copy.drop('percentage', axis=1)
trans_sup_mean_values = trans_sup_df_copy.groupby('CountryCode', as_index=False)[['score']].mean()
trans_sup_mean_values = trans_sup_mean_values.sort_values('score', ascending=False)
#chart
plt.title('Level of political support of trans people by country', size = 20)
ax = sns.barplot(x='score', y='CountryCode', data = trans_sup_mean_values)
#The relation between social acceptance and anti discrimination laws
#The relation between social acceptance of trans people and their safety
