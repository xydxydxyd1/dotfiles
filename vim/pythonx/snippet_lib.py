import string

def tagify(text: str):
    text = text.lower()
    text = text.translate(str.maketrans('', '', string.punctuation))
    text = text.replace(" ", "-")
    return text
