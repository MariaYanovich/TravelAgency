var maxHeight = 400;

$(function () {

    $(".dropdown > option").hover(function () {

        var $container = $(this),
            $list = $container.find("select"),
            $anchor = $container.find("a"),
            height = $list.height() * 1.1,       // make sure there is enough room at the bottom
            multiplier = height / maxHeight;     // needs to move faster if list is taller

        // need to save height here so it can revert on mouseout
        $container.data("origHeight", $container.height());

        // so it can retain it's rollover color all the while the dropdown is open
        $anchor.addClass("hover");

        // make sure dropdown appears directly below parent list item
        $list
            .show()
            .css({
                paddingTop: $container.data("origHeight")
            });

        // don't do any animation if list shorter than max
        if (multiplier > 1) {
            $container
                .css({
                    height: maxHeight,
                    overflow: "hidden"
                })
                .mousemove(function (e) {
                    var offset = $container.offset();
                    var relativeY = ((e.pageY - offset.top) * multiplier) - ($container.data("origHeight") * multiplier);
                    if (relativeY > $container.data("origHeight")) {
                        $list.css("top", -relativeY + $container.data("origHeight"));
                    }
                });
        }

    }, function () {

        var $el = $(this);

        // put things back to normal
        $el
            .height($(this).data("origHeight"))
            .find("option")
            .css({top: 0})
            .hide()
            .end()
            .find("a")
            .removeClass("hover");
    });
});

