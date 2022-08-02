# Docker container for Kilosort2

To run a dataset, change the UUID in 'run_kilosort2.yaml' and run with kubernetes. 

In this container, Kilosort2 is compiled as a MATLAB executable. This executable runs with MATLAB runtime, which doesn't require a MathWorks license. 
The container is currently configured to run only MaxWell datasets. When running the container, the raw data is downloaded from s3, converted to binary and bandpass filtered. Data conversion and filtering are performed using SpikeInterface API. After these steps, Kilosort2 runs and outputs phy compatible files. The output is zipped into one file, named after the dataset and uploaded back to s3. 

