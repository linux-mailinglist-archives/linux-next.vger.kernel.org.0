Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4384D34129A
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 03:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhCSCGZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 22:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbhCSCF5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 22:05:57 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C079C06174A;
        Thu, 18 Mar 2021 19:05:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1nL9290mz9sCD;
        Fri, 19 Mar 2021 13:05:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616119555;
        bh=oxc/z3/cLtYCdNTHl7G15s+v5oA6J/MydWnqd/w08wA=;
        h=Date:From:To:Cc:Subject:From;
        b=uOZFS+P1js2P77mPe+l7Bc/PLLguxBb9PmQ+2AJVZl1CfZK+ngmwu3qWe62cynD5S
         9nvf6MlGp09cV6jyKStrDgnEhMMljNGG9es/XEWoPZpv+qmzozbAThpN3NEdMYqqMf
         n6vVJlGxuLCscR+p71+XEkSHm7MQC+amuzMbz4JI1ss4GEcPzCViscnzNMFFQ24NQ4
         GeeWN916m+YHr5hRO6HyKUKHdTbJhaCN5w1CHD9rNXxldnOLt/NUKVHcMeMLbZUeaW
         wMWfzClanA4PkBUsXCMknTfaNFcGRKFmSBiSAlv1HRBYWiqkjKrqmiC3UAycQNUaIH
         qHvgKmIlEm1Gw==
Date:   Fri, 19 Mar 2021 13:05:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>, Jan Kara <jack@suse.cz>
Cc:     James Morris <jamorris@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: linux-next: manual merge of the security tree with the ext3 tree
Message-ID: <20210319130551.76ce2b8f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ArQLjobx4W6PpGQ3S1sugJ9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ArQLjobx4W6PpGQ3S1sugJ9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got conflicts in:

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

  fa8b90070a80 ("quota: wire up quotactl_path")

from the ext3 tree and commit:

  818946f8b806 ("arch: Wire up Landlock syscalls")

from the security tree.

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
index c5f7e595adab,0924a3ac7bd9..000000000000
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@@ -482,4 -482,6 +482,7 @@@
  550	common	process_madvise			sys_process_madvise
  551	common	epoll_pwait2			sys_epoll_pwait2
  552	common	mount_setattr			sys_mount_setattr
 -553	common	landlock_create_ruleset		sys_landlock_create_ruleset
 -554	common	landlock_add_rule		sys_landlock_add_rule
 -555	common	landlock_restrict_self		sys_landlock_restrict_self
 +553	common	quotactl_path			sys_quotactl_path
++554	common	landlock_create_ruleset		sys_landlock_create_ruleset
++555	common	landlock_add_rule		sys_landlock_add_rule
++556	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/arm/tools/syscall.tbl
index 90cbe207cf3e,dc1134b34cea..000000000000
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@@ -456,4 -456,6 +456,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 -443	common	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	common	landlock_add_rule		sys_landlock_add_rule
 -445	common	landlock_restrict_self		sys_landlock_restrict_self
 +443	common	quotactl_path			sys_quotactl_path
++444	common	landlock_create_ruleset		sys_landlock_create_ruleset
++445	common	landlock_add_rule		sys_landlock_add_rule
++446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/arm64/include/asm/unistd.h
index d1f7d35f986e,d1cc2849dc00..000000000000
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@@ -38,7 -38,7 +38,7 @@@
  #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
  #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
 =20
- #define __NR_compat_syscalls		444
 -#define __NR_compat_syscalls		446
++#define __NR_compat_syscalls		447
  #endif
 =20
  #define __ARCH_WANT_SYS_CLONE
