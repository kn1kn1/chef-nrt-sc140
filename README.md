nrt-sc140 Cookbook
==================
Opscode Chef cookbook for nrt-sc140.

Requirements
------------
#### operating system
- Ubuntu

#### cookbooks
- apt


Usage
-----
#### nrt-sc140::default
Just include `nrt-sc140` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nrt-sc140]"
  ]
}
```

License
-------
MIT
http://opensource.org/licenses/mit-license.php

Author
------
Kenichi Kanai
