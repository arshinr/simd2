#!/bin/bash
mkdir -p out/cold 
mkdir -p out/post1
mkdir -p out/pre 
mkdir -p out/migrror
mkdir -p out/post2justHandoff
mkdir -p out/hybrid-pre-post
mkdir -p out/hybrid-migrror-post

MinNumberOfSmartthings=1
MaxNumberOfSmartthings=2
getPeriodicTimeUp=1000
getPeriodicTimeDown=2439
VMSizeMin=128
VMSizeMax=128
BaseNetBandwidthCloudlets=100
BaseNetLatencyCloudlets=1
AccessPointDownLinkBandwidth=100
AccessPointUpLinkBandwidth=100
MobileDeviceDownLinkBandwidth=2
MobileDeviceUpLinkBandwidth=2
AppModuleBandWidth=1000



for STNumber in $(seq $MinNumberOfSmartthings $MaxNumberOfSmartthings)
do

#Complete VM/Cold migration

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber $BaseNetBandwidthCloudlets 0 0 0 $BaseNetLatencyCloudlets $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax $AccessPointDownLinkBandwidth $AccessPointUpLinkBandwidth $MobileDeviceDownLinkBandwidth $MobileDeviceUpLinkBandwidth $AppModuleBandWidth

		mv *.txt $STNumber
		mv $STNumber out/cold/


#Post-copy 1st

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber $BaseNetBandwidthCloudlets 2 0 0 $BaseNetLatencyCloudlets $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax $AccessPointDownLinkBandwidth $AccessPointUpLinkBandwidth $MobileDeviceDownLinkBandwidth $MobileDeviceUpLinkBandwidth $AppModuleBandWidth

		mv *.txt $STNumber
		mv $STNumber out/post1/


#Post-copy 2nd - Just Handoff

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber $BaseNetBandwidthCloudlets 5 0 0 $BaseNetLatencyCloudlets $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax $AccessPointDownLinkBandwidth $AccessPointUpLinkBandwidth $MobileDeviceDownLinkBandwidth $MobileDeviceUpLinkBandwidth $AppModuleBandWidth

		mv *.txt $STNumber
		mv $STNumber out/post2justHandoff/


#Pre-Copy

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber $BaseNetBandwidthCloudlets 3 0 0 $BaseNetLatencyCloudlets $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax $AccessPointDownLinkBandwidth $AccessPointUpLinkBandwidth $MobileDeviceDownLinkBandwidth $MobileDeviceUpLinkBandwidth $AppModuleBandWidth

		mv *.txt $STNumber
		mv $STNumber out/pre/


#MiGrror

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber $BaseNetBandwidthCloudlets 4 0 0 $BaseNetLatencyCloudlets $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax $AccessPointDownLinkBandwidth $AccessPointUpLinkBandwidth $MobileDeviceDownLinkBandwidth $MobileDeviceUpLinkBandwidth $AppModuleBandWidth

		mv *.txt $STNumber
		mv $STNumber out/migrror/

#Hybrid: Pre-copy before handoff, post-copy after handoff

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber $BaseNetBandwidthCloudlets 6 0 0 $BaseNetLatencyCloudlets $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax $AccessPointDownLinkBandwidth $AccessPointUpLinkBandwidth $MobileDeviceDownLinkBandwidth $MobileDeviceUpLinkBandwidth $AppModuleBandWidth

		mv *.txt $STNumber
		mv $STNumber out/hybrid-pre-post/


#Hybrid: MiGrror before handoff, post-copy after handoff

		mkdir $STNumber

		java -Xmx30g -Dfile.encoding=UTF-8 -classpath bin:jars/cloudsim-3.0.3-sources.jar:jars/cloudsim-3.0.3.jar:jars/cloudsim-examples-3.0.3-sources.jar:jars/cloudsim-examples-3.0.3.jar:jars/commons-math3-3.5/commons-math3-3.5.jar:jars/guava-18.0.jar:jars/json-simple-1.1.1.jar:jars/junit.jar:jars/org.hamcrest.core_1.3.0.v201303031735.jar org.fog.vmmobile.AppExample 1 290538 0 0 $STNumber $BaseNetBandwidthCloudlets 7 0 0 $BaseNetLatencyCloudlets $getPeriodicTimeUp $getPeriodicTimeDown $VMSizeMin $VMSizeMax $AccessPointDownLinkBandwidth $AccessPointUpLinkBandwidth $MobileDeviceDownLinkBandwidth $MobileDeviceUpLinkBandwidth $AppModuleBandWidth

		mv *.txt $STNumber
		mv $STNumber out/hybrid-migrror-post/
		

done
