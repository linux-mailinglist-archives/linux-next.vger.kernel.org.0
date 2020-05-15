Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5111D4AA5
	for <lists+linux-next@lfdr.de>; Fri, 15 May 2020 12:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbgEOKOg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 May 2020 06:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbgEOKOd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 May 2020 06:14:33 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E0EC061A0C;
        Fri, 15 May 2020 03:14:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Nkm75Fvfz9sTc;
        Fri, 15 May 2020 20:14:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589537672;
        bh=/1zKFi9F8iKSZ06Lp7Ym8283SXKPfj8jQQxg/D2jDYo=;
        h=Date:From:To:Cc:Subject:From;
        b=lSebWezqZniNDVIVz6/diqLA87mmk3WkTgnc+qR2qIJin85Qf+K+BWYB0Dj8yluMc
         ddqwUQatxAyjDkOwAZVMqCJf1oQ/WqhWWZPn29eF3c3t8dcU5LKwrzWlaENc6fgih6
         z6nPBCmm0leVvdScnclHNfzQYTZTYVwUhVMVFWPP7x5aRE3cNkfO7KIl5sFHGREv7n
         33U0IZ2Wwl5H9whfW9dAzhCeGkU7DjtwieJ/JDu3IGhBj4OKcEEdhDEqHh0UZNvTIL
         lu/G3grgaFsNsSku1pMbKhU0FHMnHbBqyEX3dN1vTMll56Zp2rU6mmKxor0foOIOZC
         KMt3NXPzkF97Q==
Date:   Fri, 15 May 2020 20:14:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the fsinfo tree with the vfs tree
Message-ID: <20200515201430.3d8b2238@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IL.gFL_aoGg4qR7aGZ_Z6lN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IL.gFL_aoGg4qR7aGZ_Z6lN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fsinfo tree got conflicts in:

  arch/alpha/kernel/syscalls/syscall.tbl
  arch/arm/tools/syscall.tbl
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

between commit:

  c8ffd8bcdd28 ("vfs: add faccessat2 syscall")