diff --cc arch/arm64/include/asm/unistd32.h
index 8361c5138e5f,54e11bce7677..000000000000
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@@ -893,8 -893,12 +893,14 @@@ __SYSCALL(__NR_process_madvise, sys_pro
  __SYSCALL(__NR_epoll_pwait2, compat_sys_epoll_pwait2)
  #define __NR_mount_setattr 442
  __SYSCALL(__NR_mount_setattr, sys_mount_setattr)
 -#define __NR_landlock_create_ruleset 443
 +#define __NR_quotactl_path 443
 +__SYSCALL(__NR_quotactl_path, sys_quotactl_path)
++#define __NR_landlock_create_ruleset 444
+ __SYSCALL(__NR_landlock_create_ruleset, sys_landlock_create_ruleset)
 -#define __NR_landlock_add_rule 444
++#define __NR_landlock_add_rule 445
+ __SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
 -#define __NR_landlock_restrict_self 445
++#define __NR_landlock_restrict_self 446
+ __SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
 =20
  /*
   * Please add new compat syscalls above this comment and update
diff --cc arch/ia64/kernel/syscalls/syscall.tbl
index c072cd459bb5,1bb35159561a..000000000000
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@@ -363,4 -363,6 +363,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 -443	common	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	common	landlock_add_rule		sys_landlock_add_rule
 -445	common	landlock_restrict_self		sys_landlock_restrict_self
 +443	common	quotactl_path			sys_quotactl_path
++444	common	landlock_create_ruleset		sys_landlock_create_ruleset
++445	common	landlock_add_rule		sys_landlock_add_rule
++446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/m68k/kernel/syscalls/syscall.tbl
index 5e9f81073ff4,e06e224523bb..000000000000
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@@ -442,4 -442,6 +442,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 -443	common	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	common	landlock_add_rule		sys_landlock_add_rule
 -445	common	landlock_restrict_self		sys_landlock_restrict_self
 +443	common	quotactl_path			sys_quotactl_path
++444	common	landlock_create_ruleset		sys_landlock_create_ruleset
++445	common	landlock_add_rule		sys_landlock_add_rule
++446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/microblaze/kernel/syscalls/syscall.tbl
index 8e74d690c64d,9994a43eafb2..000000000000
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@@ -448,4 -448,6 +448,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 -443	common	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	common	landlock_add_rule		sys_landlock_add_rule
 -445	common	landlock_restrict_self		sys_landlock_restrict_self
 +443	common	quotactl_path			sys_quotactl_path
++444	common	landlock_create_ruleset		sys_landlock_create_ruleset
++445	common	landlock_add_rule		sys_landlock_add_rule
++446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/mips/kernel/syscalls/syscall_n32.tbl
index 6f397e56926f,834333d84d3e..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@@ -381,4 -381,6 +381,7 @@@
  440	n32	process_madvise			sys_process_madvise
  441	n32	epoll_pwait2			compat_sys_epoll_pwait2
  442	n32	mount_setattr			sys_mount_setattr
 -443	n32	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	n32	landlock_add_rule		sys_landlock_add_rule
 -445	n32	landlock_restrict_self		sys_landlock_restrict_self
 +443	n32	quotactl_path			sys_quotactl_path
++444	n32	landlock_create_ruleset		sys_landlock_create_ruleset
++445	n32	landlock_add_rule		sys_landlock_add_rule
++446	n32	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/mips/kernel/syscalls/syscall_n64.tbl
index ab85a357c4fa,935024e0f49b..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@@ -357,4 -357,6 +357,7 @@@
  440	n64	process_madvise			sys_process_madvise
  441	n64	epoll_pwait2			sys_epoll_pwait2
  442	n64	mount_setattr			sys_mount_setattr
 -443	n64	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	n64	landlock_add_rule		sys_landlock_add_rule
 -445	n64	landlock_restrict_self		sys_landlock_restrict_self
 +443	n64	quotactl_path			sys_quotactl_path
++444	n64	landlock_create_ruleset		sys_landlock_create_ruleset
++445	n64	landlock_add_rule		sys_landlock_add_rule
++446	n64	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/mips/kernel/syscalls/syscall_o32.tbl
index 9c4cd2b40b38,f3f8bea8ce99..000000000000
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@@ -430,4 -430,6 +430,7 @@@
  440	o32	process_madvise			sys_process_madvise
  441	o32	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
  442	o32	mount_setattr			sys_mount_setattr
 -443	o32	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	o32	landlock_add_rule		sys_landlock_add_rule
 -445	o32	landlock_restrict_self		sys_landlock_restrict_self
 +443	o32	quotactl_path			sys_quotactl_path
++444	o32	landlock_create_ruleset		sys_landlock_create_ruleset
++445	o32	landlock_add_rule		sys_landlock_add_rule
++446	o32	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/parisc/kernel/syscalls/syscall.tbl
index 80fba3f7d47b,1bddfeffdebd..000000000000
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@@ -440,4 -440,6 +440,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 -443	common	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	common	landlock_add_rule		sys_landlock_add_rule
 -445	common	landlock_restrict_self		sys_landlock_restrict_self
 +443	common	quotactl_path			sys_quotactl_path
++444	common	landlock_create_ruleset		sys_landlock_create_ruleset
++445	common	landlock_add_rule		sys_landlock_add_rule
++446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index f66f9c9b9d6c,98548b8da879..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -522,4 -522,6 +522,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 -443	common	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	common	landlock_add_rule		sys_landlock_add_rule
 -445	common	landlock_restrict_self		sys_landlock_restrict_self
 +443	common	quotactl_path			sys_quotactl_path
++444	common	landlock_create_ruleset		sys_landlock_create_ruleset
++445	common	landlock_add_rule		sys_landlock_add_rule
++446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/s390/kernel/syscalls/syscall.tbl
index a421905c36e8,ecb697fee2f3..000000000000
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@@ -445,4 -445,6 +445,7 @@@
  440  common	process_madvise		sys_process_madvise		sys_process_madvise
  441  common	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
  442  common	mount_setattr		sys_mount_setattr		sys_mount_setattr
 -443  common	landlock_create_ruleset	sys_landlock_create_ruleset	sys_landl=
ock_create_ruleset
 -444  common	landlock_add_rule	sys_landlock_add_rule		sys_landlock_add_rule
 -445  common	landlock_restrict_self	sys_landlock_restrict_self	sys_landloc=
k_restrict_self
 +443  common	quotactl_path		sys_quotactl_path		sys_quotactl_path
++444  common	landlock_create_ruleset	sys_landlock_create_ruleset	sys_landl=
ock_create_ruleset
++445  common	landlock_add_rule	sys_landlock_add_rule		sys_landlock_add_rule
++446  common	landlock_restrict_self	sys_landlock_restrict_self	sys_landloc=
k_restrict_self
diff --cc arch/sh/kernel/syscalls/syscall.tbl
index f68517aaa4f1,440c053eada5..000000000000
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@@ -445,4 -445,6 +445,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 -443	common	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	common	landlock_add_rule		sys_landlock_add_rule
 -445	common	landlock_restrict_self		sys_landlock_restrict_self
 +443	common	quotactl_path			sys_quotactl_path
++444	common	landlock_create_ruleset		sys_landlock_create_ruleset
++445	common	landlock_add_rule		sys_landlock_add_rule
++446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/sparc/kernel/syscalls/syscall.tbl
index 3ee82321504d,f5f5d165c8c1..000000000000
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@@ -488,4 -488,6 +488,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 -443	common	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	common	landlock_add_rule		sys_landlock_add_rule
 -445	common	landlock_restrict_self		sys_landlock_restrict_self
 +443	common	quotactl_path			sys_quotactl_path
++444	common	landlock_create_ruleset		sys_landlock_create_ruleset
++445	common	landlock_add_rule		sys_landlock_add_rule
++446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index f52a443eede0,995dc5b46dfc..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -447,4 -447,6 +447,7 @@@
  440	i386	process_madvise		sys_process_madvise
  441	i386	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
  442	i386	mount_setattr		sys_mount_setattr
 -443	i386	landlock_create_ruleset	sys_landlock_create_ruleset
 -444	i386	landlock_add_rule	sys_landlock_add_rule
 -445	i386	landlock_restrict_self	sys_landlock_restrict_self
 +443	i386	quotactl_path		sys_quotactl_path
++444	i386	landlock_create_ruleset	sys_landlock_create_ruleset
++445	i386	landlock_add_rule	sys_landlock_add_rule
++446	i386	landlock_restrict_self	sys_landlock_restrict_self
diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index 7eb007b8cab5,a5207ee2b67b..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -364,7 -364,9 +364,10 @@@
  440	common	process_madvise		sys_process_madvise
  441	common	epoll_pwait2		sys_epoll_pwait2
  442	common	mount_setattr		sys_mount_setattr
 -443	common	landlock_create_ruleset	sys_landlock_create_ruleset
 -444	common	landlock_add_rule	sys_landlock_add_rule
 -445	common	landlock_restrict_self	sys_landlock_restrict_self
 +443	common	quotactl_path		sys_quotactl_path
++444	common	landlock_create_ruleset	sys_landlock_create_ruleset
++445	common	landlock_add_rule	sys_landlock_add_rule
++446	common	landlock_restrict_self	sys_landlock_restrict_self
 =20
  #
  # Due to a historical design error, certain syscalls are numbered differe=
ntly
diff --cc arch/xtensa/kernel/syscalls/syscall.tbl
index c71cc45633de,b43b96a862cd..000000000000
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@@ -413,4 -413,6 +413,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 -443	common	landlock_create_ruleset		sys_landlock_create_ruleset
 -444	common	landlock_add_rule		sys_landlock_add_rule
 -445	common	landlock_restrict_self		sys_landlock_restrict_self
 +443	common	quotactl_path			sys_quotactl_path
++444	common	landlock_create_ruleset		sys_landlock_create_ruleset
++445	common	landlock_add_rule		sys_landlock_add_rule
++446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc include/uapi/asm-generic/unistd.h
index 739c839d28fe,02d8d7804a29..000000000000
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@@ -863,11 -863,15 +863,17 @@@ __SYSCALL(__NR_process_madvise, sys_pro
  __SC_COMP(__NR_epoll_pwait2, sys_epoll_pwait2, compat_sys_epoll_pwait2)
  #define __NR_mount_setattr 442
  __SYSCALL(__NR_mount_setattr, sys_mount_setattr)
 -#define __NR_landlock_create_ruleset 443
 +#define __NR_quotactl_path 443
 +__SYSCALL(__NR_quotactl_path, sys_quotactl_path)
++#define __NR_landlock_create_ruleset 444
+ __SYSCALL(__NR_landlock_create_ruleset, sys_landlock_create_ruleset)
 -#define __NR_landlock_add_rule 444
++#define __NR_landlock_add_rule 445
+ __SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
 -#define __NR_landlock_restrict_self 445
++#define __NR_landlock_restrict_self 446
+ __SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
 =20
  #undef __NR_syscalls
- #define __NR_syscalls 444
 -#define __NR_syscalls 446
++#define __NR_syscalls 447
 =20
  /*
   * 32 bit systems traditionally used different

--Sig_/ArQLjobx4W6PpGQ3S1sugJ9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBUBv8ACgkQAVBC80lX
0GwOTAf2L6I2Dnpgw4IcVGEWIgA1TEbqmUF20QIuWfiGyZl5L650ZDWRfgWxzMEk
CAVYotOjjfe9RzNMs79B724YnoH5mjNmNFS+nwPBExbd78yOVIfE0PyGZFszzNhK
86E9ztpSdpNNA+fbqDhcyKL6WZC4YltVC8ml4hafukkfmr+khTa6e/W7x5G9YnVo
Er+veIJY/MLtPDHpsU8lQqCm03dZ3RGCYZe4xM6DsnQm5EKFyiX4bN+S8jPTbEAC
jOL8GEDLefH9/ZZZejWdzHVn+xWzApGEjQ0YV084mBe0n/D0lKaSkyg4HxnSlpJO
N52ChDt5fAX29Yt3MoH0Wm60lk67
=G+kT
-----END PGP SIGNATURE-----

--Sig_/ArQLjobx4W6PpGQ3S1sugJ9--
