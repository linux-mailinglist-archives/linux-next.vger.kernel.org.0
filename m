Return-Path: <linux-next+bounces-6766-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE29AB6482
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 09:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14D4C3A6C74
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 07:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08D61A01CC;
	Wed, 14 May 2025 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ssgvie+x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A3F83A14;
	Wed, 14 May 2025 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208073; cv=none; b=kUt6CvZRGB7Wx2BW3e6eSI7cMLENR1J0eMQXsTsGir+rLHnkLMDYcDAbIZTfxNGwLFt6unVSxg3wKm7qLLmBDL/ez5GaCb7bdiyJNPKg3nmg91b4uM4n105AURPeDbDKgwEpzC6ZJyhHEyLlNiCe6ouAR6E859BeBFg0NW19GYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208073; c=relaxed/simple;
	bh=1fPyuyauk1pgRNVdupT2Cnzvfy5Mh/2cMTvRd1QTW9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oFtalLpQ2VFhu6c4tfb1scqwwih7Xaz71GvdwOyUWj7mld55nCUS9r7UvzC86c9TosFXyvMeC7EqZnjyT1beBoBrvxGRU4dt6INh3e7AUlcGJhyTkzuk5ZSQGHBMYN6vUwUmvl64GPje2SlH9Jw071Bg5b9WW8Gy5hBmLJayAeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ssgvie+x; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747208069;
	bh=coy3ztCvZ/pZuVDtfM2e7tBss37Rx2ZWnMlpNSu1YnA=;
	h=Date:From:To:Cc:Subject:From;
	b=Ssgvie+x1ZSqfIz0VCbCbSVh6aVva6VZLY3ale4r60bJSIff0/8Cj9MIkaG2mkJL/
	 2PNnX+juV1ij7bnv+ThWrQva5rz3nHnJyJxDSRl8pHMXPgqDoYIUaqKeb0gRObj+m6
	 1QC9tsjXPtaLxbWGQgGLtcG4/losnsTpFOUKYGYkAqX5ctWzf7y9yevmvlSxBFrQCH
	 LNmlcuYUtiIttc6yke0V4CPGSoq7NAqRO/Wha7Xqb2rsZV77/5NcU7srivZx1OR+b+
	 WNimzAKvUj2b7Uz2tAnzPp6A9SYf118o6a9a5f1tRVf//gnfRdullGc+i7rHWeOOTp
	 y8njgd0vOlfyA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zy4q956GZz4x3J;
	Wed, 14 May 2025 17:34:29 +1000 (AEST)
Date: Wed, 14 May 2025 17:34:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the gpio-brgl tree
Message-ID: <20250514173428.46a24083@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KiMyu2Eym.vjzFneRd2cCRT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KiMyu2Eym.vjzFneRd2cCRT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mfd tree as different commits
(but the same patches):

  81fec13be953 ("dt-bindings: mfd: Add max77759 binding")
  ee71546b8120 ("dt-bindings: nvmem: Add max77759 binding")
  190b565788ed ("dt-bindings: gpio: Add max77759 binding")

These are commits

  f63a2ff5372e ("dt-bindings: mfd: add max77759 binding")
  3f29432ca3d3 ("dt-bindings: nvmem: add max77759 binding")
  8ba821d3c314 ("dt-bindings: gpio: add max77759 binding")

in the mfd tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/KiMyu2Eym.vjzFneRd2cCRT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgkR4QACgkQAVBC80lX
0Gy51gf+IKb79Bd/K3T4MpPp9LeQLiqLLJkfcpy+2sCzA0dhbVKsIaX53wkmc2HL
J5SF4TROLakInUiJDmhcc41aUxkhubIvfY/PM61mdAa/xucnBWd77CwcqK5v7Wyd
3c5PGPiwrF/dMHgS0UZ0HCyPxu3uX0ua2LQ3BGEE/qIeHfmY1LbqvCbHX7SdfMwx
QLB7UL7jpq/Wz840eFFo+zDzQDX9fdM25bvp+j3Nc+YQehyZeXHuqH6iDr4Kh1Qr
jWm+Lrp+0t28bLuqbGv2h8x7VbuLwhknvCACPDZexz+keySuybRAJVWFZQH9TTb2
pYnMwTgjMTCk39JYlr3nYTqCfDwSbA==
=udeB
-----END PGP SIGNATURE-----

--Sig_/KiMyu2Eym.vjzFneRd2cCRT--

