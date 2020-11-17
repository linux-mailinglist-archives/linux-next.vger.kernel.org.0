Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7B32B5A0E
	for <lists+linux-next@lfdr.de>; Tue, 17 Nov 2020 08:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgKQHGg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Nov 2020 02:06:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33645 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726561AbgKQHGf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Nov 2020 02:06:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZxnM29hmz9sPB;
        Tue, 17 Nov 2020 18:06:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605596792;
        bh=9/gzkTGLo0kGzlZyg0znQBuGuJtHgcDl4K7Sq11bpXM=;
        h=Date:From:To:Cc:Subject:From;
        b=A1XM4mP2dajV3JIh1vnVK71uoFiVQL3cORtgasDPMFLb7eU8SEJKqrC97Azm9yOpZ
         xFnNQHs0zb3IFno9UX1pvY0WF0k+mFDl58VcgCYk3ua5GCpjRkHLp5TmH3+pQKqPzk
         k9zG/tbVDAcfE3tYputGilXwBZLyU+6hK7X9y/c6nl/SaUN5wX02QXmIgNdfMVk2nU
         OgA+Qt0cNX6EB9y3cblD9uBwKQ/0tBJlUbtmCKeoTzQ+cxMDI4ijxyHT8tyd5FupWU
         xJoUuS1ZKo7vGCKzneRMWmfQwRJM/tq3Bn1xsujgf0r+3idSCdKvgf7CIgPks6UkP/
         9T4QJ8TBoCaDw==
Date:   Tue, 17 Nov 2020 18:06:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>, Hui Su <sh_def@163.com>
Subject: linux-next: boot failure in next-20201117
Message-ID: <20201117180626.30f65fd1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NXxBjr0dwG+K8g3=gCd5pLX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NXxBjr0dwG+K8g3=gCd5pLX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

My qemu boot tests failed this evening with the following logs:

    0.021080    T0 Mount-cache hash table entries: 8192 (order: 0, 65536 by=
tes, linear)
    0.021201    T0 Mountpoint-cache hash table entries: 8192 (order: 0, 655=
36 bytes, linear)
    0.030154    T0 ------------ cut here ------------
    0.031403    T0 WARNING: CPU: 0 PID: 0 at mm/slub.c:2574 ___slab_alloc+0=
x2f8/0x7b0
    0.031500    T0 Modules linked in:
    0.032048    T0 CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.0-rc4 #2
    0.032244    T0 NIP:  c00000000041aec8 LR: c00000000041d7b0 CTR: c000000=
00037fd00
    0.032367    T0 REGS: c0000000013b36d0 TRAP: 0700   Not tainted  (5.10.0=
-rc4)
    0.032435    T0 MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 4=
4022222  XER: 00000000
    0.032822    T0 CFAR: c00000000041ac28 IRQMASK: 1=20
    0.032822    T0 GPR00: c00000000041d7b0 c0000000013b3960 c0000000013b7d0=
0 c00000000601c200=20
    0.032822    T0 GPR04: 0000000000000dc0 ffffffffffffffff c00000000037fd2=
c c00000007fc99db0=20
    0.032822    T0 GPR08: 000000007eb20000 c0000000003801c0 000000000000000=
0 0000000000000010=20
    0.032822    T0 GPR12: 0000000024000222 c0000000015b0000 000000000000000=
0 00000000012b2958=20
    0.032822    T0 GPR16: 00000000012b2c70 00000000012b2a88 000000000000000=
0 0000000001368548=20
    0.032822    T0 GPR20: 0000000000000100 c00000000135c800 0000000001b9000=
8 0000000000000000=20
    0.032822    T0 GPR24: c00000000601c2b8 ffffffffffffffff c00000000037fd2=
c 0000000000000dc0=20
    0.032822    T0 GPR28: c00000007fc99db0 c00000000601c200 0000000000000dc=
0 0000000000000000=20
    0.033698    T0 NIP c00000000041aec8 ___slab_alloc+0x2f8/0x7b0
    0.033829    T0 LR c00000000041d7b0 kmem_cache_alloc+0x3c0/0x440
    0.034032    T0 Call Trace:
    0.034464    T0 c0000000013b3960 00000000000026af 0x26af (unreliable)
    0.034670    T0 c0000000013b3a30 c00000000041d7b0 kmem_cache_alloc+0x3c0=
