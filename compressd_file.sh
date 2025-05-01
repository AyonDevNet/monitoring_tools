
BASE=/home/compresed_file/archive_file/compressd_file.sh
DAYS=10
DEPTH=1
RUN=0

#if the directory is not available in here
if [[ ! -d $BASE ]];
then
    echo "the directory path is not found !! " $BASE
    exit
fi

#if the pathe is not available then it will create it
if [[ ! -d $BASE/compresed_file ]];
then
    mkdir $BASE/compresed_file
fi