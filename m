Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E98C43DA90
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 06:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhJ1Ex7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 00:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhJ1Ex6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 00:53:58 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378D2C061570;
        Wed, 27 Oct 2021 21:51:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HftSK4KRmz4xcC;
        Thu, 28 Oct 2021 15:51:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635396690;
        bh=UTWg36B5vDEffQfmKLnqkOFqYOVbhel80aqwh5FxlBA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Tan7JwP711JoBRXjxXni2jvdhf0/1K02tVtTuSUJigzNNsrSmFPs69v385xZM7R5i
         7CHHtEK+OrbK/Ji+Rm3aEXKStII1WwwLBFEBxmz4wbYm0yR69uXYYN6HSOLnMrFGdV
         kYCkvY9i6h63IoI3bzcNshQS3hz5WuKh5T2Rk0nkApGZBlkvcndsYB3XSrNH//+wbZ
         CricrwciYVBMGsSDdy0+Gg3e9mHAgGZGK4FnME4ypZo+RVu/DdnF6wx0Nkt0QI0h1W
         a2PKEU8dm6YCDRb1u7FW+t5LSB3EbV4ehtFLtLvH7pNvFWJqe+FnK+rp9RjArC+uXL
         LbHT5UpZ/kLvg==
Date:   Thu, 28 Oct 2021 15:51:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Xianting Tian <xianting.tian@linux.alibaba.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: Re: linux-next: Tree for Oct 25
Message-ID: <20211028155126.0b187410@canb.auug.org.au>
In-Reply-To: <864bbf0b-e6db-1a97-80f5-a92968a4e086@linux.alibaba.com>
References: <20211025204921.73cb3011@canb.auug.org.au>
        <20211027224231.1634cc6c@canb.auug.org.au>
        <864bbf0b-e6db-1a97-80f5-a92968a4e086@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M7/p=5RB0J.7hEwLOom_CwB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M7/p=5RB0J.7hEwLOom_CwB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Xianting,

On Thu, 28 Oct 2021 09:51:00 +0800 Xianting Tian <xianting.tian@linux.aliba=
ba.com> wrote:
>
> =E5=9C=A8 2021/10/27 =E4=B8=8B=E5=8D=887:42, Stephen Rothwell =E5=86=99=
=E9=81=93:
> > Hi all,
> >
> > On Mon, 25 Oct 2021 20:49:21 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> >> There seems to be something amiss with cnosole output in today's relea=
se
> >> (at least on my ppc qemu boot tests). =20
> > The console output seems to be back today.  I assume its repair had
> > something to do with commit
> >
> >    60f41e848492 ("Revert "tty: hvc: pass DMA capable memory to put_char=
s()"")
> > =20
> hi Stephen=EF=BC=8C
>=20
> Thanks for the info, Could you share more details about the issue you met=
? is it about early console print issue?
>=20

Here is the diff between my boot logs:

@@ -33,14 +33,14 @@
=20
 Booting from memory...
 OF stdout device is: /vdevice/vty@71000000
-Preparing to boot Linux version 5.15.0-rc6 (sfr@ash) (gcc (Debian 10.3.0-1=
1) 10.3.0, GNU ld (GNU Binutils for Debian) 2.37) #2 SMP Fri Oct 22 20:04:1=
8 AEDT 2021
+Preparing to boot Linux version 5.15.0-rc7 (sfr@ash) (gcc (Debian 10.3.0-1=
1) 10.3.0, GNU ld (GNU Binutils for Debian) 2.37) #2 SMP Tue Oct 26 19:57:5=
4 AEDT 2021
 Detected machine type: 0000000000000101
 command line: =20
 Max number of cores passed to firmware: 2048 (NR_CPUS =3D 2048)
 Calling ibm,client-architecture-support... done
 memory layout at init:
   memory_limit : 0000000000000000 (16 MB aligned)
-  alloc_bottom : 0000000002020000
+  alloc_bottom : 0000000002f50000
   alloc_top    : 0000000030000000
   alloc_top_hi : 0000000080000000
   rmo_top      : 0000000030000000
@@ -50,8 +50,8 @@
 copying OF device tree...
 Building dt strings...
 Building dt structure...
