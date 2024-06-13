Return-Path: <linux-next+bounces-2535-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C8906133
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 03:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04167B2255F
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 01:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92CB83CCC;
	Thu, 13 Jun 2024 01:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V462TnBh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2720183CBB;
	Thu, 13 Jun 2024 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718242971; cv=none; b=o7qSKmxLaniq6VUrh6IsIFTd7bTbRzhiz1xYIbt3UJhWwQQy6MdZ/MR+RdkTkT0C+NhJPRskQOfyRPEwiuAFtR3f1iSZAtf03E+6hkF7Qgl1ZpvxJjDvMo+WvAGr8lCM1rhWJfp+l2ASe742GTqyERofOAMVmkqOdJon/Vudj7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718242971; c=relaxed/simple;
	bh=5/+IrkgrhOmaGeVPdZOFOumO83cbV9KbZWwfFB9s9f0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hmdP1oHn6OkHA3pbT/zQ9FOSosCrMYREqohlxPBLVw1XdAlIZE+Vd3KkF8LhGguF2jtTubzvrS36xlxt+1TCUtPKCgptbBRXDxkxvWQ4xxsO8uLGE04l6kPoyqyrCc2Xs0TA+PJXk1nnByD7lA/T6Z5/q1TXrQIcm1Z31uUSCbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=V462TnBh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718242966;
	bh=qZu3S/2G+ssclBYZDuHdoHCD0A2B/XeDXD0CZyUPl/c=;
	h=Date:From:To:Cc:Subject:From;
	b=V462TnBhJ8uYTQKYyo2kspIokgluYpFHyYbznX1xHUBwPr7RiGXijqmMrGVnTas9J
	 aZOv45OTPUSsvI5SiKXechIkoWvn4wpcXzMbfU/VS5/5f8D6NqZgPdyRcZ/5ich/lb
	 EnrcCaX0pDrZrjzO8YC4a+MnbN7iRiLzzPXauw6Bw1KzdQnvlV1Xa1XxLYQEX7aTdG
	 UwUTEwcJQPGwX9AYs7IVHfkd1ovK25LiEzVQRMc/uab2Bl0Q5beGKSQrMAiyD5HWCR
	 tsjOH8T9/wkWYP8q9ru1icF3L3TmauQ4ze/FUFAR9XH7zJKjp+x2gOiP72udDhnjOK
	 4ocBL1J+5zWOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W04sx3P9Fz4wb1;
	Thu, 13 Jun 2024 11:42:44 +1000 (AEST)
Date: Thu, 13 Jun 2024 11:42:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Christian =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, Jiri Olsa
 <jolsa@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the vfs-brauner
 tree
Message-ID: <20240613114243.2a50059b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xF37dqulSIjQfCC/XcTfBBj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xF37dqulSIjQfCC/XcTfBBj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got conflicts in:

  arch/x86/entry/syscalls/syscall_64.tbl
  include/uapi/asm-generic/unistd.h

between commit:

  e6873349f700 ("fs/xattr: add *at family syscalls")

from the vfs-brauner tree and commit:

  190fec72df4a ("uprobe: Wire up uretprobe system call")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index 26af003921d2,6452c2ec469a..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -385,10 -384,7 +385,11 @@@
  460	common	lsm_set_self_attr	sys_lsm_set_self_attr
  461	common	lsm_list_modules	sys_lsm_list_modules
  462 	common  mseal			sys_mseal
 -463	64	uretprobe		sys_uretprobe
 +463	common	setxattrat		sys_setxattrat
 +464	common	getxattrat		sys_getxattrat
 +465	common	listxattrat		sys_listxattrat
 +466	common	removexattrat		sys_removexattrat
++467	64	uretprobe		sys_uretprobe
 =20
  #
  # Due to a historical design error, certain syscalls are numbered differe=
ntly
diff --cc include/uapi/asm-generic/unistd.h
index 5b8dab0b934e,2378f88d5ad4..000000000000
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@@ -845,17 -845,11 +845,20 @@@ __SYSCALL(__NR_lsm_list_modules, sys_ls
  #define __NR_mseal 462
  __SYSCALL(__NR_mseal, sys_mseal)
 =20
 -#define __NR_uretprobe 463
 +#define __NR_setxattrat 463
 +__SYSCALL(__NR_setxattrat, sys_setxattrat)
 +#define __NR_getxattrat 464
 +__SYSCALL(__NR_getxattrat, sys_getxattrat)
 +#define __NR_listxattrat 465
 +__SYSCALL(__NR_listxattrat, sys_listxattrat)
 +#define __NR_removexattrat 466
 +__SYSCALL(__NR_removexattrat, sys_removexattrat)
 +
++#define __NR_uretprobe 467
+ __SYSCALL(__NR_uretprobe, sys_uretprobe)
+=20
  #undef __NR_syscalls
- #define __NR_syscalls 467
 -#define __NR_syscalls 464
++#define __NR_syscalls 468
 =20
  /*
   * 32 bit systems traditionally used different

--Sig_/xF37dqulSIjQfCC/XcTfBBj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZqTpMACgkQAVBC80lX
0Gyxugf+OyoGzMPb40i+163XGdy4bk47x//dbm0++u5gjsfFmZto4qBgjQ8rGTB0
JCo/lp8T9JM9r9rI400qSijsFAaCWtoFzykWCyHFIaVhpO0+YK87NMeWUcRSt1qF
4NKgQr4wyGhpGLlNbsgvo9d7ybHVuQp3byOLo3zZ7xG0n0R+EcYXYaZDsNlk8T8o
6nP5gH7iquDmj9btE6qwaZPqnpGpaj7/Fhgd6sUddA5G+ZKt6ewSY0XY0LcQ33+0
lZ4Mr/4KHUF3r01dw0d6R3eGatbKyK3siv8y01duGCwPH7O2J06XIC4L4sR+AhNy
3pZuoW4qGYkpkJ+dGlfmNb7IeEavxg==
=8NEG
-----END PGP SIGNATURE-----

--Sig_/xF37dqulSIjQfCC/XcTfBBj--

