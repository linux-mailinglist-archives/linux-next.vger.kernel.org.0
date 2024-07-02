Return-Path: <linux-next+bounces-2793-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271191EF8A
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 08:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77C9B1C23487
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 06:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC55146D73;
	Tue,  2 Jul 2024 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VLYV6tJN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3621B13CFA6;
	Tue,  2 Jul 2024 06:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719903368; cv=none; b=ASDXgQPIVzgXjq9BYXmdLm/cc4r/NHerIxiX/qdG5qjtP7Vtsr4+eBsXa7s7Y1iTx44XnP+FiztQ1mjJZz24ZyR892Z+swNalTQC+BYwxZLDzQ9398Mm3qUDUgdtrE/44F2PcBAjz/Qv6dr9T30OlY9mT9oo8J5o5zxrhowC/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719903368; c=relaxed/simple;
	bh=VJNWkYEBAyCyda5pajo8CFzuC+ooW/qtF4/MQMwlLxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W9Zf0wyyxDN2UNR93heyAx8d9AhWF/ciYMSfae4cL+wdxgGsUnwvQaYSme6xQRtFUIuCPro4ChzbmMMXm+eORhiyCyVtmG7XvO8aTXLiTKZHuceI4bTsQsVWtvdPWl/IeagjTKm7lsT/WhczdyK0RWEpIfLV46seAcEzZYoglis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VLYV6tJN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719903362;
	bh=KncjSA/3UBDmts6OtWhvo4vKVMISsKj0GGh746bz9MY=;
	h=Date:From:To:Cc:Subject:From;
	b=VLYV6tJNQYQns0+lJWg24yKqPhdXt4vNUStHGLeWlNApipgLW4XfekQFuxSy5hUvE
	 JO3oH1/DkSZUWtlwUdA93ZhHudhpkQs59TPOeFSFAaFI+16XSBSU6lJfS9lVC9lvPc
	 EFAn31ucQC9ywmIUlePnOuyZ4oA/9OqQlFHUo4OHtQEnye/TL92MwPeUv6RYlNKYdE
	 H0agJC4G5JggFZfEyCsWDu4ESMWr2wLwh60btGA2Ey6pAeC78KU6GWygyPOEymT5eP
	 8u4iz1+TWHy+a8y80AnFh7XD6o0BgwmfOAe07ZFB4MsSZTgjL9HkjvA4MOgLP4boNf
	 hNI1YBH3/r9SA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCtwf0zwyz4wny;
	Tue,  2 Jul 2024 16:56:02 +1000 (AEST)
Date: Tue, 2 Jul 2024 16:56:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Christian Brauner <brauner@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Christian =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, Jiri Olsa
 <jolsa@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the random tree with the vfs-brauner,
 ftrace trees
Message-ID: <20240702165601.08bb4545@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qBBRs7gO0BKNkyBbCA91t_D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qBBRs7gO0BKNkyBbCA91t_D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the random tree got conflicts in:

  arch/alpha/kernel/syscalls/syscall.tbl
  arch/arm/tools/syscall.tbl
  arch/arm64/include/asm/unistd.h
  arch/arm64/include/asm/unistd32.h
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

  e6873349f700 ("fs/xattr: add *at family syscalls")
  190fec72df4a ("uprobe: Wire up uretprobe system call")

from the vfs-brauner, ftrace trees and commit:

  4549ad25b76f ("arch: allocate vgetrandom_alloc() syscall number")

from the random tree.

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
index c59d53d6d3f3,8c38193bf86a..000000000000
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@@ -502,7 -502,4 +502,8 @@@
  570	common	lsm_set_self_attr		sys_lsm_set_self_attr
  571	common	lsm_list_modules		sys_lsm_list_modules
  572	common  mseal				sys_mseal
 -573	common	vgetrandom_alloc		sys_vgetrandom_alloc
 +573	common	setxattrat			sys_setxattrat
 +574	common	getxattrat			sys_getxattrat
 +575	common	listxattrat			sys_listxattrat
 +576	common	removexattrat			sys_removexattrat
++578	common	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/arm/tools/syscall.tbl
index 49eeb2ad8dbd,118e41178905..000000000000
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@@ -477,7 -476,4 +477,8 @@@
  460	common	lsm_set_self_attr		sys_lsm_set_self_attr
  461	common	lsm_list_modules		sys_lsm_list_modules
  462	common	mseal				sys_mseal
 -463	common	vgetrandom_alloc		sys_vgetrandom_alloc
 +463	common	setxattrat			sys_setxattrat
 +464	common	getxattrat			sys_getxattrat
 +465	common	listxattrat			sys_listxattrat
 +466	common	removexattrat			sys_removexattrat
