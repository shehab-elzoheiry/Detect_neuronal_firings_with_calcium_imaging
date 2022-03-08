# detect_neuronal_firings_with_calcium_imaging

This is part of the project published in [Elzoheiry et al 2019](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7820691/pdf/10.1177_0271678X19892657.pdf)

## Content:
The 'GroundTruth.m' script fits high resolution electrophysiological recordings with low resolution recordings of calcium fluorescent signal. This is required to correspond firing activity of certain neurons with their calcium imaging. The output is count, average firings and interspike interval for each neuron during calcium imaging recordings.

The script uses the 'butterband.m' funciton is a butterband filter. It takes the signal, sampling rate, low and high frequencies, and lastly the order. The output is filtered signal.

## Implementation:
* First, you should extract uncontaminated calcium fluorescent signals, which can be extracted using [Extraction_of_Calcium_Imaging_Signals](https://github.com/shehab-elzoheiry/Extraction_of_Calcium_Imaging_Signals) if you are using wide field microscopy for your recordings.
* Second, you should extract electrophysiology recordings (action potentials / firings) with the 'events' channel if you are using spike2.
