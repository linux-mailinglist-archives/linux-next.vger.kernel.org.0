Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAEF1D49D8
	for <lists+linux-next@lfdr.de>; Fri, 15 May 2020 11:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbgEOJkU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 May 2020 05:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727116AbgEOJkT (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 May 2020 05:40:19 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29A9C061A0C;
        Fri, 15 May 2020 02:40:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Nk0c1QHyz9sT8;
        Fri, 15 May 2020 19:40:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589535616;
        bh=T9GlGtlZyu9mSdZnMxldG1qpqyg2QLCkwykzkGZUUok=;
        h=Date:From:To:Cc:Subject:From;
        b=gIAvJr6yW38+FcVZ2YoOZFBjDtMouKctealRA66m8injmgeMPJBIDeI/WR/XyYiOX
         cmXYT7u9jil+bfLhmupEXEQF+ULU9T5tirpAWrFiG1H8Rf5PW8/6qNsuKpVcbEpfCn
         xb4EfLyvXSvh+6pkePGLhWgFiBDcHwp4jGLbgnC0c0xkzH2Ii8g84h4uQK3XF5ZR58
         dWOgAnbeXakQ5HWHyNCgtF/iR4wNkWmoNgHuN/dKfqHc/RzFWmoQMGTU/Ckmpo6Kwz
         TjOsx2D4LSWa8V9SxTx/dOzGaSSQraV/2aZlt849wKzm3JCn4zod9KxmjsK61wSaiX
         /2QMnI2T8zamw==
Date:   Fri, 15 May 2020 19:40:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the notifications tree with the vfs
 tree
Message-ID: <20200515194014.60ba8325@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.XzmyPmF47InO7ez_bDM1ie";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.XzmyPmF47InO7ez_bDM1ie
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

between commit:

  c8ffd8bcdd28 ("vfs: add faccessat2 syscall")

from the vfs tree and commits:

  cd7109637b0b ("watch_queue: Implement mount topology and attribute change=
 notifications")
  46896d79c514 ("watch_queue: Add superblock notifications")

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
index 5ddd128d4b7a,7c0115af9010..000000000000
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@@ -477,4 -477,5 +477,6 @@@
  # 545 reserved for clone3
  547	common	openat2				sys_openat2
  548	common	pidfd_getfd			sys_pidfd_getfd
 -549	common	watch_mount			sys_watch_mount
 -550	common	watch_sb			sys_watch_sb
 +549	common	faccessat2			sys_faccessat2
++550	common	watch_mount			sys_watch_mount
++551	common	watch_sb			sys_watch_sb
diff --cc arch/arm/tools/syscall.tbl
index d5cae5ffede0,f256f009a89f..000000000000
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@@ -451,4 -451,5 +451,6 @@@
  435	common	clone3				sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 +439	common	faccessat2			sys_faccessat2
++440	common	watch_mount			sys_watch_mount
++441	common	watch_sb			sys_watch_sb
diff --cc arch/arm64/include/asm/unistd.h
index 3b859596840d,b3b2019f8d16..000000000000
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@@ -38,7 -38,7 +38,7 @@@
  #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
  #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
 =20
- #define __NR_compat_syscalls		440
 -#define __NR_compat_syscalls		441
++#define __NR_compat_syscalls		442
  #endif
 =20
  #define __ARCH_WANT_SYS_CLONE
diff --cc arch/arm64/include/asm/unistd32.h
index 6d95d0c8bf2f,5ba3dae4859b..000000000000
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@@ -883,8 -883,10 +883,12 @@@ __SYSCALL(__NR_clone3, sys_clone3
  __SYSCALL(__NR_openat2, sys_openat2)
  #define __NR_pidfd_getfd 438
  __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
 -#define __NR_watch_mount 439
 +#define __NR_faccessat2 439
 +__SYSCALL(__NR_faccessat2, sys_faccessat2)
++#define __NR_watch_mount 440
+ __SYSCALL(__NR_watch_mount, sys_watch_mount)
 -#define __NR_watch_sb 440
++#define __NR_watch_sb 441
+ __SYSCALL(__NR_watch_sb, sys_watch_sb)
 =20
  /*
   * Please add new compat syscalls above this comment and update
diff --cc arch/ia64/kernel/syscalls/syscall.tbl
index 49e325b604b3,a4dafc659647..000000000000
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@@ -358,4 -358,5 +358,6 @@@
  # 435 reserved for clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 +439	common	faccessat2			sys_faccessat2
++440	common	watch_mount			sys_watch_mount
++441	common	watch_sb			sys_watch_sb
diff --cc arch/m68k/kernel/syscalls/syscall.tbl
index f71b1bbcc198,893fb4151547..000000000000
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@@ -437,4 -437,5 +437,6 @@@
  435	common	clone3				__sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 +439	common	faccessat2			sys_faccessat2
++440	common	watch_mount			sys_watch_mount
++441	common	watch_sb			sys_watch_sb
diff --cc arch/microblaze/kernel/syscalls/syscall.tbl
index edacc4561f2b,54aaf0d40c64..000000000000
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@@ -443,4 -443,5 +443,6 @@@
  435	common	clone3				sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 +439	common	faccessat2			sys_faccessat2
++440	common	watch_mount			sys_watch_mount
++441	common	watch_sb			sys_watch_sb
diff --cc arch/mips/kernel/syscalls/syscall_n32.tbl
index f777141f5256,fd34dd0efed0..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@@ -376,4 -376,5 +376,6 @@@
  435	n32	clone3				__sys_clone3
  437	n32	openat2				sys_openat2
  438	n32	pidfd_getfd			sys_pidfd_getfd
 -439	n32	watch_mount			sys_watch_mount
 -440	n32	watch_sb			sys_watch_sb
 +439	n32	faccessat2			sys_faccessat2
++440	n32	watch_mount			sys_watch_mount
++441	n32	watch_sb			sys_watch_sb
diff --cc arch/mips/kernel/syscalls/syscall_n64.tbl
index da8c76394e17,db0f4c0a0a0b..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@@ -352,4 -352,5 +352,6 @@@
  435	n64	clone3				__sys_clone3
  437	n64	openat2				sys_openat2
  438	n64	pidfd_getfd			sys_pidfd_getfd
 -439	n64	watch_mount			sys_watch_mount
 -440	n64	watch_sb			sys_watch_sb
 +439	n64	faccessat2			sys_faccessat2
++440	n64	watch_mount			sys_watch_mount
++441	n64	watch_sb			sys_watch_sb
diff --cc arch/mips/kernel/syscalls/syscall_o32.tbl
index 13280625d312,ce2e1326de8f..000000000000
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@@ -425,4 -425,5 +425,6 @@@
  435	o32	clone3				__sys_clone3
  437	o32	openat2				sys_openat2
  438	o32	pidfd_getfd			sys_pidfd_getfd
 -439	o32	watch_mount			sys_watch_mount
 -440	o32	watch_sb			sys_watch_sb
 +439	o32	faccessat2			sys_faccessat2
++440	o32	watch_mount			sys_watch_mount
++441	o32	watch_sb			sys_watch_sb
diff --cc arch/parisc/kernel/syscalls/syscall.tbl
index 5a758fa6ec52,6e4a7c08b64b..000000000000
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@@ -435,4 -435,5 +435,6 @@@
  435	common	clone3				sys_clone3_wrapper
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 +439	common	faccessat2			sys_faccessat2
++440	common	watch_mount			sys_watch_mount
++441	common	watch_sb			sys_watch_sb
diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index f833a3190822,d3caa8704db1..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -527,4 -527,5 +527,6 @@@
  435	spu	clone3				sys_ni_syscall
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 +439	common	faccessat2			sys_faccessat2
++440	common	watch_mount			sys_watch_mount
++441	common	watch_sb			sys_watch_sb
diff --cc arch/s390/kernel/syscalls/syscall.tbl
index bfdcb7633957,b3b8529d2b74..000000000000
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@@ -440,4 -440,5 +440,6 @@@
  435  common	clone3			sys_clone3			sys_clone3
  437  common	openat2			sys_openat2			sys_openat2
  438  common	pidfd_getfd		sys_pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount		sys_watch_mount			sys_watch_mount
 -440	common	watch_sb		sys_watch_sb			sys_watch_sb
 +439  common	faccessat2		sys_faccessat2			sys_faccessat2
++440	common	watch_mount		sys_watch_mount			sys_watch_mount
++441	common	watch_sb		sys_watch_sb			sys_watch_sb
diff --cc arch/sh/kernel/syscalls/syscall.tbl
index acc35daa1b79,89307a20657c..000000000000
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@@ -440,4 -440,5 +440,6 @@@
  # 435 reserved for clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 +439	common	faccessat2			sys_faccessat2
++440	common	watch_mount			sys_watch_mount
++441	common	watch_sb			sys_watch_sb
diff --cc arch/sparc/kernel/syscalls/syscall.tbl
index 8004a276cb74,4ff841a00450..000000000000
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@@ -483,4 -483,5 +483,6 @@@
  # 435 reserved for clone3
  437	common	openat2			sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 +439	common	faccessat2			sys_faccessat2
++440	common	watch_mount			sys_watch_mount
++441	common	watch_sb			sys_watch_sb
diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index d8f8a1a69ed1,b26a6f5a7680..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -442,4 -442,5 +442,6 @@@
  435	i386	clone3			sys_clone3
  437	i386	openat2			sys_openat2
  438	i386	pidfd_getfd		sys_pidfd_getfd
 -439	i386	watch_mount		sys_watch_mount
 -440	i386	watch_sb		sys_watch_sb
 +439	i386	faccessat2		sys_faccessat2
++440	i386	watch_mount		sys_watch_mount
++441	i386	watch_sb		sys_watch_sb
diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index 78847b32e137,4c4f0b709ee2..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -359,7 -359,8 +359,9 @@@
  435	common	clone3			sys_clone3
  437	common	openat2			sys_openat2
  438	common	pidfd_getfd		sys_pidfd_getfd
 -439	common	watch_mount		sys_watch_mount
 -440	common	watch_sb		sys_watch_sb
 +439	common	faccessat2		sys_faccessat2
++440	common	watch_mount		sys_watch_mount
++441	common	watch_sb		sys_watch_sb
 =20
  #
  # x32-specific system call numbers start at 512 to avoid cache impact
diff --cc arch/xtensa/kernel/syscalls/syscall.tbl
index 69d0d73876b3,8e7d731ed6cf..000000000000
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@@ -408,4 -408,5 +408,6 @@@
  435	common	clone3				sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 +439	common	faccessat2			sys_faccessat2
++440	common	watch_mount			sys_watch_mount
++441	common	watch_sb			sys_watch_sb
diff --cc include/uapi/asm-generic/unistd.h
index f4a01305d9a6,5bff318b7ffa..000000000000
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@@ -855,11 -855,13 +855,15 @@@ __SYSCALL(__NR_clone3, sys_clone3
  __SYSCALL(__NR_openat2, sys_openat2)
  #define __NR_pidfd_getfd 438
  __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
 -#define __NR_watch_mount 439
 +#define __NR_faccessat2 439
 +__SYSCALL(__NR_faccessat2, sys_faccessat2)
++#define __NR_watch_mount 440
+ __SYSCALL(__NR_watch_mount, sys_watch_mount)
 -#define __NR_watch_sb 440
++#define __NR_watch_sb 441
+ __SYSCALL(__NR_watch_sb, sys_watch_sb)
 =20
  #undef __NR_syscalls
- #define __NR_syscalls 440
 -#define __NR_syscalls 441
++#define __NR_syscalls 442
 =20
  /*
   * 32 bit systems traditionally used different

--Sig_/.XzmyPmF47InO7ez_bDM1ie
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6+Y34ACgkQAVBC80lX
0Gy3Kgf/Tk9/hm8oqOKVv0e65i0XOUVn7znnEWuvruMs6yYtifbdGWtw1pv8kj63
rxh5i53BGp5zDC7Akd8F+GaKJO3Prd6SMbbQbWpF9QwKEs2vLI33ZBRk6KL/1f95
/TGy0FW54vX+AGpgQTHN8P9wnFPsIVwBPw3bEEedt9ziwpp3reenYlbh/BrMEV5g
3v9nQkOEnzoBy4biJISQIUVA9Hvpre40cysOnZIdXd7ke3mceYbOoaw7DpEu9BMN
Tyt2o+QdkaQYuGI84QNIQHQVbSG9uRslzO0gmK9V9jvqqXn8RpeHdaGFgB5DFbdV
V6EpSGgSnJDxdWvimQ+fuRmR9Osy4A==
=fyh0
-----END PGP SIGNATURE-----

--Sig_/.XzmyPmF47InO7ez_bDM1ie--
