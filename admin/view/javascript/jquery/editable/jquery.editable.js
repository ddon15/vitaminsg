(function ($) {
    $.fn.editable = function (options) {
        var defaults = {
            beforeEdit: null,
            onEdit: null,
            onSubmit: null,
            onCancel: null,
            editClass: null,
            submit: null,
            cancel: null,
            type: "text",
            submitBy: "blur",
            editBy: "click",
            options: null,
            name: null,
        };
        if (options == "disable") {
            return this.unbind(this.data("editable.options").editBy, this.data("editable.options").toEditable)
        }
        if (options == "enable") {
            return this.bind(this.data("editable.options").editBy, this.data("editable.options").toEditable)
        }
        if (options == "destroy") {
            this.next('input[type=hidden]').remove();
            return this.unbind(this.data("editable.options").editBy, this.data("editable.options").toEditable).data("editable.previous", null).data("editable.current", null).data("editable.options", null)
        }
        if (this.data("editable.options")) {
            return;
        }
        var options = $.extend(defaults, options);

        _this = this;

        $("<input/>").attr("type", "hidden").attr("name", options.name).attr("value", (_this.attr('data-selected') ? _this.attr('data-selected') : "")).insertAfter(_this);

        (options.type == 'select') && options.options && $.each(options.options, function (key, value) {
            if (_this.attr('data-selected') == '' || _this.attr('data-selected') == key) {
                _this.next('input[type=hidden]').val(key);
                return _this.html(value) && false;
            }
        });

        if ((options.type == 'select') && !options.options && _this.attr('data-selected')) {
            _this.next('input[type=hidden]').val(_this.attr('data-selected'));
        }

        options.toEditable = function () {
            $this = $(this);
            $this.data("editable.current", $this.html());
            opts = $this.data("editable.options");
            if ($.isFunction(opts.beforeEdit)) {
                opts.beforeEdit.apply($this, [])
            }
            if (opts.type == 'select') {
                $this.data("editable.current_val", $this.attr('data-selected'));
            }
            $.editableFactory[opts.type].toEditable($this.empty(), opts);
            $this.data("editable.previous", $this.data("editable.current")).children().focus().addClass(opts.editClass);
            if (opts.submit) {
                $(opts.submit).appendTo($this).one("mouseup", function () {
                    opts.toNonEditable($(this).parent(), true)
                })
            } else {
                $this.one(opts.submitBy, function () {
                    opts.toNonEditable($(this), true)
                }).children().one(opts.submitBy, function () {
                    opts.toNonEditable($(this).parent(), true)
                })
            } if (opts.cancel) {
                $(opts.cancel).appendTo($this).one("mouseup", function () {
                    opts.toNonEditable($(this).parent(), false)
                })
            }
            if ($.isFunction(opts.onEdit)) {
                opts.onEdit.apply($this, [{
                    current: $this.data("editable.current"),
                    previous: $this.data("editable.previous")
                }])
            }
        };
        options.toNonEditable = function ($this, change) {
            opts = $this.data("editable.options");
            if (opts.type == 'select') {
                $this.data("editable.current_val", $.editableFactory[opts.type].getVal($this, opts));
            }
            $this.one(opts.editBy, opts.toEditable).data("editable.current", change ? $.editableFactory[opts.type].getValue($this, opts) : $this.data("editable.current")).html(opts.type == "password" ? "*****" : $this.data("editable.current"));
            var func = null;
            if ($.isFunction(opts.onSubmit) && change == true) {
                func = opts.onSubmit
            } else {
                if ($.isFunction(opts.onCancel) && change == false) {
                    func = opts.onCancel
                }
            } if (func != null) {
                func.apply($this, [{
                    current: $this.data("editable.current"),
                    previous: $this.data("editable.previous"),
                    current_val: $this.data("editable.current_val")
                }])
            }
        };
        this.data("editable.options", options);
        return this.one(options.editBy, options.toEditable)
    };
    $.editableFactory = {
        text: {
            toEditable: function ($this, options) {
                if (options.editClass == 'date') {
                    $("<input/>").attr('size', 10).appendTo($this).val($this.data("editable.current"))
                } else {
                    $("<input/>").appendTo($this).val($this.data("editable.current"))
                }
            },
            getValue: function ($this, options) {
                return $this.children().val()
            }
        },
        password: {
            toEditable: function ($this, options) {
                $this.data("editable.current", $this.data("editable.password"));
                $this.data("editable.previous", $this.data("editable.password"));
                $('<input type="password"/>').appendTo($this).val($this.data("editable.current"))
            },
            getValue: function ($this, options) {
                $this.data("editable.password", $this.children().val());
                return $this.children().val()
            }
        },
        textarea: {
            toEditable: function ($this, options) {
                $("<textarea/>").appendTo($this).val($this.data("editable.current"))
            },
            getValue: function ($this, options) {
                return $this.children().val()
            }
        },
        select: {
            toEditable: function ($this, options) {
                $select = $("<select/>").appendTo($this);
                $optgroup = null;
                $.each(options.options, function (key, value) {
                    if (value == 'optgroup_open') {
                        $optgroup = $("<optgroup/>").appendTo($select).attr("label", key)
                    } else if (value == 'optgroup_close') {
                        $optgroup = null;
                    } else {
                        if ($optgroup) {
                            $("<option/>").appendTo($optgroup).html(value).attr("value", key)
                        } else {
                            $("<option/>").appendTo($select).html(value).attr("value", key)
                        }
                    }
                });
                $select.find('option').each(function () {
                    var opt = $(this);
                    if (opt.text() == $this.data("editable.current")) {
                        return opt.attr("selected", "selected").text()
                    }
                    if (opt.attr('data-selected') && opt.attr('data-selected') == $this.data("editable.current_val")) {
                        return opt.attr("selected", "selected").text()
                    }
                })
            },
            getValue: function ($this, options) {
                var item = null;
                $("select option:selected", $this).each(function () {
                    return item = $(this).text()
                });
                return item
            },
            getVal: function ($this, options) {
                var item = null;
                $("select option:selected", $this).each(function () {
                    return item = $(this).val()
                });
                return item
            }
        }
    }
})(jQuery);