/0x440
    0.034767    T0 c0000000013b3aa0 c00000000037fd2c shmem_alloc_inode+0x2c=
/0x50
    0.034841    T0 c0000000013b3ac0 c000000000488a08 alloc_inode+0x48/0x150
    0.034913    T0 c0000000013b3b00 c0000000004894b0 new_inode+0x30/0x140
    0.034986    T0 c0000000013b3b40 c000000000386a74 shmem_get_inode+0xc4/0=
x5b0
    0.035059    T0 c0000000013b3bf0 c00000000038765c shmem_fill_super+0x19c=
/0x2f0
    0.035134    T0 c0000000013b3c30 c000000000460db4 get_tree_nodev+0xb4/0x=
130
    0.035207    T0 c0000000013b3c70 c00000000037f788 shmem_get_tree+0x28/0x=
40
    0.035285    T0 c0000000013b3c90 c00000000045dfb8 vfs_get_tree+0x48/0x120
    0.035357    T0 c0000000013b3d00 c0000000004935e0 vfs_kern_mount.part.0+=
0xd0/0x130
    0.035427    T0 c0000000013b3d40 c000000000493704 kern_mount+0x34/0x70
    0.035592    T0 c0000000013b3d60 c000000001041620 shmem_init+0x8c/0x174
    0.035670    T0 c0000000013b3dd0 c00000000104c500 mnt_init+0x184/0x2fc
    0.035745    T0 c0000000013b3e70 c00000000104bfa4 vfs_caches_init+0x110/=
0x138
    0.035819    T0 c0000000013b3ef0 c000000001014294 start_kernel+0x67c/0x7=
20
    0.035898    T0 c0000000013b3f90 c00000000000cb88 start_here_common+0x1c=
/0x614
    0.036095    T0 Instruction dump:
    0.036261    T0 7a5207e0 7f1dc214 2d890000 eaad0968 ebfc0018 2c3f0000 40=
820498 e93d0048=20
    0.036426    T0 2c290000 41820014 2c140000 4182000c <0fe00000> 60420000 =
41920140 e8980008=20
    0.037330    T0 --- end trace 5025492be6dd1f87 ---
    0.091826    T1 POWER8 performance monitor hardware support registered
    0.093359    T1 rcu: Hierarchical SRCU implementation.

So the WARN_ON is

	WARN_ON_ONCE(s->ctor && (flags & __GFP_ZERO));

in new_slab_objects().

	...

    2.359086    T1 Run /init as init process
    2.622483   T52 mount (52) used greatest stack depth: 12560 bytes left
    2.826397   T54 mount (54) used greatest stack depth: 12464 bytes left
Starting logging: OK
Initializing random number generator...     3.518701   T69 cat (69) used gr=
eatest stack depth: 12192 bytes left
    3.554960   T70 BUG: Kernel NULL pointer dereference on write at 0x00000=
008
    3.555090   T70 Faulting instruction address: 0xc0000000003a63ac
    3.555600   T70 Oops: Kernel access of bad area, sig: 11 #1
    3.555723   T70 LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pS=
eries
    3.555827   T70 Modules linked in:
    3.555987   T70 CPU: 0 PID: 70 Comm: rm Tainted: G        W         5.10=
.0-rc4 #2
    3.556052   T70 NIP:  c0000000003a63ac LR: c0000000003a637c CTR: c000000=
000486d10
    3.556122   T70 REGS: c0000000083539e0 TRAP: 0300   Tainted: G        W =
         (5.10.0-rc4)
    3.556183   T70 MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 22000=
442  XER: 20000000
    3.556338   T70 CFAR: c0000000000101c0 DAR: 0000000000000008 DSISR: 4200=
0000 IRQMASK: 0=20
    3.556338   T70 GPR00: c0000000003a637c c000000008353c70 c0000000013b7d0=
0 0000000000000000=20
    3.556338   T70 GPR04: c000000006ea68f8 0000000000000064 000000140000000=