from the vfs tree and commit:

  1b3979fc0f0c ("fsinfo: Add fsinfo() syscall to query filesystem informati=
on")

from the fsinfo tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I also added the following patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 15 May 2020 20:10:32 +1000
Subject: [PATCH] extra syscall updates

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm64/include/asm/unistd.h   | 2 +-
 arch/arm64/include/asm/unistd32.h | 2 +-
 include/uapi/asm-generic/unistd.h | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unist=
d.h
index 86a9d7b3eabe..949788f5ba40 100644
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@ -38,7 +38,7 @@
 #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
 #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
=20
-#define __NR_compat_syscalls		442
+#define __NR_compat_syscalls		443
 #endif
=20
 #define __ARCH_WANT_SYS_CLONE
diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/uni=
std32.h
index a524549e1e6b..d49b63db5b08 100644
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@ -889,7 +889,7 @@ __SYSCALL(__NR_faccessat2, sys_faccessat2)
 __SYSCALL(__NR_watch_mount, sys_watch_mount)
 #define __NR_watch_sb 441
 __SYSCALL(__NR_watch_sb, sys_watch_sb)
-#define __NR_fsinfo 441
+#define __NR_fsinfo 442
 __SYSCALL(__NR_fsinfo, sys_fsinfo)
=20
 /*
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/u=
nistd.h
index 4b676c2483f8..9018bb54bfa3 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -861,11 +861,11 @@ __SYSCALL(__NR_faccessat2, sys_faccessat2)
 __SYSCALL(__NR_watch_mount, sys_watch_mount)
 #define __NR_watch_sb 441
 __SYSCALL(__NR_watch_sb, sys_watch_sb)
-#define __NR_fsinfo 441
+#define __NR_fsinfo 442
 __SYSCALL(__NR_fsinfo, sys_fsinfo)
=20
 #undef __NR_syscalls
-#define __NR_syscalls 442
+#define __NR_syscalls 443
=20
 /*
  * 32 bit systems traditionally used different
--=20
2.26.2

--=20
Cheers,
Stephen Rothwell

diff --cc arch/alpha/kernel/syscalls/syscall.tbl
index 0dd59fd28c81,4d0b07dde12d..000000000000
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@@ -477,6 -477,6 +477,7 @@@
  # 545 reserved for clone3
  547	common	openat2				sys_openat2
  548	common	pidfd_getfd			sys_pidfd_getfd
 -549	common	watch_mount			sys_watch_mount
 -550	common	watch_sb			sys_watch_sb
 -551	common	fsinfo				sys_fsinfo
 +549	common	faccessat2			sys_faccessat2
 +550	common	watch_mount			sys_watch_mount
 +551	common	watch_sb			sys_watch_sb
++552	common	fsinfo				sys_fsinfo
diff --cc arch/arm/tools/syscall.tbl
index df4aeba36c40,fdda8382b420..000000000000
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@@ -451,6 -451,6 +451,7 @@@
  435	common	clone3				sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
++442	common	fsinfo				sys_fsinfo
diff --cc arch/ia64/kernel/syscalls/syscall.tbl
index 6e12406f2205,2316e60e031a..000000000000
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@@ -358,6 -358,6 +358,7 @@@
  # 435 reserved for clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
++442	common	fsinfo				sys_fsinfo
diff --cc arch/m68k/kernel/syscalls/syscall.tbl
index d6f020ba7c7a,efc2723ca91f..000000000000
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@@ -437,6 -437,6 +437,7 @@@
  435	common	clone3				__sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
++442	common	fsinfo				sys_fsinfo
diff --cc arch/microblaze/kernel/syscalls/syscall.tbl
index d3db934ef48a,745c0f462fce..000000000000
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@@ -443,6 -443,6 +443,7 @@@
  435	common	clone3				sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
++442	common	fsinfo				sys_fsinfo
diff --cc arch/mips/kernel/syscalls/syscall_n32.tbl
index 9a3aad3b0e33,499f83562a8c..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@@ -376,6 -376,6 +376,7 @@@
  435	n32	clone3				__sys_clone3
  437	n32	openat2				sys_openat2
  438	n32	pidfd_getfd			sys_pidfd_getfd
 -439	n32	watch_mount			sys_watch_mount
 -440	n32	watch_sb			sys_watch_sb
 -441	n32	fsinfo				sys_fsinfo
 +439	n32	faccessat2			sys_faccessat2
 +440	n32	watch_mount			sys_watch_mount
 +441	n32	watch_sb			sys_watch_sb
++442	n32	fsinfo				sys_fsinfo
diff --cc arch/mips/kernel/syscalls/syscall_n64.tbl
index 430e7c05fea6,b3188bc3ab3c..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@@ -352,6 -352,6 +352,7 @@@
  435	n64	clone3				__sys_clone3
  437	n64	openat2				sys_openat2
  438	n64	pidfd_getfd			sys_pidfd_getfd
 -439	n64	watch_mount			sys_watch_mount
 -440	n64	watch_sb			sys_watch_sb
 -441	n64	fsinfo				sys_fsinfo
 +439	n64	faccessat2			sys_faccessat2
 +440	n64	watch_mount			sys_watch_mount
 +441	n64	watch_sb			sys_watch_sb
++442	n64	fsinfo				sys_fsinfo
diff --cc arch/mips/kernel/syscalls/syscall_o32.tbl
index f7404c028e03,1a3e8ed5e538..000000000000
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@@ -425,6 -425,6 +425,7 @@@
  435	o32	clone3				__sys_clone3
  437	o32	openat2				sys_openat2
  438	o32	pidfd_getfd			sys_pidfd_getfd
 -439	o32	watch_mount			sys_watch_mount
 -440	o32	watch_sb			sys_watch_sb
 -441	o32	fsinfo				sys_fsinfo
 +439	o32	faccessat2			sys_faccessat2
 +440	o32	watch_mount			sys_watch_mount
 +441	o32	watch_sb			sys_watch_sb
++442	o32	fsinfo				sys_fsinfo
diff --cc arch/parisc/kernel/syscalls/syscall.tbl
index 9841479242a5,2572c215d861..000000000000
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@@ -435,6 -435,6 +435,7 @@@
  435	common	clone3				sys_clone3_wrapper
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
++442	common	fsinfo				sys_fsinfo
diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index f74b23ba70b2,1f318c68048b..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -527,6 -527,6 +527,7 @@@
  435	spu	clone3				sys_ni_syscall
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
++442	common	fsinfo				sys_fsinfo
diff --cc arch/s390/kernel/syscalls/syscall.tbl
index 0e7fc0a9592b,ae4cefd3dd1b..000000000000
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@@ -440,6 -440,6 +440,7 @@@
  435  common	clone3			sys_clone3			sys_clone3
  437  common	openat2			sys_openat2			sys_openat2
  438  common	pidfd_getfd		sys_pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount		sys_watch_mount			sys_watch_mount
 -440	common	watch_sb		sys_watch_sb			sys_watch_sb
 -441  common	fsinfo			sys_fsinfo			sys_fsinfo
 +439  common	faccessat2		sys_faccessat2			sys_faccessat2
 +440	common	watch_mount		sys_watch_mount			sys_watch_mount
 +441	common	watch_sb		sys_watch_sb			sys_watch_sb
++442  common	fsinfo			sys_fsinfo			sys_fsinfo
diff --cc arch/sh/kernel/syscalls/syscall.tbl
index f283107b9d6b,05945b9aee4b..000000000000
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@@ -440,6 -440,6 +440,7 @@@
  # 435 reserved for clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
++442	common	fsinfo				sys_fsinfo
diff --cc arch/sparc/kernel/syscalls/syscall.tbl
index 408117c427bd,b71b34d4b45c..000000000000
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@@ -483,6 -483,6 +483,7 @@@
  # 435 reserved for clone3
  437	common	openat2			sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
++442	common	fsinfo				sys_fsinfo
diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index 41be37dcb8ea,e26b34e99850..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -442,6 -442,6 +442,7 @@@
  435	i386	clone3			sys_clone3
  437	i386	openat2			sys_openat2
  438	i386	pidfd_getfd		sys_pidfd_getfd
 -439	i386	watch_mount		sys_watch_mount
 -440	i386	watch_sb		sys_watch_sb
 -441	i386	fsinfo			sys_fsinfo
 +439	i386	faccessat2		sys_faccessat2
 +440	i386	watch_mount		sys_watch_mount
 +441	i386	watch_sb		sys_watch_sb
++442	i386	fsinfo			sys_fsinfo
diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index beb4e906f604,4578b3309c7f..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -359,9 -359,9 +359,10 @@@
  435	common	clone3			sys_clone3
  437	common	openat2			sys_openat2
  438	common	pidfd_getfd		sys_pidfd_getfd
 -439	common	watch_mount		sys_watch_mount
 -440	common	watch_sb		sys_watch_sb
 -441	common	fsinfo			sys_fsinfo
 +439	common	faccessat2		sys_faccessat2
 +440	common	watch_mount		sys_watch_mount
 +441	common	watch_sb		sys_watch_sb
++442	common	fsinfo			sys_fsinfo
 =20
  #
  # x32-specific system call numbers start at 512 to avoid cache impact
diff --cc arch/xtensa/kernel/syscalls/syscall.tbl
index c35d13531382,e1ec25099d10..000000000000
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@@ -408,6 -408,6 +408,7 @@@
  435	common	clone3				sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
++442	common	fsinfo				sys_fsinfo

--Sig_/IL.gFL_aoGg4qR7aGZ_Z6lN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6+a4YACgkQAVBC80lX
0GyQqQf+JpFPbbsvYTTwmhhtsuAzzfUU3IyIXVGSmx5D00bhpod5jE0dH8Uj9zWn
E+7PaapORQtOHsZBy4vGcdB1l0i8Qgx+GuGBt94X8nlWLDm3WFuJPijjjRB3387s
mzbARdjnA1lk4zc6aMDwyp0AQhDxq1zT1bFoFMjaNWhhH2Jn038sdRWk0ruMRYuN
fudZ2tb+pQgdWPpzccEQW9C+lRMr91Qyt3/05PS3avVuYD3swFmU4caC0UwwOwmg
VKVPEihuz/OAxtEMdxZgtJ0T5S3C+pUM4Q+N2nEQ6QhrN9QiB5cQ8snkhz9+LNN7
OO0TW+kePjO4pPlxgZw+dx7oq9NdtA==
=M4e9
-----END PGP SIGNATURE-----

--Sig_/IL.gFL_aoGg4qR7aGZ_Z6lN--
