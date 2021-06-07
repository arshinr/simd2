#!/bin/bash
mkdir -p out/cold 
mkdir -p out/post
mkdir -p out/pre 
mkdir -p out/migrror

MinNumberOfSmartthings=7
MaxNumberOfSmartthings=10
getPeriodicTimeUp=1000
getPeriodicTimeDown=2439
VMSizeMin=128
VMSizeMax=128
#getPeriodicTimeUp=2000
#getPeriodicTimeDown=4878
#VMSizeMin=128
#VMSizeMax=128



for STNumber in $(seq $MinNumberOfSmartthings $MaxNumberOfSmartthings)
do

#Complete VM/Cold migration

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber 11 0 0 0 61 $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax

		mv *.txt $STNumber
		mv $STNumber out/cold/


#Post-copy

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber 11 2 0 0 61 $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax

		mv *.txt $STNumber
		mv $STNumber out/post/


#Pre-Copy

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber 11 3 0 0 61 $getPeriodicTimeUp $getPeriodicTimeDown 2439 $VMSizeMin $VMSizeMax

		mv *.txt $STNumber
		mv $STNumber out/Pre/


#Migrror

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber 11 4 0 0 61 $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax

		mv *.txt $STNumber
		mv $STNumber out/Migrror/


done
