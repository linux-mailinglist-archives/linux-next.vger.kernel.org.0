Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA7B359412
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 06:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbhDIEkP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 00:40:15 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43199 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230375AbhDIEkO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Apr 2021 00:40:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGlmD2L50z9sWH;
        Fri,  9 Apr 2021 14:39:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617943198;
        bh=t+vdAvut94nV21OkGlsq38gpBXpVXVhVJI6Y8NGNC5Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=N6lmDJBLU5d+H2495lLQasKf2aqOMWv2O9hp8AiaaEeefi16Cdzw985HMJgVAnyw4
         wRv+9yESeyy/l8kKuHVYpdsglb2P00mzMQ3pd2Rz3kOZUotkwL1FUbxxxyTA924AV7
         QuvXnRz7r0u/4511TRGuiLZUQP+9qo1rVUaKmsxUeHlKIUu+4Bkad2WkDgYxqRinUk
         9ahSgFKyuMyzhKrmEzKj4004AHn0voLMNWBQJ7Sd9aEJvAHXF92xyTMwAKyyQUap0L
         lgDNjOkqy1rUiW0GDid+y/zuLkAdweDsJkLbxnu4BqKKCv+3RuDQpBre5Fuan4vq6Y
         ei4FD4PDOTkWA==
Date:   Fri, 9 Apr 2021 14:39:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>, Jan Kara <jack@suse.cz>
Cc:     James Morris <jamorris@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: linux-next: manual merge of the security tree with the ext3
 tree
Message-ID: <20210409143954.22329cfa@canb.auug.org.au>
In-Reply-To: <20210319130551.76ce2b8f@canb.auug.org.au>
References: <20210319130551.76ce2b8f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jIwcnALhWun5T_MjVd1jZXm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jIwcnALhWun5T_MjVd1jZXm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 19 Mar 2021 13:05:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the security tree got conflicts in:
>=20
>   arch/alpha/kernel/syscalls/syscall.tbl
>   arch/arm/tools/syscall.tbl
>   arch/arm64/include/asm/unistd.h
>   arch/arm64/include/asm/unistd32.h
>   arch/ia64/kernel/syscalls/syscall.tbl
>   arch/m68k/kernel/syscalls/syscall.tbl
>   arch/microblaze/kernel/syscalls/syscall.tbl
>   arch/mips/kernel/syscalls/syscall_n32.tbl
>   arch/mips/kernel/syscalls/syscall_n64.tbl
>   arch/mips/kernel/syscalls/syscall_o32.tbl
>   arch/parisc/kernel/syscalls/syscall.tbl
>   arch/powerpc/kernel/syscalls/syscall.tbl
>   arch/s390/kernel/syscalls/syscall.tbl
>   arch/sh/kernel/syscalls/syscall.tbl
>   arch/sparc/kernel/syscalls/syscall.tbl
>   arch/x86/entry/syscalls/syscall_32.tbl
>   arch/x86/entry/syscalls/syscall_64.tbl
>   arch/xtensa/kernel/syscalls/syscall.tbl
>   include/uapi/asm-generic/unistd.h
>=20
> between commit:
>=20
>   fa8b90070a80 ("quota: wire up quotactl_path")
>=20
> from the ext3 tree and commit:
>=20
>   818946f8b806 ("arch: Wire up Landlock syscalls")

This is now commit

  9fbebb70210a ("arch: Wire up Landlock syscalls")

> from the security tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution now looks like below (since the lanlock syscall number
have been updated).
--=20
Cheers,
Stephen Rothwell

diff --cc arch/alpha/kernel/syscalls/syscall.tbl
index c5f7e595adab,4240f21b10b3..000000000000
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@@ -482,4 -482,6 +482,7 @@@
  550	common	process_madvise			sys_process_madvise
  551	common	epoll_pwait2			sys_epoll_pwait2
  552	common	mount_setattr			sys_mount_setattr
 +553	common	quotactl_path			sys_quotactl_path
