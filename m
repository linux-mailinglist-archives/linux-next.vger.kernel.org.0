Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09C32DF763
	for <lists+linux-next@lfdr.de>; Mon, 21 Dec 2020 02:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgLUBC4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Dec 2020 20:02:56 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43017 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726027AbgLUBC4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Dec 2020 20:02:56 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Czh5G0Yglz9sSC;
        Mon, 21 Dec 2020 12:02:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608512531;
        bh=lf89HOzqVG12pcrGPAL0ET/UwgB8NtG17av6JvK9QVw=;
        h=Date:From:To:Cc:Subject:From;
        b=Wr+yDA5ck4E7KQ61WaG+Do8q4OKJD8yvFAiQJQiCqOC4mSigyDHxEmx7Jr1/ukWBi
         K4zEsgtcZhy29s37N00nzPGvA8BdLKpaF+kpgGynZne7zT3DZ3I0ReTJmk6Hy96Ui9
         RjkJ8rNMTjGxJvj6EyZbi9I1F8SvQ8sPVBl7u3Mh7KvTj80uj4v+bJPohoH9uVWHje
         PYK+0p6ONedaxzPiBKzDMDgfDfmtH7qw3qx/7/O3UMClw4GuloprLN1/vKTuRQ7437
         LocrRO+xO3oNpA5/yaLQDp4n/od+AuG4ETBj++VcOB2nobqvnuSsppkNJFfGdMqtRS
         1BwXuGBF4sLqQ==
Date:   Mon, 21 Dec 2020 12:02:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Minchan Kim <minchan@kernel.org>,
        Willem de Bruijn <willemb@google.com>,
        YueHaibing <yuehaibing@huawei.com>
Subject: linux-next: manual merge of the notifications tree with Linus' tree
Message-ID: <20201221120209.5c5cb5d8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x2tSK=g50YMR/8duWuqmpWD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/x2tSK=g50YMR/8duWuqmpWD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the notifications tree got conflicts in:

  arch/alpha/kernel/syscalls/syscall.tbl
  arch/arm/tools/syscall.tbl
  arch/arm64/include/asm/unistd.h
  arch/arm64/include/asm/unistd32.h
  arch/ia64/kernel/syscalls/syscall.tbl
  arch/m68k/kernel/syscalls/syscall.tbl
  arch/microblaze/kernel/syscalls/syscall.tbl
  arch/mips/kernel/syscalls/syscall_n32.tbl
  arch/mips/kernel/syscalls/syscall_n64.tbl
  arch/mips/kernel/syscalls/syscall_o32.tbl
  arch/parisc/kernel/syscalls/syscall.tbl
  arch/powerpc/kernel/syscalls/syscall.tbl
  arch/s390/kernel/syscalls/syscall.tbl
  arch/sh/kernel/syscalls/syscall.tbl
  arch/sparc/kernel/syscalls/syscall.tbl
  arch/x86/entry/syscalls/syscall_32.tbl
  arch/x86/entry/syscalls/syscall_64.tbl
  arch/xtensa/kernel/syscalls/syscall.tbl
  include/uapi/asm-generic/unistd.h

