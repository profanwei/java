
var GanttDataSummary = function (gantt, options) {
    this.gantt = gantt;
    this.options = $.extend({}, this.options, options);
    this.init();
}

GanttDataSummary.prototype = {

    options: {
        rows: 1,
        rowHeight: 20,
        drawTableCell: function (e) { },
        drawGanttCell: function (e) { }
    },

    init: function () {
        var me = this,
            gantt = me.gantt,
            tableView = gantt.tableView,
            ganttView = gantt.ganttView;

        me.tableSummaryEl = $('<div class="gantt-summary"></div>').appendTo(tableView.el.parentNode);
        me.ganttSummaryEl = $('<div class="gantt-summary"></div>').appendTo(ganttView.el.parentNode);

        ganttView.on("refresh", function (e) {
            me.renderSummary();
        });

        me.doLayout();
    },

    doLayout: function () {
        var me = this,
            gantt = me.gantt,
            tableView = gantt.tableView,
            ganttView = gantt.ganttView,
            height = tableView.el.parentNode.clientHeight - me.getSummaryHeight();

        tableView.el.style.height = height + "px";
        ganttView.el.style.height = height + "px";
    },

    getSummaryHeight: function () {
        return this.options.rows * this.options.rowHeight;
    },

    renderSummary: function () {
        var me = this,
            gantt = me.gantt,
            tableView = gantt.tableView,
            ganttView = gantt.ganttView,
            rows = me.options.rows;

        function renderTable() {
            var region = tableView.viewRegion,
                startColumn = region.startColumn,
                endColumn = region.endColumn,
                columns = tableView.getColumns();

            var sb = [];

            var top = 0, height = me.options.rowHeight;

            for (var i = 0, l = rows; i < l; i++) {

                var left = 0;
                for (var j = startColumn, k = endColumn; j <= k; j++) {
                    var column = columns[j];
                    if (!column) continue;
                    var width = column.width;

                    sb[sb.length] = '<div class="gantt-summary-cell ';
                    sb[sb.length] = '" style="left:';
                    sb[sb.length] = left;
                    sb[sb.length] = 'px;top:' + top + 'px;width:';
                    sb[sb.length] = width;
                    sb[sb.length] = 'px;height:';
                    sb[sb.length] = height;
                    sb[sb.length] = 'px;';
                    sb[sb.length] = '">';

                    var e = { row: i, column: column, html: '' };
                    me.options.drawTableCell(e);

                    sb[sb.length] = e.html;
                    sb[sb.length] = '</div>';

                    left += width;
                }
                top += height;
            }

            me.tableSummaryEl.html(sb.join(''));
        }

        function renderGantt() {
            var region = ganttView.viewRegion,
                startDate = region.startDate,
                endDate = region.endDate,
                endTime = endDate.getTime(),
                bType = ganttView.bottomTimeScale.type,
                 bNumber = ganttView.bottomTimeScale.number;

            var sb = [];

            var top = 0, height = me.options.rowHeight;

            for (var i = 0, l = rows; i < l; i++) {

                var left = 0;
                for (var date = startDate; date.getTime() <= endTime; ) {
                    var next = ganttView.getTimeScaleNextDate(date, bType, bNumber);
                    var topLeft = ganttView.getOffsetByDate(date);
                    var topRight = ganttView.getOffsetByDate(next);

                    var width = topRight - topLeft;

                    var s = '<div class="gantt-summary-cell" style="left:' + left + 'px;top:' + top + 'px;width:' + width + 'px;height:' + height + 'px;">';

                    var e = { row: i, date: date, html: '' };
                    me.options.drawGanttCell(e);
                    s += e.html;

                    s += '</div>';
                    sb.push(s);

                    left += width;
                    date = next;
                }
                top += height;
            }

            me.ganttSummaryEl.html(sb.join(''));
        }

        renderTable();
        renderGantt();
    }
}