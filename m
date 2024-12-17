Return-Path: <linux-next+bounces-4979-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A34B9F3EEA
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 01:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7783D16E1DA
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 00:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3989C45BEC;
	Tue, 17 Dec 2024 00:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="T23qSbCK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5378A12E5B;
	Tue, 17 Dec 2024 00:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734395999; cv=none; b=H9wv8/O36KR5vzKMcHjT+MrHzLnPK20pMaH9WwQF3kx2em9bm2m+uPZLFj2m1wuJ49l5dswkUrXtQrLB5ch97pTQrpevk0SXco9h9E/hi8K+aC031h963eE2DCGSLFuKHX01IeM7Xw6JaUSekAd+bvHwjhmbY93VAFQmkDtHfXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734395999; c=relaxed/simple;
	bh=axG5ZnrBvV+bCXWM2zhn9qzR1RyHszeUyJgoS3ylD08=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q9un+JrghNwsBGglAzTwDw6IKEAeib5dyFjR62x/s3Ys98AJr+euRRrkuN94ZiIK6GJJMOOPSoirGoAc17xyfCxiJG52ZdMUDV9xRouvIbxASRv0Ihke0ZEYujC3mJXX8YELoHzfQjBJR9m9jxnUTRlD8k5J+aCdYnaSVTqF7Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=T23qSbCK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734395983;
	bh=axG5ZnrBvV+bCXWM2zhn9qzR1RyHszeUyJgoS3ylD08=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T23qSbCKTg5HKmhJrrlVsvNAYZFsqdtGLNXAPaPQghQolGi7BDCQaSXr7UsbNEGat
	 +JMEXu9/F8dZbri4giw/ILZr7Zqxq55xD2ndp9N3AIsZTpAoQuHbbr/bTrE1ZRa5vD
	 DMIKqhiES6R0mD79dJlRfzmZMz7DZTllQpLUoWFf1jmeEVFnbkM6FJNLq7CJOpL96s
	 d+iFPmdahsdF19R0N+ATN3VNbwnNb5ksPMniP8Ku74x+xL485yVeAmmuOa9rNwkWpK
	 ZPiKWWQhBz4ehWSLKuvh/RUkBasr4WAn/PT0rDgS7FQH2olmjppc9LRTlW4DKHIVSh
	 K1Tw6n09hygIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBycv2Lvtz4wnx;
	Tue, 17 Dec 2024 11:39:43 +1100 (AEDT)
Date: Tue, 17 Dec 2024 11:39:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnaldo Carvalho de Melo
 <arnaldo.melo@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Ruffalo
 Lavoisier <ruffalolavoisier@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the perf tree
Message-ID: <20241217113947.0ad90c47@canb.auug.org.au>
In-Reply-To: <Z2DG41WOlZgQl9Ue@x1>
References: <20241216082725.2ef47ce1@canb.auug.org.au>
	<Z2DG41WOlZgQl9Ue@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DX6mA7x4uZYPCiIdIBsc.qh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DX6mA7x4uZYPCiIdIBsc.qh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnaldo,

On Mon, 16 Dec 2024 21:33:39 -0300 Arnaldo Carvalho de Melo <acme@kernel.or=
g> wrote:
>
> I can force push after the original author provides the Signed-off-by,
> but for such a simple patch can we just keep things as-is?
>=20
> Is that that what you're saying?

Yeah, hardly worth a rebase/rewrite.

--=20
Cheers,
Stephen Rothwell

--Sig_/DX6mA7x4uZYPCiIdIBsc.qh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdgyFMACgkQAVBC80lX
0GyZ7wgAkHwylsJZmkx9y+vVZCcaRp3EpgqJ1cIZzgVJtlO3FAlu3eB6kxwJ33Qo
6S/rG935vQv4knE6HzWyb6RWslcz78PolSNbrHa5DQHL8eGKmqlEhmidXO/SLJ72
9njwz9CPV4rgZQTFN3NbYYXxlHZBGokEmfiivGqHwANjGkO9aTsQE90DZ4FcRN9Z
qovHHRRB3A1qqoKPW1ylVj52grvrlfHAVM1GOGRZcvXULFGNZYSxRkiBo6K5vd+H
lkWMqGrsuns5xE/gEah40XoMDFlkCVXmx/c3rwMnJqrzpQclq5mbZjS/RJojomSs
r9KH9clP8EEPZkUmXJ+l5d0Uw0vKsw==
=XrN+
-----END PGP SIGNATURE-----

--Sig_/DX6mA7x4uZYPCiIdIBsc.qh--

