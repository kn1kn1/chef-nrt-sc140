nrt-sc140 Cookbook
==================
[Opscode Chef](http://www.opscode.com/chef/) cookbook for [nrt-sc140](https://github.com/kn1kn1/nrt-sc140).

Requirements
------------
#### operating system
- Ubuntu

#### cookbooks
- [apt](http://community.opscode.com/cookbooks/apt)


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
