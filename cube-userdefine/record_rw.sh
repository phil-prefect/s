#!/bin/sh
killall -9 envset_proc
rm -f instance/server/aspect_policy.cfg
rm -f instance/user2/aspect_policy.cfg
yes|cp instance/server/plugin_config.cfg.record instance/server/plugin_config.cfg
yes|cp instance/server/sys_config.cfg.record instance/server/sys_config.cfg
yes|cp instance/server/router_policy.cfg.record instance/server/router_policy.cfg

yes|cp instance/user2/sys_config.cfg.record instance/user/sys_config.cfg
yes|cp instance/user2/router_policy.cfg.record instance/user/router_policy.cfg
sleep 1

sh run_cube.sh exec_def/_user_server.def &
sleep 1
sh run_cube.sh exec_def/_user2_client.def login.msg write.msg read.msg
