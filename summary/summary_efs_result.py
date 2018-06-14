#! /usr/bin/env python

import sys, os, glob
import numpy as np

target_files = glob.glob('result/*txt')
print "#EC2\tmax\tmin\tmean\tptp"
for target_file in target_files:
    time_list = []
    f_name, f_ext = os.path.splitext(target_file)
    f_array = f_name.split("_")
    f = "AWS-EFS " + f_array[1].replace("x","")
    with open(target_file, 'r') as hin:
        for line in hin:
            if line.startswith("ami"): continue
            F = line.rstrip('\n').split(' ')
            real_time = F[7]
            time_list.append(float(real_time))
    a = np.array(time_list)
    print f +"\t"+ str(np.amax(a)) +"\t"+ str(np.amin(a)) +"\t"+ str(round(np.mean(a),3)) +"\t"+ str(round(np.ptp(a),3))

