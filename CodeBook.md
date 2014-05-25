Codebook for the Getting and Cleaning Datacourse project
========================================================

We present hereafter the details of the different variables used in the tidy dataset obtained as an output of the file *run_analysis.R*.

One of the main problems faced in the definition of variables is the lack of detailed explanations provided in the original database. Thus, the descriptions of the variables are oftencase more a guess than a proper explanation.

## Generic variables ##
**Subjects:** Integer, ID of the subjects considered in the study.

**Activities:** Description of the activities done per subject. It can take 6 values:
* Laying
* Sitting
* Standing
* Walking
* Walking downstairs
* Walking upstairs

## Time domain mean signals ##
These variables are time domain signals (prefix 'Time') that were captured at a constant rate of 50 Hz.

They represent the mean values for the measured signals, of which the mean has been calculated per subject and activity. All variables considered are of type **float**.

**TimeBodyAccelerometerMeanX:** Body acceleration from the accelerometer, raw signal on the x axis

**TimeBodyAccelerometerMeanY:** Body acceleration from the accelerometer, raw signal on the y axis

**TimeBodyAccelerometerMeanZ:** Body acceleration from the accelerometer, raw signal on the z axis

**TimeGravityAccelerometerMeanX:** Body acceleration from the accelerometer, raw signal on the x axis

**TimeGravityAccelerometerMeanY:** Body acceleration from the accelerometer, raw signal on the y axis

**TimeGravityAccelerometerMeanZ:** Body acceleration from the accelerometer, raw signal on the z axis

**TimeBodyAccelerometerJerkMeanX:** Jerk signals derived from the body acceleration signals, x axis

**TimeBodyAccelerometerJerkMeanY:** Jerk signals derived from the body acceleration signals, y axis

**TimeBodyAccelerometerJerkMeanZ:** Jerk signals derived from the body acceleration signals, z axis

**TimeBodyGyroscopeMeanX:** Body angular velocity from the gyroscope, raw signal on the x axis

**TimeBodyGyroscopeMeanY:** Body angular velocity from the gyroscope, raw signal on the x axis

**TimeBodyGyroscopeMeanZ:** Body angular velocity from the gyroscope, raw signal on the x axis

**TimeBodyGyroscopeJerkMeanX:** Jerk signals derived from the body angular velocity signals, x axis

**TimeBodyGyroscopeJerkMeanY:** Jerk signals derived from the body angular velocity signals, y axis

**TimeBodyGyroscopeJerkMeanZ:** Jerk signals derived from the body angular velocity signals, z axis

**TimeBodyAccelerometerMagnitudeMean:** Magnitude calculation of the body acceleration signals

**TimeGravityAccelerometerMagnitudeMean:** Magnitude calculation of the gravity acceleration signals

**TimeBodyAccelerometerJerkMagnitudeMean:** Magnitude calculation of the body acceleration jerk signals

**TimeBodyGyroscopeMagnitudeMean:** Magnitude calculation of the body  angular velocity  signals

**TimeBodyGyroscopeJerkMagnitudeMean:** Magnitude calculation of the body angular velocity signals

## Fast fourier transfrom mean signals ##
These variables are the result of applying a Fast Fourier Transfrom (FFT) to signals (prefix 'FastFourierTransform').

They represent the mean values for the measured signals, of which the mean has been calculated per subject and activity. All variables considered are of type **float**.

**FastFourierTransformBodyAccelerometerMeanX:** Body acceleration from the accelerometer, raw signal on the x axis

**FastFourierTransformBodyAccelerometerMeanY:** Body acceleration from the accelerometer, raw signal on the y axis

**FastFourierTransformBodyAccelerometerMeanZ:** Body acceleration from the accelerometer, raw signal on the z axis

**FastFourierTransformBodyAccelerometerJerkMeanX:** Jerk signals derived from the body acceleration signals, x axis