0 0000000000000000=20
    3.556338   T70 GPR08: 0000000000000000 c0000000015b0000 000000000000000=
0 c0000000074bac80=20
    3.556338   T70 GPR12: c000000000486d10 c0000000015b0000 000000000000000=
0 0000000000000000=20
    3.556338   T70 GPR16: 0000000000000000 0000000000000000 000000000000000=
0 0000000000000000=20
    3.556338   T70 GPR20: 0000000000000000 0000000000000000 c000000006ea680=
8 0000000000000002=20
    3.556338   T70 GPR24: 0000000000200000 0000000000000000 000000000000000=
0 c000000006060788=20
    3.556338   T70 GPR28: c000000006060780 c000000006060780 000000000000000=
0 c000000006ea68f8=20
    3.557120   T70 NIP c0000000003a63ac list_lru_del+0xbc/0x1d0
    3.557180   T70 LR c0000000003a637c list_lru_del+0x8c/0x1d0
    3.557231   T70 Call Trace:
    3.557284   T70 c000000008353c70 c000000008353cc0 0xc000000008353cc0 (un=
reliable)
    3.557372   T70 c000000008353cc0 c00000000048a7b0 iput+0x1c0/0x3c0
    3.557443   T70 c000000008353d10 c0000000004778a0 do_unlinkat+0x230/0x3c0
    3.557526   T70 c000000008353dc0 c000000000033fec system_call_exception+=
0x14c/0x230
    3.557602   T70 c000000008353e20 c00000000000d740 system_call_common+0xf=
0/0x27c
    3.557670   T70 Instruction dump:
    3.557723   T70 60000000 2c230000 4182001c e95d0020 2c2a0000 41820010 e9=
23099a 2c090000=20
    3.557856   T70 408000f4 e95f0008 e91f0000 7da96b78 <f9480008> f90a0000 =
fbff0000 fbff0008=20
    3.558425   T70 --- end trace 5025492be6dd1f89 ---
    3.572722   T70=20
    3.572988   T70 note: rm70 exited with preempt_count 2
    3.579869   T70 rm (70) used greatest stack depth: 11616 bytes left
Segmentation fault
    3.618833   T71 random: dd: uninitialized urandom read (512 bytes read)

	...

Welcome to Buildroot
buildroot login: root
# halt
# Stopping network...Saving random seed...     5.238633  T102 random: dd: u=
ninitialized urandom read (512 bytes read)
done.
Stopping logging: OK
    5.488999  T107 BUG: Kernel NULL pointer dereference on write at 0x00000=
008
    5.489127  T107 Faulting instruction address: 0xc0000000003a63ac
    5.489209  T107 Oops: Kernel access of bad area, sig: 11 #2
    5.489268  T107 LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pS=
eries
    5.489328  T107 Modules linked in:
    5.489407  T107 CPU: 0 PID: 107 Comm: umount Tainted: G      D W        =
 5.10.0-rc4 #2
    5.489470  T107 NIP:  c0000000003a63ac LR: c0000000003a637c CTR: c000000=
000486d10
    5.489532  T107 REGS: c00000000a24b660 TRAP: 0300   Tainted: G      D W =
         (5.10.0-rc4)
    5.489591  T107 MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28242=
484  XER: 20000000
    5.489739  T107 CFAR: c0000000000101c0 DAR: 0000000000000008 DSISR: 4200=
0000 IRQMASK: 0=20
    5.489739  T107 GPR00: c0000000003a637c c00000000a24b8f0 c0000000013b7d0=
0 0000000000000000=20
    5.489739  T107 GPR04: c000000006ea70f0 c00000000047f080 c0000000075451c=
9 0000000000000000=20
    5.489739  T107 GPR08: 0000000000000000 c0000000015b0000 000000000000000=
0 0000000000000001=20
    5.489739  T107 GPR12: c000000000486d10 c0000000015b0000 000000000000000=
0 0000000000000000=20
    5.489739  T107 GPR16: 0000000000000000 0000000000000000 000000000000000=
0 0000000000000000=20
    5.489739  T107 GPR20: 0000000000000000 0000000000000000 000000000000000=