+ 554	common	landlock_create_ruleset		sys_landlock_create_ruleset
+ 555	common	landlock_add_rule		sys_landlock_add_rule
+ 556	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/arm/tools/syscall.tbl
index 90cbe207cf3e,161423a5d773..000000000000
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@@ -456,4 -456,6 +456,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 +443	common	quotactl_path			sys_quotactl_path
+ 444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	common	landlock_add_rule		sys_landlock_add_rule
+ 446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/arm64/include/asm/unistd.h
index d1f7d35f986e,727bfc3be99b..000000000000
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
diff --cc arch/arm64/include/asm/unistd32.h
index 8361c5138e5f,fdfe06bae3fc..000000000000
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@@ -893,8 -893,12 +893,14 @@@ __SYSCALL(__NR_process_madvise, sys_pro
  __SYSCALL(__NR_epoll_pwait2, compat_sys_epoll_pwait2)
  #define __NR_mount_setattr 442
  __SYSCALL(__NR_mount_setattr, sys_mount_setattr)
 +#define __NR_quotactl_path 443
 +__SYSCALL(__NR_quotactl_path, sys_quotactl_path)
+ #define __NR_landlock_create_ruleset 444
+ __SYSCALL(__NR_landlock_create_ruleset, sys_landlock_create_ruleset)
+ #define __NR_landlock_add_rule 445
+ __SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
+ #define __NR_landlock_restrict_self 446
+ __SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
 =20
  /*
   * Please add new compat syscalls above this comment and update
diff --cc arch/ia64/kernel/syscalls/syscall.tbl
index c072cd459bb5,48dbbc95a01f..000000000000
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@@ -363,4 -363,6 +363,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 +443	common	quotactl_path			sys_quotactl_path
+ 444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	common	landlock_add_rule		sys_landlock_add_rule
+ 446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/m68k/kernel/syscalls/syscall.tbl
index 5e9f81073ff4,595108bbbe42..000000000000
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@@ -442,4 -442,6 +442,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 +443	common	quotactl_path			sys_quotactl_path
+ 444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	common	landlock_add_rule		sys_landlock_add_rule
+ 446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/microblaze/kernel/syscalls/syscall.tbl
index 8e74d690c64d,db23d65871f9..000000000000
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@@ -448,4 -448,6 +448,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 +443	common	quotactl_path			sys_quotactl_path
+ 444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	common	landlock_add_rule		sys_landlock_add_rule
+ 446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/mips/kernel/syscalls/syscall_n32.tbl
index 6f397e56926f,5028839225fa..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@@ -381,4 -381,6 +381,7 @@@
  440	n32	process_madvise			sys_process_madvise
  441	n32	epoll_pwait2			compat_sys_epoll_pwait2
  442	n32	mount_setattr			sys_mount_setattr
 +443	n32	quotactl_path			sys_quotactl_path
+ 444	n32	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	n32	landlock_add_rule		sys_landlock_add_rule
+ 446	n32	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/mips/kernel/syscalls/syscall_n64.tbl
index ab85a357c4fa,ec9c68b75e23..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@@ -357,4 -357,6 +357,7 @@@
  440	n64	process_madvise			sys_process_madvise
  441	n64	epoll_pwait2			sys_epoll_pwait2
  442	n64	mount_setattr			sys_mount_setattr
 +443	n64	quotactl_path			sys_quotactl_path
+ 444	n64	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	n64	landlock_add_rule		sys_landlock_add_rule
+ 446	n64	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/mips/kernel/syscalls/syscall_o32.tbl
index 9c4cd2b40b38,24afd33e3e49..000000000000
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@@ -430,4 -430,6 +430,7 @@@
  440	o32	process_madvise			sys_process_madvise
  441	o32	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
  442	o32	mount_setattr			sys_mount_setattr
 +443	o32	quotactl_path			sys_quotactl_path
+ 444	o32	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	o32	landlock_add_rule		sys_landlock_add_rule
+ 446	o32	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/parisc/kernel/syscalls/syscall.tbl
index 80fba3f7d47b,8ddd0b82d767..000000000000
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@@ -440,4 -440,6 +440,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 +443	common	quotactl_path			sys_quotactl_path
+ 444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	common	landlock_add_rule		sys_landlock_add_rule
+ 446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index f66f9c9b9d6c,02150894b1cf..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -522,4 -522,6 +522,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 +443	common	quotactl_path			sys_quotactl_path
+ 444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	common	landlock_add_rule		sys_landlock_add_rule
+ 446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/s390/kernel/syscalls/syscall.tbl
index a421905c36e8,331663efd3e7..000000000000
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@@ -445,4 -445,6 +445,7 @@@
  440  common	process_madvise		sys_process_madvise		sys_process_madvise
  441  common	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
  442  common	mount_setattr		sys_mount_setattr		sys_mount_setattr
 +443  common	quotactl_path		sys_quotactl_path		sys_quotactl_path
+ 444  common	landlock_create_ruleset	sys_landlock_create_ruleset	sys_landl=
ock_create_ruleset
+ 445  common	landlock_add_rule	sys_landlock_add_rule		sys_landlock_add_rule
+ 446  common	landlock_restrict_self	sys_landlock_restrict_self	sys_landloc=
k_restrict_self
diff --cc arch/sh/kernel/syscalls/syscall.tbl
index f68517aaa4f1,6ada711f4b72..000000000000
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@@ -445,4 -445,6 +445,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 +443	common	quotactl_path			sys_quotactl_path
+ 444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	common	landlock_add_rule		sys_landlock_add_rule
+ 446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/sparc/kernel/syscalls/syscall.tbl
index 3ee82321504d,1dbe3239a638..000000000000
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@@ -488,4 -488,6 +488,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2		compat_sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 +443	common	quotactl_path			sys_quotactl_path
+ 444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	common	landlock_add_rule		sys_landlock_add_rule
+ 446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index f52a443eede0,782c310de1da..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -447,4 -447,6 +447,7 @@@
  440	i386	process_madvise		sys_process_madvise
  441	i386	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
  442	i386	mount_setattr		sys_mount_setattr
 +443	i386	quotactl_path		sys_quotactl_path
+ 444	i386	landlock_create_ruleset	sys_landlock_create_ruleset
+ 445	i386	landlock_add_rule	sys_landlock_add_rule
+ 446	i386	landlock_restrict_self	sys_landlock_restrict_self
diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index 7eb007b8cab5,8604ee4bfff9..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -364,7 -364,9 +364,10 @@@
  440	common	process_madvise		sys_process_madvise
  441	common	epoll_pwait2		sys_epoll_pwait2
  442	common	mount_setattr		sys_mount_setattr
 +443	common	quotactl_path		sys_quotactl_path
+ 444	common	landlock_create_ruleset	sys_landlock_create_ruleset
+ 445	common	landlock_add_rule	sys_landlock_add_rule
+ 446	common	landlock_restrict_self	sys_landlock_restrict_self
 =20
  #
  # Due to a historical design error, certain syscalls are numbered differe=
ntly
diff --cc arch/xtensa/kernel/syscalls/syscall.tbl
index c71cc45633de,2fad056a32e8..000000000000
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@@ -413,4 -413,6 +413,7 @@@
  440	common	process_madvise			sys_process_madvise
  441	common	epoll_pwait2			sys_epoll_pwait2
  442	common	mount_setattr			sys_mount_setattr
 +443	common	quotactl_path			sys_quotactl_path
+ 444	common	landlock_create_ruleset		sys_landlock_create_ruleset
+ 445	common	landlock_add_rule		sys_landlock_add_rule
+ 446	common	landlock_restrict_self		sys_landlock_restrict_self
diff --cc include/uapi/asm-generic/unistd.h
index 739c839d28fe,300608b05226..000000000000
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@@ -863,11 -863,15 +863,17 @@@ __SYSCALL(__NR_process_madvise, sys_pro
  __SC_COMP(__NR_epoll_pwait2, sys_epoll_pwait2, compat_sys_epoll_pwait2)
  #define __NR_mount_setattr 442
  __SYSCALL(__NR_mount_setattr, sys_mount_setattr)
 +#define __NR_quotactl_path 443
 +__SYSCALL(__NR_quotactl_path, sys_quotactl_path)
+ #define __NR_landlock_create_ruleset 444
+ __SYSCALL(__NR_landlock_create_ruleset, sys_landlock_create_ruleset)
+ #define __NR_landlock_add_rule 445
+ __SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
+ #define __NR_landlock_restrict_self 446
+ __SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
 =20
  #undef __NR_syscalls
- #define __NR_syscalls 444
+ #define __NR_syscalls 447
 =20
  /*
   * 32 bit systems traditionally used different

--Sig_/jIwcnALhWun5T_MjVd1jZXm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBv2poACgkQAVBC80lX
0GwtXAf/VxxBn+yxEso+1Ls1MBrUZ1oaHOnmzU1KGGWED5LkmWWBXQF7JujsLHmB
IMZPFCpYoy+DzcS4zlS0D5PD6RNrbhWk6ES3uRlVBtHk0iPxCRMLHsxnArgc3QV6
1WrI5pM69jNDCTggor6T1bC4vhkt8fUf8jp1BhSZM235mSmMj3oINWIL9oDp8Bbx
wXhHjU6FAlXqfnmKt8bazCiSF0UPgx4cZwGlustgW9o6ZoPwA8xKIzrYzfM+v1nV
Qsw+Q+L2BCEv+uK6tBDkj+qnkwE9WXOeuGhcHgQbUjlADcZfZPJ/WhBE7zgZWBwU
+5kK6J5sdxXTDDWt84CSV89dPWH0eA==
=hIOZ
-----END PGP SIGNATURE-----

--Sig_/jIwcnALhWun5T_MjVd1jZXm--