**FastFourierTransformBodyAccelerometerJerkMeanY:** Jerk signals derived from the body acceleration signals, y axis

**FastFourierTransformBodyAccelerometerJerkMeanZ:** Jerk signals derived from the body acceleration signals, z axis

**FastFourierTransformBodyGyroscopeMeanX:** Body angular velocity from the gyroscope, raw signal on the x axis

**FastFourierTransformBodyGyroscopeMeanY:** Body angular velocity from the gyroscope, raw signal on the x axis

**FastFourierTransformBodyGyroscopeMeanZ:** Body angular velocity from the gyroscope, raw signal on the x axis

**FastFourierTransformBodyAccelerometerMagnitudeMean:** Magnitude calculation of the body acceleration signals

**FastFourierTransformBodyAccelerometerJerkMagnitudeMean:** Magnitude calculation of the body acceleration jerk signals

**FastFourierTransformBodyGyroscopeMagnitudeMean:** Magnitude calculation of the body  angular velocity  signals

**FastFourierTransformBodyGyroscopeJerkMagnitudeMean:** Magnitude calculation of the body angular velocity signals

## Time domain standard deviation signals ##
These variables are time domain signals (prefix 'Time') that were captured at a constant rate of 50 Hz.

They represent the standard deviation values for the measured signals, of which the mean has been calculated per subject and activity. All variables considered are of type **float**.

**TimeBodyAccelerometerStandardDeviationX:** Body acceleration from the accelerometer, raw signal on the x axis

**TimeBodyAccelerometerStandardDeviationY:** Body acceleration from the accelerometer, raw signal on the y axis

**TimeBodyAccelerometerStandardDeviationZ:** Body acceleration from the accelerometer, raw signal on the z axis

**TimeGravityAccelerometerStandardDeviationX:** Body acceleration from the accelerometer, raw signal on the x axis

**TimeGravityAccelerometerStandardDeviationY:** Body acceleration from the accelerometer, raw signal on the y axis

**TimeGravityAccelerometerStandardDeviationZ:** Body acceleration from the accelerometer, raw signal on the z axis

**TimeBodyAccelerometerJerkStandardDeviationX:** Jerk signals derived from the body acceleration signals, x axis

**TimeBodyAccelerometerJerkStandardDeviationY:** Jerk signals derived from the body acceleration signals, y axis

**TimeBodyAccelerometerJerkStandardDeviationZ:** Jerk signals derived from the body acceleration signals, z axis

**TimeBodyGyroscopeStandardDeviationX:** Body angular velocity from the gyroscope, raw signal on the x axis

**TimeBodyGyroscopeStandardDeviationY:** Body angular velocity from the gyroscope, raw signal on the x axis

**TimeBodyGyroscopeStandardDeviationZ:** Body angular velocity from the gyroscope, raw signal on the x axis

**TimeBodyGyroscopeJerkStandardDeviationX:** Jerk signals derived from the body angular velocity signals, x axis

**TimeBodyGyroscopeJerkStandardDeviationY:** Jerk signals derived from the body angular velocity signals, y axis

**TimeBodyGyroscopeJerkStandardDeviationZ:** Jerk signals derived from the body angular velocity signals, z axis

**TimeBodyAccelerometerMagnitudeStandardDeviation:** Magnitude calculation of the body acceleration signals

**TimeGravityAccelerometerMagnitudeStandardDeviation:** Magnitude calculation of the gravity acceleration signals

**TimeBodyAccelerometerJerkMagnitudeStandardDeviation:** Magnitude calculation of the body acceleration jerk signals

**TimeBodyGyroscopeMagnitudeStandardDeviation:** Magnitude calculation of the body  angular velocity  signals

**TimeBodyGyroscopeJerkMagnitudeStandardDeviation:** Magnitude calculation of the body angular velocity signals

## Fast fourier transfrom standard deviation signals ##
These variables are the result of applying a Fast Fourier Transfrom (FFT) to signals (prefix '').

