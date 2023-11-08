#!/bin/bash
for i in `seq 0 1 99`; 
    do 
        finale=`grep ^! grid_point_$i.out | tail -n 1 | awk '{print $5}'`; 
        initiale=`grep ^! grid_point_$i.out | head -n 1 | awk '{print $5}'`; 
        initialxyz=`grep '        36           O   tau(  36) =' grid_point_$i.out | awk '{print $7,$8,$9}'`; 
        finalxyz=`awk '/Begin final coordinates/ {finished=1};/^O/ {if (finished==1) {print $2,$3,$4}}' grid_point_$i.out`; 
        echo $i $initiale $finale $initialxyz $finalxyz ; 
done
