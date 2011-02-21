"============================================================================
"
" iptables-save/restore syntax highlighter
"
" Language:	   iptables-save/restore file
" Version:     1.06
" Date:        12-Jul-2008
" Maintainer:  Eric Haarbauer <ehaar{DOT}com{AT}grithix{DOT}dyndns{DOT}org>
" License:     This file is placed in the public domain.
"
"============================================================================
" Section:  Notes  {{{1
"============================================================================
"
" This vim syntax script highlights files used by Harald Welte's iptables-save
" and iptables-restore utilities.  Both utilities are part of the iptables
" application (http://www.netfilter.org/projects/iptables).
" 
" Features:
"
"   * Distinguishes commands, options, modules, targets and chains.
"   * Distinguishes numeric IP addresses from net masks.
"   * Highlights tokens that occur only in hand-edited files; for example,
"     "--append" and "destination-unreachable".
"   * Special handling for module names; for example, the tcp module is
"     colored differently from the tcp protocol.
"
" Options:
"
"   Customize the behavior of this script by setting values for the following
"   options in your .vimrc file.  (Type ":h vimrc" in vim for more information
"   on the .vimrc file.)
"
"   g:Iptables_SpecialDelimiters
"     This variable, if set to a non-zero value, distinguishes numeric
"     delimiters, including the dots in IP addresses, the slash that separates
"     an IP address from a netmask, and the colon that separates the ends of a
"     port range.  If not set, this option defaults to off.
"
" Known Issues:
"
"   * Some special argument tokens are highlighted whether or not they are
"     used with the correct option.  For example, "destination-unreachable"
"     gets special highlighting whether or not is used as an argument to the
"     --icmp-type option.  In practice, this is rarely a problem.
"
" Reporting Issues:
"
"   If you discover an iptables file that this script highlights incorrectly,
"   please email the author (address at the top of the script) with the
"   following information:
"
"     * Problem iptables file WITH ANY SENSITIVE INFORMATION REMOVED
"     * The release version of this script (see top of the script)
"     * If possible, a patch to fix the problem
"
" Design Notes:
"
"   Part of this script is autogenerated from the output of the iptables man
"   page.  The source code for generating the script is available from the
"   author on request (see email address at the top of the script).  The
"   script should build from source on most Linux systems with iptables
"   installed.
"
"   The build system that generates this script strips special CVS tokens
"   (like "Id:") so that CVS no longer recognizes them.  This allows users to
"   place the script in their own version control system without losing
"   information.  The author encourages other vim script developers to adopt a
"   similar approach in their own scripts.
"
" Installation:
"
"   Put this file in your user runtime syntax directory, usually ~/.vim/syntax
"   in *NIX or C:\Program Files\vim\vimfiles\syntax in Windows.  Type ":h
"   syn-files" from within vim for more information.
"
"   The iptables-save and iptables-restore applications do not specify a
"   naming standard for the files they use.  However, iptables-save places a
"   comment in the first line of its output.  Other applications, such as
"   Fedora Core's system-config-securitylevel use the iptables-save/restore
"   format, but with a different leading comment.  We can use these leading
"   comments to identify the filetype by placing the following code in the
"   scripts.vim file in your user runtime directory:
"   
"      if getline(1) =~ "^# Generated by iptables-save" ||
"       \ getline(1) =~ "^# Firewall configuration written by"
"          setfiletype iptables
"          set commentstring=#%s
"          finish
"      endif
"
"   Setting the commentstring on line 4 allows Meikel Brandmeyer's
"   EnhancedCommentify script (vimscript #23) to work with iptables files.
"   (Advanced users may want to set the commentstring option in an ftplugin
"   file or in autocommands defined in .vimrc.)
"
"============================================================================
" Source File: Id: iptables.src.vim 38 2007-06-23 12:47:16Z ehaar 
"============================================================================
" Section:  Initialization  {{{1
"============================================================================

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'iptables'
endif

" Don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ IptablesHiLink highlight link <args>
else
  command! -nargs=+ IptablesHiLink highlight default link <args>
endif

syntax case match

if version < 600
    set iskeyword+=-
else
    setlocal iskeyword+=-
endif

" Initialize global public variables:  {{{2

" Support deprecated variable name used prior to release 1.07.
if exists("g:iptablesSpecialDelimiters") &&
\ !exists("g:Iptables_SpecialDelimiters")

    let   g:Iptables_SpecialDelimiters = g:iptablesSpecialDelimiters
    unlet g:iptablesSpecialDelimiters
    " echohl WarningMsg | echo "Warning:" | echohl None
    " echo "The g:iptablesSpecialDelimiters variable is deprecated."
    " echo "Please use g:Iptables_SpecialDelimiters in your .vimrc instead"

endif

if exists("g:Iptables_SpecialDelimiters")
    let s:Iptables_SpecialDelimiters = g:Iptables_SpecialDelimiters
