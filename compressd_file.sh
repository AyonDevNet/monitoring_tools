#if any file larger than 50MB then it will compressed those and preserve it in compresed_file 

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

#THIS IS THE CODE TO EXECUTED
for i in `find $BASE -maxdepth $DEPTH -type f -size +50MB`
do
        if [ $RUN -eq 0]; then
           gzip $i || exit 1
           mv $i.gz  $BASE/compresed_file || exit 1
done