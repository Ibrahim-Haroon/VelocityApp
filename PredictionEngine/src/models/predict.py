import pickle as pk
from sklearn.ensemble import RandomForestRegressor
from sklearn.feature_extraction.text import TfidfVectorizer


def load_models_and_vectorizer(

) -> (RandomForestRegressor, RandomForestRegressor, TfidfVectorizer):
    """
    :rtype: RandomForestRegressor + RandomForestRegressor + TfidfVectorizer
    :return: the trained models and the vectorizer
    """
    with open('model_min.pkl', 'rb') as file:
        model_min = pk.load(file)
    with open('model_max.pkl', 'rb') as file:
        model_max = pk.load(file)
    with open('vectorizer.pkl', 'rb') as file:
        vectorizer = pk.load(file)
    return model_min, model_max, vectorizer


def predict(
        task_to_predict: str,
        model_min: RandomForestRegressor,
        model_max: RandomForestRegressor,
        vectorizer: TfidfVectorizer
) -> (float, float):
    """

    :param task_to_predict: the task to predict the duration
    :param model_min: the model to predict the minimum duration
    :param model_max: the model to predict the maximum duration
    :param vectorizer: the vectorizer to transform the task
    :return: the predicted minimum and maximum duration
    """
    new_task_features = vectorizer.transform([task_to_predict])

    predicted_min_duration = model_min.predict(new_task_features)
    predicted_max_duration = model_max.predict(new_task_features)

    return predicted_min_duration[0], predicted_max_duration[0]


def main(

) -> None:
    model_min, model_max, vectorizer = load_models_and_vectorizer()

    task = input("Enter the task to predict duration: ")
    min_duration, max_duration = predict(task, model_min, model_max, vectorizer)

    print("Predicted Min Duration for New Task:", min_duration)
    print("Predicted Max Duration for New Task:", max_duration)


if __name__ == '__main__':
    main()