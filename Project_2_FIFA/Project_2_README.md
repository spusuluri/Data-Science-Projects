# FIFA Player Analysis Project

By: Srisatya Pusuluri

[Data](https://www.kaggle.com/datasets/yagunnersya/fifa-21-messy-raw-dataset-for-cleaning-exploring?rvi=1)

## Purpose
The purpose of this project is to conduct a comprehensive analysis of FIFA player data. The analysis includes data examination, cleaning, transformation, visualization, and statistical tests to gain insights into player characteristics, team dynamics, and potential relationships between attributes.

## Data Examination
We start by examining all columns and rows of the dataset to understand the data and identify inconsistencies. General observations include cleaning newline characters, extracting numeric values, and addressing units in certain columns.

## Data Cleaning
1. **Team & Contract Column:** Remove newlines and leading/trailing spaces.
2. **Value, Wage, Release Clause Columns:** Rename columns and extract numeric values.
3. **W/F, SM, and IR Columns:** Clean by removing stars.
4. **Hits Column:** Replace '\n' and convert to numeric.
5. **Weight Column:** Remove 'lbs' from all rows.

## Data Transformation
1. Separate height into feet and inches.
2. Calculate BMI of each player.
3. Calculate the number of positions a player can play.
4. Separate Team and Contract.
5. Separate the 'Joined' column into year, month, and day.

## Data Visualization
1. Bar Graph of Nationalities.
2. Correlation between Value and Release Clause.
3. Average Player Overall Rating by Team.
4. Histogram of the Age of the Players.
5. Player Overall Ranking Box Plot.
6. Average Player value ('Value (€M)') Over the years.

## Statistical Tests
1. **ANOVA for Overall Rating:** Explore differences in overall ratings across nationalities.
2. **Independent t-test for Age:** Investigate age differences between FC Barcelona and Juventus players.
3. **Pearson Correlation for Goalkeeper Height and Diving Ability:** Examine the relationship between a goalkeeper's height and diving ability.
4. **Spearman Rank Correlation for Attacking and Defending Skills:** Assess if players with high attacking skills tend to have lower defending skills.
5. **Linear Regression for Overall Rating Prediction:** Predict a player's overall rating based on various attributes.
6. **KMeans Clustering for Player Position Clustering:** Cluster players into groups based on their various attributes.

## Methods and Functions Used
- Pandas for data manipulation and exploration.
- Matplotlib and Seaborn for data visualization.
- Scipy and Numpy for statistical tests.
- Scikit-learn for machine learning tasks.

## Conclusion
This project provides a comprehensive analysis of FIFA player data, offering valuable insights into player characteristics and team dynamics. The combination of data examination, cleaning, transformation, visualization, and statistical tests allows for a thorough exploration of the dataset.

For detailed code implementations, refer to the Jupyter Notebooks in the folder.

Feel free to explore and adapt the code for further analysis or specific use cases related to FIFA player data.