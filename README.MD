Docker container for Kilosort2.

Kilosort2 is compiled as a MATLAB executable. 
The MAXWELL raw data is downloaded from s3, converted to binary and filtered by spikeinterface.extractor API. Then kilosort runs. 
The kilosort output is zipped and uploaded to s3.


