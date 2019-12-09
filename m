Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E83117B82
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 00:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfLIXeY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Dec 2019 18:34:24 -0500
Received: from ozlabs.org ([203.11.71.1]:59019 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbfLIXeY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Dec 2019 18:34:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Wzzt4sT0z9sPn;
        Tue, 10 Dec 2019 10:34:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575934460;
        bh=R2iFjfwyeVM89BlN1peFO3QlNhiPRKvGOt5rWuCpZrA=;
        h=Date:From:To:Cc:Subject:From;
        b=h6iF8qGNUEIzmNvYgNOupK+1tw9JrUnOt9o+3bnPyidQV/LkcGGkI9TOUGJ4s5iUr
         9vFjhGvLbhIXa8E+MEC346MVhEvCcSv9k0dXMCVNb0UOglhht5lO20FQB70HFDlHmU
         5veTNq6ip4r3lF7BBiqIZSUfkyy3rbat3XQUzgX7WiVYEQ4PzQaVrew1LXq/ERO72N
         S1Ug5f58jF9pgbmZI5g2hElr4yEAxCMQloolBAq0xgtQDakEnYBAFq8y+BlMAbboy5
         +dvX0pyZ14erD1XmXVcInOEPvDMaoVnY8DZl0uOQiibyIA6J0ZsAVGkba+o7nSp/2b
         GjDCUHiBVeF4A==
Date:   Tue, 10 Dec 2019 10:34:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the keys tree with the vfs tree
Message-ID: <20191210103417.5f73136f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4Jq7rURz6ZElyc40E5ssIqX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4Jq7rURz6ZElyc40E5ssIqX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the keys tree got conflicts in:

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

  0a51692d49ec ("open: introduce openat2(2) syscall")

from the vfs tree and commit:

  3a92c6e49c47 ("Add a general, global device notification watch list")

from the keys tree.

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
index 4d7f2ffa957c,8e841d8e4c22..000000000000
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@@ -475,4 -475,4 +475,5 @@@
  543	common	fspick				sys_fspick
  544	common	pidfd_open			sys_pidfd_open
  # 545 reserved for clone3
+ 546	common	watch_devices			sys_watch_devices
 +547	common	openat2				sys_openat2
diff --cc arch/arm/tools/syscall.tbl
index 4ba54bc7e19a,0f080cf44cc9..000000000000
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@@ -449,4 -449,4 +449,5 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  435	common	clone3				sys_clone3
+ 436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
diff --cc arch/arm64/include/asm/unistd.h
index 8aa00ccb0b96,368761302768..000000000000
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
diff --cc arch/arm64/include/asm/unistd32.h
index 57f6f592d460,b5310789ce7a..000000000000
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@@ -879,8 -879,8 +879,10 @@@ __SYSCALL(__NR_fspick, sys_fspick
  __SYSCALL(__NR_pidfd_open, sys_pidfd_open)
  #define __NR_clone3 435
  __SYSCALL(__NR_clone3, sys_clone3)
+ #define __NR_watch_devices 436
+ __SYSCALL(__NR_watch_devices, sys_watch_devices)
 +#define __NR_openat2 437
 +__SYSCALL(__NR_openat2, sys_openat2)
 =20
  /*
   * Please add new compat syscalls above this comment and update
diff --cc arch/ia64/kernel/syscalls/syscall.tbl
index 8d36f2e2dc89,2f33f5db2fed..000000000000
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@@ -356,4 -356,4 +356,5 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  # 435 reserved for clone3
+ 436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
diff --cc arch/m68k/kernel/syscalls/syscall.tbl
index 2559925f1924,83e4e8784b88..000000000000
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@@ -435,4 -435,4 +435,5 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  # 435 reserved for clone3
+ 436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
diff --cc arch/microblaze/kernel/syscalls/syscall.tbl
index c04385e60833,9a70a3be3b7b..000000000000
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@@ -441,4 -441,4 +441,5 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  435	common	clone3				sys_clone3
+ 436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
diff --cc arch/mips/kernel/syscalls/syscall_n32.tbl
index 68c9ec06851f,b39527fc32c9..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@@ -374,4 -374,4 +374,5 @@@
  433	n32	fspick				sys_fspick
  434	n32	pidfd_open			sys_pidfd_open
  435	n32	clone3				__sys_clone3
+ 436	n32	watch_devices			sys_watch_devices
 +437	n32	openat2				sys_openat2
diff --cc arch/mips/kernel/syscalls/syscall_n64.tbl
index 42a72d010050,a7f0c5e71768..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@@ -350,4 -350,4 +350,5 @@@
  433	n64	fspick				sys_fspick
  434	n64	pidfd_open			sys_pidfd_open
  435	n64	clone3				__sys_clone3
+ 436	n64	watch_devices			sys_watch_devices
 +437	n64	openat2				sys_openat2
diff --cc arch/mips/kernel/syscalls/syscall_o32.tbl
index f114c4aed0ed,6f378288598c..000000000000
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@@ -423,4 -423,4 +423,5 @@@
  433	o32	fspick				sys_fspick
  434	o32	pidfd_open			sys_pidfd_open
  435	o32	clone3				__sys_clone3
+ 436	o32	watch_devices			sys_watch_devices
 +437	o32	openat2				sys_openat2
diff --cc arch/parisc/kernel/syscalls/syscall.tbl
index b550ae9a7fea,b64bbafa5919..000000000000
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@@ -433,4 -433,4 +433,5 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  435	common	clone3				sys_clone3_wrapper
+ 436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index a8b5ecb5b602,0a503239ab5c..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -517,4 -517,4 +517,5 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  435	nospu	clone3				ppc_clone3
+ 436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
diff --cc arch/s390/kernel/syscalls/syscall.tbl
index 16b571c06161,19b43c0d928a..000000000000
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@@ -438,4 -438,4 +438,5 @@@
  433  common	fspick			sys_fspick			sys_fspick
  434  common	pidfd_open		sys_pidfd_open			sys_pidfd_open
  435  common	clone3			sys_clone3			sys_clone3
+ 436  common	watch_devices		sys_watch_devices		sys_watch_devices
 +437  common	openat2			sys_openat2			sys_openat2
diff --cc arch/sh/kernel/syscalls/syscall.tbl
index a7185cc18626,b454e07c9372..000000000000
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@@ -438,4 -438,4 +438,5 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  # 435 reserved for clone3
+ 436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
diff --cc arch/sparc/kernel/syscalls/syscall.tbl
index b11c19552022,8ef43c27457e..000000000000
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@@ -481,4 -481,4 +481,5 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  # 435 reserved for clone3
+ 436	common	watch_devices			sys_watch_devices
 +437	common	openat2			sys_openat2
diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index d22a8b5c3fab,9b225c0d5240..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -440,4 -440,4 +440,5 @@@
  433	i386	fspick			sys_fspick			__ia32_sys_fspick
  434	i386	pidfd_open		sys_pidfd_open			__ia32_sys_pidfd_open
  435	i386	clone3			sys_clone3			__ia32_sys_clone3
+ 436	i386	watch_devices		sys_watch_devices		__ia32_sys_watch_devices
 +437	i386	openat2			sys_openat2			__ia32_sys_openat2
diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index 9035647ef236,29293d103829..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -357,7 -357,7 +357,8 @@@
  433	common	fspick			__x64_sys_fspick
  434	common	pidfd_open		__x64_sys_pidfd_open
  435	common	clone3			__x64_sys_clone3/ptregs
+ 436	common	watch_devices		__x64_sys_watch_devices
 +437	common	openat2			__x64_sys_openat2
 =20
  #
  # x32-specific system call numbers start at 512 to avoid cache impact
diff --cc arch/xtensa/kernel/syscalls/syscall.tbl
index f0a68013c038,243fa18b8d1e..000000000000
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@@ -406,4 -406,4 +406,5 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  435	common	clone3				sys_clone3
+ 436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
diff --cc include/uapi/asm-generic/unistd.h
index d4122c091472,4794d3c2afd7..000000000000
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@@ -850,12 -850,11 +850,14 @@@ __SYSCALL(__NR_pidfd_open, sys_pidfd_op
  #define __NR_clone3 435
  __SYSCALL(__NR_clone3, sys_clone3)
  #endif
+ #define __NR_watch_devices 436
+ __SYSCALL(__NR_watch_devices, sys_watch_devices)
 =20
 +#define __NR_openat2 437
 +__SYSCALL(__NR_openat2, sys_openat2)
 +
  #undef __NR_syscalls
 -#define __NR_syscalls 437
 +#define __NR_syscalls 438
 =20
  /*
   * 32 bit systems traditionally used different

--Sig_/4Jq7rURz6ZElyc40E5ssIqX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3u2fkACgkQAVBC80lX
0GwRFwf9F7L0oNgZNsVah5DVcDv2TrCms71viVCMDZyFUb8FIepp/MGOkGJ2ZY/g
O+Q8qVQAiqQ4u5ZBprPMvonag8nX+eonn7Bnx+yAFl67aWAP76OWyuhqxbES8Hzy
YkcR3ZSAAYFX+KbUlPTk0iHoGes0+bPvmr5y2qm2FpL3me3GBclELV2zDsZVE20h
3zkQ7DqaN0Gqh0/qdzq2FgnuyiQIyNUaMx0GEalC09H2/kyEyBihAHs7daxTFCvY
11XjDOBXZq0E42djyJ/Y0MPL4g0QT4isJaxnvtcMtdgIG5jUR2mTnsy1mAdEIWI4
7FwHexTWlIaQ9qdbEACdlFmUJPHSdg==
=2xL5
-----END PGP SIGNATURE-----

--Sig_/4Jq7rURz6ZElyc40E5ssIqX--
