/****************************************************************************
**
** Copyright (C) 2012 Digia Plc
** All rights reserved.
** For any questions to Digia, please use contact form at http://qt.digia.com
**
** This file is part of the Qt Commercial Charts Add-on.
**
** $QT_BEGIN_LICENSE$
** Licensees holding valid Qt Commercial licenses may use this file in
** accordance with the Qt Commercial License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.
**
** If you have questions regarding the use of this file, please use
** contact form at http://qt.digia.com
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.0

Column {
    spacing: 5
    signal openGLEnabled(bool enabled)
    signal animationsEnabled(bool enabled)
    signal seriesTypeChanged(string type)
    signal refreshRateChanged(variant rate);
    signal signalSourceChanged(string source, int signalCount, int sampleCount);

    Text {
        text: "Oscilloscope"
        font.pointSize: 18
    }

    MultiButton {
        text: "Graph: "
        items: ["line", "spline", "scatter"]
        currentSelection: 0
        onSelectionChanged: seriesTypeChanged(items[currentSelection]);
    }

    MultiButton {
        id: signalSourceButton
        text: "Source: "
        items: ["sin", "linear"]
        currentSelection: 0
        onSelectionChanged: signalSourceChanged(
                                selection,
                                5,
                                sampleCountButton.items[sampleCountButton.currentSelection]);
    }

    MultiButton {
        id: sampleCountButton
        text: "Samples: "
        items: [6, 128, 1024, 10000]
        currentSelection: 2
        onSelectionChanged: signalSourceChanged(
                                signalSourceButton.items[signalSourceButton.currentSelection],
                                5,
                                selection);
    }

    MultiButton {
        text: "Refresh rate: "
        items: [1, 24, 60, 100]
        currentSelection: 2
        onSelectionChanged: refreshRateChanged(items[currentSelection]);
    }

    MultiButton {
        text: "OpenGL: "
        items: ["OFF", "ON"]
        currentSelection: 0
        onSelectionChanged: openGLEnabled(currentSelection == 1);
    }

    MultiButton {
        text: "Animations: "
        items: ["OFF", "ON"]
        currentSelection: 0
        onSelectionChanged: animationsEnabled(currentSelection == 1);
    }
}