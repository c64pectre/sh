# On VSCode

In the source code, we use regions, like this:

    ;region Region description

    ...

    ;endregion"

To make the regions foldable in VSCode with `Ctrl+Shift+[` and `Ctrl+Shift+]`, add the following to the
language configuration json of your CC65/CA65 extension:

    {
        "folding": {
            "markers": {
                "start": ";region",
                "end": ";endregion"
            }
        }
    }
