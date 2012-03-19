integrated_build:{
    INCLUDEPATH += $$CHART_BUILD_PUBLIC_HEADER_DIR

    !win32: {
        LIBS += -L $$CHART_BUILD_LIB_DIR -Wl,-rpath,$$CHART_BUILD_LIB_DIR
    }else{
        win32-msvc*: {
            # hack fix for error:
            #   "LINK : fatal error LNK1146: no argument specified with option '/LIBPATH:'"
            QMAKE_LIBDIR += $$CHART_BUILD_LIB_DIR
        }else{
            LIBS += -L $$CHART_BUILD_LIB_DIR
        }
    }

    CONFIG(debug, debug|release) {
        LIBS += -lQtCommercialChartd
        #this is ugly hack to work around missing rpath, it simply copies lib
        win32:{
            copylib.target = $$CHART_BUILD_BIN_DIR/QtCommercialChartd.dll
            copylib.commands = $$QMAKE_COPY $$CHART_BUILD_LIB_DIR\\QtCommercialChartd.dll $$CHART_BUILD_BIN_DIR
            copylib.depends = $$CHART_BUILD_LIB_DIR/QtCommercialChartd.dll
            PRE_TARGETDEPS += $$CHART_BUILD_BIN_DIR/QtCommercialChartd.dll
            QMAKE_EXTRA_TARGETS +=copylib
        }
    } else {
        LIBS += -lQtCommercialChart

        #this is ugly hack to work around missing rpath, it simply copies lib
        win32: {
            copylib.target = $$CHART_BUILD_BIN_DIR/QtCommercialChart
            copylib.commands = $$QMAKE_COPY $$CHART_BUILD_LIB_DIR\\QtCommercialChart.dll $$CHART_BUILD_BIN_DIR
            copylib.depends = $$CHART_BUILD_LIB_DIR/QtCommercialChart.dll
            PRE_TARGETDEPS += $$CHART_BUILD_BIN_DIR/QtCommercialChart
            QMAKE_EXTRA_TARGETS +=copylib
        }
    }

    mac: {
        CHARTS_LIB_NAME = libQtCommercialChart.1.dylib
        CONFIG(debug, debug|release) {
            CHARTS_LIB_NAME = libQtCommercialChartd.1.dylib
        }

        # This is a hack to make binaries to use the internal version of the QtCommercial Charts library on OSX
        exists($$CHART_BUILD_BIN_DIR"/"$$TARGET".app/Contents/MacOS/"$$TARGET) {
            QMAKE_POST_LINK += install_name_tool -change $$CHARTS_LIB_NAME $$CHART_BUILD_LIB_DIR"/"$$CHARTS_LIB_NAME $$CHART_BUILD_BIN_DIR"/"$$TARGET".app/Contents/MacOS/"$$TARGET
            #message($$QMAKE_POST_LINK)
        }

        # Hack to make qml plugins available as internal build versions and to make the plugins use
        # the internal version of the QtCommercial Charts library on OSX
        exists($$CHART_BUILD_PLUGIN_DIR"/lib"$$TARGET".dylib") {
            QMAKE_POST_LINK += "$$QMAKE_COPY qmldir $$CHART_BUILD_PLUGIN_DIR &"
            QMAKE_POST_LINK += "install_name_tool -change $$CHARTS_LIB_NAME $$CHART_BUILD_LIB_DIR"/"$$CHARTS_LIB_NAME $$CHART_BUILD_PLUGIN_DIR"/lib"$$TARGET".dylib""
#            message($$QMAKE_POST_LINK)
        }
    }

} else {
    CONFIG += qtcommercialchart
}
