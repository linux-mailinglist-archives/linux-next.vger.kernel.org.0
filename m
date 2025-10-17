Return-Path: <linux-next+bounces-8612-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3C8BE9151
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 16:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E567189D654
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 14:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E5A346A0F;
	Fri, 17 Oct 2025 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIURILoV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2831A9F91;
	Fri, 17 Oct 2025 14:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760709713; cv=none; b=dmycha/FyE4POQDunG/gFB4Ck6qYSAbdlvXCdGseX3ryhrfTHiqflUK6oFT32RPrkIH6+BLp4kJw6b6dkxfgGxPQADxAhWUkn8RBX+0w7UBzdxnXWsOpamKgJHV/RId/pp6calk5aMauZZmsY91VJD5sGgw0G8IIQAAwcrFTOl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760709713; c=relaxed/simple;
	bh=kc8xRtJkps8tCAauU3vyANSScSBW+1iqhIXWrBYCRAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ywk09c9SCvswUZupsp17LNa2BsniCIk/pkGt7ycivXiO3kp/zZmppxk5+DjUJg8SHhXsBq/uBTpx0kbK4+CUDzUZcsNjGC5Qy9NKwLwY/lAIOfDniIRoNuRkt1D9rPJn2lh7Jwb6TvAkcXq6vgzshGIYau9pnUjsUdU6MXl2DXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIURILoV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1579AC4CEF9;
	Fri, 17 Oct 2025 14:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760709711;
	bh=kc8xRtJkps8tCAauU3vyANSScSBW+1iqhIXWrBYCRAE=;
	h=Date:From:To:Cc:Subject:From;
	b=IIURILoV6e8auvs3dkfssyPwrxPc5/Sa0g8PF+OFr5sMZ8ExUm1PUV5aXrpkTWBXc
	 1aafMLkSj1W0e94weEJJYpQncT7cfLbzeiMGgwvjDRfFlx/5u8G1992TyBE9EAbyjq
	 Zthrbde84J68GcrR4AK3geAXKKLVoyvqiEDq/oKn0OOvzgvhD+FlJ6q6gw9G9aNACl
	 lpDLJs/LgCR3VFsevI530RnJ2pUQFbfTwPFpYWiTL0ti8Bs5ZPPRyG0cAJMhChTpmr
	 ExxOLZcmIW6B1azDsBoJc6XoZ+I6Ijj6Cy9f7pQjj1bT1AA0x3hcY9RqQwSklL2xVR
	 BDynNp9z1AtTw==
Date: Fri, 17 Oct 2025 15:01:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linux Crypto List <linux-crypto@vger.kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the libcrypto tree with the crypto tree
Message-ID: <aPJMS2QN_Our8v2l@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jHxOnWdYjD7Fw44y"
Content-Disposition: inline


--jHxOnWdYjD7Fw44y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the libcrypto tree got a conflict in:

  arch/x86/crypto/aes-gcm-vaes-avx2.S

between commits:

  f6c31b7871903 ("crypto: x86/aes-gcm - add VAES+AVX2 optimized code")
  d4acd8519d2ad ("crypto: x86/aes-gcm - rename avx10 and avx10_512 to avx51=
2")

=66rom the crypto tree and commits:

  ae40f6df72d10 ("crypto: x86/aes-gcm - add VAES+AVX2 optimized code")
  9bc4bcca89e45 ("crypto: x86/aes-gcm - rename avx10 and avx10_512 to avx51=
2")

=66rom the libcrypto tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

(I'm not very confident of this resolution which was a bit bigger than
it looks from the diff below, I've no real idea about x86 assembly)

diff --cc arch/x86/crypto/aes-gcm-vaes-avx2.S
index 5ccbd85383cdd,d9754e683bde3..0000000000000
--- a/arch/x86/crypto/aes-gcm-vaes-avx2.S
+++ b/arch/x86/crypto/aes-gcm-vaes-avx2.S
@@@ -689,7 -687,7 +688,8 @@@ SYM_FUNC_END(aes_gcm_aad_update_vaes_av
  	.set	LE_CTR_PTR32,	%esi
  	.set	GHASH_ACC_PTR,	%rdx
  	.set	SRC,		%rcx	// Assumed to be %rcx.
 +					// See .Ltail_xor_and_ghash_partial_vec
+ 					// See .Ltail_xor_and_ghash_1to16bytes
  	.set	DST,		%r8
  	.set	DATALEN,	%r9d
  	.set	DATALEN64,	%r9	// Zero-extend DATALEN before using!

--jHxOnWdYjD7Fw44y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjyTEoACgkQJNaLcl1U
h9DMvggAguXrXYJP8UN/0659hMHmAWgGL8765wOsG+83Pax+i2C+8VSrklezuEg3
E0WkgO1vfu2OTLOYNERyBOVEjIyJDv9lCbJ1goQDZuN8W9tPYho55xFG3zL+xocV
Z3DadSp57mxgFmjOXeTeZCuoiBvt6BZ76PPEtxOWI/7cTwH2lIC/XgOLjc1/rkzN
oZmrDkkgdWI5OtdcRfBCHq717FOMY+aeh4q+5zG/Qr0Kn0dkssiWQst8+dCbIgpK
Yvz6uUikaKOoJ38jTBX4dkDtBEuCNnDwntB59d6tJRLlu4zJraY9dVbjq6m58sCW
e0brND751nFz50QsBaOdT06Rk+yoEQ==
=EGa+
-----END PGP SIGNATURE-----

--jHxOnWdYjD7Fw44y--

