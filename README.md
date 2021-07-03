# Professional-Athlete-Career-Lifetimes
Final Project Repo

Deliverable 1:

Our selected topic is on if we can determine the length of a professional athlete's career based on external factors, including the sport they play, their position, height, weight, and more. 

We selected this topic because we think there is a lot of potential knowledge in the comparison of career length between each sport, position, and body type. 

Our data source for Deliverable 1 is a dataset of NFL Statistics found on Kaggle (https://www.kaggle.com/kendallgillies/nflstatistics). The dataset contains data of players past and up to 2017. We did intial cleaning of the data in Excel, to remove the extra characters from the Experience column to reflect just the number of seasons. Something of note is that only active players have data on their position, and only retired players have data on their Years Played. The dataset can be found in the Resources folder. 

With this project we hope to find out which athletes from the Big 4 Sports Leagues have the longest careers, and to further break down and compare that data by position and body type. Other potential external factors include which college the player attended, their place of origin, and starting age. 

Database ERD:

![](Resources/deliverable1ERD.png)

Machine Learning Model:


 __Triangle Roles: Shihab & Peter__

* Keep the following questions in mind as the machine learning model is developed:
  * Which model did you choose and why? 
    * Our group will be implementing the neural network learning model in order to predict athletes career longevity from the NBA, NHL, NFL and MLB. 
    * There will be two different types of neural network models. The independent variable for the first model will be when the player first started in the league. The second model will be when the player retired from the specific year. The y-value for both models will be the years played.

  * How are you training your model?
    * We will train the neural network learning model by using 75/25 proportion of the learning/testing data. If the global accuracy of the neural network model is poor, we will use the 20/80 proportion of the learning/testing data.
  
  * What is the model's accuracy?
    * Our goal for this project to achieve a 60% accuracy on our neural network model.
  
  * How does this model work?
    * The neural network model is used to create a classification algorithm that determines if an input belongs in one category versus another. The neural network model, specifically the perceptron model, has four major components:
      * Input values, typically labelled as x or 𝝌 
      * A weight coefficient for each input value, typically labelled as w or ⍵
      * Bias is a constant value added to the input to influence the final decision, typically labelled as w0.
      * A net summary function that aggregates all weighted inputs, a weighted summation.
    * The neural network model that we will be creating will most likely not be linearly separable. 

__Building A Basic Neural Network (Sample Code for Later Use)__

```
# Import our dependencies
import pandas as pd
import matplotlib as plt
from sklearn.datasets import make_blobs
import sklearn as skl
import tensorflow as tf

# Generate dummy dataset
X, y = make_blobs(n_samples=1000, centers=2, n_features=2, random_state=78)

# Creating a DataFrame with the dummy data
df = pd.DataFrame(X, columns=["Feature 1", "Feature 2"])

df["Target"] = y

# Plotting the dummy data
df.plot.scatter(x="Feature 1", y="Feature 2", c="Target", colormap="winter")

# Use sklearn to split dataset
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=78)

# Create scaler instance
X_scaler = skl.preprocessing.StandardScaler()

# Fit the scaler
X_scaler.fit(X_train)

# Scale the data
X_train_scaled = X_scaler.transform(X_train)
X_test_scaled = X_scaler.transform(X_test)

# Create the Keras Sequential model
nn_model = tf.keras.models.Sequential()

# Add our first Dense layer, including the input layer
nn_model.add(tf.keras.layers.Dense(units=1, activation="relu", input_dim=2))

# Add the output layer that uses a probability activation function
nn_model.add(tf.keras.layers.Dense(units=1, activation="sigmoid"))

# Check the structure of the Sequential model
nn_model.summary()
```


# Communication Protocols

Our group consists of 5 people (Shihab Humayun, Peter Nielson, Matthew DeYoung, Alyssa Allende Motz and Eric Williams). Primary contact will be maintained through Slack and/or Zoom. Additional contact information follows below:

__Shihab__ \
Email: shihab_humayun@yahoo.com\
Cell: (321) 888 - 9978

__Peter__ \
Email: petenielsen93@gmail.com\
Cell: (407) 937-8174

__Matthew__ \
Email: deyoungmatthewd@gmail.com\
Cell: (407) 405-0651

__Alyssa__ \
Email: aamotz001@gmail.com \
Cell: (720) 469 - 4500

__Eric__ \
Email: eric.williamscait@gmail.com \
Cell: (321) 274-6611

## Communication Standards
The following guidelines have been agreed upon:

* In order to maintain communication throughout the working period, we plan to meet 3 times a week: during the assigned group time in Tuesday/Thursday lectures, and once on Saturday (time will be agreed upon the Thursday before). 
* We anticipate an initial total of approximately 2-3 hours per week in discussion with the entire group present, with more time assigned as required (to be decided upon as a group). As well, group members working together will interface as needed, with communication times set between the relevant members. The entire group need not be alerted to meetings between individuals. 
* It is understandable if a group member needs to be absent for a particular meeting, however it is expected that they will put forth best efforts to get back up to date and minimize the number of absences. It is preferred if absences are communicated at least 24 hours before hand.

## Project Roles

Our group has decided on the following division of work:

__Square Role:__ Alyssa

__Triangle Role:__ Shihab and Peter

__Circle Role:__ Matthew

__X Role:__ Eric and Alysssa



