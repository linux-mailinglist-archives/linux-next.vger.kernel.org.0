Return-Path: <linux-next+bounces-7807-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B73FB17C34
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 06:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 227423AB2FD
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 04:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE5772608;
	Fri,  1 Aug 2025 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jct9z9CE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB77B26ACB;
	Fri,  1 Aug 2025 04:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754023554; cv=none; b=Kn2OWQgn6MTeKlSHDXARMGk5M5yIgyXfkDfVTlsabnmETbZDslhd9Wg9k1evqi+onKNznvvzFXZ6JszbAmhnQmZlL/Te8fDq1/TcWCBEGldEVRUjeWoHjIWlUFWIpThXeTJTrp3UJmRpQUNqohp0KACMl+3KNguyIpG7+77+LPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754023554; c=relaxed/simple;
	bh=wS3qXVBl1TnlKvUmfNqO7QY7qzTJu5AmJ9rdRICgcSs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObvBbFpHLfw8RkNz633tHJpaTDPJgo9MZvch2Ic+KigYaBGlo+oeuBocKKg7iyTYrCcayVDDWL7xyxkF1rc9wBESni80YtL8XrdBE18sufIsBe4ATwVbt3pd0HuwExiB401rvRA/Fzju6I75Bt9hvCTcbCSPbe2ZeNPvcJjc25M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jct9z9CE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754023321;
	bh=fkhHCdK4HiR7Xz21slquhjXKKWDj4oe/SSnEH9oOez8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jct9z9CEYAN+3paeexwh6FwUQAdaCQF1QGVYhg3/uJQVngLk5NCWJum3bmEcdNdjC
	 Viar22HTLlawHJK8L743jcudeeFe56V57Jv/zdxiipWALVOuxfm72owDdDkKz/Pxg+
	 dBFDRyFDBRRjPybwSS8UbPWUs32GFa3j1t8lLaiYm3Ex0dSF5LLUYqLZm+BV2Em0Oe
	 WCqLjyMcidg0JU+U/P02I2LGp8ddqz12vXgdt1TrMU+heuOBVn/Jx4e1I1VujbFK6t
	 TksEIxK7s+Mfgu3H7RWxcVbQGie+P2NDqFyCLjWuqT7Ne/+XsfjKV9jz1v/sEXGjyA
	 sH7anwpEsECjA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4btYFj17qmz4x6n;
	Fri,  1 Aug 2025 14:42:01 +1000 (AEST)
Date: Fri, 1 Aug 2025 14:45:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Ivan Lipski
 <ivan.lipski@amd.com>, Yihan Zhu <Yihan.Zhu@amd.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250801144550.1b14a990@canb.auug.org.au>
In-Reply-To: <20250716202831.68661f12@canb.auug.org.au>
References: <20250716202831.68661f12@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e_+2YNqVH1WsVRho1mKtAAU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e_+2YNqVH1WsVRho1mKtAAU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 16 Jul 2025 20:28:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/dc/dc.h:255: warning: Function parameter or s=
truct member 'num_rmcm_3dluts' not described in 'mpc_color_caps'
>=20
> Introduced by commit
>=20
>   26ad78fffc66 ("drm/amd/display: MPC basic allocation logic and TMZ")

I am still seeing that warning.  That commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/e_+2YNqVH1WsVRho1mKtAAU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiMRn4ACgkQAVBC80lX
0Gy6dwf/Tp/JPFHhy/e9RePtw9zOku/89/TZW2v+pWodAzI+94Re9pZ22inVZRJC
Wzc0tcbyR7E1fPfc/MIEcXz2OMqPtw68YJyvGn08d86ko9ehmudHPLu+/XLxhd3C
rF4Oz0kkLmOrwWuY7ZFgUyka1HnIjAkLgnXNmIunuv0UFe7scZgA/UQjB3efxRMJ
f2A6SzZGcyGnfq/LGOlGvkgvwih1rW/4w6Cq7jZmOcXwpEBJSZaCdRwoC/gGbw9f
nQ/PAX0UsCEYrJzm1Uu3T2A7/Kr5a0Cy2DDfjPgpf7bXn+Wd5mgjFS6Zh+7DD1XR
oxx4fE6qkPimmw1i3wMWEL5eOAeW3Q==
=RyOe
-----END PGP SIGNATURE-----

--Sig_/e_+2YNqVH1WsVRho1mKtAAU--

