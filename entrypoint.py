#!/usr/bin/env python3
# -*- coding: utf-8 -*-


import os
import os.path
import sys
import shutil
import subprocess


def main():
    if len(sys.argv) <= 1:
        return

    if sys.argv[1] == "dmucs":
        cfg_dir = "/etc/dmucs"
        # We generate on if there don't have `hosts-info` file inside /etc/dmucs
        os.makedirs(cfg_dir, exist_ok=True)
        hosts_info_path = os.path.join(cfg_dir, "hosts-info")
        if not os.path.exists(hosts_info_path):
            print(
                "Not found hosts-info file in %s, copied one from default."
                % cfg_dir
            )
            shutil.copy("/etc/dmucs.conf", hosts_info_path)

    return subprocess.run(sys.argv[1:])


if __name__ == "__main__":
    sys.exit(main())
