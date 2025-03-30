Return-Path: <linux-next+bounces-6090-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6C1A75CB0
	for <lists+linux-next@lfdr.de>; Sun, 30 Mar 2025 23:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 543EE167237
	for <lists+linux-next@lfdr.de>; Sun, 30 Mar 2025 21:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EF61DE2C6;
	Sun, 30 Mar 2025 21:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Yeg0RPGl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE3D1B4F09;
	Sun, 30 Mar 2025 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743369941; cv=none; b=gAYOCB9hH2mvurRIdK6XV2NAKSfrTSSfZ/dRhdVd61gO0yvQOhk2PQo5sfO5ldcFl4R43r9xfdZMSrDPs2hZAdriSCKgFKMuvS6NBV9q2yhnsyrQ7oZO8y+Zlh+vqCvKHVz6vb3TcLAS0FoTZpVNvgFYx4Slf/z4Cwci/J6eOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743369941; c=relaxed/simple;
	bh=bUl+Mlo/MI6v4nOb943f4dDRqfRZ5/261SHUI/meDBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=saNCL7MGG2TMHnTv+fY0rqrq1IRaK2rk5Kcr1KnHeM89fI16cIbOZ9IlMk7aTCEkoIpRo/dtt0LUb+uY7OC3/zeBeUqlLQwRYnafVYucjVkaiy0h1tSZ9JK/ZQpD6wxTnmT4PFpa08z+ZU7nc9YnSzd5On716u380NLGZSgAnlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Yeg0RPGl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743369928;
	bh=5Ec5du5hxcVYdVABBwuN3/mGp0BmltDWXVTbCw6WUU0=;
	h=Date:From:To:Cc:Subject:From;
	b=Yeg0RPGl+/1b/6DUP97iYC5KNszR+Qq4JXfjmsTSsAfoAoQajjIz/I81HTlDY9BZX
	 FcCxKOCK3z+v5IcHattYacgXkMIauVLxtdEvGKLy/h2A/fAzuCugex/MYtYb63x/DQ
	 smcnfrY6W1Xp3G/pwQIeIXMOeBvfbzNtWA+SHw14S/70NSf/5RnPP58SeIkpVXa3ih
	 pw0nKwdx0Ft4a0gmX/kSIFnP8k7qF0Zc+ovyOcIyS425FhrCh6nac8sA53arvDhKF6
	 rVrxEbZcUVJwXRZavYOs7barnw1qLqO8YG+bspYoqwBis1xP6r0cPrJxg0EDR4BYXF
	 RrVO3i+5wEMGQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZQnNm20lmz4wc4;
	Mon, 31 Mar 2025 08:25:28 +1100 (AEDT)
Date: Mon, 31 Mar 2025 08:25:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Fan Wu <wufan@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the ipe tree
Message-ID: <20250331082507.36ffa10b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OhB3Xq3E.Y16_.aFJ.VHzce";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OhB3Xq3E.Y16_.aFJ.VHzce
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  42d4d6207180 ("ipe: policy_fs: fix kernel-doc warnings")

This is commit

  6df401a2ee4a ("ipe: policy_fs: fix kernel-doc warnings")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/OhB3Xq3E.Y16_.aFJ.VHzce
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfptrMACgkQAVBC80lX
0Gw6iwgAjA+Tm1rbUbilbgsJNZl1+CZKvZpNGT7pl2EPeA6Ksna2CONGw5HTlq3P
b+lhel8J07CltbMP7eCvj06RM/gZ9Il3JeR6571TvD9Wr8iO2WsA4eOuVBuwi5mH
53e4RWaSDafWMOBsdNedCAtD9upsyo/Xs4pde/zIEOlYVLHq21gZej5ODiLQeq72
8tuCmVyxyEtBfpWA2RYA8G0dFLCdInPIGXz2O3qSpU5+WNOHrwo//5e/niZwl5AJ
jyPEQCgOVdF26v/BZ/NQM0hOjLulJzOxulKTsPPxPtRcrB0A+I/WrErWYlmBWGMa
9aTYxOn6USmkLY1oDZyFga3+hSmCzA==
=5dd8
-----END PGP SIGNATURE-----

--Sig_/OhB3Xq3E.Y16_.aFJ.VHzce--