++468	common	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/arm64/include/asm/unistd.h
index ad8afcad8516,6067f617273f..000000000000
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@@ -39,7 -39,7 +39,7 @@@
  #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
  #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
 =20
- #define __NR_compat_syscalls		467
 -#define __NR_compat_syscalls		464
++#define __NR_compat_syscalls		469
  #endif
 =20
  #define __ARCH_WANT_SYS_CLONE
diff --cc arch/arm64/include/asm/unistd32.h
index cff1ca302791,f7a45c1788b3..000000000000
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@@ -931,14 -931,8 +931,16 @@@ __SYSCALL(__NR_lsm_set_self_attr, sys_l
  __SYSCALL(__NR_lsm_list_modules, sys_lsm_list_modules)
  #define __NR_mseal 462
  __SYSCALL(__NR_mseal, sys_mseal)
 -#define __NR_vgetrandom_alloc 463
 +#define __NR_setxattrat 463
 +__SYSCALL(__NR_setxattrat, sys_setxattrat)
 +#define __NR_getxattrat 464
 +__SYSCALL(__NR_getxattrat, sys_getxattrat)
 +#define __NR_listxattrat 465
 +__SYSCALL(__NR_listxattrat, sys_listxattrat)
 +#define __NR_removexattrat 466
 +__SYSCALL(__NR_removexattrat, sys_removexattrat)
++#define __NR_vgetrandom_alloc 468
+ __SYSCALL(__NR_vgetrandom_alloc, sys_vgetrandom_alloc)
 =20
  /*
   * Please add new compat syscalls above this comment and update
diff --cc arch/m68k/kernel/syscalls/syscall.tbl
index f5ed71f1910d,bd919d1a8231..000000000000
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@@ -462,7 -462,4 +462,8 @@@
  460	common	lsm_set_self_attr		sys_lsm_set_self_attr
  461	common	lsm_list_modules		sys_lsm_list_modules
  462	common	mseal				sys_mseal
 -463	common	vgetrandom_alloc		sys_vgetrandom_alloc
 +463	common	setxattrat			sys_setxattrat
 +464	common	getxattrat			sys_getxattrat
 +465	common	listxattrat			sys_listxattrat
 +466	common	removexattrat			sys_removexattrat
++468	common	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/microblaze/kernel/syscalls/syscall.tbl
index 680f568b77f2,d3d3c017a5bb..000000000000
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@@ -468,7 -468,4 +468,8 @@@
  460	common	lsm_set_self_attr		sys_lsm_set_self_attr
  461	common	lsm_list_modules		sys_lsm_list_modules
  462	common	mseal				sys_mseal
 -463	common	vgetrandom_alloc		sys_vgetrandom_alloc
 +463	common	setxattrat			sys_setxattrat
 +464	common	getxattrat			sys_getxattrat
 +465	common	listxattrat			sys_listxattrat
 +466	common	removexattrat			sys_removexattrat
++468	common	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/mips/kernel/syscalls/syscall_n32.tbl
index 0b9b7e25b69a,502cedc0f84d..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@@ -401,7 -401,4 +401,8 @@@
  460	n32	lsm_set_self_attr		sys_lsm_set_self_attr
  461	n32	lsm_list_modules		sys_lsm_list_modules
  462	n32	mseal				sys_mseal
 -463	n32	vgetrandom_alloc		sys_vgetrandom_alloc
 +463	n32	setxattrat			sys_setxattrat
 +464	n32	getxattrat			sys_getxattrat
 +465	n32	listxattrat			sys_listxattrat
 +466	n32	removexattrat			sys_removexattrat
++468	n32	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/mips/kernel/syscalls/syscall_n64.tbl
index c844cd5cda62,33710f855c46..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@@ -377,7 -377,4 +377,8 @@@
  460	n64	lsm_set_self_attr		sys_lsm_set_self_attr
  461	n64	lsm_list_modules		sys_lsm_list_modules
  462	n64	mseal				sys_mseal
 -463	n64	vgetrandom_alloc		sys_vgetrandom_alloc
 +463	n64	setxattrat			sys_setxattrat
 +464	n64	getxattrat			sys_getxattrat
 +465	n64	listxattrat			sys_listxattrat
 +466	n64	removexattrat			sys_removexattrat
++468	n64	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/mips/kernel/syscalls/syscall_o32.tbl
index 349b8aad1159,f342d3f26396..000000000000
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@@ -450,7 -450,4 +450,8 @@@
  460	o32	lsm_set_self_attr		sys_lsm_set_self_attr
  461	o32	lsm_list_modules		sys_lsm_list_modules
  462	o32	mseal				sys_mseal
 -463	o32	vgetrandom_alloc		sys_vgetrandom_alloc
 +463	o32	setxattrat			sys_setxattrat
 +464	o32	getxattrat			sys_getxattrat
 +465	o32	listxattrat			sys_listxattrat
 +466	o32	removexattrat			sys_removexattrat
++468	o32	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/parisc/kernel/syscalls/syscall.tbl
index d9fc94c86965,cddae8bc6fd5..000000000000
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@@ -461,7 -461,4 +461,8 @@@
  460	common	lsm_set_self_attr		sys_lsm_set_self_attr
  461	common	lsm_list_modules		sys_lsm_list_modules
  462	common	mseal				sys_mseal
 -463	common	vgetrandom_alloc		sys_vgetrandom_alloc
 +463	common	setxattrat			sys_setxattrat
 +464	common	getxattrat			sys_getxattrat
 +465	common	listxattrat			sys_listxattrat
 +466	common	removexattrat			sys_removexattrat
++468	common	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
index d8b4ab78bef0,5c01ec49f510..000000000000
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@@ -553,7 -553,4 +553,8 @@@
  460	common	lsm_set_self_attr		sys_lsm_set_self_attr
  461	common	lsm_list_modules		sys_lsm_list_modules
  462	common	mseal				sys_mseal
 -463	common	vgetrandom_alloc		sys_vgetrandom_alloc
 +463	common	setxattrat			sys_setxattrat
 +464	common	getxattrat			sys_getxattrat
 +465	common	listxattrat			sys_listxattrat
 +466	common	removexattrat			sys_removexattrat
++468	common	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/s390/kernel/syscalls/syscall.tbl
index e9115b4d8b63,f5abf7e496ee..000000000000
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@@ -465,7 -465,4 +465,8 @@@
  460  common	lsm_set_self_attr	sys_lsm_set_self_attr		sys_lsm_set_self_attr
  461  common	lsm_list_modules	sys_lsm_list_modules		sys_lsm_list_modules
  462  common	mseal			sys_mseal			sys_mseal
 -463  common	vgetrandom_alloc	sys_vgetrandom_alloc		sys_vgetrandom_alloc
 +463  common	setxattrat		sys_setxattrat			sys_setxattrat
 +464  common	getxattrat		sys_getxattrat			sys_getxattrat
 +465  common	listxattrat		sys_listxattrat			sys_listxattrat
 +466  common	removexattrat		sys_removexattrat		sys_removexattrat
++468  common	vgetrandom_alloc	sys_vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/sh/kernel/syscalls/syscall.tbl
index c8cad33bf250,b911231478ee..000000000000
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@@ -466,7 -466,4 +466,8 @@@
  460	common	lsm_set_self_attr		sys_lsm_set_self_attr
  461	common	lsm_list_modules		sys_lsm_list_modules
  462	common	mseal				sys_mseal
 -463	common	vgetrandom_alloc		sys_vgetrandom_alloc
 +463	common	setxattrat			sys_setxattrat
 +464	common	getxattrat			sys_getxattrat
 +465	common	listxattrat			sys_listxattrat
 +466	common	removexattrat			sys_removexattrat
++468	common	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/sparc/kernel/syscalls/syscall.tbl
index 727f99d333b3,7578d0dee5b1..000000000000
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@@ -508,7 -508,4 +508,8 @@@
  460	common	lsm_set_self_attr		sys_lsm_set_self_attr
  461	common	lsm_list_modules		sys_lsm_list_modules
  462	common	mseal 				sys_mseal
 -463	common	vgetrandom_alloc		sys_vgetrandom_alloc
 +463	common	setxattrat			sys_setxattrat
 +464	common	getxattrat			sys_getxattrat
 +465	common	listxattrat			sys_listxattrat
 +466	common	removexattrat			sys_removexattrat
++468	common	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index 4d0fb2fba7e2,c4fc7c4f65c3..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -468,7 -467,4 +468,8 @@@
  460	i386	lsm_set_self_attr	sys_lsm_set_self_attr
  461	i386	lsm_list_modules	sys_lsm_list_modules
  462	i386	mseal 			sys_mseal
 -463	i386	vgetrandom_alloc	sys_vgetrandom_alloc
 +463	i386	setxattrat		sys_setxattrat
 +464	i386	getxattrat		sys_getxattrat
 +465	i386	listxattrat		sys_listxattrat
 +466	i386	removexattrat		sys_removexattrat
++468	i386	vgetrandom_alloc	sys_vgetrandom_alloc
diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index b1d45a7399a5,441443ba2ae6..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -385,11 -384,7 +385,12 @@@
  460	common	lsm_set_self_attr	sys_lsm_set_self_attr
  461	common	lsm_list_modules	sys_lsm_list_modules
  462 	common  mseal			sys_mseal
 -463	common	vgetrandom_alloc	sys_vgetrandom_alloc
 +463	common	setxattrat		sys_setxattrat
 +464	common	getxattrat		sys_getxattrat
 +465	common	listxattrat		sys_listxattrat
 +466	common	removexattrat		sys_removexattrat
 +467	64	uretprobe		sys_uretprobe
++468	common	vgetrandom_alloc	sys_vgetrandom_alloc
 =20
  #
  # Due to a historical design error, certain syscalls are numbered differe=
ntly
diff --cc arch/xtensa/kernel/syscalls/syscall.tbl
index 37effc1b134e,b9f64edd0b18..000000000000
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@@ -433,7 -433,4 +433,8 @@@
  460	common	lsm_set_self_attr		sys_lsm_set_self_attr
  461	common	lsm_list_modules		sys_lsm_list_modules
  462	common	mseal 				sys_mseal
 -463	common	vgetrandom_alloc		sys_vgetrandom_alloc
 +463	common	setxattrat			sys_setxattrat
 +464	common	getxattrat			sys_getxattrat
 +465	common	listxattrat			sys_listxattrat
 +466	common	removexattrat			sys_removexattrat
++468	common	vgetrandom_alloc		sys_vgetrandom_alloc
diff --cc include/uapi/asm-generic/unistd.h
index a48dcc83d289,57371c90dc13..000000000000
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@@ -845,20 -845,11 +845,23 @@@ __SYSCALL(__NR_lsm_list_modules, sys_ls
  #define __NR_mseal 462
  __SYSCALL(__NR_mseal, sys_mseal)
 =20
 -#define __NR_vgetrandom_alloc 463
 +#define __NR_setxattrat 463
 +__SYSCALL(__NR_setxattrat, sys_setxattrat)
 +#define __NR_getxattrat 464
 +__SYSCALL(__NR_getxattrat, sys_getxattrat)
 +#define __NR_listxattrat 465
 +__SYSCALL(__NR_listxattrat, sys_listxattrat)
 +#define __NR_removexattrat 466
 +__SYSCALL(__NR_removexattrat, sys_removexattrat)
 +
 +#define __NR_uretprobe 467
 +__SYSCALL(__NR_uretprobe, sys_uretprobe)
 +
++#define __NR_vgetrandom_alloc 468
+ __SYSCALL(__NR_vgetrandom_alloc, sys_vgetrandom_alloc)
+=20
  #undef __NR_syscalls
- #define __NR_syscalls 468
 -#define __NR_syscalls 464
++#define __NR_syscalls 469
 =20
  /*
   * 32 bit systems traditionally used different

--Sig_/qBBRs7gO0BKNkyBbCA91t_D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaDpIEACgkQAVBC80lX
0GyaRggAgHzIJMz1wlGmtK/9vO6yTbjch1hBTR9cRhJy4wASdayDb8ZbuCw40rWJ
UCB70b9Xv1hcGYlU02famfGHcG2VZJgdF/3Ui8trC62KM796z+KXTZ1QERkLgQqT
XY70enrcC6UH1SnVBS+y+tRw6eqrNuZuZcZlJVfE9nSBuZqa5x3zL286/fhxLUzm
9qhljexB0SPPZ3A0gWEk75NrYyt/+qh0z1uX3lYEUzBOOEjZ6zZuGP7/Ai1SBF9E
9Jl7S7pGg7VW0gHsWdcDAFogxtIixcdFG+OeUBC1r4ok89TVQWQtQHomK2V1kiaQ
djvSrPqG+SpAlnbyi/9BwKtc5hhHKg==
=UUUu
-----END PGP SIGNATURE-----

--Sig_/qBBRs7gO0BKNkyBbCA91t_D--

