Return-Path: <linux-next+bounces-6953-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E8AC6088
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 05:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98F95189F2F7
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 03:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D791E1C22;
	Wed, 28 May 2025 03:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FN3Y0tJt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B7979FE;
	Wed, 28 May 2025 03:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748404581; cv=none; b=b+wo3zpyXht2pxDAirqmENE+ipN3odtnoBOoM/En7AdJmCSDkFzBw1Jnhbhwz72CDlLiD/00RO16uMfEgzAdpVJIVj2zyI42L3+EIQy4RZMv+i2pfJ21+Fa5s3qzVL3HGVOFU8tKA//lBoy8qkYN7A57lSNk4mxzrR1H4swCJiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748404581; c=relaxed/simple;
	bh=jL4VPElyTefmk4ZCL4VMvLlTjYydInTlUtnDRPmZCPk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y0/5A1z34W2Yk0+/vvzmz2lL9e0gUaukXxC3assMUghwJpUtHH/ixpOODdRsFYfh446BUVubCCUlgMCA8ke6vZbE9IElYXqWULYOvH4TSYmAQbrCvVu1gMWG9rAqbaOnZfy7RoH+2IVoh9iy4oECTi1GSpl3CjMKBFF8TUncUfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FN3Y0tJt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748404577;
	bh=rUoOsao8Qz143i7ETAaq8VYqNMJ3ULeqCMUNoMALvIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FN3Y0tJtmdMD6PUf+8AKXdf65u85qv41kN5XGcl5dGktHYS7Q7xBeCkGc4qfYLvzp
	 GnH2XXNn87li45dJKKSfZL2hgwZcnTKu/PnAaB/cpgHxaWuH1X1Iuw6oPLpRgFSg5s
	 1TjPEEcKA/AwaXlZjDyTYkycSRcFsXTKm7K+iDp3zCQ7zH4cgO96WQ1cMCxcljCuLb
	 WMK3ff/FeqWI2fjBgT2lQlvQf4ToRGikm2PIMIXNqyKylDcPi46Ai1XSv57dIIOl/P
	 vys4UTjE0t79AreFcV74+q9ptARqlpuszxekKMzZzmjkhrJYD/QEabC/tT5rGyIkIh
	 EQ9WVSmxFxzTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b6bJw4t0Wz4wcQ;
	Wed, 28 May 2025 13:56:16 +1000 (AEST)
Date: Wed, 28 May 2025 13:56:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Raju Rangoju <Raju.Rangoju@amd.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250528135616.6b14a725@canb.auug.org.au>
In-Reply-To: <20250514152318.52714b39@canb.auug.org.au>
References: <20250514152318.52714b39@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bGCc7O8++WWcF07aEOe8uzk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bGCc7O8++WWcF07aEOe8uzk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 14 May 2025 15:23:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> In file included from drivers/net/ethernet/amd/xgbe/xgbe-dev.c:18:
> drivers/net/ethernet/amd/xgbe/xgbe-smn.h:15:10: fatal error: asm/amd_nb.h=
: No such file or directory
>    15 | #include <asm/amd_nb.h>
>       |          ^~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   bcbb65559532 ("x86/platform/amd: Move the <asm/amd_nb.h> header to <asm=
/amd/nb.h>")
>=20
> interacting with commit
>=20
>   e49479f30ef9 ("amd-xgbe: add support for new XPCS routines")
>=20
> from the net-next tree.
>=20
> I have applied the following merge resolution for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 14 May 2025 14:49:31 +1000
> Subject: [PATCH] fix up for "x86/platform/amd: Move the <asm/amd_nb.h> he=
ader
>  to <asm/amd/nb.h>"
>=20
> interacting with "amd-xgbe: add support for new XPCS routines" from the
> net-next tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/net/ethernet/amd/xgbe/xgbe-smn.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-smn.h b/drivers/net/ether=
net/amd/xgbe/xgbe-smn.h
> index 3fd03d39c18a..c6ae127ced03 100644
> --- a/drivers/net/ethernet/amd/xgbe/xgbe-smn.h
> +++ b/drivers/net/ethernet/amd/xgbe/xgbe-smn.h
> @@ -12,7 +12,7 @@
> =20
>  #ifdef CONFIG_AMD_NB
> =20
> -#include <asm/amd_nb.h>
> +#include <asm/amd/nb.h>
> =20
>  #else
> =20
> --=20
> 2.47.2

This is now a semantic conflict between the net-next tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/bGCc7O8++WWcF07aEOe8uzk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg2iWAACgkQAVBC80lX
0Gx/Zgf9FNsF1UPfHTNvhtq4lZLTEkn1aO5FqB//Yy+JlUIgPdDrrdLk7VUZj4IV
pHt0SdsCqlTJkzcexZIZUAZzg2Fqnd4Xmfdv9QeQBkIL0bvPFTpmWBW3SwPYXIGo
nYvzr0jFbAUWH+aNZgMgr7trijSxUF/7EsYJZSfxo0iNjdvfG8hsh/pSePKP3ZeL
YSHe0DGfezMPs6q2CboyXU+Oov8Y4kD6hl3T2yc2aRXibR0je3cXN0zP+kG9Cbm/
haB4aAewmRHBGVlTCrNwfnXWwy3MsgfSER0DYxrlEq9WClrcz1QeME/5HCU9KSTY
7NdF4+Fe2vjbalE1rnwTZPCAV5ROpA==
=piY2
-----END PGP SIGNATURE-----

--Sig_/bGCc7O8++WWcF07aEOe8uzk--

