Return-Path: <linux-next+bounces-3049-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E60E493359F
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 05:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A19842843AB
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 03:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F023D76;
	Wed, 17 Jul 2024 03:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KzDfdgSE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0301C20;
	Wed, 17 Jul 2024 03:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721186525; cv=none; b=EiwXSD8TCOLrOCUl41YiAMxSkGq6guWRImH6vjGJeVHIJ7beThsY8tOa5jrvLuQAOnYZjS5gUTLR8Q+HpmFVo2muiXG/0Ckj881dX2jHz+U/qXTGq7Fz+NNkAipw9uDWbZPpH/vqJFgYoFAueSYP8jtCuYV9Bg9mxJkLSHbyntE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721186525; c=relaxed/simple;
	bh=Lkqp5EmVAhz/4kd2vi6wPYvfUx55U+pEKgIA0ejI9BA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LK9HSfcLSmAKFw8JPnuAXE5VJ2PVXXcEt0fNlG74UI+xuqxwJ6+ibIWzDllEvX/TVagxwvyzpQQQBXUH2S/hRVwgaKF9h99TuQJpk+QJs19ebr5eZCOZQPJVIaEzvodjj3ozz/3ux0k2DYRHgAFoukRb5oV1Y02lOO4oQbIDkHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KzDfdgSE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721186518;
	bh=tNw4mW2cGpBsqPKedMxLYqg2C+khFbOaJmbGXw01mQs=;
	h=Date:From:To:Cc:Subject:From;
	b=KzDfdgSE2l7okt0djrlle2Xq5A/2bQNYPu2QE+BUL98uBoEnrdvOrc7wVfZD4/lId
	 BVMu9bj1DsZGeY90SQTZl9MHxn2IorIaSAsrjyKkty3DJTzFU+krjSLB97SZb6OcT3
	 +XtrjztZE+7gUKrLV0XooaMg2Eeu/h1IHQhcv3+B694EKnKWPgpHXTCl6fZJcollum
	 NFmXgwvBP6gHDgU/HKKdO6v43RF6IAMS4ss9xSd4EiZoodoC9KIaHE+jpTX8fmfR/A
	 Lkp5xDljnF72tNbdAsLOONv0YFFhHlW7zVhxoNoZD97MbHP/gpPNYFu47OqXh9nEiE
	 /o2pWgtGXYo/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WP1Sj4b08z4w2Q;
	Wed, 17 Jul 2024 13:21:56 +1000 (AEST)
Date: Wed, 17 Jul 2024 13:21:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Christian Brauner <brauner@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>
Cc: Christian =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, Jiri Olsa
 <jolsa@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the vfs-brauner
 tree
Message-ID: <20240717132155.6ca2ce47@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eDhu.cip=TtyAGE.x+c=tuP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eDhu.cip=TtyAGE.x+c=tuP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  arch/x86/entry/syscalls/syscall_64.tbl

between commit:

  e6873349f700 ("fs/xattr: add *at family syscalls")

from the vfs-brauner tree and commits:

  190fec72df4a ("uprobe: Wire up uretprobe system call")
  63ded110979b ("uprobe: Change uretprobe syscall scope and number")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I also added this patch due to commit (no in Linus' tree)

  4fe53bf2ba0a ("syscalls: add generic scripts/syscall.tbl")

rom: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 17 Jul 2024 13:15:32 +1000
Subject: [PATCH] fixup for "uprobe: Wire up uretprobe system call"

and "uprobe: Change uretprobe syscall scope and number"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 scripts/syscall.tbl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
index 86b53c7a815b..c792b08e594d 100644
--- a/scripts/syscall.tbl
+++ b/scripts/syscall.tbl
@@ -406,3 +406,4 @@
 464	common	getxattrat			sys_getxattrat
 465	common	listxattrat			sys_listxattrat
 466	common	removexattrat			sys_removexattrat
+467	common	uretprobe			sys_uretprobe
--=20
2.43.0


--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/entry/syscalls/syscall_64.tbl
index 623d954f3afb,dabf1982de6d..000000000000
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@@ -385,10 -384,7 +385,11 @@@
  460	common	lsm_set_self_attr	sys_lsm_set_self_attr
  461	common	lsm_list_modules	sys_lsm_list_modules
  462 	common  mseal			sys_mseal
 +463	common	setxattrat		sys_setxattrat
 +464	common	getxattrat		sys_getxattrat
 +465	common	listxattrat		sys_listxattrat
 +466	common	removexattrat		sys_removexattrat
+ 467	common	uretprobe		sys_uretprobe
 =20
  #
  # Due to a historical design error, certain syscalls are numbered differe=
ntly

--Sig_/eDhu.cip=TtyAGE.x+c=tuP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaXONMACgkQAVBC80lX
0GyYdwf0CVa7vGZq1Eg7vdsnima76sRnvVQ4xHCiGu0hj7S7ejnwbXXdrXrb0PH6
T87FAbo16TpzBZugHC0s7jaYb0PppQ9kaV+S6j5lmeAqv09QQvOD6dXDysQ2oVIw
v4L8hCSapriOyiBML/0ENxsV+b+zbQz0FHUu1L/xWe4T7SppjZAVDtk9j3xDyG6H
PcEE3xlw37VMH6dOY+u1PiBipaZLevTH3HXBLOi+5V3Qml8h0UBd+h+Mm7EDGeID
m2iA3pU8rA1TSn+4fhykLKYWy8FBzB5Z015QbneVNzhexsqhiCbxesqa0/wDlcqu
7PMPkB27YFo6JGEKeSX94YCayyNO
=9u3m
-----END PGP SIGNATURE-----

--Sig_/eDhu.cip=TtyAGE.x+c=tuP--

