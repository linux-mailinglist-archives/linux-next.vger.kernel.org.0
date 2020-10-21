Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D001C294659
	for <lists+linux-next@lfdr.de>; Wed, 21 Oct 2020 03:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439880AbgJUBro (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Oct 2020 21:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439875AbgJUBro (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Oct 2020 21:47:44 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A46C0613CE;
        Tue, 20 Oct 2020 18:47:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CGCzv6gJ9z9sSG;
        Wed, 21 Oct 2020 12:47:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603244861;
        bh=v9rVB+Nesdc+q52L+L2XnNtNmWYruvACC1Nf5mx47bk=;
        h=Date:From:To:Cc:Subject:From;
        b=fhsN/SMVlgKR+evQF8GfkX8Wml9U2RlpuhJ36JGRwvt/1HuOteYwSu+3wKsrlwbk0
         68VU/FgMBM5k7CM+gn8ucpot0SXV7+Xz7WbyThIaTQlYK7+ADZCVc3iHpqm9F9TbAA
         f58n7Wq32uxASZqP1J0qqpmW5wAhkFKnnWw9DTO+otsc/PS0Pmf53pEOt95MVeV15A
         jksHe6Or9DclPDHvtBRwIWJ06y61ZMkgaup/GEKrkw64f1+HUEdHabLROtna4fZEx8
         hFdlFXO8GrHZyak91RyzPmnLKlhiT+RLGvlvBeT0ITXLkRerT7asJ2k4hXb+FZ0fGG
         Pi/rhvuE6gNag==
Date:   Wed, 21 Oct 2020 12:47:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Minchan Kim <minchan@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: linux-next: manual merge of the notifications tree with Linus' tree
Message-ID: <20201021124733.344e5107@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I_vE3GrcmGPVy9Ufzbz/r7W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/I_vE3GrcmGPVy9Ufzbz/r7W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the notifications tree got conflicts in:

  arch/alpha/kernel/syscalls/syscall.tbl
  arch/arm/tools/syscall.tbl
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

between commit:

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

--=20
Cheers,
Stephen Rothwell

diff --cc arch/alpha/kernel/syscalls/syscall.tbl
index ee7b01bb7346,b6cf8403da35..000000000000
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@@ -479,4 -478,4 +479,5 @@@
  547	common	openat2				sys_openat2
  548	common	pidfd_getfd			sys_pidfd_getfd
  549	common	faccessat2			sys_faccessat2
 -550	common	watch_mount			sys_watch_mount
 +550	common	process_madvise			sys_process_madvise
++551	common	watch_mount			sys_watch_mount
diff --cc arch/arm/tools/syscall.tbl
index d056a548358e,27cc1f53f4a0..000000000000
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@@ -453,4 -452,4 +453,5 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
++441	common	watch_mount			sys_watch_mount
diff --cc arch/arm64/include/asm/unistd32.h
index 107f08e03b9f,4f9cf98cdf0f..000000000000
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@@ -887,8 -885,8 +887,10 @@@ __SYSCALL(__NR_openat2, sys_openat2
  __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
  #define __NR_faccessat2 439
  __SYSCALL(__NR_faccessat2, sys_faccessat2)
 -#define __NR_watch_mount 440
 +#define __NR_process_madvise 440
 +__SYSCALL(__NR_process_madvise, sys_process_madvise)
++#define __NR_watch_mount 441
+ __SYSCALL(__NR_watch_mount, sys_watch_mount)
 =20
  /*
   * Please add new compat syscalls above this comment and update
diff --cc arch/ia64/kernel/syscalls/syscall.tbl
index b96ed8b8a508,fc6d87903781..000000000000
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@@ -360,4 -359,4 +360,5 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
++441	common	watch_mount			sys_watch_mount
diff --cc arch/m68k/kernel/syscalls/syscall.tbl
index 625fb6d32842,c671aa0e4d25..000000000000
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@@ -439,4 -438,4 +439,5 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
++441	common	watch_mount			sys_watch_mount
diff --cc arch/microblaze/kernel/syscalls/syscall.tbl
index aae729c95cf9,65cc53f129ef..000000000000
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@@ -445,4 -444,4 +445,5 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
++441	common	watch_mount			sys_watch_mount
diff --cc arch/mips/kernel/syscalls/syscall_n32.tbl
index 32817c954435,7f034a239930..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@@ -378,4 -377,4 +378,5 @@@
  437	n32	openat2				sys_openat2
  438	n32	pidfd_getfd			sys_pidfd_getfd
  439	n32	faccessat2			sys_faccessat2
 -440	n32	watch_mount			sys_watch_mount
 +440	n32	process_madvise			sys_process_madvise
++441	n32	watch_mount			sys_watch_mount
diff --cc arch/mips/kernel/syscalls/syscall_n64.tbl
index 9e4ea3c31b1c,d39b90de3642..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@@ -354,4 -353,4 +354,5 @@@
  437	n64	openat2				sys_openat2
  438	n64	pidfd_getfd			sys_pidfd_getfd
  439	n64	faccessat2			sys_faccessat2
 -440	n64	watch_mount			sys_watch_mount
 +440	n64	process_madvise			sys_process_madvise
++441	n64	watch_mount			sys_watch_mount
diff --cc arch/mips/kernel/syscalls/syscall_o32.tbl
index 29f5f28cf5ce,09f426cb45b1..000000000000
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@@ -427,4 -426,4 +427,5 @@@
  437	o32	openat2				sys_openat2
  438	o32	pidfd_getfd			sys_pidfd_getfd
  439	o32	faccessat2			sys_faccessat2
 -440	o32	watch_mount			sys_watch_mount
 +440	o32	process_madvise			sys_process_madvise
++441	o32	watch_mount			sys_watch_mount
diff --cc arch/parisc/kernel/syscalls/syscall.tbl
index 38c63e5404bc,52ff3454baa1..000000000000
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@@ -437,4 -436,4 +437,5 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
++441	common	watch_mount			sys_watch_mount
diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index 1275daec7fec,10b7ed3c7a1b..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -529,4 -528,4 +529,5 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
++441	common	watch_mount			sys_watch_mount
diff --cc arch/s390/kernel/syscalls/syscall.tbl
index 28c168000483,86f317bf52df..000000000000
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@@ -442,4 -441,4 +442,5 @@@
  437  common	openat2			sys_openat2			sys_openat2
  438  common	pidfd_getfd		sys_pidfd_getfd			sys_pidfd_getfd
  439  common	faccessat2		sys_faccessat2			sys_faccessat2
 -440	common	watch_mount		sys_watch_mount			sys_watch_mount
 +440  common	process_madvise		sys_process_madvise		sys_process_madvise
++441	common	watch_mount		sys_watch_mount			sys_watch_mount
diff --cc arch/sh/kernel/syscalls/syscall.tbl
index 783738448ff5,0bb0f0b372c7..000000000000
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@@ -442,4 -441,4 +442,5 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
++441	common	watch_mount			sys_watch_mount
diff --cc arch/sparc/kernel/syscalls/syscall.tbl
index 78160260991b,369ab65c1e9a..000000000000
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@@ -485,4 -484,4 +485,5 @@@
  437	common	openat2			sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
++441	common	watch_mount			sys_watch_mount
diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index 0d0667a9fbd7,e760ba92c58d..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -444,4 -443,4 +444,5 @@@
  437	i386	openat2			sys_openat2
  438	i386	pidfd_getfd		sys_pidfd_getfd
  439	i386	faccessat2		sys_faccessat2
 -440	i386	watch_mount		sys_watch_mount
 +440	i386	process_madvise		sys_process_madvise
++441	i386	watch_mount		sys_watch_mount
diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index 379819244b91,5b58621d4f75..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -361,13 -360,13 +361,14 @@@
  437	common	openat2			sys_openat2
  438	common	pidfd_getfd		sys_pidfd_getfd
  439	common	faccessat2		sys_faccessat2
 -440	common	watch_mount		sys_watch_mount
 +440	common	process_madvise		sys_process_madvise
++441	common	watch_mount		sys_watch_mount
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
index b070f272995d,5b28ee39f70f..000000000000
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@@ -410,4 -409,4 +410,5 @@@
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
  439	common	faccessat2			sys_faccessat2
 -440	common	watch_mount			sys_watch_mount
 +440	common	process_madvise			sys_process_madvise
++441	common	watch_mount			sys_watch_mount
diff --cc include/uapi/asm-generic/unistd.h
index 2056318988f7,fcdca8c7d30a..000000000000
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@@ -857,8 -857,8 +857,10 @@@ __SYSCALL(__NR_openat2, sys_openat2
  __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
  #define __NR_faccessat2 439
  __SYSCALL(__NR_faccessat2, sys_faccessat2)
 -#define __NR_watch_mount 440
 +#define __NR_process_madvise 440
 +__SYSCALL(__NR_process_madvise, sys_process_madvise)
++#define __NR_watch_mount 441
+ __SYSCALL(__NR_watch_mount, sys_watch_mount)
 =20
  #undef __NR_syscalls
  #define __NR_syscalls 441

--Sig_/I_vE3GrcmGPVy9Ufzbz/r7W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+PkzUACgkQAVBC80lX
0Gxjywf+Isf+jWkca2hL10a3si0fbAsg8EQso1TfjehpTLKIbJWDVlJ+m5ip/vLn
ce64WHzQd/J/cWhak7Y8h67B33p1Sxsyepl0lk0RPT3YgJ4SoYD3i3p+JpOTWXDj
o7Q4h3Y1PlSB9u4+36G+t1nG1Sz2cEGRBx5NcHP3XIoVNHhid+f7DIWL3equfYEW
kSp8yj09JpaIDocwy17GX4MpXOxK1rMcgVGoI9fLXsUBaek9f56PXLHN1Twup2lk
+ESqOHlNOXTwkIV//vpKDh0ZHKhhVTaJdL6t0+GipmKyZT7+xrabkKICvW99LRKB
iOHwBjMjoDu5RDLUcSb8ud4fE09mjw==
=lXLL
-----END PGP SIGNATURE-----

--Sig_/I_vE3GrcmGPVy9Ufzbz/r7W--
