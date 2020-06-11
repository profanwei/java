
var GanttSummary = function (gantt) {
    this.gantt = gantt;
    this.init();
}

GanttSummary.prototype = {
    init: function () {
        var me = this,
            gantt = me.gantt,
            ganttView = gantt.ganttView;

        gantt.autoWrapItem = false;

        var container = $(ganttView.el).find(".mini-ganttview-viewport");

        function renderSummarys() {
            var region = ganttView.viewRegion;
            var startRow = region.startRow, endRow = region.endRow;
            var viewBox = ganttView.getViewportBounds(region);
            var rowHeight = gantt.rowHeight;
            var data = ganttView.getVisibleRows();

            var topOffset = region.yOffset - region.topOffset;

            container.find(".summaryblock").remove();
            //alert(JSON.stringify(region));
            var html = '';
            for (var i = startRow, l = endRow; i <= l; i++) {
                var record = data[i];
                if (!record || !record.Summary) continue;
                var start = record.Summary.Start,
                    finish = record.Summary.Finish;

                if (!mini.isDate(start) || !mini.isDate(finish)) {
                    continue;
                }

                var left = ganttView.getOffsetByDate(start) - viewBox.left - 1;
                var right = ganttView.getOffsetByDate(finish) - viewBox.left - 1;
                var width = right - left;
                var height = rowHeight - 3;

                var item = record.Tasks[0];
                if (!item) continue;
                var top = ganttView.getItemTop(item) - viewBox.top  + topOffset;

                html += '<div class="summaryblock" style="position:absolute;left:' + left + 'px;top:' + top + 'px;width:' + width + 'px;height:' + height + 'px;border:solid 1px red;overflow:hidden;z-index:10;"></div>';
            }

            container.append(html);

            /////////////////////////////////////////////////////////////////////////


            container.find(".mini-gantt-item").each(function () {
                var el = $(this);
                var event = { target: this };
                var item = ganttView.getItemByEvent(event);
                //alert(item.Name);
                if (!item) return;
                var node = gantt.getOwnerNode(item);
                if (!node.Summary) return;
                var start = node.Summary.Start,
                    finish = node.Summary.Finish;
                if (!start || !finish) return;

                if (start <= item.Start && item.Finish <= finish) return;

                el.addClass("mini-gantt-item-noborder");
                var border1 = $('<div class="mini-gantt-item-border1"></div>').appendTo(el);
                var border2 = $('<div class="mini-gantt-item-border2"></div>').appendTo(el);

                var width = parseInt(el.css("width"));
                if (item.Finish < start || item.Start > finish) {
                    border1.hide();
                } else if (item.Start < start && item.Finish > start) {
                    //border1.hide();
                    border1.css("border-left", 0);
                    border2.css("border-right", 0);
                    var time = item.Finish - item.Start,
                        time2 = start - item.Start;
                    var leftWidth = time2 / time * width;
                    border2.css("width", leftWidth + "px");
                    border1.css("width", width - leftWidth + "px");
                } else {
                    //border1.hide();
                    border1.css("border-right", 0);
                    border2.css("border-left", 0);
                    border1.css({ left: "-1px", right: 'auto' });
                    border2.css({ left: "auto", right: '-1px' });
                    var time = item.Finish - item.Start,
                        time2 = finish - item.Start;
                    var leftWidth = time2 / time * width;
                    border1.css("width", leftWidth + "px");
                    border2.css("width", width - leftWidth + "px");
                }


            });

        }

        ganttView.on("refresh", function (e) {
            renderSummarys();
        });

    }
}