Return-Path: <linux-next+bounces-166-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D437FFE55
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 23:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 554DAB20D86
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 22:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1426167C;
	Thu, 30 Nov 2023 22:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CCLHKo+l"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F7810DF;
	Thu, 30 Nov 2023 14:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701382214;
	bh=tGoqKjA42cE3Tk+7GVPpkEkj6chR/SK3IvRvQjTYq20=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CCLHKo+lmMSqjSn6RNiOydApuVZmqoxwI5pBdM/GP5gDkdPEDQx6JbN9loi5f7Swj
	 BCx1IGnRYibn5vbTrm2/c29xUJe8lO8VBrATZXa2Kjh1RyHXVeOmrasGAJ/8EbVKGw
	 Dn8ju+H90kkvTq+/fpWWAwMdbHQvgAh57Myo3ASaDDIIdyN97yZSlAVIQdUhU6qxPV
	 EfD2YvVmjQkTfwtmoZwcjlxOXaSIUMhr6TnWgN+0AgTtBwEvDrVOC0Ka80V/mTgenB
	 7DremU+J5JuXHrU5e8s8XgibONFDJ5DuLHddBnZZHDN0jX+kILixB7s7o/O3jpHW0W
	 XuycNQ57uipVg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sh9Nj6Gyfz4xWX;
	Fri,  1 Dec 2023 09:10:13 +1100 (AEDT)
Date: Fri, 1 Dec 2023 09:10:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Aithal, Srikanth" <sraithal@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the kspp-gustavo tree
Message-ID: <20231201091013.6554b27f@canb.auug.org.au>
In-Reply-To: <402fc89f-96ff-4f64-ad6d-aaa7ecc284e7@embeddedor.com>
References: <20231122144814.649823ac@canb.auug.org.au>
	<813f3aa2-3449-7264-fa54-eaafd9981add@amd.com>
	<20231128091351.2bfb38dd@canb.auug.org.au>
	<001021e0-2262-49c8-89d0-c0d0720ca313@embeddedor.com>
	<402fc89f-96ff-4f64-ad6d-aaa7ecc284e7@embeddedor.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kdNimbeNk/GRNQqhx_kqMm9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kdNimbeNk/GRNQqhx_kqMm9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gustavo,

On Thu, 30 Nov 2023 15:54:57 -0600 "Gustavo A. R. Silva" <gustavo@embeddedo=
r.com> wrote:
>

> >> Given that gcc 11 is a provided compiler on RHEL 9, can you not add
> >> -Wstringop-overflow for that compiler, please. =20
>=20
> Done:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/comm=
it/?h=3Dfor-next/kspp&id=3D617ab3c357d2ebdfff0e1a090c46f2f3f29b45e2

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/kdNimbeNk/GRNQqhx_kqMm9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVpCEUACgkQAVBC80lX
0Gx1mgf/fm6PH5keY60h4sgJAJFzE8XQYxlYDe4RL36z5HYxVJSDcOKWi+DLktgl
KrU0fhtQds1VwFuy0a4LdurHrDnr9mD48iPnNdnpgUGC3kOXoNOOv6jwD4yjhA3L
HlOQsTNsMW4dMjeOSqAAH+Li58yJgE6vMpa6BGJq8OGnRTjLIq1gXlMUdw5axHo2
FGAk6L8Z/waPnyXH/7J+IhUjuD4r+ThkPUspxpbMOguPqIEvyaElPIdxkJhvM84L
huPlumslbZ1pBbe+7GZkIc1nfK0K4OE89FswMF9oMnEu8847AYjnWUJplRY32i/b
dEbwxRc6L/TCzzqROKUhAm/o7NKd2g==
=4QiC
-----END PGP SIGNATURE-----

--Sig_/kdNimbeNk/GRNQqhx_kqMm9--

