Return-Path: <linux-next+bounces-2401-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFAE8D128A
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 05:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2A041F233A5
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 03:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2A32563;
	Tue, 28 May 2024 03:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kzUt2c7Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E91E182B3;
	Tue, 28 May 2024 03:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867070; cv=none; b=NQDPCZzvRz2TqgbYExDqTFdszGZ5dXOHPizHDQ5fKKWAFoMbjDOygmeBselmFBqg9wq+0KHyNvL1qwljHDcloH/pIwbKGnBXVk036L3ZtJMo+i1pLBmNcs3S2pduRMPBkGGWy8IfNhQpWjKl6MXshX2JIynYLGI+QMLZDL0QcP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867070; c=relaxed/simple;
	bh=cRuGbE2kT2DLy6FpG59pv2HQi8wldOlEGCVy5Bulv30=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u0cNlwB2RUwGUgc/EnJgg2XvFbN+KByd/RTiFs09vKVd2fLJnQE6STbeXAzPIMRLkH2BPNFfe1L8iTfdEs/flJ6G8EVWJpD54Zkg+MbIQ26aNVREZ/05XQ4vfWTLIQwrLStIsPPLwh7yg8RremmtOGSMjzVatDhTTrMMzFJQXRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kzUt2c7Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716867065;
	bh=a/YGT24DW2Pi0REejXJMP4A653WFoC6Gwpyt/TYyVec=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kzUt2c7Qj7o7lvSXSIwwY4S1xawKlORmlzRUONWQ7YB9OrJYF2AIGRkvkwHLGuH6E
	 YLDsU89ug632uky47hBeFX1HpyRecB+PFnGCUm15UPAYY5uRF2Xld0EFL0L9DDpmkP
	 xofeg1bm/d4SrnU7MNFx0DntHor9Z6NghLRDlPHJksVl00mBLSWLdxXf2ao7xWQK9V
	 nqREv9vQu6Wapa7/XDt5DFHgzK5dMr5VjE11oY5nit7rA2piRbxS+nqeF7ixHh1FRx
	 O6W6SgcS4LndHqlzsFokFAdG5RXzY5rclDzqpx4SUZZKMnjdlPLZP+Q+TYNbAD32/k
	 s5cGOnfjKCivw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VpJ2J4J9Qz4wyw;
	Tue, 28 May 2024 13:31:04 +1000 (AEST)
Date: Tue, 28 May 2024 13:31:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Christian =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, Arnd
 Bergmann <arnd@arndb.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240528133104.304a1261@canb.auug.org.au>
In-Reply-To: <20240528104905.58195cbe@canb.auug.org.au>
References: <20240528104905.58195cbe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z9bmRDdU.XvdNV.f=5KL.w4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/z9bmRDdU.XvdNV.f=5KL.w4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 28 May 2024 10:49:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the vfs-brauner tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> fs/xattr.c: In function '__do_sys_setxattrat':
> fs/xattr.c:709:61: warning: cast to pointer from integer of different siz=
e [-Wint-to-pointer-cast]
>   709 |         return do_setxattrat(dfd, pathname, at_flags, name, (cons=
t void __user *)args.value,
>       |                                                             ^
> fs/xattr.c: In function '__do_sys_getxattrat':
> fs/xattr.c:855:61: warning: cast to pointer from integer of different siz=
e [-Wint-to-pointer-cast]
>   855 |         return do_getxattrat(dfd, pathname, at_flags, name, (void=
 __user *)args.value, args.size);
>       |                                                             ^
>=20
> Introduced by commit
>=20
>   89345b0ac5ac ("fs/xattr: add *at family syscalls")

This became a build failure in the i386 defconfig build, so I applied
the following fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 28 May 2024 13:20:29 +1000
Subject: [PATCH] fix up for "fs/xattr: add *at family syscalls"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/xattr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/xattr.c b/fs/xattr.c
index 8e712795ab80..d0d54ae2f9cb 100644
--- a/fs/xattr.c
+++ b/fs/xattr.c
@@ -706,7 +706,8 @@ SYSCALL_DEFINE6(setxattrat, int, dfd, const char __user=
 *, pathname, unsigned in
 	if (error)
 		return error;
=20
-	return do_setxattrat(dfd, pathname, at_flags, name, (const void __user *)=
args.value,
+	return do_setxattrat(dfd, pathname, at_flags, name,
+			     (const void __user *)(unsigned long)args.value,
 			     args.size, args.flags);
 }
=20
@@ -852,7 +853,9 @@ SYSCALL_DEFINE6(getxattrat, int, dfd, const char __user=
 *, pathname, unsigned in
 	if (args.flags !=3D 0)
 		return -EINVAL;
=20
-	return do_getxattrat(dfd, pathname, at_flags, name, (void __user *)args.v=
alue, args.size);
+	return do_getxattrat(dfd, pathname, at_flags, name,
+			     (void __user *)(unsigned long)args.value,
+			     args.size);
 }
=20
 SYSCALL_DEFINE4(getxattr, const char __user *, pathname,
--=20
2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/z9bmRDdU.XvdNV.f=5KL.w4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZVT/gACgkQAVBC80lX
0GzHQgf+LlYQsQdZOQQJU/c8l/j4ESdIUDOyPxiFRKaDKphZWlADuvAE+RZ45UtG
Q499df8nTWl13lfZqZYyZ+hCB0E4OE4Ym+ErJT/3glvLphkerMJiQGZqNJneeNxN
6LEp1BGf1dBwIwEW4Ooy5AR9vgz6+aPd+S5Vj/2w8M+wRoaPmZbTv3+G2y268wng
ZUs/vLdjXBhZAL6RWjBIMItaexw5MgHAUVAtIQNBM8h1ALyFb9Sv3Zb5uznlTpvG
gcQy5rvuLy7GAQyBt9mfPUMns61q6xWIjVQZtaG2l+CxtXI7AJKxS2VAMgbdxHYI
I+lSIshVg0LX0cd9/QG/3PeaZyDxOA==
=+BTr
-----END PGP SIGNATURE-----

--Sig_/z9bmRDdU.XvdNV.f=5KL.w4--

