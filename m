Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52141C85DE
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 11:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgEGJcW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 05:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgEGJcV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2020 05:32:21 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC649C061A41
        for <linux-next@vger.kernel.org>; Thu,  7 May 2020 02:32:21 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id f83so5244848qke.13
        for <linux-next@vger.kernel.org>; Thu, 07 May 2020 02:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aXYHDw4cvlFbRXqxisK7rfFissrcLXryPeAwvIZG9TU=;
        b=qsXQRtaU4Z5D38+TzQ/wLEYrcE2s5SXIiji3LpnAe0USnL/7h/9z2bE9RrUQ1EI/Kp
         k3mXLkLPV2piAJozHPhhgXpp2VMcz3METXLekwsMJQ1D4UFHRC7vY+T45P1wKVqoSu6a
         yQzZk/N5heJ7773MC6qd44jgpw7Swz7+ivwZT5g4Hpt/MFeUDnRDl8r0zDvChqWDq2Mq
         kqM+ZxZen/qOi2b3cgi7Al9wmrofL1NeOG5vYt6v2y3Y64tawf0AtUp5pgJWvakivOwf
         kfyEPTIdaIS3ikZ1I+/AiwuVI79ixDrZbCarksqqSII77RMYdrmfqh795HPnsUjg3XxC
         uZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aXYHDw4cvlFbRXqxisK7rfFissrcLXryPeAwvIZG9TU=;
        b=gA2+u8gvbrddNAs6Lnt3C1VcsAW8QNGZH5Ydp7CFGIUOLeIXnUBFIX704cQNZ2B0Ws
         tCYqZNLIWCE7FnqY0kfB15XaLOZj9bS+LvNAR+e2L4qhueCDj2jYcHoWI5Ndvod8j9P6
         BEWY8/IXgEJgYtLgssYx/RfO5eArsX+1afl6IcQ5tH5cgv16nvbFBB79Qf80djo3IzLt
         m22tJRwcWJCeoUVO5HPKNxFR2WYtrxCycZ+w1mpx5QUpb9FZ71LFFMynOrYecPRmVUkU
         OmL4ncv/OquzoSzfRmR4iYh5xq246l6p0dUzbZd50BNjhrSOygvYitTz2tyLJOjoGjpd
         PpzQ==
X-Gm-Message-State: AGi0Puba+vS0mVdhjaeEaomiuzciADAJpoN+eCxT5JRNpQhbf0dXn186
        TNwDU0W+cJy7d8Ko8JbaKG8oR8VxEBVRH1614Ky2vw==
X-Google-Smtp-Source: APiQypKoFv0SJGU156cfq3NUci5/F+axzLsWzsebeOcAzB50ArPWsJAu3jxzNleiJxXpxA7C2s3cE72ZsUp6vyMvUdA=
X-Received: by 2002:a05:620a:1362:: with SMTP id d2mr12915747qkl.256.1588843939308;
 Thu, 07 May 2020 02:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000003dc8f05a50b798e@google.com>
In-Reply-To: <00000000000003dc8f05a50b798e@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 7 May 2020 11:32:08 +0200
Message-ID: <CACT4Y+bzRtZdLSzHTp-kJZo4Qg7QctXNVEY9=kbAzfMck9XxAA@mail.gmail.com>
Subject: Re: linux-next boot error: WARNING: suspicious RCU usage in ip6mr_get_table
To:     syzbot <syzbot+761cff389b454aa387d2@syzkaller.appspotmail.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>, kuba@kernel.org,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        LKML <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 7, 2020 at 11:26 AM syzbot
<syzbot+761cff389b454aa387d2@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    6b43f715 Add linux-next specific files for 20200507
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=16f64370100000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ef9b7a80b923f328
> dashboard link: https://syzkaller.appspot.com/bug?extid=761cff389b454aa387d2
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+761cff389b454aa387d2@syzkaller.appspotmail.com


+linux-next for linux-next boot breakage

