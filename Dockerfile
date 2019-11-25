
FROM jupyter/base-notebook

LABEL maintainer="Jason B. Hill <jason@jasonbhill.com>"

RUN conda install --quiet --yes \
    matplotlib \
    numpy