0 0000000002002000=20
    5.489739  T107 GPR24: 0000000000000000 0000000000000000 000000000000000=
0 c000000006069588=20
    5.489739  T107 GPR28: c000000006069580 c000000006069580 000000000000000=
0 c000000006ea70f0=20
    5.490469  T107 NIP c0000000003a63ac list_lru_del+0xbc/0x1d0
    5.490527  T107 LR c0000000003a637c list_lru_del+0x8c/0x1d0
    5.490577  T107 Call Trace:
    5.490628  T107 c00000000a24b8f0 c00000000a24b940 0xc00000000a24b940 (un=
reliable)
    5.490714  T107 c00000000a24b940 c00000000048a7b0 iput+0x1c0/0x3c0
    5.490781  T107 c00000000a24b990 c0000000004807f8 dentry_unlink_inode+0x=
168/0x230
    5.490851  T107 c00000000a24b9c0 c000000000481614 __dentry_kill+0x154/0x=
2e0
    5.490923  T107 c00000000a24ba00 c000000000484bd8 shrink_dentry_list+0xa=
8/0x1a0
    5.490995  T107 c00000000a24ba50 c000000000484ff4 shrink_dcache_parent+0=
x154/0x240
    5.491065  T107 c00000000a24bae0 c0000000004856a0 shrink_dcache_for_umou=
nt+0x70/0x240
    5.491146  T107 c00000000a24bb90 c00000000045f320 generic_shutdown_super=
+0x40/0x1b0
    5.491225  T107 c00000000a24bc00 c00000000045f5d8 kill_litter_super+0x48=
/0x80
    5.491298  T107 c00000000a24bc30 c00000000045fe14 deactivate_locked_supe=
r+0x74/0x160
    5.491374  T107 c00000000a24bc60 c00000000049453c cleanup_mnt+0x15c/0x240
    5.491449  T107 c00000000a24bcb0 c000000000158fe4 task_work_run+0xf4/0x1=
60
    5.491525  T107 c00000000a24bd00 c00000000001f234 do_notify_resume+0x424=
/0x460
    5.491598  T107 c00000000a24bdb0 c000000000034294 syscall_exit_prepare+0=
x1c4/0x330
    5.491672  T107 c00000000a24be20 c00000000000d74c system_call_common+0xf=
c/0x27c
    5.491736  T107 Instruction dump:
    5.491788  T107 60000000 2c230000 4182001c e95d0020 2c2a0000 41820010 e9=
23099a 2c090000=20
    5.491917  T107 408000f4 e95f0008 e91f0000 7da96b78 <f9480008> f90a0000 =
fbff0000 fbff0008=20
    5.492065  T107 --- end trace 5025492be6dd1f8a ---
    5.504337  T107=20
    5.504388  T107 note: umount107 exited with preempt_count 2
The system is going down NOW!
Sent SIGTERM to all processes

I bisected it to commit

  212c968dfcdf ("mm/shmem: use kmem_cache_zalloc in shmem_alloc_inode()")

Which Hugh Dickens has just sent an email about :-)

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/NXxBjr0dwG+K8g3=gCd5pLX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+zdnIACgkQAVBC80lX
0Gx+Ygf+L2HZcqxWysFeWxAhe3c2nr91K2hzqi8z39hfoeNE+QFstQNP3Y3uTUMx
bLQ/lJKd64er5thJNRWatf0v/CMswc7iekOBj0Q5Ny/yewsgUEb8Fbg0iMnU/N87
FTH7HhYz1zsxCtS86vOQILecWgjnVEx0nqjKuZMr4hSeM5ac4x2NX6EudmZyw/ja
CpZEkvqZNDTiiiJRbxnEy740ksiHG0UvEDjBJ16TreCSMvrMovzeUPRJwqCB5DRA
DPhx4/FiqmvmiMn9ALyWGGyAMx5NLtZTrPbnpxlrM37qZfEbCRNej4OUl8+cu3hp
d6AkJYfAJtYfEgKjF3k0jQeiJMDPPw==
=kBT8
-----END PGP SIGNATURE-----

--Sig_/NXxBjr0dwG+K8g3=gCd5pLX--
