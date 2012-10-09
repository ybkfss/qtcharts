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

#include "charts.h"
#include "qchart.h"
#include "qlineseries.h"
#include "qvalueaxis.h"
#include "qcategoryaxis.h"

class MultiValueAxis: public Chart
{
public:
    QString name()
    {
        return "MultiValueAxis";
    }
    QString category()
    {
        return QObject::tr("Axis");
    }
    QString subCategory()
    {
        return QString::null;
    }

    QChart *createChart(const DataTable &table)
    {
        QChart *chart = new QChart();
        QValueAxis *axisX;
        QValueAxis *axisY;

        chart->setTitle("MultiValueAxis");

        QString name("Series");
        int nameIndex = 0;
        foreach (DataList list, table) {
            QLineSeries *series = new QLineSeries(chart);
            foreach (Data data, list)
                series->append(data.first);
            series->setName(name + QString::number(nameIndex));

            chart->addSeries(series);
            axisX = new QValueAxis();
            axisX->setLinePenColor(series->pen().color());
            if (nameIndex % 2)
                axisX->setAlignment(Qt::AlignTop);
            else
                axisX->setAlignment(Qt::AlignBottom);
            axisY = new QValueAxis();
            axisY->setLinePenColor(series->pen().color());

            if (nameIndex % 2)
                axisY->setAlignment(Qt::AlignRight);
            else
                axisY->setAlignment(Qt::AlignLeft);

            chart->setAxisX(axisX, series);
            chart->setAxisY(axisY, series);
            nameIndex++;
        }

        return chart;
    }
};

DECLARE_CHART(MultiValueAxis);