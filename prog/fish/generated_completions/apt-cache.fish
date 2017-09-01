# apt-cache
# Autogenerated from man page /data/data/com.termux/files/usr/share/man/man8/apt-cache.8
complete -c apt-cache -s p -l pkg-cache --description 'Select the file to store the package cache.'
complete -c apt-cache -s s -l src-cache --description 'Select the file to store the source cache.'
complete -c apt-cache -s q -l quiet --description 'Quiet; produces output suitable for logging, omitting progress indicators.'
complete -c apt-cache -s i -l important --description 'Print only important dependencies; for use with unmet and depends.'
complete -c apt-cache -l no-pre-depends -l no-depends -l no-recommends -l no-suggests -l no-conflicts -l no-breaks -l no-replaces -l no-enhances --description 'Per default the depends and rdepends print all dependencies.'
complete -c apt-cache -l implicit --description 'Per default depends and rdepends print only dependencies explicitly expressed…'
complete -c apt-cache -s f -l full --description 'Print full package records when searching.'
complete -c apt-cache -s a -l all-versions --description 'Print full records for all available versions.'
complete -c apt-cache -s g -l generate --description 'Perform automatic package cache regeneration, rather than use the cache as it…'
complete -c apt-cache -l names-only -s n --description 'Only search on the package and provided package names, not the long descripti…'
complete -c apt-cache -l all-names --description 'Make pkgnames print all names, including virtual packages and missing depende…'
complete -c apt-cache -l recurse --description 'Make depends and rdepends recursive so that all packages mentioned are printe…'
complete -c apt-cache -l installed --description 'Limit the output of depends and rdepends to packages which are currently inst…'
complete -c apt-cache -s h -l help --description 'Show a short usage summary.'
complete -c apt-cache -s v -l version --description 'Show the program version.'
complete -c apt-cache -s c -l config-file --description 'Configuration File; Specify a configuration file to use.'
complete -c apt-cache -s o -l option --description 'Set a Configuration Option; This will set an arbitrary configuration option.'
complete -c apt-cache -l only-source --description 'to display only source package names.  dump.'
complete -c apt-cache -o f- -l no-f --description '.'
complete -c apt-cache -l 'no-all-versions.' --description '.'
complete -c apt-cache -l no-all-versions --description 'is specified, only the candidate version will be displayed (the one which wou…'
complete -c apt-cache -l 'no-generate.' --description 'APT::Cache::Generate.'