between commits:

  b0a0c2615f6f ("epoll: wire up syscall epoll_pwait2")
  450f68e2425e ("epoll: fix compat syscall wire up of epoll_pwait2")
  ecb8ac8b1f14 ("mm/madvise: introduce process_madvise() syscall: an extern=
al memory hinting API")

from Linus' tree and commit:

  4cd92d064cb0 ("watch_queue: Implement mount topology and attribute change=
 notifications")

from the notifications tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

If this is not submitted to Linus during this merge window, please
either drop it from your linux-next included branch, or at least fix it
up wrt to the sate of Linus' tree.
--=20
Cheers,
Stephen Rothwell

diff --cc arch/alpha/kernel/syscalls/syscall.tbl
index a6617067dbe6,b6cf8403da35..000000000000
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@@ -479,5 -478,4 +479,6 @@@
  547	common	openat2				sys_openat2
  548	common	pidfd_getfd			sys_pidfd_getfd
  549	common	faccessat2			sys_faccessat2
 -550	common	watch_mount			sys_watch_mount
 +550	common	process_madvise			sys_process_madvise
 +551	common	epoll_pwait2			sys_epoll_pwait2
++552	common	watch_mount			sys_watch_mount
diff --cc arch/arm/tools/syscall.tbl
index 20e1170e2e0a,27cc1f53f4a0..000000000000
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@@ -453,5 -452,4 +453,6 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
 +441	common	epoll_pwait2			sys_epoll_pwait2
++442	common	watch_mount			sys_watch_mount
diff --cc arch/arm64/include/asm/unistd.h
index 86a9d7b3eabe,b3b2019f8d16..000000000000
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@@ -38,7 -38,7 +38,7 @@@
  #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
  #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
 =20
- #define __NR_compat_syscalls		442
 -#define __NR_compat_syscalls		441
++#define __NR_compat_syscalls		443
  #endif
 =20
  #define __ARCH_WANT_SYS_CLONE
diff --cc arch/arm64/include/asm/unistd32.h
index cccfbbefbf95,4f9cf98cdf0f..000000000000
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@@ -887,10 -885,8 +887,12 @@@ __SYSCALL(__NR_openat2, sys_openat2
  __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
  #define __NR_faccessat2 439
  __SYSCALL(__NR_faccessat2, sys_faccessat2)
 -#define __NR_watch_mount 440
 +#define __NR_process_madvise 440
 +__SYSCALL(__NR_process_madvise, sys_process_madvise)
 +#define __NR_epoll_pwait2 441
 +__SYSCALL(__NR_epoll_pwait2, compat_sys_epoll_pwait2)
++#define __NR_watch_mount 442
+ __SYSCALL(__NR_watch_mount, sys_watch_mount)
 =20
  /*
   * Please add new compat syscalls above this comment and update
diff --cc arch/ia64/kernel/syscalls/syscall.tbl
index bfc00f2bd437,fc6d87903781..000000000000
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@@ -360,5 -359,4 +360,6 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
 +441	common	epoll_pwait2			sys_epoll_pwait2
++442	common	watch_mount			sys_watch_mount
diff --cc arch/m68k/kernel/syscalls/syscall.tbl
index 7fe4e45c864c,c671aa0e4d25..000000000000
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@@ -439,5 -438,4 +439,6 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
 +441	common	epoll_pwait2			sys_epoll_pwait2
++442	common	watch_mount			sys_watch_mount
diff --cc arch/microblaze/kernel/syscalls/syscall.tbl
index a522adf194ab,65cc53f129ef..000000000000
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@@ -445,5 -444,4 +445,6 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
 +441	common	epoll_pwait2			sys_epoll_pwait2
++442	common	watch_mount			sys_watch_mount
diff --cc arch/mips/kernel/syscalls/syscall_n32.tbl
index 0f03ad223f33,7f034a239930..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@@ -378,5 -377,4 +378,6 @@@
  437	n32	openat2				sys_openat2
  438	n32	pidfd_getfd			sys_pidfd_getfd
  439	n32	faccessat2			sys_faccessat2
 -440	n32	watch_mount			sys_watch_mount
 +440	n32	process_madvise			sys_process_madvise
 +441	n32	epoll_pwait2			compat_sys_epoll_pwait2
++442	n32	watch_mount			sys_watch_mount
diff --cc arch/mips/kernel/syscalls/syscall_n64.tbl
index 91649690b52f,d39b90de3642..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@@ -354,5 -353,4 +354,6 @@@
  437	n64	openat2				sys_openat2
  438	n64	pidfd_getfd			sys_pidfd_getfd
  439	n64	faccessat2			sys_faccessat2
 -440	n64	watch_mount			sys_watch_mount
 +440	n64	process_madvise			sys_process_madvise
 +441	n64	epoll_pwait2			sys_epoll_pwait2
++442	n64	watch_mount			sys_watch_mount
diff --cc arch/mips/kernel/syscalls/syscall_o32.tbl
index 4bad0c40aed6,09f426cb45b1..000000000000
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@@ -427,5 -426,4 +427,6 @@@
  437	o32	openat2				sys_openat2
  438	o32	pidfd_getfd			sys_pidfd_getfd
  439	o32	faccessat2			sys_faccessat2
 -440	o32	watch_mount			sys_watch_mount
 +440	o32	process_madvise			sys_process_madvise
 +441	o32	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
++442	o32	watch_mount			sys_watch_mount
diff --cc arch/parisc/kernel/syscalls/syscall.tbl
index 6bcc31966b44,52ff3454baa1..000000000000
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@@ -437,5 -436,4 +437,6 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
 +441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
++442	common	watch_mount			sys_watch_mount
diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index f744eb5cba88,10b7ed3c7a1b..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -529,5 -528,4 +529,6 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
 +441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
++442	common	watch_mount			sys_watch_mount
diff --cc arch/s390/kernel/syscalls/syscall.tbl
index d443423495e5,86f317bf52df..000000000000
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@@ -442,5 -441,4 +442,6 @@@
  437  common	openat2			sys_openat2			sys_openat2
  438  common	pidfd_getfd		sys_pidfd_getfd			sys_pidfd_getfd
  439  common	faccessat2		sys_faccessat2			sys_faccessat2
 -440	common	watch_mount		sys_watch_mount			sys_watch_mount
 +440  common	process_madvise		sys_process_madvise		sys_process_madvise
 +441  common	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
++442	common	watch_mount		sys_watch_mount			sys_watch_mount
diff --cc arch/sh/kernel/syscalls/syscall.tbl
index 9df40ac0ebc0,0bb0f0b372c7..000000000000
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@@ -442,5 -441,4 +442,6 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
 +441	common	epoll_pwait2			sys_epoll_pwait2
++442	common	watch_mount			sys_watch_mount
diff --cc arch/sparc/kernel/syscalls/syscall.tbl
index 40d8c7cd8298,369ab65c1e9a..000000000000
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@@ -485,5 -484,4 +485,6 @@@
  437	common	openat2			sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
 +441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
++442	common	watch_mount			sys_watch_mount
diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index 874aeacde2dd,e760ba92c58d..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -444,5 -443,4 +444,6 @@@
  437	i386	openat2			sys_openat2
  438	i386	pidfd_getfd		sys_pidfd_getfd
  439	i386	faccessat2		sys_faccessat2
 -440	i386	watch_mount		sys_watch_mount
 +440	i386	process_madvise		sys_process_madvise
 +441	i386	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
++442	i386	watch_mount		sys_watch_mount
diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index 78672124d28b,5b58621d4f75..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -361,14 -360,13 +361,15 @@@
  437	common	openat2			sys_openat2
  438	common	pidfd_getfd		sys_pidfd_getfd
  439	common	faccessat2		sys_faccessat2
 -440	common	watch_mount		sys_watch_mount
 +440	common	process_madvise		sys_process_madvise
 +441	common	epoll_pwait2		sys_epoll_pwait2
++442	common	watch_mount		sys_watch_mount
 =20
  #
 -# x32-specific system call numbers start at 512 to avoid cache impact
 -# for native 64-bit operation. The __x32_compat_sys stubs are created
 -# on-the-fly for compat_sys_*() compatibility system calls if X86_X32
 -# is defined.
 +# Due to a historical design error, certain syscalls are numbered differe=
ntly
 +# in x32 as compared to native x86_64.  These syscalls have numbers 512-5=
47.
 +# Do not add new syscalls to this range.  Numbers 548 and above are avail=
able
 +# for non-x32 use.
  #
  512	x32	rt_sigaction		compat_sys_rt_sigaction
  513	x32	rt_sigreturn		compat_sys_x32_rt_sigreturn
diff --cc arch/xtensa/kernel/syscalls/syscall.tbl
index 46116a28eeed,5b28ee39f70f..000000000000
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@@ -410,5 -409,4 +410,6 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
 +441	common	epoll_pwait2			sys_epoll_pwait2
++442	common	watch_mount			sys_watch_mount
diff --cc include/uapi/asm-generic/unistd.h
index 728752917785,fcdca8c7d30a..000000000000
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@@ -857,13 -857,11 +857,15 @@@ __SYSCALL(__NR_openat2, sys_openat2
  __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
  #define __NR_faccessat2 439
  __SYSCALL(__NR_faccessat2, sys_faccessat2)
 -#define __NR_watch_mount 440
 +#define __NR_process_madvise 440
 +__SYSCALL(__NR_process_madvise, sys_process_madvise)
 +#define __NR_epoll_pwait2 441
 +__SC_COMP(__NR_epoll_pwait2, sys_epoll_pwait2, compat_sys_epoll_pwait2)
++#define __NR_watch_mount 442
+ __SYSCALL(__NR_watch_mount, sys_watch_mount)
 =20
  #undef __NR_syscalls
- #define __NR_syscalls 442
 -#define __NR_syscalls 441
++#define __NR_syscalls 443
 =20
  /*
   * 32 bit systems traditionally used different

--Sig_/x2tSK=g50YMR/8duWuqmpWD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/f9BEACgkQAVBC80lX
0GzCZAgAnm1mrdosyaemirts/R8a0po6VGxbH8vFQQ4QNhVab4Rk75aUXe/l6LO4
3eX3cqyHQQyHi3PjEO18DUQQwWJtGo+2zo0Q/yMxJyoRRL2cR5cJM9iY9M1j2Bqc
ePp39HJQtav6K+OjtAEXvvLowfzsh6PXR8hPnxAmfG2cXL2isTIcFVP8zeXgpLRS
XcCMuHzDj4fkUSnRHklTjEQewPUv/OI34/ip9BtkQpEl3eSkTIzm6EkmzUUEABBT
C5Vx/+1KvBK7jE5yWS9n9dxm1qRktVgeWhUYvKN7XwzCQ10jjcOogmZkKRBN+Vdr
ni7LCIbebGYnBCugB0Ln8JcsoWzVGA==
=yaV/
-----END PGP SIGNATURE-----

--Sig_/x2tSK=g50YMR/8duWuqmpWD--
