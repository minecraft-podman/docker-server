"""
Assemble a minecraft server from the given build args.

Not really meant to be used outside of the build
"""
import sys
sys.path.append(str(p".".resolve()))

from sys import exit
from utils import get_versions_data

if 'eula' not in ${...}:
    exit("Must accept EULA at https://account.mojang.com/documents/minecraft_eula")

p"/mc".mkdir()

p"/mc/eula.txt".write_text("""
# Generated by assemble.xsh
eula=TRUE
""")

if $version.lower() == 'latest':
    version_num = get_versions_data()['latest']['release']
elif $version.lower() == 'snapshot':
    version_num = get_versions_data()['latest']['snapshot']
else:
    version_num = $version

if not pf"build-{$type}.xsh".exists():
    exit(f"Unknown server type {$type}")

source build-$type.xsh
