#!/bin/sh
set -x
date

# NOAA WCOSS Dell Phase3
#HOMEhafs=/gpfs/dell2/emc/modeling/noscrub/${USER}/save/HAFS
#dev="-s sites/wcoss_dell_p3.ent -f"
#PYTHON3=/usrx/local/prod/packages/python/3.6.3/bin/python3

# NOAA WCOSS Cray
#HOMEhafs=/gpfs/hps3/emc/hwrf/noscrub/${USER}/save/HAFS
#dev="-s sites/wcoss_cray.ent -f"
#PYTHON3=/opt/intel/intelpython3/bin/python3

# NOAA RDHPCS Jet
HOMEhafs=/mnt/lfs4/HFIP/hwrf-vd/${USER}/HAFS2021_ensemble
#dev="-s sites/xjet.ent -f"
dev="-s sites/xjet_ensemble.ent -f"
PYTHON3=/apps/intel/intelpython3/bin/python3

# MSU Orion
# HOMEhafs=/work/noaa/hwrf/save/${USER}/HAFS
# dev="-s sites/orion.ent -f"
# PYTHON3=/apps/intel-2020/intel-2020/intelpython3/bin/python3

# NOAA RDHPCS Hera
#HOMEhafs=/scratch1/NCEPDEV/hwrf/save/${USER}/HAFS
#dev="-s sites/hera.ent -f"
#PYTHON3=/apps/intel/intelpython3/bin/python3

cd ${HOMEhafs}/rocoto

EXPT=$(basename ${HOMEhafs})
scrubopt="config.scrub_work=yes config.scrub_com=yes"

#===============================================================================

 # hafsv0p2a phase2
 confopts="config.EXPT=${EXPT} config.SUBEXPT=HAFS2021_ensemble \
     ../parm/hafsv2021_ensemble_AL.conf \
     ../parm/hafs_hycom.conf"

 confopts_noocean="config.EXPT=${EXPT} config.SUBEXPT=HAFS2021_ensemble \
     ../parm/hafsv2021_ensemble_AL.conf"

#for ens in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
#do

#if [ $ens -eq 00 ] ; then
# ${PYTHON3} ./run_hafs.py -t ${dev} 2020082112 00L HISTORY \
#     ${confopts_noocean} ${scrubopt} \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_${ens} config.ENS=${ens} \
#     config.do_sppt=.F. config.do_shum=.F. config.do_skeb=.F. \
#     config.disk_project=hwrf-vd 
#else
# ${PYTHON3} ./run_hafs.py -t ${dev} 2020082112 00L HISTORY \
#     ${confopts_noocean} ${scrubopt} \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_${ens} config.ENS=${ens} \
#     config.disk_project=hwrf-vd 
#fi

#done

#===============================================================================

date

echo 'cronjob done'
