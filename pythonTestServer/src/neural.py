from sklearn import svm, datasets
import pylab as pl

def main():
    digits = datasets.load_digits()
    # pl.gray()
    # pl.matshow(digits.images[0])
    # pl.show()
    images_and_labels = list(zip(digits.images, digits.target))
    n_samples = len(digits.images)
    data = digits.images.reshape((n_samples, -1))