-Device tree strings 0x0000000002030000 -> 0x0000000002030a77
-Device tree struct  0x0000000002040000 -> 0x0000000002050000
+Device tree strings 0x0000000002f60000 -> 0x0000000002f60a77
+Device tree struct  0x0000000002f70000 -> 0x0000000002f80000
 Quiescing Open Firmware ...
 Booting Linux via __start() @ 0x0000000000400000 ...
  hash-mmu: Page sizes from device-tree:
@@ -59,8 +59,8 @@
  hash-mmu: base_shift=3D16: shift=3D16, sllp=3D0x0110, avpnm=3D0x00000000,=
 tlbiel=3D1, penc=3D1
  Using 1TB segments
  hash-mmu: Initializing hash mmu with SLB
- Linux version 5.15.0-rc6 (sfr@ash) (gcc (Debian 10.3.0-11) 10.3.0, GNU ld=
 (GNU Binutils for Debian) 2.37) #2 SMP Fri Oct 22 20:04:18 AEDT 2021
- Found initrd at 0xc000000001e50000:0xc00000000201d70b
+ Linux version 5.15.0-rc7 (sfr@ash) (gcc (Debian 10.3.0-11) 10.3.0, GNU ld=
 (GNU Binutils for Debian) 2.37) #2 SMP Tue Oct 26 19:57:54 AEDT 2021
+ Found initrd at 0xc000000002d80000:0xc000000002f4d70b
  Using pSeries machine description
  printk: bootconsole [udbg0] enabled
  Partition configured for 1 cpus.
@@ -106,9 +106,9 @@
  Dentry cache hash table entries: 262144 (order: 5, 2097152 bytes, linear)
  Inode-cache hash table entries: 131072 (order: 4, 1048576 bytes, linear)
  mem auto-init: stack:off, heap alloc:off, heap free:off
- Memory: 1995200K/2097152K available (14208K kernel code, 3136K rwdata, 29=
44K rodata, 4992K init, 1531K bss, 101952K reserved, 0K cma-reserved)
+ Memory: 1979648K/2097152K available (14208K kernel code, 3136K rwdata, 29=
44K rodata, 4992K init, 1531K bss, 117504K reserved, 0K cma-reserved)
  SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
- ftrace: allocating 33247 entries in 13 pages
+ ftrace: allocating 33265 entries in 13 pages
  ftrace: allocated 13 pages with 3 groups
  trace event string verifier disabled
  rcu: Hierarchical RCU implementation.
@@ -124,81 +124,9 @@
  clocksource: timebase mult[1f40000] shift[24] registered
  Console: colour dummy device 80x25
  printk: console [hvc0] enabled
- printk: console [hvc0] enabled
- printk: bootconsole [udbg0] disabled
  printk: bootconsole [udbg0] disabled
- pid_max: default: 32768 minimum: 301
- Mount-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
- Mountpoint-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
- POWER8 performance monitor hardware support registered
- rcu: Hierarchical SRCU implementation.
- smp: Bringing up secondary CPUs ...
- smp: Brought up 1 node, 1 CPU
- numa: Node 0 CPUs: 0
- devtmpfs: initialized
- PCI host bridge /pci@800000020000000  ranges:
-   IO 0x0000200000000000..0x000020000000ffff -> 0x0000000000000000
-  MEM 0x0000200080000000..0x00002000ffffffff -> 0x0000000080000000=20
-  MEM 0x0000210000000000..0x000021ffffffffff -> 0x0000210000000000=20
- PCI: OF: PROBE_ONLY disabled
- clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_n=
s: 19112604462750000 ns
- futex hash table entries: 256 (order: -1, 32768 bytes, linear)
- NET: Registered PF_NETLINK/PF_ROUTE protocol family
- audit: initializing netlink subsys (disabled)
- cpuidle: using governor menu
- pstore: Registered nvram as persistent store backend
 =0DLinux ppc64le