> SoftiWARP attached
> Driver 'framebuffer' was unable to register with bus_type 'coreboot' because the bus was not initialized.
> Driver 'memconsole' was unable to register with bus_type 'coreboot' because the bus was not initialized.
> Driver 'vpd' was unable to register with bus_type 'coreboot' because the bus was not initialized.
> hid: raw HID events driver (C) Jiri Kosina
> usbcore: registered new interface driver usbhid
> usbhid: USB HID core driver
> ashmem: initialized
> usbcore: registered new interface driver snd-usb-audio
> drop_monitor: Initializing network drop monitor service
> NET: Registered protocol family 26
> GACT probability on
> Mirror/redirect action on
> Simple TC action Loaded
> netem: version 1.3
> u32 classifier
>     Performance counters on
>     input device check on
>     Actions configured
> nf_conntrack_irc: failed to register helpers
> nf_conntrack_sane: failed to register helpers
> nf_conntrack_sip: failed to register helpers
> xt_time: kernel timezone is -0000
> IPVS: Registered protocols (TCP, UDP, SCTP, AH, ESP)
> IPVS: Connection hash table configured (size=4096, memory=64Kbytes)
> IPVS: ipvs loaded.
> IPVS: [rr] scheduler registered.
> IPVS: [wrr] scheduler registered.
> IPVS: [lc] scheduler registered.
> IPVS: [wlc] scheduler registered.
> IPVS: [fo] scheduler registered.
> IPVS: [ovf] scheduler registered.
> IPVS: [lblc] scheduler registered.
> IPVS: [lblcr] scheduler registered.
> IPVS: [dh] scheduler registered.
> IPVS: [sh] scheduler registered.
> IPVS: [mh] scheduler registered.
> IPVS: [sed] scheduler registered.
> IPVS: [nq] scheduler registered.
> IPVS: ftp: loaded support on port[0] = 21
> IPVS: [sip] pe registered.
> ipip: IPv4 and MPLS over IPv4 tunneling driver
> gre: GRE over IPv4 demultiplexor driver
> ip_gre: GRE over IPv4 tunneling driver
> IPv4 over IPsec tunneling driver
> ipt_CLUSTERIP: ClusterIP Version 0.8 loaded successfully
> Initializing XFRM netlink socket
> IPsec XFRM device driver
> NET: Registered protocol family 10
> =============================
> WARNING: suspicious RCU usage
> 5.7.0-rc4-next-20200507-syzkaller #0 Not tainted
> -----------------------------
> net/ipv6/ip6mr.c:124 RCU-list traversed in non-reader section!!
>
> other info that might help us debug this:
>
>
> rcu_scheduler_active = 2, debug_locks = 1
> 1 lock held by swapper/0/1:
>  #0: ffffffff8a7aae30 (pernet_ops_rwsem){+.+.}-{3:3}, at: register_pernet_subsys+0x16/0x40 net/core/net_namespace.c:1257
>
> stack backtrace:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-rc4-next-20200507-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x18f/0x20d lib/dump_stack.c:118
>  ip6mr_get_table+0x153/0x180 net/ipv6/ip6mr.c:124
>  ip6mr_new_table+0x1b/0x70 net/ipv6/ip6mr.c:382
>  ip6mr_rules_init net/ipv6/ip6mr.c:236 [inline]
>  ip6mr_net_init+0x133/0x3f0 net/ipv6/ip6mr.c:1310
>  ops_init+0xaf/0x420 net/core/net_namespace.c:151
>  __register_pernet_operations net/core/net_namespace.c:1140 [inline]
>  register_pernet_operations+0x346/0x840 net/core/net_namespace.c:1217
>  register_pernet_subsys+0x25/0x40 net/core/net_namespace.c:1258
>  ip6_mr_init+0x49/0x152 net/ipv6/ip6mr.c:1363
>  inet6_init+0x1d7/0x6dc net/ipv6/af_inet6.c:1037
>  do_one_initcall+0x10a/0x7d0 init/main.c:1159
>  do_initcall_level init/main.c:1232 [inline]
>  do_initcalls init/main.c:1248 [inline]
>  do_basic_setup init/main.c:1268 [inline]
>  kernel_init_freeable+0x501/0x5ae init/main.c:1454
>  kernel_init+0xd/0x1bb init/main.c:1359
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351
> Segment Routing with IPv6
> mip6: Mobile IPv6
> sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> ip6_gre: GRE over IPv6 tunneling driver
> NET: Registered protocol family 17
> NET: Registered protocol family 15
> Bridge firewalling registered
> NET: Registered protocol family 9
> X25: Linux Version 0.2
> NET: Registered protocol family 6
> NET: Registered protocol family 11
> NET: Registered protocol family 3
> can: controller area network core (rev 20170425 abi 9)
> NET: Registered protocol family 29
> can: raw protocol (rev 20170425)
> can: broadcast manager protocol (rev 20170425 t)
> can: netlink gateway (rev 20190810) max_hops=1
> can: SAE J1939
> Bluetooth: RFCOMM TTY layer initialized
> Bluetooth: RFCOMM socket layer initialized
> Bluetooth: RFCOMM ver 1.11
> Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> Bluetooth: BNEP filters: protocol multicast
> Bluetooth: BNEP socket layer initialized
> Bluetooth: CMTP (CAPI Emulation) ver 1.0
> Bluetooth: CMTP socket layer initialized
> Bluetooth: HIDP (Human Interface Emulation) ver 1.2
> Bluetooth: HIDP socket layer initialized
> RPC: Registered rdma transport module.
> RPC: Registered rdma backchannel transport module.
> NET: Registered protocol family 33
> Key type rxrpc registered
> Key type rxrpc_s registered
> NET: Registered protocol family 41
> lec:lane_module_init: lec.c: initialized
> mpoa:atm_mpoa_init: mpc.c: initialized
> l2tp_core: L2TP core driver, V2.0
> l2tp_ppp: PPPoL2TP kernel driver, V2.0
> l2tp_ip: L2TP IP encapsulation support (L2TPv3)
> l2tp_netlink: L2TP netlink interface
> l2tp_eth: L2TP ethernet pseudowire support (L2TPv3)
> l2tp_ip6: L2TP IP encapsulation support for IPv6 (L2TPv3)
> NET: Registered protocol family 35
> 8021q: 802.1Q VLAN Support v1.8
> DCCP: Activated CCID 2 (TCP-like)
> DCCP: Activated CCID 3 (TCP-Friendly Rate Control)
> sctp: Hash tables configured (bind 32/56)
> NET: Registered protocol family 21
> Registered RDS/infiniband transport
> Registered RDS/tcp transport
> tipc: Activated (version 2.0.0)
> NET: Registered protocol family 30
> tipc: Started in single node mode
> NET: Registered protocol family 43
> 9pnet: Installing 9P2000 support
> NET: Registered protocol family 37
> NET: Registered protocol family 36
> Key type dns_resolver registered
> Key type ceph registered
> libceph: loaded (mon/osd proto 15/24)
> batman_adv: B.A.T.M.A.N. advanced 2020.2 (compatibility version 15) loaded
> openvswitch: Open vSwitch switching datapath
> NET: Registered protocol family 40
> mpls_gso: MPLS GSO support
> IPI shorthand broadcast: enabled
> AVX2 version of gcm_enc/dec engaged.
> AES CTR mode by8 optimization enabled
> sched_clock: Marking stable (12995625706, 30506909)->(13027042353, -909738)
> registered taskstats version 1
> Loading compiled-in X.509 certificates
> Loaded X.509 cert 'Build time autogenerated kernel key: 8b22f477d966bfa6cf9a482acbda6ca1892a4acc'
> zswap: loaded using pool lzo/zbud
> debug_vm_pgtable: debug_vm_pgtable: Validating architecture page table helpers
> Key type ._fscrypt registered
> Key type .fscrypt registered
> Key type fscrypt-provisioning registered
> kAFS: Red Hat AFS client v0.1 registering.
> FS-Cache: Netfs 'afs' registered for caching
> Btrfs loaded, crc32c=crc32c-intel
> Key type big_key registered
> Key type encrypted registered
> AppArmor: AppArmor sha1 policy hashing enabled
> ima: No TPM chip found, activating TPM-bypass!
> ima: Allocated hash algorithm: sha256
> ima: No architecture policies found
> evm: Initialising EVM extended attributes:
> evm: security.selinux
> evm: security.SMACK64
> evm: security.SMACK64EXEC
> evm: security.SMACK64TRANSMUTE
> evm: security.SMACK64MMAP
> evm: security.apparmor
> evm: security.ima
> evm: security.capability
> evm: HMAC attrs: 0x1
> PM:   Magic number: 4:395:573
> usbmon usbmon13: hash matches
> tty ptyb5: hash matches
> printk: console [netcon0] enabled
> netconsole: network logging started
> gtp: GTP module loaded (pdp ctx size 104 bytes)
> rdma_rxe: loaded
> cfg80211: Loading compiled-in X.509 certificates for regulatory database
> cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> ALSA device list:
>   #0: Dummy 1
>   #1: Loopback 1
>   #2: Virtual MIDI Card 1
> md: Waiting for all devices to be available before autodetect
> md: If you don't use raid, use raid=noautodetect
> md: Autodetecting RAID arrays.
> md: autorun ...
> md: ... autorun DONE.
> EXT4-fs (sda1): mounted filesystem without journal. Opts: (null)
> VFS: Mounted root (ext4 filesystem) readonly on device 8:1.
> devtmpfs: mounted
> Freeing unused kernel image (initmem) memory: 2784K
> Kernel memory protection disabled.
> Run /sbin/init as init process
> random: systemd: uninitialized urandom read (16 bytes read)
> random: systemd: uninitialized urandom read (16 bytes read)
> random: systemd: uninitialized urandom read (16 bytes read)
> systemd[1]: systemd 232 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
> systemd[1]: Detected virtualization kvm.
> systemd[1]: Detected architecture x86-64.
> systemd[1]: Set hostname to <syzkaller>.
> systemd[1]: Listening on Journal Audit Socket.
> systemd[1]: Listening on Journal Socket (/dev/log).
> systemd[1]: Listening on Syslog Socket.
> systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
> systemd[1]: Reached target Remote File Systems.
>
> =============================
> WARNING: suspicious RCU usage
> 5.7.0-rc4-next-20200507-syzkaller #0 Not tainted
> -----------------------------
> security/integrity/evm/evm_main.c:231 RCU-list traversed in non-reader section!!
>
> other info that might help us debug this:
>
>
> rcu_scheduler_active = 2, debug_locks = 1
> 2 locks held by systemd/1:
>  #0: ffff88809867e450 (sb_writers#8){.+.+}-{0:0}, at: sb_start_write include/linux/fs.h:1663 [inline]
>  #0: ffff88809867e450 (sb_writers#8){.+.+}-{0:0}, at: mnt_want_write+0x3a/0xb0 fs/namespace.c:354
>  #1: ffff8880989712d0 (&type->i_mutex_dir_key#6){++++}-{3:3}, at: inode_lock include/linux/fs.h:799 [inline]
>  #1: ffff8880989712d0 (&type->i_mutex_dir_key#6){++++}-{3:3}, at: vfs_setxattr+0x92/0xf0 fs/xattr.c:219
>
> stack backtrace:
> CPU: 1 PID: 1 Comm: systemd Not tainted 5.7.0-rc4-next-20200507-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x18f/0x20d lib/dump_stack.c:118
>  evm_protected_xattr+0x1c2/0x210 security/integrity/evm/evm_main.c:231
>  evm_protect_xattr.isra.0+0xb6/0x3d0 security/integrity/evm/evm_main.c:318
>  evm_inode_setxattr+0xc4/0xf0 security/integrity/evm/evm_main.c:387
>  security_inode_setxattr+0x18f/0x200 security/security.c:1297
>  vfs_setxattr+0xa7/0xf0 fs/xattr.c:220
>  setxattr+0x23d/0x330 fs/xattr.c:451
>  path_setxattr+0x170/0x190 fs/xattr.c:470
>  __do_sys_setxattr fs/xattr.c:485 [inline]
>  __se_sys_setxattr fs/xattr.c:481 [inline]
>  __x64_sys_setxattr+0xc0/0x160 fs/xattr.c:481
>  do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
>  entry_SYSCALL_64_after_hwframe+0x49/0xb3
> RIP: 0033:0x7ff804be467a
> Code: 48 8b 0d 21 18 2b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 bc 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ee 17 2b 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffd6a5afa98 EFLAGS: 00000246 ORIG_RAX: 00000000000000bc
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ff804be467a
> RDX: 00007ffd6a5afb10 RSI: 0000563851e78f9b RDI: 000056385393e6c0
> RBP: 0000563851e78f9b R08: 0000000000000000 R09: 0000000000000030
> R10: 0000000000000020 R11: 0000000000000246 R12: 00007ffd6a5afb10
> R13: 0000000000000020 R14: 0000000000000000 R15: 00005638539151b0
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/00000000000003dc8f05a50b798e%40google.com.
