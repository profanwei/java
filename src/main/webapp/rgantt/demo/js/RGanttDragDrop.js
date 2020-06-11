var RGanttDragDrop = function (gantt, options) {
    this.gantt = gantt;
    this.options = $.extend({}, this.options, options);
    this.init();
}

RGanttDragDrop.prototype = {

    options: {        
        el: null,
        itemSelector: '.item',
        drop: null
    },

    init: function () {
        var me = this,
            gantt = me.gantt,
            opts = me.options;

        var el = $(opts.el);

        el.bind("mousedown", function (event) {
            me.startDrag(event);
        });

    },

    startDrag: function (event) {
        var me = this,
            gantt = me.gantt,
            ganttView = gantt.ganttView,
            opts = me.options;

        var jq = $(event.target).closest(opts.itemSelector);
        if (!jq[0]) return;
        event.preventDefault();
        //var index = parseInt(jq.attr("index"));
        var index = jq.index();

        var feedback = $('<div class="mini-feedback mini-feedback-no">' + jq.html() + '</div>').appendTo('body');


        function onMouseMove(e) {

            feedback.offset({
                top: e.pageY + 10,
                left: e.pageX + 15
            });

            if ($(e.target).closest('.mini-ganttview-viewport')[0]) {
                feedback.removeClass("mini-feedback-no");
                feedback.addClass("mini-feedback-add");
            } else {
                feedback.removeClass("mini-feedback-add");
                feedback.addClass("mini-feedback-no");
            }
        }

        function onMouseUp(e) {

            $(document).unbind("mousemove", onMouseMove);
            $(document).unbind("mouseup", onMouseUp);

            feedback.remove();

            var isAdd = feedback.hasClass("mini-feedback-add");

            if (isAdd) {

                var node = ganttView.getRowByPageY(e.pageY),
                    date = ganttView.getDateByPageX(e.pageX);

                if (opts.drop) opts.drop(index, node, date);

            }
        }

        $(document).bind("mousemove", onMouseMove);
        $(document).bind("mouseup", onMouseUp);

    }

}