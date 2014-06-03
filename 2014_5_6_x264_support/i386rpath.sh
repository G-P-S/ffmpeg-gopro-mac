# cd to the proper directory
cd i386/lib/rpathed

# libavcodec
install_name_tool -id @rpath/../Frameworks/libavcodec.55.60.103.dylib libavcodec.55.60.103.dylib
install_name_tool -change i386/lib/libavutil.52.dylib @rpath/../Frameworks/libavutil.52.dylib libavcodec.55.60.103.dylib

# libavformat
install_name_tool -id @rpath/../Frameworks/libavformat.55.37.102.dylib libavformat.55.37.102.dylib
install_name_tool -change i386/lib/libavcodec.55.dylib @rpath/../Frameworks/libavcodec.55.dylib libavformat.55.37.102.dylib
install_name_tool -change i386/lib/libavutil.52.dylib @rpath/../Frameworks/libavutil.52.dylib libavformat.55.37.102.dylib

# libavutil
install_name_tool -id @rpath/../Frameworks/libavutil.52.81.100.dylib libavutil.52.81.100.dylib

# libsyscale
install_name_tool -id @rpath/../Frameworks/libswscale.2.6.100.dylib libswscale.2.6.100.dylib
install_name_tool -change i386/lib/libavutil.52.dylib @rpath/../Frameworks/libavutil.52.dylib libswscale.2.6.100.dylib