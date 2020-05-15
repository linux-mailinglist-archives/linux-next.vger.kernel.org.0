Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7C61D4CA8
	for <lists+linux-next@lfdr.de>; Fri, 15 May 2020 13:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgEOLdx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 May 2020 07:33:53 -0400
Received: from ozlabs.org ([203.11.71.1]:44993 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725986AbgEOLdx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 May 2020 07:33:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49NmWc4xt8z9sT6;
        Fri, 15 May 2020 21:33:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589542429;
        bh=iq8qXFT+qZvopdlqiUZA2tdeLoPJoCZJzb4XY7DrskE=;
        h=Date:From:To:Cc:Subject:From;
        b=rgl7GK1J0LXbbRCxrGBWbbTSHkpTZUnQ+aFmyi3ZPVhkrcQdFffmKxIep9+74zdNM
         3vfXyv3ysS2sFTtLhV1yOD9FZH8DcE017afrtelonaq8qwVihsJg3U6dENiVGXt6rA
         XjWZdJPShjBTFwvc5G3KoHaIidUufjsrclkMw25NGWDNpB154G7D8z6+6mUz4E6fqU
         Mf2wwpFbmQt+Tq1C2p8l9zYOj2EUEgwMSWtp5WiQBtcUfCIkvqP2Fm5Hh8ZGCl0ekP
         4iVS/nmvZ6uu63JUplkvFFiTAJd4VzTKOfIxUkEGhk7xs0uty7vwC8xpgc2+WUwndW
         jVAB34m4E9LjQ==
Date:   Fri, 15 May 2020 21:33:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Minchan Kim <minchan@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Subject: linux-next: manual merge of the akpm tree with the vfs tree
Message-ID: <20200515213345.4e503778@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tij3mRIY.GS4Y=sJJUbFT3u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tij3mRIY.GS4Y=sJJUbFT3u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got conflicts in:

  arch/alpha/kernel/syscalls/syscall.tbl
  arch/arm/tools/syscall.tbl
  arch/arm64/include/asm/unistd.h
  arch/arm64/include/asm/unistd32.h
  arch/ia64/kernel/syscalls/syscall.tbl
  arch/m68k/kernel/syscalls/syscall.tbl
  arch/microblaze/kernel/syscalls/syscall.tbl
  arch/mips/kernel/syscalls/syscall_n32.tbl
  arch/mips/kernel/syscalls/syscall_n64.tbl
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

from the vfs tree and commit:

  b9b2aed54678 ("mm/madvise: introduce process_madvise() syscall: an extern=
al memory hinting API")

from the akpm tree.

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
index 598779a35e49,de8334404d5c..000000000000
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@@ -477,7 -477,7 +477,8 @@@
  # 545 reserved for clone3
  547	common	openat2				sys_openat2
  548	common	pidfd_getfd			sys_pidfd_getfd
 -549	common	watch_mount			sys_watch_mount
 -550	common	watch_sb			sys_watch_sb
 -551	common	fsinfo				sys_fsinfo
 -552	common	process_madvise			sys_process_madvise
 +549	common	faccessat2			sys_faccessat2
 +550	common	watch_mount			sys_watch_mount
 +551	common	watch_sb			sys_watch_sb
 +552	common	fsinfo				sys_fsinfo
++553	common	process_madvise			sys_process_madvise
diff --cc arch/arm/tools/syscall.tbl
index 7dd5907463ef,c7a6d0a7f718..000000000000
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@@ -451,7 -451,7 +451,8 @@@
  435	common	clone3				sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 -442	common	process_madvise			sys_process_madvise
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
 +442	common	fsinfo				sys_fsinfo
++443	common	process_madvise			sys_process_madvise
diff --cc arch/ia64/kernel/syscalls/syscall.tbl
index 457270289902,f256946d6396..000000000000
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@@ -358,7 -358,7 +358,8 @@@
  # 435 reserved for clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 -442	common	process_madvise			sys_process_madvise
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
 +442	common	fsinfo				sys_fsinfo
++443	common	process_madvise			sys_process_madvise
diff --cc arch/m68k/kernel/syscalls/syscall.tbl
index 86872b908471,01d17f551e44..000000000000
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@@ -437,7 -437,7 +437,8 @@@
  435	common	clone3				__sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 -442	common	process_madvise			sys_process_madvise
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
 +442	common	fsinfo				sys_fsinfo
++443	common	process_madvise			sys_process_madvise
diff --cc arch/microblaze/kernel/syscalls/syscall.tbl
index 11e1587078b3,907834833a08..000000000000
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@@ -443,7 -443,7 +443,8 @@@
  435	common	clone3				sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 -442	common	process_madvise			sys_process_madvise
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
 +442	common	fsinfo				sys_fsinfo
++443	common	process_madvise			sys_process_madvise
diff --cc arch/mips/kernel/syscalls/syscall_n32.tbl
index 3cde581d0cfb,d38cf3afb962..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@@ -376,7 -376,7 +376,8 @@@
  435	n32	clone3				__sys_clone3
  437	n32	openat2				sys_openat2
  438	n32	pidfd_getfd			sys_pidfd_getfd
 -439	n32	watch_mount			sys_watch_mount
 -440	n32	watch_sb			sys_watch_sb
 -441	n32	fsinfo				sys_fsinfo
 -442	n32	process_madvise			sys_process_madvise
 +439	n32	faccessat2			sys_faccessat2
 +440	n32	watch_mount			sys_watch_mount
 +441	n32	watch_sb			sys_watch_sb
 +442	n32	fsinfo				sys_fsinfo
++443	n32	process_madvise			sys_process_madvise
diff --cc arch/mips/kernel/syscalls/syscall_n64.tbl
index e0270d5700b5,e1135b54f429..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@@ -352,7 -352,7 +352,8 @@@
  435	n64	clone3				__sys_clone3
  437	n64	openat2				sys_openat2
  438	n64	pidfd_getfd			sys_pidfd_getfd
 -439	n64	watch_mount			sys_watch_mount
 -440	n64	watch_sb			sys_watch_sb
 -441	n64	fsinfo				sys_fsinfo
 -442	n64	process_madvise			sys_process_madvise
 +439	n64	faccessat2			sys_faccessat2
 +440	n64	watch_mount			sys_watch_mount
 +441	n64	watch_sb			sys_watch_sb
 +442	n64	fsinfo				sys_fsinfo
++443	n64	process_madvise			sys_process_madvise
diff --cc arch/parisc/kernel/syscalls/syscall.tbl
index 6e6b2114065f,ab98693b4a14..000000000000
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@@ -435,7 -435,7 +435,8 @@@
  435	common	clone3				sys_clone3_wrapper
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 -442	common	process_madvise			sys_process_madvise
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
 +442	common	fsinfo				sys_fsinfo
++443	common	process_madvise			sys_process_madvise
diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index 4dda0f1ce513,284a43fbf343..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -527,7 -527,7 +527,8 @@@
  435	spu	clone3				sys_ni_syscall
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 -442	common	process_madvise			sys_process_madvise
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
 +442	common	fsinfo				sys_fsinfo
++443	common	process_madvise			sys_process_madvise
diff --cc arch/s390/kernel/syscalls/syscall.tbl
index a750ad6821f1,67d3f7276bc1..000000000000
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@@ -440,7 -440,7 +440,8 @@@
  435  common	clone3			sys_clone3			sys_clone3
  437  common	openat2			sys_openat2			sys_openat2
  438  common	pidfd_getfd		sys_pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount		sys_watch_mount			sys_watch_mount
 -440	common	watch_sb		sys_watch_sb			sys_watch_sb
 -441  common	fsinfo			sys_fsinfo			sys_fsinfo
 -442  common	process_madvise		sys_process_madvise		sys_process_madvise
 +439  common	faccessat2		sys_faccessat2			sys_faccessat2
 +440	common	watch_mount		sys_watch_mount			sys_watch_mount
 +441	common	watch_sb		sys_watch_sb			sys_watch_sb
 +442  common	fsinfo			sys_fsinfo			sys_fsinfo
++443  common	process_madvise		sys_process_madvise		sys_process_madvise
diff --cc arch/sh/kernel/syscalls/syscall.tbl
index 4d7b900bb350,a1056f55d362..000000000000
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@@ -440,7 -440,7 +440,8 @@@
  # 435 reserved for clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 -442	common	process_madvise			sys_process_madvise
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
 +442	common	fsinfo				sys_fsinfo
++443	common	process_madvise			sys_process_madvise
diff --cc arch/sparc/kernel/syscalls/syscall.tbl
index 6b25b0a33834,a5753e45393e..000000000000
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@@ -483,7 -483,7 +483,8 @@@
  # 435 reserved for clone3
  437	common	openat2			sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 -442	common	process_madvise			sys_process_madvise
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
 +442	common	fsinfo				sys_fsinfo
++443	common	process_madvise			sys_process_madvise
diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index 65d3497d1eb8,698c661a0c3e..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -442,7 -442,7 +442,8 @@@
  435	i386	clone3			sys_clone3
  437	i386	openat2			sys_openat2
  438	i386	pidfd_getfd		sys_pidfd_getfd
 -439	i386	watch_mount		sys_watch_mount
 -440	i386	watch_sb		sys_watch_sb
 -441	i386	fsinfo			sys_fsinfo
 -442	i386	process_madvise		sys_process_madvise
 +439	i386	faccessat2		sys_faccessat2
 +440	i386	watch_mount		sys_watch_mount
 +441	i386	watch_sb		sys_watch_sb
 +442	i386	fsinfo			sys_fsinfo
++443	i386	process_madvise		sys_process_madvise
diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index 3100ed45b108,139ae65c6d75..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -359,10 -359,10 +359,11 @@@
  435	common	clone3			sys_clone3
  437	common	openat2			sys_openat2
  438	common	pidfd_getfd		sys_pidfd_getfd
 -439	common	watch_mount		sys_watch_mount
 -440	common	watch_sb		sys_watch_sb
 -441	common	fsinfo			sys_fsinfo
 -442	common	process_madvise		sys_process_madvise
 +439	common	faccessat2		sys_faccessat2
 +440	common	watch_mount		sys_watch_mount
 +441	common	watch_sb		sys_watch_sb
 +442	common	fsinfo			sys_fsinfo
++443	common	process_madvise		sys_process_madvise
 =20
  #
  # x32-specific system call numbers start at 512 to avoid cache impact
diff --cc arch/xtensa/kernel/syscalls/syscall.tbl
index fc382476421f,1727cf0243e0..000000000000
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@@ -408,7 -408,7 +408,8 @@@
  435	common	clone3				sys_clone3
  437	common	openat2				sys_openat2
  438	common	pidfd_getfd			sys_pidfd_getfd
 -439	common	watch_mount			sys_watch_mount
 -440	common	watch_sb			sys_watch_sb
 -441	common	fsinfo				sys_fsinfo
 -442	common	process_madvise			sys_process_madvise
 +439	common	faccessat2			sys_faccessat2
 +440	common	watch_mount			sys_watch_mount
 +441	common	watch_sb			sys_watch_sb
 +442	common	fsinfo				sys_fsinfo
++443	common	process_madvise			sys_process_madvise
diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unist=
d.h
index 949788f5ba40..d1f7d35f986e 100644
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@ -38,7 +38,7 @@
 #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
 #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
=20
-#define __NR_compat_syscalls		443
+#define __NR_compat_syscalls		444
 #endif
=20
 #define __ARCH_WANT_SYS_CLONE
diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/uni=
std32.h
index 13e2750e6f2e..95c37f111fd5 100644
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@ -891,7 +891,7 @@ __SYSCALL(__NR_watch_mount, sys_watch_mount)
 __SYSCALL(__NR_watch_sb, sys_watch_sb)
 #define __NR_fsinfo 442
 __SYSCALL(__NR_fsinfo, sys_fsinfo)
-#define __NR_process_madvise 442
+#define __NR_process_madvise 443
 __SYSCALL(__NR_process_madvise, process_madvise)
=20
 /*
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/u=
nistd.h
index 8b4432641ab2..5a4973137d8c 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -863,11 +863,11 @@ __SYSCALL(__NR_watch_mount, sys_watch_mount)
 __SYSCALL(__NR_watch_sb, sys_watch_sb)
 #define __NR_fsinfo 442
 __SYSCALL(__NR_fsinfo, sys_fsinfo)
-#define __NR_process_madvise 442
+#define __NR_process_madvise 443
 __SYSCALL(__NR_process_madvise, sys_process_madvise)
=20
 #undef __NR_syscalls
-#define __NR_syscalls 443
+#define __NR_syscalls 444
=20
 /*
  * 32 bit systems traditionally used different

--Sig_/tij3mRIY.GS4Y=sJJUbFT3u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6+fhkACgkQAVBC80lX
0GxPBwgAngX3OsQ9hJr1dLWy4WA1lVh/VvhChMcogXD/e9rAT3FQl1WXqIA2Oy0x
Qc1NDW9F/8U5jvnYgD0QhFDUM4ZNSI2sIm9WZXIDiW2OVgxHmjXGdcwyJQofvzHQ
Gcna87mJq1XJJT9FGVxCPaukUz9a2fDmy3l4UL23AZ7fWS6jzBrQCGR/KMTcq+MA
AnlLZqy7CueBFawKx/49mmF2ggsgXu3SA4yP284G4PbyGMiGoilqF66xnBwxkF6h
qn3zthJ7KCmCcqP4eeQu0BXcfH8KYaE9wpVOWWkxpHb6RiKGS6y2mzH5eVsab3XS
8eIS0/8JGdcIUTGsRtHToD0xPTy++g==
=Zx0m
-----END PGP SIGNATURE-----

--Sig_/tij3mRIY.GS4Y=sJJUbFT3u--
