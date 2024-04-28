import pandas as pd
from os import path
import pickle as pk
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor


def train_model(
        model_min: RandomForestRegressor,
        model_max: RandomForestRegressor,
        X_train: pd.DataFrame,
        y_min_train: pd.Series,
        y_max_train: pd.Series
) -> None:
    """

    :param model_min: the model to train for min duration
    :param model_max: the model to train for max duration
    :param X_train: the training data feature matrix
    :param y_min_train: the training data target vector for minimum duration predictions
    :param y_max_train:  the training data target vector for maximum duration predictions.
    """
    model_min.fit(X_train, y_min_train)
    model_max.fit(X_train, y_max_train)


def build_model(

) -> (RandomForestRegressor, RandomForestRegressor):
    """
    :rtype: RandomForestRegressor + RandomForestRegressor
    :return: two new model instances with a set random_state
    """
    model_min = RandomForestRegressor(random_state=42)
    model_max = RandomForestRegressor(random_state=42)

    return model_min, model_max


def split_data(
        X: pd.DataFrame,
        y_min: pd.Series,
        y_max: pd.Series
) -> (pd.DataFrame, pd.DataFrame, pd.Series, pd.Series, pd.Series, pd.Series):
    """

    :param X: the feature matrix
    :param y_min: the target vector for minimum duration predictions
    :param y_max: the target vector for maximum duration predictions
    :rtype: pd.DataFrame + pd.DataFrame + pd.Series + pd.Series + pd.Series + pd.Series
    :return: the training and testing data for the feature matrix and target vectors
    """
    return train_test_split(X, y_min, y_max, test_size=0.2, random_state=42)


def load_data(

) -> (pd.DataFrame, pd.DataFrame, TfidfVectorizer):
    """
    :rtype: pd.DataFrame + pd.DataFrame + TfidfVectorizer
    :return: the dataset, the feature matrix, and the vectorizer
    """
    dataset_path = path.join(path.dirname(path.realpath(__file__)), '../../data', 'training.csv')

    data = pd.read_csv(dataset_path)

    vectorizer = TfidfVectorizer(stop_words='english')
    return data, vectorizer.fit_transform(data['Task']), vectorizer


def save_models_and_vectorizer(
        model_min: RandomForestRegressor,
        model_max: RandomForestRegressor,
        vectorizer: TfidfVectorizer
) -> None:
    """

    :param model_min: the model to save for min duration
    :param model_max: the model to save for max duration
    :param vectorizer: the vectorizer to save
    :rtype: None
    :return: None
    """
    with open('model_min.pkl', 'wb') as file:
        pk.dump(model_min, file)
    with open('model_max.pkl', 'wb') as file:
        pk.dump(model_max, file)
    with open('vectorizer.pkl', 'wb') as file:
        pk.dump(vectorizer, file)


def main(

) -> None:
    data, X, vectorizer = load_data()

    # Targets
    y_min = data['Min_Duration']
    y_max = data['Max_Duration']

    model_min, model_max = build_model()
    X_train, X_test, y_min_train, y_min_test, y_max_train, y_max_test = split_data(X, y_min, y_max)
    train_model(model_min, model_max, X_train, y_min_train, y_max_train)


    save_models_and_vectorizer(model_min, model_max, vectorizer)


if __name__ == '__main__':
    main()
