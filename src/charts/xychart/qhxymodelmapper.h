/****************************************************************************
**
** Copyright (C) 2014 Digia Plc
** All rights reserved.
** For any questions to Digia, please use contact form at http://qt.digia.com
**
** This file is part of the Qt Enterprise Charts Add-on.
**
** $QT_BEGIN_LICENSE$
** Licensees holding valid Qt Enterprise licenses may use this file in
** accordance with the Qt Enterprise License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.
**
** If you have questions regarding the use of this file, please use
** contact form at http://qt.digia.com
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QHXYMODELMAPPER_H
#define QHXYMODELMAPPER_H

#include <QtCharts/QXYModelMapper>

QT_CHARTS_BEGIN_NAMESPACE
/* Comment line for syncqt to generate the fwd-include correctly, due to QTBUG-22432 */
class QT_CHARTS_EXPORT QHXYModelMapper : public QXYModelMapper
{
    Q_OBJECT
    Q_PROPERTY(QXYSeries *series READ series WRITE setSeries NOTIFY seriesReplaced)
    Q_PROPERTY(QAbstractItemModel *model READ model WRITE setModel NOTIFY modelReplaced)
    Q_PROPERTY(int xRow READ xRow WRITE setXRow NOTIFY xRowChanged)
    Q_PROPERTY(int yRow READ yRow WRITE setYRow NOTIFY yRowChanged)
    Q_PROPERTY(int firstColumn READ firstColumn WRITE setFirstColumn NOTIFY firstColumnChanged)
    Q_PROPERTY(int columnCount READ columnCount WRITE setColumnCount NOTIFY columnCountChanged)

public:
    explicit QHXYModelMapper(QObject *parent = 0);

    QAbstractItemModel *model() const;
    void setModel(QAbstractItemModel *model);

    QXYSeries *series() const;
    void setSeries(QXYSeries *series);

    int xRow() const;
    void setXRow(int xRow);

    int yRow() const;
    void setYRow(int yRow);

    int firstColumn() const;
    void setFirstColumn(int firstColumn);

    int columnCount() const;
    void setColumnCount(int columnCount);

Q_SIGNALS:
    void seriesReplaced();
    void modelReplaced();
    void xRowChanged();
    void yRowChanged();
    void firstColumnChanged();
    void columnCountChanged();
};

QT_CHARTS_END_NAMESPACE

#endif // QHXYMODELMAPPER_H