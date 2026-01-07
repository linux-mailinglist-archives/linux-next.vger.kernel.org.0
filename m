Return-Path: <linux-next+bounces-9566-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD3CFBA85
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 03:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C7DA3014AC2
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 02:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085AB1F8BD6;
	Wed,  7 Jan 2026 02:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CrpIyp1q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5957B79CD;
	Wed,  7 Jan 2026 02:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767751666; cv=none; b=hJDLAYzW/L0oXrvDR7tC/18eK/RYfJx069rmsLPjF6yi23MyaG45Xhi+NRFxSYAh6lURweEG70RW+CZKNGBzhck4jICZaiXwcl8IKC4OMYpE0KyJoo6OIBK5HR5GWaM7x/PRBbiI1s7bBn6YHU1DfuxBeC2QNBRR7qqi/OPthhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767751666; c=relaxed/simple;
	bh=vhguIardauXjFlC4vsBfp/FTq3ccPHvkdpSRinqaBpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HE3dKG94iOrET4CVU17Y4BVxSe+4tvtqEp0CM6PJ0FV+p6sJPg0Emax2b11DzEY6A5vu2Wk3m+N74wIrWjtGsaUWQSnKrVxNCifOBAHeWkJTzqnQ6O8EwESGdxICUtmQ14jyzzOXS4ZkSTz9QFLcd+NFUSuqZyfIrPiL3LKCcZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CrpIyp1q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767751660;
	bh=2Jb0BHn4abHwjtveo440TVHA+fBYH/uo+aaMEbzzC7o=;
	h=Date:From:To:Cc:Subject:From;
	b=CrpIyp1qtrPsY+ANwvJIytnq4IddC5LLh7+hBt25TnL6+RK5vo9ns5/g/dhYmFs6J
	 ISpwPw3uOe75M7UUow/7g2/kyo5Gy4qdcUV2AUxkOpN1BHKi3ki7teuLHM+J2YDm6j
	 51wsUnqdKLfh8ZxKc6kZhnqEOef3NOIGjkF2Y2K4Z9Zrdg1120VFja13hu15j75vBA
	 zIk8tbboEtm1iBxhukwQhNmF8hzWWAw33xdKKrW6sl3+wAh4aLg4/sWN3lYIeHIVNV
	 ahHw6bwLRucL0jJrGgdFlrKWe2oHZPhHHGpuFXZe5dDFAYrMYWPY3XqK6d6dEENoGu
	 iwzU1KqPSfT7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dmBJ95Y0Mz4wQy;
	Wed, 07 Jan 2026 13:07:37 +1100 (AEDT)
Date: Wed, 7 Jan 2026 13:07:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Marco Elver <elver@google.com>, Sergey
 Shtylyov <s.shtylyov@omp.ru>
Subject: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <20260107130736.22775042@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2n/TF5AFsW+K6zOTs0+69bi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2n/TF5AFsW+K6zOTs0+69bi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  crypto/drbg.c

between commits:

  6acd394367ab ("crypto: drbg - make drbg_fips_continuous_test() return boo=
l")
  c904e459cf73 ("crypto: drbg - make drbg_get_random_bytes() return *void*")

from the crypto tree and commit:

  dc36d55d4e72 ("crypto: Enable context analysis")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc crypto/drbg.c
index 9a2af599ead1,0a6f6c05a78f..000000000000
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@@ -226,16 -226,19 +226,17 @@@ static inline unsigned short drbg_sec_s
   * @entropy buffer of seed data to be checked
   *
   * return:
 - *	0 on success
 - *	-EAGAIN on when the CTRNG is not yet primed
 - *	< 0 on error
 + *	%true on success
 + *	%false when the CTRNG is not yet primed
   */
 -static int drbg_fips_continuous_test(struct drbg_state *drbg,
 -				     const unsigned char *entropy)
 +static bool drbg_fips_continuous_test(struct drbg_state *drbg,
 +				      const unsigned char *entropy)
+ 	__must_hold(&drbg->drbg_mutex)
  {
  	unsigned short entropylen =3D drbg_sec_strength(drbg->core->flags);
 -	int ret =3D 0;
 =20
  	if (!IS_ENABLED(CONFIG_CRYPTO_FIPS))
 -		return 0;
 +		return true;
 =20
  	/* skip test if we test the overall system */
  	if (list_empty(&drbg->test_data.list))
@@@ -842,13 -846,21 +843,14 @@@ static inline int __drbg_seed(struct dr
  	return ret;
  }
 =20
 -static inline int drbg_get_random_bytes(struct drbg_state *drbg,
 -					unsigned char *entropy,
 -					unsigned int entropylen)
 +static inline void drbg_get_random_bytes(struct drbg_state *drbg,
 +					 unsigned char *entropy,
 +					 unsigned int entropylen)
+ 	__must_hold(&drbg->drbg_mutex)
  {
 -	int ret;
 -
 -	do {
 +	do
  		get_random_bytes(entropy, entropylen);
 -		ret =3D drbg_fips_continuous_test(drbg, entropy);
 -		if (ret && ret !=3D -EAGAIN)
 -			return ret;
 -	} while (ret);
 -
 -	return 0;
 +	while (!drbg_fips_continuous_test(drbg, entropy));
  }
 =20
  static int drbg_seed_from_random(struct drbg_state *drbg)

--Sig_/2n/TF5AFsW+K6zOTs0+69bi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmldv+gACgkQAVBC80lX
0Gz6lQf+IToupxmXKxsZwoZfcFMcwSKCXxloFLZykjnwcNE5MQxBBvm80hZvRrOz
6IYOsqe2N4WPal/DqeZYNfrVqRXcdBpT5SAplD02giQjn/xoJvZM92Y0W4v6CnVT
/QkjE1Nz0sejpNul7z4JpoP/t2uzqS9gfj6jS2tTYzVc1YnLWEH2e5yD87XWOjPC
Flk3wiMGL52MwW+VQAme+MhXGwuITfRZMCaUGtHjhGNkX//UBdMLsoZyTxueYX4I
lSjAuA5Co8K7v3ru1MGlmTtxIM7UCXMhPothHrpwrtKp1B2/Jy6wNSZ5ff0yLhfp
c15VhhqGDlVl+Lwd2BEScNvVYAX52g==
=+HOx
-----END PGP SIGNATURE-----

--Sig_/2n/TF5AFsW+K6zOTs0+69bi--

