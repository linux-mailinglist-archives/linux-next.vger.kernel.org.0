Return-Path: <linux-next+bounces-5555-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0312AA42FDE
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 23:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F076B179C86
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 22:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0C11FC10C;
	Mon, 24 Feb 2025 22:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FrAO3q0B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF65383;
	Mon, 24 Feb 2025 22:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740435440; cv=none; b=LNFbwtyaWjKH9FvVRhnQs2uRCpSejhlH8xgAMNOKFqqYNDsgBTiW8oqRlao4AS/1qhpaFcqqj6k54Ie5d+7ac1ZhEB20S/ctx0VjzJse0Azg7PT35vuD4jQunrbtU+Z9eVRkwOwDanLW7N9zS4+6oyJRa9twZlTtnGMQANVI21M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740435440; c=relaxed/simple;
	bh=krf1O8hD7ok3Sokf0fdhWPATtGSLtV+LuSTXFc+GMXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NWLEeVo1O7FIWMLjyFruRyW+FgG9fGeB6CaAhOLSEZ4wHMhoyHAI6LGl5EVGHho+cUT/ljec/eaMI+cfFTcdeKo0u0pYO3GmIXHxqfHBTWCwgR1G9N8UFLhs0mZW1FyDbUBtx0bixKsx0jyvXe0+tCHMsNPpI9rvZ79CiaW63jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FrAO3q0B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740435426;
	bh=0bjA42lEh+PHwpPTAG/zT9drpPCzoBpsfNuiRiTpebs=;
	h=Date:From:To:Cc:Subject:From;
	b=FrAO3q0BoAEmicvnZwlfsbzPVbF33DZ8VNe3IV1m4VIWly9JEiKoI2huEHeFJhkLG
	 TnPo2U7/v7hh09+4Q1w5F1XkQkPhFC/o1Tkjgcw6+GI3fK1c+iQTKDkafJHcTDoU1A
	 6SXWag9G0TCXlGbH/NuYd/UXRiLa57/Ce2FpZ+5iE1Kwd67G0CqME82lw6qp9Fp5ga
	 t1OHi9Rh64TrvIg89nAoHSOiS8GHnBKZ7o+WW7dsr6rViovMmEgFoJ55+3vj5LTo0F
	 nOALMKKDvR+MBVmGN81bx9fZTCYdbc5rIOq3vMZJqecFOTDgQdtlyOjViKRp/97Yq9
	 xGz4Ap9mdnG1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1w824zx9z4wj2;
	Tue, 25 Feb 2025 09:17:06 +1100 (AEDT)
Date: Tue, 25 Feb 2025 09:17:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mediatek tree
Message-ID: <20250225091705.3171e392@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I5ukhYscy4g_gSAKRedHHGd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/I5ukhYscy4g_gSAKRedHHGd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  fd042310df40 ("arm64: dts: mediatek: mt8183: Switch to Elan touchscreen d=
river")

is missing a Signed-off-by from its committer.


--=20
Cheers,
Stephen Rothwell

--Sig_/I5ukhYscy4g_gSAKRedHHGd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme87+IACgkQAVBC80lX
0Gy9SQgAkn8nmB0Mj0vp5fV560jUOfFYJWQxKnEmGUSsntTTgvHLKY8aER8ct/Bx
3Y5tR6SvdSE+0h0UpHFA9GvZgmwIgZxOiPcMSbNyqpFmJfMODKU8mn8YavjrASS4
2c8iPfdWSRvMdbdO+1LH4Wjn1AS3iF0BDpfJ6P6GBiMV7w5Cgfn4M86MP+m3QFP8
dCXMNgQOrj/nt+FQ525hyuXW5SWi5fwdVNWkt86Ivh1IUR+pZ9WGXXxUzSbmcMNg
0Zl4F//WX0h+lcDCfwY17hVQelI6ClfOwjFlnQiKgKsC7coZ3mgBKkiHkjeD4cfj
8giIyGSjeR9kQGJmrglzQmYaH3J9xQ==
=+ZcV
-----END PGP SIGNATURE-----

--Sig_/I5ukhYscy4g_gSAKRedHHGd--

