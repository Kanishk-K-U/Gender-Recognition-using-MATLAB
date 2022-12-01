# Gender Recognition using MATLAB

## Objective
The Speech signal processing has numerous applications in almost all technical 
fields. Gender identification is important in speech processing. 
This project describes a comparative analysis of speech signals in order to 
produce automatic gender classification. Gender classification by speech signal 
is a technique that analyses various features of a voice sample to determine 
the gender of the speaker.

## Abstract
It is presented an application for speech encoding, analysis, synthesis, and 
gender identification. A typical gender recognition system is divided into two 
parts: the front-end system and the back-end system. The front-end system's task 
is to extract gender information from a speech signal and represent it as a set 
of frames. The feature is extracted using the FFT algorithm (Fast Fourier Transform).
The back-end system's (also known as classifier's) task in the recognition phase is 
to create a gender model to recognise the gender from speech signal.

## Concept/Working principle
**Method 1:** Using the built-in pitch function
`[f0,inx] = pitch(audioIn,fs)`
It returns the fundamental frequency, f0, of any input audio file with 
sampling frequency fs right away. As a result, we can directly compare 
it to 165 Hz and determine whether the voice is male or female.

**Method 2:** Simulink Implementation
Using the From `Multimedia File block` the sample audio is taken as input with 3500
samples per audio channel.

## Approach/ Methodology
As a classifier, the energy-based thresholding technique is used. First, 
male and female voice samples are recorded in a file and saved in a recorded file. 
The feature (energy) is then extracted from the voice sample and designated as a 
known value. The unknown voice sample is then analysed and the feature extracted. 
Unknown value refers to the extracted feature. The unknown and known values 
are compared. If it matches, we can conclude whether the speaker is male or female.
The unknown and known values are compared. Extraction of Characteristics As a feature, 
energy is extracted by estimating the power spectrum. A file contains samples of both male and female voices. 
The voice samples are then fed into the recognition system. The voice samples are then subjected to FFT. The power spectrum is then estimated 
using the FFT signal. Following that, the energy is extracted from the power 
spectrum. The threshold energy is derived from this. Energy is extracted from the 
unknown voice sample using the same method and compared to the estimated frequency.

## Flowchart
<p >
  <div align="center" >
 <img width="640" height="400" src="https://github.com/Kanishk-K-U/Gender-Recognition/blob/master/images/flow%20chart.JPG">
    </div>
</p>

## Output
<p align="center"> <b> Method 1 - Using GUI based Matlab App</b>
</p>

<p >
  <div align="center" >
 <img width="640" height="400" src="https://github.com/Kanishk-K-U/Gender-Recognition/blob/master/images/app.png">
    </div>
</p>

<p align="center"> <b> Method 2 - Using Matlab Simulink</b>
</p>

<p >
  <div align="center" >
 <img width="640" height="400" src="https://github.com/Kanishk-K-U/Gender-Recognition/blob/master/images/simulink.png">
    </div>
</p>

## Conclusion

This process of translating speech in systems is known as gender recognition 
using voice. It was created to allow a person to authenticate or verify the 
identity of a speaker as part of a security measure. In this project, the speaker 
is identified by using energy estimation as a threshold value. This calculated 
energy is then compared to the threshold energy. If the energy is greater than the
threshold, the male produces the voice sample. If it is less than the threshold, 
the female produces the voice sample.

## References

<sub><br>[1] *Huang X., Acero, A., and Hon, H.-W. “Spoken Language Processing: a Guide To Theory, Algorithms and System Development” prentice-Hall, New Jersey, 2001*
</br></sub>
<sub><br>[2] *Matlab based Gender Recognition using Voice Processing Shaheda Eqbal1 , Ms. Taru Tevatia JUNE 2019 ISSN: 2348-2281 INTERNATIONAL JOURNAL OF RESEARCH IN ELECTRONICS AND COMPUTER ENGINEERING A UNIT OF I2OR 3353*
</br></sub>
<sub><br>[3] *https://github.com/Shubzedm007/Male-Female-Voice-Recognition*</br></sub>
