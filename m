Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F46138A8A
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 06:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgAMFDD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 00:03:03 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33115 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725263AbgAMFDC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 00:03:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47x1gQ63hwz9sP6;
        Mon, 13 Jan 2020 16:02:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578891779;
        bh=KfV8PnwbCpXJ1YJLrzQAWbPYiu8XsdiL3qsRE4uT2/k=;
        h=Date:From:To:Cc:Subject:From;
        b=QlhxIU17tFmYdSBRDH7Uy4z5FHogu3NMfyzLxGwZxh4vP+0Jp9roPHbylXoxg3zRS
         lCPkTSaKvr053SUwLa9L/EPUir2czHOP/K86rwyIXKv6mQI9YBYEpjqTwDL8MYu1L4
         yKOLvR0/jBIJJhGOozGwkjEGImq0/D1gBrbOQ45diZ9x7R+fNszFN5Pr77PlBwdAom
         LBrTHq0X9vDLDtH92i2K9pXu8A+aQP8jenjJIcjXldB3Rc3SPELL7sytXFOeIlDkZq
         EJOuTGPwQvaDF5ec3yxyqCW37xfnPfcwKFdHj0cA8YDUAaZaNzMvCkQGVlVV1nKuPB
         ITYwPMvNeLqmw==
Date:   Mon, 13 Jan 2020 16:02:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Al Viro <viro@ZenIV.linux.org.uk>,
        David Howells <dhowells@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sargun Dhillon <sargun@sargun.me>,
        Aleksa Sarai <cyphar@cyphar.com>,
        Kars de Jong <jongk@linux-m68k.org>
Subject: linux-next: manual merge of the pidfd tree with the m68k, vfs and
 keys trees
Message-ID: <20200113160252.7003c102@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C3mY7wIq26haiVzoL+kT5wi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/C3mY7wIq26haiVzoL+kT5wi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got conflicts in:

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
  include/linux/syscalls.h
  include/uapi/asm-generic/unistd.h

between commits:

  e8bb2a2a1d51 ("m68k: Wire up clone3() syscall")
  0a51692d49ec ("open: introduce openat2(2) syscall")
  3a92c6e49c47 ("Add a general, global device notification watch list")

from the m68k, vfs and keys trees and commit:

  27063d9f5fbf ("arch: wire up pidfd_getfd syscall")

from the pidfd tree.

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
index e56950f23b49,82301080f5e7..000000000000
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@@ -475,5 -475,4 +475,6 @@@
  543	common	fspick				sys_fspick
  544	common	pidfd_open			sys_pidfd_open
  # 545 reserved for clone3
 +546	common	watch_devices			sys_watch_devices
 +547	common	openat2				sys_openat2
+ 548	common	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/arm/tools/syscall.tbl
index 7fb2f4d59210,ba045e2f3a60..000000000000
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@@ -449,5 -449,4 +449,6 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  435	common	clone3				sys_clone3
 +436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
