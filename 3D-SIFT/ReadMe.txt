Dataset Used: KTH human action dataset with 6 actions

Create following folders in the project directory
1) "DATA"
2) "HIST"
3) "STIP"
4) "HOG"
5) "Videos"

Download and put the data in 'DATA' folder. There are 6 classes clap, running, walking, jogging, waving, walking and boxing
The data should be in following format classSampleNumber.avi 
Class 1 : Clap clap1.avi
               clap2.avi
               ....
Class 2 : Running running1.avi
                  running2.avi  
                  ....

'STIP': This directory stores 3-D matrices indicating STIP points for each video
'Videos': This directory stores frames of each video in greyscale format.
'HOG': This directory stores HOG descriptors of each video.
'HIST' : This directory contains the histograms for each of the videos.

These directories will be empty 

Running steps:
    1) Run "main.m" to extract the HOG features of :
        80 training files for each class and 20 test files

        After running the main.m file :
            "STIP" folder will contain the STIP points for each video
            "Videos" folder will contain the frames for each video
            "HOG" folder will the HOG descriptors for each video
        
        This file uses following files:
            "STIP.m"  -> For collecting the STIP points for a video
            "saving_video.m"    -> For collecting the frames of a video
            "HOG.m"         -> Iterating over the STIP points and frames of video
            "Collectin_HOG.m"  -> Constructing the HOG descriptors of a video
    
 x``
    
    2) Run "k_means.m" to construct the cluster centres (k=1000). Save the [C,IDX] with the name of clustering_information.mat
       Only training videos are used for this
        

    3) After running "k_means.m" , run "construct_hist.m" to construct the histogram for each of the videos
       After this step we obtain the histogram for each of the videos in "HIST" folder.


    4) Run "svm_train.m" to obtain the predicted classes for each of the test videos with accuracy and confusion matrix.
        This file uses SVM to train the classifier.
    
    5) Run "knn.m" to obtain the predicted classes for each of the test videos with accuracy and confusion matrix.
        This file uses KNN to train the classifier.

Acknowledgement: 3D-SIFT code: https://github.com/saadali37/3D-SIFT  