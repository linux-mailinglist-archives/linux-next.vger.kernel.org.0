Return-Path: <linux-next+bounces-6522-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4693FAA9055
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 11:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5D291748E5
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 09:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593241F417E;
	Mon,  5 May 2025 09:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WQem0V/z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7036F4F1;
	Mon,  5 May 2025 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438936; cv=none; b=SFu82SgzJVdXIXWG1K/D8FM5SIHFIk5y0Ykex3lxc5xg0DtyiweaBGllqG6quUtNhbXsR4BQF7uTNMq4PEWTQxdJuVXBPd9giXH4EZHyqu2/J40cxCtIS7eUuRw5f2WROwCb119BVd9sGs8xOpg4uBDt7jlcrKLivBuauHTnk00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438936; c=relaxed/simple;
	bh=YCu1DVWXV15rZ391SGqEaLIhxhTxoTFgzak6kJEYabs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k5+x4LzEaXK2EX2PZzsKWDDUzdOySX9FGoUSHOqqIDJnq/XmYakXI0Of75YJQxicd5SbOL7cQUrBu8/8H6X4JzUJKOGJ13yOM6h9/NhrJjc7TnBDVQQ1wdrGZUTMiJLeyU5DwAOVc9PeIu/ThGPvo1634LUMnymrEHU2jpK9MGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WQem0V/z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746438928;
	bh=wClUWaY3Wl0XfzWjXcyW4fUNHnVCAUDtmE1qViFHSeo=;
	h=Date:From:To:Cc:Subject:From;
	b=WQem0V/zVd5kkKxFULGNe80jSGVBnX7hk1/y1cqy3s0RQoOY+Yg+EUPSwr1yvwiZa
	 vpxYc/RIaY+F0sX3Ct+kVSGyAqL4D7ERvmo/r9w9r9XihC2WcvfAHzD5VBZxvJPF7t
	 Sd77i+3QpZRHxkQtYpbpYHULE4px4n2MKZ9l5KfJDYomPasMnLeNrLsg6UA09yn63u
	 cGpz0JZFFh/ZDPbBXhpb3x0poIPKPgzIEHqhzuZ2CN1xIBSb43lpZie3n6e8P3NApV
	 X8atK5x90RQ1pJgjvNwM8/h6SeZ1Rp0n/wzYNjQLgbpHyb3om/42I0iwWz/UBtTx5L
	 vnWaUu7/KZhIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZrcN05cqsz4wyR;
	Mon,  5 May 2025 19:55:28 +1000 (AEST)
Date: Mon, 5 May 2025 19:55:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto List
 <linux-crypto@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the crypto tree
Message-ID: <20250505195527.4c4237c4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h9FYyv=y73CibUN15Xmcai=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/h9FYyv=y73CibUN15Xmcai=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  e4274cd4f727 ("crypto: hisilicon/qm - replace devm_kzalloc with devm_kcal=
loc")
  3f9ea3a5618e ("crypto: hisilicon/qm - remove sizeof(char)")
  7da3b0ff2af8 ("crypto: sun8i-ce-hash - use pm_runtime_resume_and_get()")
  2c870574fb94 ("crypto: sun8i-ce - undo runtime PM changes during driver r=
emoval")
  24418b58792a ("hwrng: rockchip - add support for RK3576's RNG")
  e511999438e1 ("dt-bindings: rng: rockchip,rk3588-rng: add rk3576-rng comp=
atible")
  13917ce458c7 ("crypto: rng - fix documentation for crypto_rng_alg()")
  c6527b8ca148 ("crypto: qat - add qat_6xxx driver")
  bed3233d9e4f ("crypto: qat - add firmware headers for GEN6 devices")
  4903f74450d1 ("crypto: qat - update firmware api")
  e9833be85348 ("crypto: qat - export adf_init_admin_pm()")
  a260a62349b0 ("crypto: qat - expose configuration functions")
  8e84a854176a ("crypto: qat - export adf_get_service_mask()")
  ff193f6c14e9 ("crypto: qat - add GEN6 firmware loader")
  c1e216382091 ("crypto: qat - refactor FW signing algorithm")
  25177bb3f705 ("crypto: qat - use pr_fmt() in qat uclo.c")
  5fc9923d1554 ("crypto: qat - refactor compression template logic")
  424b3c3cfbae ("crypto: qat - rename and relocate timer logic")
  9b6fc5b6e9c0 ("crypto: qat - include qat_common in top Makefile")
  f230dcfe428b ("crypto: lib/sha256 - improve function prototypes")
  e42b6c1e17cc ("crypto: sha256 - remove sha256_base.h")
  91c5c4bf145d ("crypto: x86/sha256 - implement library instead of shash")
  42802c7f8eff ("crypto: sparc/sha256 - implement library instead of shash")
  1a92dd688525 ("crypto: sparc - move opcodes.h into asm directory")
  d31058b2589f ("crypto: s390/sha256 - implement library instead of shash")
  fe11c8974fdc ("crypto: riscv/sha256 - implement library instead of shash")
  9d2b1924c137 ("crypto: powerpc/sha256 - implement library instead of shas=
h")
  19c9460ea05b ("crypto: mips/sha256 - implement library instead of shash")
  6df537365d25 ("crypto: arm64/sha256 - implement library instead of shash")
  4fcab0fbfd54 ("crypto: arm64/sha256 - remove obsolete chunking logic")
  7f4bd270972c ("crypto: arm/sha256 - implement library instead of shash")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/h9FYyv=y73CibUN15Xmcai=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgYiw8ACgkQAVBC80lX
0GxhAgf+KZPb3I3J+rquhpAlzHSkWwKvisIVeuvXDrrz8jU+tjXiliqSZwdMgKka
mQdvXnvhrtfrTQY6VZ7B6IZvFTaXwjQKXQeoE5f6L2thkAnXXrTCPVYWy2hEdGUl
/vFHKrVNPzqxRFALK51pW4SNMafvfQj/fn9OdgdUetd4CCAD1kOg2OtyNYgj0ezU
IVIgTjAnkLDdRA5s7XvkPA+lMRGu9EJdQr3Cxe+oV0iMoozznY6ZZAFMVO/mS5op
Z4wnMdgZ1H7Keb2/YMgJre+0MM/QcRB28SylnIqOtwLfOoZanWIzVHSQFBL0dCpJ
9wvpH8mm8c/b37T0JdP6P/uGRwgPjA==
=x2t4
-----END PGP SIGNATURE-----

--Sig_/h9FYyv=y73CibUN15Xmcai=--

