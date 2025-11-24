Return-Path: <linux-next+bounces-9168-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9C9C7EE6F
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 04:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B0164E2130
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 03:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40BE1EF36C;
	Mon, 24 Nov 2025 03:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kQrZOO0E"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2001D29A33E;
	Mon, 24 Nov 2025 03:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763955319; cv=none; b=qAsYpuYZgzreaPnEKi2C/0uOfnH8UqaiaNJgyFp3ZfJUqm+WnbUfebUl2eubLJFraJHiZ18W9cqnwlkCw7Wp6AjQ/rvunLDXnN0V9D/qthX+EpXDQGaCh+xRBQB/YvRqNgK5yRPS9KiEqgV5dTdmaNwfJySuUBHaVIfFkKfjItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763955319; c=relaxed/simple;
	bh=S9lFNJ9CfbrYR5YWVjIHQAMZV1e7dV+3Pb1JXw9jOE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iwTIGSLm5malORKg/2PGjrNfhfaEYohK19HVjjr35d5j9/jxd4wleGUdvvsXPZtXu1CApXQc00VQCfSG4djbUYCFRTnNodOfNHRqdsOeFYhVnsVWJgTA/XFy0NjyA6RaJia4ifBxhElN6U9Eg4Z5x57TAsbNSaV8W97ChjqazOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kQrZOO0E; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763955314;
	bh=ZQo6+GV86NUEzdDCnTQRDiAqq3DADF3mUe9iTWsCz3w=;
	h=Date:From:To:Cc:Subject:From;
	b=kQrZOO0EWN88xB4wxKoP9SelEiuY5zYqL7I1AlWCrWQg6mhJQORyTBG1he7znJ4ny
	 BPfqSJd4J/g3DDCRXV6IdSTPekk0B4UpbdX0PYk7FK9gsdsOH/5UECCUDsfZ8LyDOa
	 IsRJNC7aMQ4D64PeUIoNKLKmaIXVZgyeRrV/oQZw2+f8HnoX2vBTSrpQNhYLvEBt7N
	 Rm1VXGZ2cfL/SkYzSRmwUQYosfDljxvhQjky10xxB7C7yE6XanL5X8wnsoRxXRTsYD
	 FxuiD8eeX/iLG+/9uoXv7Ba6Dl6Q56NniBWVtlm9GWPwevrzElPoIqGUltTxHgNleQ
	 7IqVfdwRLtp0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFBKY3p30z4w8x;
	Mon, 24 Nov 2025 14:35:13 +1100 (AEDT)
Date: Mon, 24 Nov 2025 14:35:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the libcrypto tree with the crypto tree
Message-ID: <20251124143512.7e09c074@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b_tI+FK8DuxI0NP=T=sDvjz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/b_tI+FK8DuxI0NP=T=sDvjz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the libcrypto tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  c7dcb041ce7d ("crypto: ansi_cprng - Remove unused ansi_cprng algorithm")

from the crypto tree and commit:

  1e29a750572a ("lib/crypto: arm64/sha3: Migrate optimized code into librar=
y")

from the libcrypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/configs/defconfig
index ea054634d157,20dd3a39faea..000000000000
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@@ -1868,9 -1783,10 +1868,9 @@@ CONFIG_CRYPTO_CHACHA20=3D
  CONFIG_CRYPTO_BENCHMARK=3Dm
  CONFIG_CRYPTO_ECHAINIV=3Dy
  CONFIG_CRYPTO_MICHAEL_MIC=3Dm
+ CONFIG_CRYPTO_SHA3=3Dm
 -CONFIG_CRYPTO_ANSI_CPRNG=3Dy
  CONFIG_CRYPTO_USER_API_RNG=3Dm
  CONFIG_CRYPTO_GHASH_ARM64_CE=3Dy
- CONFIG_CRYPTO_SHA3_ARM64=3Dm
  CONFIG_CRYPTO_SM3_ARM64_CE=3Dm
  CONFIG_CRYPTO_AES_ARM64_CE_BLK=3Dy
  CONFIG_CRYPTO_AES_ARM64_BS=3Dm

--Sig_/b_tI+FK8DuxI0NP=T=sDvjz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkj0nAACgkQAVBC80lX
0GxNtwgAkm1YEwUL/hNqkyFxRs/yNaS3/6Cdz6R8d7sKaqC834SuMJEUF09TuDMg
nq7iWgpz5FY3U0mrqUXyLKq96vtLD3iWfpMFpSScA2UtpyNrLElSeXdYqM3XhaAz
Atpuvhyjew5dUJehXsoy4hFWwV1i+e0Istpu2CgGVprJ0lEYiSCCmu0BUAX7URC8
LIfmOR8rzerHam31vIvPcTmHLPrhJtBQBHvz39+2hz70Xxz6JGmOiXaDglXf+dSa
NESEyxm5fhh2dJremgBvoVwh4qPHjhOyYwLyT+DNYSx5O9vSfTFuPFcdORXgjklt
YjlpLGJBbepqWC/bQRkierEW4mLThg==
=USee
-----END PGP SIGNATURE-----

--Sig_/b_tI+FK8DuxI0NP=T=sDvjz--