They represent the standard deviation values for the measured signals, of which the mean has been calculated per subject and activity. All variables considered are of type **float**.

**FastFourierTransformBodyAccelerometerStandardDeviationX:** Body acceleration from the accelerometer, raw signal on the x axis

**FastFourierTransformBodyAccelerometerStandardDeviationY:** Body acceleration from the accelerometer, raw signal on the y axis

**FastFourierTransformBodyAccelerometerStandardDeviationZ:** Body acceleration from the accelerometer, raw signal on the z axis

**FastFourierTransformBodyAccelerometerJerkStandardDeviationX:** Jerk signals derived from the body acceleration signals, x axis

**FastFourierTransformBodyAccelerometerJerkStandardDeviationY:** Jerk signals derived from the body acceleration signals, y axis

**FastFourierTransformBodyAccelerometerJerkStandardDeviationZ:** Jerk signals derived from the body acceleration signals, z axis

**FastFourierTransformBodyGyroscopeStandardDeviationX:** Body angular velocity from the gyroscope, raw signal on the x axis

**FastFourierTransformBodyGyroscopeStandardDeviationY:** Body angular velocity from the gyroscope, raw signal on the x axis

**FastFourierTransformBodyGyroscopeStandardDeviationZ:** Body angular velocity from the gyroscope, raw signal on the x axis

**FastFourierTransformBodyAccelerometerMagnitudeStandardDeviation:** Magnitude calculation of the body acceleration signals

**FastFourierTransformBodyAccelerometerJerkMagnitudeStandardDeviation:** Magnitude calculation of the body acceleration jerk signals

**FastFourierTransformBodyGyroscopeMagnitudeStandardDeviation:** Magnitude calculation of the body  angular velocity  signals

**FastFourierTransformBodyGyroscopeJerkMagnitudeStandardDeviation:** Magnitude calculation of the body angular velocity signals

## Weighted frequency variables ##
These variables are the result of applying a Fast Fourier Transfrom (FFT) to signals (prefix 'FastFourierTransform').

They represent the weighted average of the frequency components to obtain mean values for the measured signals, of which the mean has been calculated per subject and activity. All variables considered are of type **float**.

**FastFourierTransformBodyAccelerometerMeanFrequencyX:** Body acceleration from the accelerometer, raw signal on the x axis

**FastFourierTransformBodyAccelerometerMeanFrequencyY:** Body acceleration from the accelerometer, raw signal on the y axis

**FastFourierTransformBodyAccelerometerMeanFrequencyZ:** Body acceleration from the accelerometer, raw signal on the z axis

**FastFourierTransformBodyAccelerometerJerkMeanFrequencyX:** Jerk signals derived from the body acceleration signals, x axis

**FastFourierTransformBodyAccelerometerJerkMeanFrequencyY:** Jerk signals derived from the body acceleration signals, y axis

**FastFourierTransformBodyAccelerometerJerkMeanFrequencyZ:** Jerk signals derived from the body acceleration signals, z axis

**FastFourierTransformBodyGyroscopeMeanFrequencyX:** Body angular velocity from the gyroscope, raw signal on the x axis

**FastFourierTransformBodyGyroscopeMeanFrequencyY:** Body angular velocity from the gyroscope, raw signal on the x axis

**FastFourierTransformBodyGyroscopeMeanFrequencyZ:** Body angular velocity from the gyroscope, raw signal on the x axis

**FastFourierTransformBodyAccelerometerMagnitudeMeanFrequency:** Magnitude calculation of the body acceleration signals

**FastFourierTransformBodyAccelerometerJerkMagnitudeMeanFrequency:** Magnitude calculation of the body acceleration jerk signals

**FastFourierTransformBodyGyroscopeMagnitudeMeanFrequency:** Magnitude calculation of the body  angular velocity  signals

**FastFourierTransformBodyGyroscopeJerkMagnitudeMeanFrequency:** Magnitude calculation of the body angular velocity signals
