# Generated from domain.pro.

#####################################################################
## domain Test:
#####################################################################

qt_internal_add_test(domain
    SOURCES
        ../inc/tst_definitions.h
        tst_domain.cpp
    INCLUDE_DIRECTORIES
        ../inc
    PUBLIC_LIBRARIES
        Qt::Charts
        Qt::ChartsPrivate
        Qt::CorePrivate
        Qt::Gui
        Qt::OpenGL
        Qt::OpenGLWidgets
        Qt::Widgets
)
