# Automotive Radar Interference Mitigation Data Set

The data already generated are in the "arim_dataset.mat".
In order to convert the dataset in python and split it into train and test, you may use the "split_dataset.py" script.

If you want to regenerate the dataset (maybe with a different number of FFT points or other modifications, which must not affect the raw data) you may use the matlab scripts.

We strongly recomand, if you want to regenerate the dataset, to modify at most the labels (which relates to targets positions; the reason should be that you want to have a range profile consisting of a smaller FFT points).