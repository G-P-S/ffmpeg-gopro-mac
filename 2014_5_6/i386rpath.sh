# cd to the i386/lib directory
cd i386/lib

# recursively delete any existing rpathed directory
if [ -d rpathed ]
then
echo removing existing rpathed directory
rm -r rpathed
fi

# create a new rpathed directory
mkdir rpathed

# copy (and rename) necessary dylibs
cp libavcodec.55.60.103.dylib rpathed/libavcodec.55.dylib
cp libavformat.55.37.102.dylib rpathed/libavformat.55.dylib
cp libavutil.52.81.100.dylib rpathed/libavutil.52.dylib
cp libswscale.2.6.100.dylib rpathed/libswscale.2.dylib
cp libavresample.1.2.0.dylib rpathed/libavresample.1.dylib
cp libswresample.0.18.100.dylib rpathed/libswresample.0.dylib

# cd to the new rpathed directory
cd rpathed

# libavcodec
install_name_tool -id @rpath/../Frameworks/libavcodec.55.dylib libavcodec.55.dylib
install_name_tool -change i386/lib/libavutil.52.dylib @rpath/../Frameworks/libavutil.52.dylib libavcodec.55.dylib

# libavformat
install_name_tool -id @rpath/../Frameworks/libavformat.55.dylib libavformat.55.dylib
install_name_tool -change i386/lib/libavcodec.55.dylib @rpath/../Frameworks/libavcodec.55.dylib libavformat.55.dylib
install_name_tool -change i386/lib/libavutil.52.dylib @rpath/../Frameworks/libavutil.52.dylib libavformat.55.dylib

# libavutil
install_name_tool -id @rpath/../Frameworks/libavutil.52.dylib libavutil.52.dylib

# libsyscale
install_name_tool -id @rpath/../Frameworks/libswscale.2.dylib libswscale.2.dylib
install_name_tool -change i386/lib/libavutil.52.dylib @rpath/../Frameworks/libavutil.52.dylib libswscale.2.dylib

# libavresample
install_name_tool -id @rpath/../Frameworks/libavresample.1.dylib libavresample.1.dylib
install_name_tool -change i386/lib/libavutil.52.dylib @rpath/../Frameworks/libavutil.52.dylib libavresample.1.dylib

# libswresample
install_name_tool -id @rpath/../FrameWorks/libswresample.0.dylib libswresample.0.dylib
install_name_tool -change i386/lib/libavutil.52.dylib @rpath/../Frameworks/libavutil.52.dylib libswresample.0.dylib
