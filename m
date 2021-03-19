Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A645534153D
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 07:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233756AbhCSGGy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Mar 2021 02:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbhCSGGx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 Mar 2021 02:06:53 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268CCC06174A;
        Thu, 18 Mar 2021 23:06:53 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1th551p5z9sRR;
        Fri, 19 Mar 2021 17:06:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616134009;
        bh=eiVMt2M3R6q7YinzTkvUK/ofoiVrSkJARODUGtcdwEE=;
        h=Date:From:To:Cc:Subject:From;
        b=d5mZNoV/+X6afN8Gehi4MUW3YYv0eXoDrnyGn4iNQZS+zijbi31IkoOPotbxjAVxk
         +/HuqZ3iu4Vf80mXq30W00L1EL9yzi+xg7eDZI933+pkX5EOgi8ogsfrszZ2xueSqA
         Gt58LycHFlguWcgAwGYEuKk9iSlbCeNzPjAZg/kB5TFUcEo5dYV8Lre+O7ZijKQhDO
         zn3LLTFrqBhqtmbqUGEtKTV6N3iml26VNmPET2cYmmYV0hT2BQk7NSqs6JjiBLq/hU
         liWuYPr5vtNXWXyvbdj/6/qwVBPdwOVI4n3NX2DXhT9HhTQqCfFLCr89BrZdYwx2Z1
         OJ5uOR/pOCDYQ==
Date:   Fri, 19 Mar 2021 17:06:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        James Morris <jmorris@namei.org>
Cc:     James Morris <jamorris@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm tree with the security tree
Message-ID: <20210319170643.3dac3446@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iBe.hE=bXl5Uz2dlh4SkLpM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iBe.hE=bXl5Uz2dlh4SkLpM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the akpm tree got conflicts in:

  arch/x86/entry/syscalls/syscall_32.tbl
  arch/x86/entry/syscalls/syscall_64.tbl
  include/linux/syscalls.h
  include/uapi/asm-generic/unistd.h

between commit:

  c5eafae25eb5 ("landlock: Add syscall implementations")

from the security tree and patch:

  "arch, mm: wire up memfd_secret system call where relevant"

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

diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index 28a1423ce32e,524a076e79ca..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -448,6 -448,4 +448,7 @@@
  441	i386	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
  442	i386	mount_setattr		sys_mount_setattr
  443	i386	quotactl_path		sys_quotactl_path
 -444	i386	memfd_secret		sys_memfd_secret
 +444	i386	landlock_create_ruleset	sys_landlock_create_ruleset
 +445	i386	landlock_add_rule	sys_landlock_add_rule
 +446	i386	landlock_restrict_self	sys_landlock_restrict_self
++447	i386	memfd_secret		sys_memfd_secret
diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index ecd551b08d05,440467ca352d..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -365,9 -365,7 +365,10 @@@
  441	common	epoll_pwait2		sys_epoll_pwait2
  442	common	mount_setattr		sys_mount_setattr
  443	common	quotactl_path		sys_quotactl_path
 -444	common	memfd_secret		sys_memfd_secret
 +444	common	landlock_create_ruleset	sys_landlock_create_ruleset
 +445	common	landlock_add_rule	sys_landlock_add_rule
 +446	common	landlock_restrict_self	sys_landlock_restrict_self
++447	common	memfd_secret		sys_memfd_secret
 =20
  #
  # Due to a historical design error, certain syscalls are numbered differe=
ntly
diff --cc include/linux/syscalls.h
index 050511e8f1f8,019a1d876eb1..000000000000
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@@ -1045,11 -1043,7 +1045,12 @@@ asmlinkage long sys_pidfd_send_signal(i
  				       siginfo_t __user *info,
  				       unsigned int flags);
  asmlinkage long sys_pidfd_getfd(int pidfd, int fd, unsigned int flags);
 +asmlinkage long sys_landlock_create_ruleset(const struct landlock_ruleset=
_attr __user *attr,
 +		size_t size, __u32 flags);
 +asmlinkage long sys_landlock_add_rule(int ruleset_fd, enum landlock_rule_=
type rule_type,
 +		const void __user *rule_attr, __u32 flags);
 +asmlinkage long sys_landlock_restrict_self(int ruleset_fd, __u32 flags);
+ asmlinkage long sys_memfd_secret(unsigned long flags);
 =20
  /*
   * Architecture-specific system calls
diff --cc include/uapi/asm-generic/unistd.h
index 67093382a4e6,77d89b24341f..000000000000
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@@ -865,15 -865,13 +865,19 @@@ __SC_COMP(__NR_epoll_pwait2, sys_epoll_
  __SYSCALL(__NR_mount_setattr, sys_mount_setattr)
  #define __NR_quotactl_path 443
  __SYSCALL(__NR_quotactl_path, sys_quotactl_path)
 +#define __NR_landlock_create_ruleset 444
 +__SYSCALL(__NR_landlock_create_ruleset, sys_landlock_create_ruleset)
 +#define __NR_landlock_add_rule 445
 +__SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
 +#define __NR_landlock_restrict_self 446
 +__SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
+ #ifdef __ARCH_WANT_MEMFD_SECRET
 -#define __NR_memfd_secret 444
++#define __NR_memfd_secret 447
+ __SYSCALL(__NR_memfd_secret, sys_memfd_secret)
+ #endif
 =20
  #undef __NR_syscalls
- #define __NR_syscalls 447
 -#define __NR_syscalls 445
++#define __NR_syscalls 448
 =20
  /*
   * 32 bit systems traditionally used different

--Sig_/iBe.hE=bXl5Uz2dlh4SkLpM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBUP3MACgkQAVBC80lX
0GzQmwgApQOQLN4AC8PMlh11JAzm1DQrO9RmT+kWIc2oAm74EWzvHsKoM+tRm1+F
MfOMYIhUYTWeWcs8ow9YOPQ6tWlqInaIBS2uukfT8kysgu0M3lQx/ga2JmpLOR8X
Y6TNgjiYir3HG3Wo1tE3MxuABHu8G0IxyvAsxkAVGjgx5oNT0Syz3aCkdwkHZkXc
+8nJNmwjp1di+nmueVGcr3He0LlsJqm7X1RQvHm3c5NJ6xrZXrPPsLLoZNYE/e8P
he0+sLD0ICn3CihzrjR1x72W4mse6LisXg8L5tni8hF1IoAN3k2Y2dz5MvdtpUyO
2bx/qIf8rPzVZXS8HJxqx8dqwLPESA==
=e+to
-----END PGP SIGNATURE-----

--Sig_/iBe.hE=bXl5Uz2dlh4SkLpM--
