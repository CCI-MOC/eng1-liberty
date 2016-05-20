This module contains puppitizations of workarounds for various issues we've hit.

The individual classes and resources have more detail, but here is a summary:

* `disable_lro` -- Disables LRO on `em*`, which interacts badly with ovs.
* `install_package` -- install an RPM manually