+ 438	common	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/arm64/include/asm/unistd.h
index 0f255a23733d,b722e47377a5..000000000000
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
diff --cc arch/arm64/include/asm/unistd32.h
index 31f0ce25719e,a8da97a2de41..000000000000
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@@ -879,10 -879,8 +879,12 @@@ __SYSCALL(__NR_fspick, sys_fspick
  __SYSCALL(__NR_pidfd_open, sys_pidfd_open)
  #define __NR_clone3 435
  __SYSCALL(__NR_clone3, sys_clone3)
 +#define __NR_watch_devices 436
 +__SYSCALL(__NR_watch_devices, sys_watch_devices)
 +#define __NR_openat2 437
 +__SYSCALL(__NR_openat2, sys_openat2)
+ #define __NR_pidfd_getfd 438
+ __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
 =20
  /*
   * Please add new compat syscalls above this comment and update
diff --cc arch/ia64/kernel/syscalls/syscall.tbl
index b9aa59931905,2b11adfc860c..000000000000
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@@ -356,5 -356,4 +356,6 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  # 435 reserved for clone3
 +436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
+ 438	common	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/m68k/kernel/syscalls/syscall.tbl
index 7e6fd536e1ae,44e879e98459..000000000000
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@@ -434,6 -434,5 +434,7 @@@
  432	common	fsmount				sys_fsmount
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
 -# 435 reserved for clone3
 +435	common	clone3				__sys_clone3
 +436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
+ 438	common	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/microblaze/kernel/syscalls/syscall.tbl
index 544b4cef18b3,7afa00125cc4..000000000000
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@@ -441,5 -441,4 +441,6 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  435	common	clone3				sys_clone3
 +436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
+ 438	common	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/mips/kernel/syscalls/syscall_n32.tbl
index 05e8aee5dae7,856d5ba34461..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@@ -374,5 -374,4 +374,6 @@@
  433	n32	fspick				sys_fspick
  434	n32	pidfd_open			sys_pidfd_open
  435	n32	clone3				__sys_clone3
 +436	n32	watch_devices			sys_watch_devices
 +437	n32	openat2				sys_openat2
+ 438	n32	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/mips/kernel/syscalls/syscall_n64.tbl
index 24d6c01328fb,2db6075352f3..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@@ -350,5 -350,4 +350,6 @@@
  433	n64	fspick				sys_fspick
  434	n64	pidfd_open			sys_pidfd_open
  435	n64	clone3				__sys_clone3
 +436	n64	watch_devices			sys_watch_devices
 +437	n64	openat2				sys_openat2
+ 438	n64	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/mips/kernel/syscalls/syscall_o32.tbl
index 05579c1a9bec,e9f9d4a9b105..000000000000
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@@ -423,5 -423,4 +423,6 @@@
  433	o32	fspick				sys_fspick
  434	o32	pidfd_open			sys_pidfd_open
  435	o32	clone3				__sys_clone3
 +436	o32	watch_devices			sys_watch_devices
 +437	o32	openat2				sys_openat2
+ 438	o32	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/parisc/kernel/syscalls/syscall.tbl
index 4b5f77a4e1a2,c58c7eb144ca..000000000000
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@@ -433,5 -433,4 +433,6 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  435	common	clone3				sys_clone3_wrapper
 +436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
+ 438	common	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index 9716dc85a517,707609bfe3ea..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -517,5 -517,4 +517,6 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  435	nospu	clone3				ppc_clone3
 +436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
+ 438	common	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/s390/kernel/syscalls/syscall.tbl
index 7da330f8b03e,185cd624face..000000000000
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@@ -438,5 -438,4 +438,6 @@@
  433  common	fspick			sys_fspick			sys_fspick
  434  common	pidfd_open		sys_pidfd_open			sys_pidfd_open
  435  common	clone3			sys_clone3			sys_clone3
 +436  common	watch_devices		sys_watch_devices		sys_watch_devices
 +437  common	openat2			sys_openat2			sys_openat2
+ 438  common	pidfd_getfd		sys_pidfd_getfd			sys_pidfd_getfd
diff --cc arch/sh/kernel/syscalls/syscall.tbl
index bb7e68e25337,88f90895aad8..000000000000
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@@ -438,5 -438,4 +438,6 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  # 435 reserved for clone3
 +436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
+ 438	common	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/sparc/kernel/syscalls/syscall.tbl
index 646a1fad7218,218df6a2326e..000000000000
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@@ -481,5 -481,4 +481,6 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  # 435 reserved for clone3
 +436	common	watch_devices			sys_watch_devices
 +437	common	openat2			sys_openat2
+ 438	common	pidfd_getfd			sys_pidfd_getfd
diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index 57c53acee290,9c3101b65e0f..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -440,5 -440,4 +440,6 @@@
  433	i386	fspick			sys_fspick			__ia32_sys_fspick
  434	i386	pidfd_open		sys_pidfd_open			__ia32_sys_pidfd_open
  435	i386	clone3			sys_clone3			__ia32_sys_clone3
 +436	i386	watch_devices		sys_watch_devices		__ia32_sys_watch_devices
 +437	i386	openat2			sys_openat2			__ia32_sys_openat2
+ 438	i386	pidfd_getfd		sys_pidfd_getfd			__ia32_sys_pidfd_getfd
diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index 1dd8d21f6500,cef85db75a62..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -357,8 -357,7 +357,9 @@@
  433	common	fspick			__x64_sys_fspick
  434	common	pidfd_open		__x64_sys_pidfd_open
  435	common	clone3			__x64_sys_clone3/ptregs
 +436	common	watch_devices		__x64_sys_watch_devices
 +437	common	openat2			__x64_sys_openat2
+ 438	common	pidfd_getfd		__x64_sys_pidfd_getfd
 =20
  #
  # x32-specific system call numbers start at 512 to avoid cache impact
diff --cc arch/xtensa/kernel/syscalls/syscall.tbl
index 0f48ab7bd75b,ae15183def12..000000000000
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@@ -406,5 -406,4 +406,6 @@@
  433	common	fspick				sys_fspick
  434	common	pidfd_open			sys_pidfd_open
  435	common	clone3				sys_clone3
 +436	common	watch_devices			sys_watch_devices
 +437	common	openat2				sys_openat2
+ 438	common	pidfd_getfd			sys_pidfd_getfd
diff --cc include/linux/syscalls.h
index ce992e3d7378,8640af30c506..000000000000
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@@ -1002,7 -1000,7 +1002,8 @@@ asmlinkage long sys_fspick(int dfd, con
  asmlinkage long sys_pidfd_send_signal(int pidfd, int sig,
  				       siginfo_t __user *info,
  				       unsigned int flags);
 +asmlinkage long sys_watch_devices(int watch_fd, int watch_id, unsigned in=
t flags);
+ asmlinkage long sys_pidfd_getfd(int pidfd, int fd, unsigned int flags);
 =20
  /*
   * Architecture-specific system calls
diff --cc include/uapi/asm-generic/unistd.h
index 33f3856a9c3c,d36ec3d645bd..000000000000
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@@ -850,14 -850,11 +850,17 @@@ __SYSCALL(__NR_pidfd_open, sys_pidfd_op
  #define __NR_clone3 435
  __SYSCALL(__NR_clone3, sys_clone3)
  #endif
 +#define __NR_watch_devices 436
 +__SYSCALL(__NR_watch_devices, sys_watch_devices)
 +
 +#define __NR_openat2 437
 +__SYSCALL(__NR_openat2, sys_openat2)
 +
+ #define __NR_pidfd_getfd 438
+ __SYSCALL(__NR_pidfd_getfd, sys_pidfd_getfd)
+=20
  #undef __NR_syscalls
- #define __NR_syscalls 438
+ #define __NR_syscalls 439
 =20
  /*
   * 32 bit systems traditionally used different

--Sig_/C3mY7wIq26haiVzoL+kT5wi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4b+fwACgkQAVBC80lX
0GxqSwf/VFIEV6MIqtBbYkI8KJgzaCafK0fSkre0EfKOxupYY/iW6egEorzX04N1
hQ2PzK7bw8C2ctmUr2GvFph2cUAs3i9ah9qIY9rA4bmrEnW8K3nMAavT6VzZ5veE
0wgu+sttuZfEUxn+zfhW+aso8iIW0gqRmpCUgHQoOIlrJ+rj6ZdgUMFoDiiATCHU
X/Q11r4tRJnHbJOShYrfC/BXalyXbTh+pZpgePrlX79YLkTpGbbOP5SV2N0Hslru
KnkpLk+20WQw1XYOtyMA0LIZy3AP2iIROF6lKVxncACKK0qqZbix2cWda8eak67T
MVMvdBiEmr/vUgj2WilayRTRq5HPDw==
=aTDf
-----END PGP SIGNATURE-----

--Sig_/C3mY7wIq26haiVzoL+kT5wi--