else
    let s:Iptables_SpecialDelimiters = 0
endif

"============================================================================
" Section:  Group Definitions  {{{1
"============================================================================

syntax keyword iptablesSaveDirective COMMIT
syntax match   iptablesSaveOperation "^[:*]"

syntax keyword iptablesTable filter nat mangle raw

syntax keyword iptablesTarget
    \ ACCEPT DROP QUEUE RETURN BALANCE CLASSIFY CLUSTERIP CONNMARK
    \ CONNSECMARK CONNTRACK DNAT DSCP ECN IPMARK IPV4OPSSTRIP LOG
    \ MARK MASQUERADE MIRROR NETMAP NFQUEUE NOTRACK REDIRECT REJECT
    \ ROUTE SAME SECMARK SET SNAT TARPIT TCPMSS TOS TRACE TTL ULOG XOR

syntax keyword iptablesBuiltinChain
    \ INPUT OUTPUT FORWARD PREROUTING POSTROUTING

syntax keyword iptablesCommand -A -D -I -R -L -F -Z -N -X -P -E
    \ --append --delete --insert --replace --list --flush --zero
    \ --new-chain --delete-chain --policy --rename-chain

syntax keyword iptablesParam   -p -s -d -j -i -o -f -c -t

syntax match iptablesOperator "\s\zs!\ze\s"

syntax keyword iptablesModuleName contained
    \ account addrtype ah childlevel comment condition connbytes connlimit
    \ connmark connrate conntrack dccp dscp dstlimit ecn esp fuzzy hashlimit
    \ helper icmp iprange ipv4options length limit mac mark mport multiport
    \ nth osf owner physdev pkttype policy psd quota random realm recent
    \ sctp set state string tcp tcpmss time tos ttl u32 udp unclean

syntax keyword iptablesModuleType
    \ UNSPEC UNICAST LOCAL BROADCAST ANYCAST MULTICAST BLACKHOLE UNREACHABLE
    \ PROHIBIT THROW NAT XRESOLVE INVALID ESTABLISHED NEW RELATED SYN ACK FIN
    \ RST URG PSH ALL NONE

" From --reject-with option
syntax keyword iptablesModuleType
    \ icmp-net-unreachable
    \ icmp-host-unreachable
    \ icmp-port-unreachable
    \ icmp-proto-unreachable
    \ icmp-net-prohibited
    \ icmp-host-prohibited
    \ icmp-admin-prohibited

" From --icmp-type option
syntax keyword iptablesModuleType
    \ any
    \ echo-reply
    \ destination-unreachable
    \    network-unreachable
    \    host-unreachable
    \    protocol-unreachable
    \    port-unreachable
    \    fragmentation-needed
    \    source-route-failed
    \    network-unknown
    \    host-unknown
    \    network-prohibited
    \    host-prohibited
    \    TOS-network-unreachable
    \    TOS-host-unreachable
    \    communication-prohibited
    \    host-precedence-violation
    \    precedence-cutoff
    \ source-quench
    \ redirect
    \    network-redirect
    \    host-redirect
    \    TOS-network-redirect
    \    TOS-host-redirect
    \ echo-request
    \ router-advertisement
    \ router-solicitation
    \ time-exceeded
    \    ttl-zero-during-transit
    \    ttl-zero-during-reassembly
    \ parameter-problem
    \    ip-header-bad
    \    required-option-missing
    \ timestamp-request
    \ timestamp-reply
    \ address-mask-request
    \ address-mask-reply

" If we used a keyword for this, port names would be colored the same
" as modules with the same name (e.g. tcp, udp, icmp).
syntax keyword iptablesParam -m --match skipwhite nextgroup=iptablesModuleName

syntax region iptablesString start=+"+ skip=+\\"+ end=+"+ oneline

syntax match  iptablesComment    "^#.*" contains=iptablesTodo
syntax match  iptablesBadComment "^\s\+\zs#.*" " Pound must be in first column

syntax keyword iptablesTodo contained TODO FIXME XXX NOT NOTE

" Special Delimiters: {{{2

if s:Iptables_SpecialDelimiters != 0
    syntax match iptablesNumber    "\<[0-9./:]\+\>"
        \ contains=iptablesMask,iptablesDelimiter
    syntax match iptablesDelimiter "[./:]"     contained
    syntax match iptablesMask      "/[0-9.]\+" contained 
        \ contains=iptablesDelimiter
else " s:Iptables_SpecialDelimiters == 0
    syntax match iptablesNumber    "\<[0-9./]\+\>"
        \ contains=iptablesMask,iptablesDelimiter
    syntax match iptablesDelimiter "/"         contained
    syntax match iptablesMask      "/[0-9.]\+" contained 
        \ contains=iptablesDelimiter
endif

"============================================================================
" Section:  Autogenerated Groups  {{{2
"============================================================================

