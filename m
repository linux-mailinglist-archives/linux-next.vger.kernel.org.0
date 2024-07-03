Return-Path: <linux-next+bounces-2818-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ECD924DE1
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 04:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EB9B1C22BF1
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 02:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B891FB4;
	Wed,  3 Jul 2024 02:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BrTosh7Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E9139D;
	Wed,  3 Jul 2024 02:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719974211; cv=none; b=Z5WpO5OniDygb48hAFCgUg2LapFlRC36NBGMoeCr8CrxmUGS8oloefvdG+LJ37TBJZtIZFaTI4aCq7iZC4YFtLPbt1TUOGxg+4x83JCNe5lqwT5ZtO+2Ra5xhkZi5UY2IyGzEUShH8gmKPPdCBCZVnsLbFjDtyYK0YQUBugLlwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719974211; c=relaxed/simple;
	bh=aSfuX8QaCcB4szCaBQHcb6fbkYpJ+xJH7F8/1Hanxio=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RrWv8kSkaoTdhiOmnHcMwahFSlUHjiWrKB/Tf11IgTOFdSFzkpxCybfiuopeuB2TjaAqXH9HrkrTPZ5o7vqJcrTJ/cFokFwJIPIIHUIrJw2yRLyzfgtbiRpBA9tK/wGMFYrS6lyv/78HFV7gKT6V2h0g6W3U99hAwRkizwXPL7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BrTosh7Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719974205;
	bh=0SHqF0dUovd6ss7dr8haTSOKzF2Sqk2aiA+Wo+YlUXw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BrTosh7QOfRCq2kxrXOrE8VmZbJ+puf5D3nORfbHKQFZ166stwB0wms/m3X4eyOFO
	 Kr7n0OQysIE4CUVMEpEMBM8t0wDnDB2G9glSM8lOIIaIU6zJMpQiWvYgOEn1Ovlgex
	 UEkrQ60MvhEBj2ekWFrKPsk9f7xvJt5XqbEhjyGZF0ESDf2slOcg4Ci13fW72gtdRK
	 StugcFI0ly3iVCGkClfUtX8oXm2/1DdYc31ir1Q2zloNy7I97NvwGZACzBes6XlMxG
	 uB9wk9zd5xi2mfvy4ZnuSqsdXLOVejNqlNLiDf7M1Qf5jEQekJi87DoW9obsXnX4+H
	 LtJl48F11Yshg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDP704HvCz4wbr;
	Wed,  3 Jul 2024 12:36:44 +1000 (AEST)
Date: Wed, 3 Jul 2024 12:36:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Mark Brown <broonie@kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 Piotr =?UTF-8?B?UGnDs3Jrb3dza2k=?= <piotr.piorkowski@intel.com>, Michal
 Wajdeczko <michal.wajdeczko@intel.com>,
 buildfailureaftermergeofthedrmtree@sirena.org.uk, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm
Message-ID: <20240703123643.5b4dc83f@canb.auug.org.au>
In-Reply-To: <Zn7s611xnutUFxR0@sirena.org.uk>
References: <Zn7s611xnutUFxR0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yaBhn/0VkwjWMaUO2AGJq8U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yaBhn/0VkwjWMaUO2AGJq8U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 28 Jun 2024 18:03:39 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> After merging the drm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c: In function '=
pf_get_threshold':
> /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1788:27: error=
: unused variable 'xe' [-Werror=3Dunused-variable]
>  1788 |         struct xe_device *xe =3D gt_to_xe(gt);
>       |                           ^~
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   629df234bfe73d ("drm/xe/pf: Introduce functions to configure VF thresho=
lds")
>=20
> I have used the tree from 20240627 instead.

I am still seeing that build failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/yaBhn/0VkwjWMaUO2AGJq8U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEuTsACgkQAVBC80lX
0GxrbQf+LSBGQ52sQ0YfN9wr5fTIjIq/ntnbwl+hoEnKZtBUjmaiPZWEoWXYnmbG
oKgUBRZvVBAKjxpb4hwV4aVdvQGWKDe4FjD+AwUeevutrFEeZEGI2ZQBLfHbFC6x
+kio3gEHjh/I5VOIgeaDToOo47JLKvArn5Bu69nZgMZIaOVectLT74KrE0TP4L4a
V5Ey0a2C4MXXbTC+zZWP2Y9AX8LgvxE5wGOkRJ5pN7C0p5Ff8UDYwEXBEQ/T6SRF
E3ejRAGuWP5FVOe6gGDeC2FEeBQfrCVrnIzCq7aqNiZIyW3lrXTFHQo3atFYwekB
gk25zepLUnHaYJPhIXoYZw0eLsGC2g==
=efJw
-----END PGP SIGNATURE-----

--Sig_/yaBhn/0VkwjWMaUO2AGJq8U--

