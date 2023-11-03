#!/bin/sh

#vlan20
ip link add vlan20-shim link enX1 type macvlan mode bridge
ip addr add 10.10.20.200/32 dev vlan20-shim
ip link set vlan20-shim up
#access from host to ns1 docker
ip route add 10.10.20.21/32 dev vlan20-shim

#vlan150
ip link add vlan150-shim link enX0 type macvlan mode bridge
ip addr add 10.10.150.250/32 dev vlan150-shim
ip link set vlan150-shim up
#access from host to ntp docker
ip route add 10.10.150.252/32 dev vlan150-shim

#vlan5
ip link add vlan5-shim link enX3 type macvlan mode bridge
ip addr add 10.10.5.250/32 dev vlan5-shim
ip link set vlan5-shim up
#access from host to proxy dockers
ip route add 10.10.5.11/32 dev vlan5-shim

#Fix default route
ip route del default
ip route add default via 10.10.150.1 dev enX0 onlink
