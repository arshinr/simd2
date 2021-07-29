#!/bin/bash
mkdir -p out/hybrid-pre-post
mkdir -p out/hybrid-migrror-post

MinNumberOfSmartthings=1
MaxNumberOfSmartthings=5
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

#Hybrid: Pre-copy befor handoff, post-copy after handoff

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber 11 6 0 0 61 $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax

		mv *.txt $STNumber
		mv $STNumber out/hybrid-pre-post/


#Hybrid: MiGrror befor handoff, post-copy after handoff

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber 11 7 0 0 61 $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax

		mv *.txt $STNumber
		mv $STNumber out/hybrid-migrror-post/


done