-#2 SMP Fri Oct 2 audit: type=3D2000 audit(1634893757.210:1): state=3Diniti=
alized audit_enabled=3D0 res=3D1
- EEH: pSeries platform initialized
- software IO TLB: tearing down default memory pool
- PCI: Probing PCI hardware
- PCI host bridge to bus 0000:00
- pci_bus 0000:00: root bus resource [io  0x10000-0x1ffff] (bus address [0x=
0000-0xffff])
- pci_bus 0000:00: root bus resource [mem 0x200080000000-0x2000ffffffff] (b=
us address [0x80000000-0xffffffff])
- pci_bus 0000:00: root bus resource [mem 0x210000000000-0x21ffffffffff 64b=
it]
- pci_bus 0000:00: root bus resource [bus 00-ff]
- IOMMU table initialized, virtual merging enabled
- pci_bus 0000:00: resource 4 [io  0x10000-0x1ffff]
- pci_bus 0000:00: resource 5 [mem 0x200080000000-0x2000ffffffff]
- pci_bus 0000:00: resource 6 [mem 0x210000000000-0x21ffffffffff 64bit]
- EEH: No capable adapters found: recovery disabled.
- kprobes: kprobe jump-optimization is enabled. All kprobes are optimized i=
f possible.
- iommu: Default domain type: Translated=20
- iommu: DMA domain TLB invalidation policy: strict mode=20
- vgaarb: loaded
- SCSI subsystem initialized
- usbcore: registered new interface driver usbfs
- usbcore: registered new interface driver hub
- usbcore: registered new device driver usb
- pps_core: LinuxPPS API ver. 1 registered
- pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <gio=
metti@linux.it>
- PTP clock support registered
- clocksource: Switched to clocksource timebase
- hugetlbfs: disabling because there are no supported hugepage sizes
- NET: Registered PF_INET protocol family
- IP idents hash table entries: 32768 (order: 2, 262144 bytes, linear)
- tcp_listen_portaddr_hash hash table entries: 4096 (order: 0, 65536 bytes,=
 linear)
- TCP established hash table entries: 16384 (order: 1, 131072 bytes, linear)
- TCP bind hash table entries: 16384 (order: 2, 262144 bytes, linear)
- TCP: Hash tables configured (established 16384 bind 16384)
- UDP hash table entries: 2048 (order: 0, 65536 bytes, linear)
- UDP-Lite hash table entries: 2048 (order: 0, 65536 bytes, linear)
- NET: Registered PF_UNIX/PF_LOCAL protocol family
- RPC: Registered named UNIX socket transport module.
- RPC: Registered udp transport module.
- RPC: Registered tcp transport module.
- RPC: Registered tcp NFSv4.1 backchannel transport module.
- PCI: CLS 0 bytes, default 128
- Trying to unpack rootfs image as initramfs...
- vas: API is supported only with radix page tables
- workingset: timestamp_bits=3D38 max_order=3D15 bucket_order=3D0
- NFS: Registering the id_resolver key type
- Key type id_resolver registered
- Key type id_legacy registered
- Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
- io scheduler mq-deadline registered
- io scheduler kyber registered
- Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
+#2 SMP Tue Oct 2 Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
  Non-volatile memory driver v1.3
  Freeing initrd memory: 1792K
  brd: module loaded
@@ -230,7 +158,7 @@
  ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
  ohci-pci: OHCI PCI platform driver
  rtc-generic rtc-generic: registered as rtc0
- rtc-generic rtc-generic: setting system clock to 2021-10-22T09:09:21 UTC =
(1634893761)
+ rtc-generic rtc-generic: setting system clock to 2021-10-26T09:02:50 UTC =
(1635238970)
  i2c_dev: i2c /dev entries driver
  device-mapper: uevent: version 1.0.3
  device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised: dm-devel@red=
hat.com

--=20
Cheers,
Stephen Rothwell

--Sig_/M7/p=5RB0J.7hEwLOom_CwB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6LE4ACgkQAVBC80lX
0GyVtgf/Q/in6gIAAJS8bhWIdtR108slzEP7yvAOfHfJ2x++XpQXh4Cwhy26wsM4
engEyA6sG/K/uoN9I95GI8dnlrhZQi8xf/v65YACfc3HRKc7tqgWXgn3BExI6/Bp
xwReT7rl/mOY92ILkjQBvYxmIjZ0EwtrzDgX17EE4GTwXEwcRFkSti/M4HDHrdm4
nz8e5wPrfy/g5O65FAS9inKa95LhRZGapGWQQHI/UpN41pQXfuRknY3zOFpYNHmQ
BKRPGSY87VHfLOicBD8+mjo6s7x/V7k8Z1MoM5SgaWhuzV8TivBGfnaU8TZSNQ/V
cbQx+hdaCsUk80bXBeUiY56ua1GLbA==
=E9I4
-----END PGP SIGNATURE-----

--Sig_/M7/p=5RB0J.7hEwLOom_CwB--
