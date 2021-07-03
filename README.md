# Professional-Athlete-Career-Lifetimes
## Final Project Repo

### Triangle Roles: Shihab & Peter

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

### Building A Basic Neural Network (Sample Code for Later Use)

#### Import our dependencies
import pandas as pd
import matplotlib as plt
from sklearn.datasets import make_blobs
import sklearn as skl
import tensorflow as tf

#### Generate dummy dataset
X, y = make_blobs(n_samples=1000, centers=2, n_features=2, random_state=78)

#### Creating a DataFrame with the dummy data
df = pd.DataFrame(X, columns=["Feature 1", "Feature 2"])

df["Target"] = y

#### Plotting the dummy data
df.plot.scatter(x="Feature 1", y="Feature 2", c="Target", colormap="winter")

#### Use sklearn to split dataset
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=78)

#### Create scaler instance
X_scaler = skl.preprocessing.StandardScaler()

#### Fit the scaler
X_scaler.fit(X_train)

#### Scale the data
X_train_scaled = X_scaler.transform(X_train)

X_test_scaled = X_scaler.transform(X_test)

#### Create the Keras Sequential model
nn_model = tf.keras.models.Sequential()

#### Add our first Dense layer, including the input layer
nn_model.add(tf.keras.layers.Dense(units=1, activation="relu", input_dim=2))

#### Add the output layer that uses a probability activation function
nn_model.add(tf.keras.layers.Dense(units=1, activation="sigmoid"))

#### Check the structure of the Sequential model
nn_model.summary()