" Begin autogenerated section.
" iptables2vim: "iptables2vim 40 2008-07-13 02:21:40Z ehaar"
" iptables:     "iptables v1.4.1.1"

syntax keyword iptablesLongParam
   \ --xor-tos --xor-mark --weekdays --verbose --utc --update 
   \ --ulog-qthreshold --ulog-prefix --ulog-nlgroup --ulog-cprange 
   \ --uid-owner --u --tunnel-src --tunnel-dst --ttl-set --ttl-lt --ttl-inc 
   \ --ttl-gt --ttl-eq --ttl-dec --total-nodes --tos --to-source --to-ports 
   \ --to-destination --to- --to --timestop --timestart --tcp-option 
   \ --tcp-flags --tcp- --table --syn --strip-options --string --strict 
   \ --state --src-type --src-range --src --sports --sport --spi 
   \ --source-ports --source-port --source --socket-exists --set-xmark 
   \ --set-tos --set-mss --set-mark --set-dscp-class --set-dscp 
   \ --set-counters --set-class --set --selctx --seconds --save-mark --save 
   \ --rttl --restore-mark --restore --reqid --remove --reject-with --realm 
   \ --rcheck --rateest-name --rateest-interval --rateest-ewmalog --random 
   \ --quota --queue-num --protocol --proto --probability --ports --pol 
   \ --pkt-type --physdev-out --physdev-is-out --physdev-is-in 
   \ --physdev-is-bridged --physdev-in --packet --out-interface --or-tos 
   \ --or-mark --numeric --nodst --nflog-threshold --nflog-range 
   \ --nflog-prefix --nflog-group --next --new --name --mss --monthdays 
   \ --modprobe --mode --mark --mac-source --log-uid --log-tcp-sequence 
   \ --log-tcp-options --log-prefix --log-level --log-ip-options --localtz 
   \ --local-node --line-numbers --limit-iface-out --limit-iface-in 
   \ --limit-burst --limit --length --jump --in-interface --icmp-type 
   \ --hitcount --hex-string --helper --help --hashmode --hashlimit-upto 
   \ --hashlimit-srcmask --hashlimit-src- --hashlimit-name --hashlimit-mode 
   \ --hashlimit-htable-size --hashlimit-htable-max 
   \ --hashlimit-htable-gcinterval --hashlimit-htable-expire 
   \ --hashlimit-dstmask --hashlimit-burst --hashlimit-above --hash-init 
   \ --goto --gid-owner --from --fragment --exact --every --espspi 
   \ --ecn-tcp-remove --ecn-tcp-ece --ecn-tcp-cwr --ecn-ip-ect --dst-type 
   \ --dst-range --dst --dscp-class --dscp --dports --dport --dir 
   \ --destination-ports --destination-port --destination --del-set 
   \ --dccp-types --dccp-option --datestop --datestart --ctstatus --ctstate 
   \ --ctreplsrcport --ctreplsrc --ctrepldstport --ctrepldst --ctproto 
   \ --ctorigsrcport --ctorigsrc --ctorigdstport --ctorigdst --ctexpire 
   \ --ctdir --connlimit-mask --connlimit-above --connbytes-mode 
   \ --connbytes-dir --connbytes --comment --clustermac --clamp-mss-to-pmtu 
   \ --chunk-types --and-tos --and-mark --algo --ahspi --add-set
" End autogenerated section.

"============================================================================
" Section:  Group Linking  {{{1
"============================================================================

IptablesHiLink iptablesSaveDirective PreProc
IptablesHiLink iptablesSaveOperation PreProc

IptablesHiLink iptablesTable         Statement
IptablesHiLink iptablesTarget        Statement
IptablesHiLink iptablesBuiltinChain  Type

IptablesHiLink iptablesCommand       Operator

IptablesHiLink iptablesModuleName    Type
IptablesHiLink iptablesModuleType    Type

IptablesHiLink iptablesOperator      Operator
IptablesHiLink iptablesParam         Identifier
IptablesHiLink iptablesLongParam     Identifier

IptablesHiLink iptablesNumber        Constant

if s:Iptables_SpecialDelimiters != 0
    IptablesHiLink iptablesMask      PreProc
    IptablesHiLink iptablesDelimiter Delimiter
else " s:Iptables_SpecialDelimiters == 0 
    IptablesHiLink iptablesMask      Special
    IptablesHiLink iptablesDelimiter None
endif

IptablesHiLink iptablesString        Constant

IptablesHiLink iptablesComment       Comment
IptablesHiLink iptablesBadComment    Error
IptablesHiLink iptablesTodo          Todo   

"============================================================================
" Section:  Clean Up    {{{1
"============================================================================

delcommand IptablesHiLink

let b:current_syntax = "iptables"

if main_syntax == 'iptables'
  unlet main_syntax
endif

" Autoconfigure vim indentation settings
" vim:ts=4:sw=4:sts=4:fdm=marker:iskeyword+=-