Return-Path: <linux-next+bounces-3638-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1472596E855
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 05:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40CB91C20D6A
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 03:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100F73BBF2;
	Fri,  6 Sep 2024 03:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Qn2ZoGBi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A44CD2FF;
	Fri,  6 Sep 2024 03:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725594037; cv=none; b=EZUNYL01Lxqmqs4PT/4P3dA3F6t366BKcTfbVjk2pDv1B8EpjazedmqXmegFza6flr10Xda8eEJswR2W3u7LOqxV4H5Ih1mmaMq2x2nBwl7vAbvsBZmwPhvd7bOzt7aVqZBENxwyCtGXWJkSyiqqU6q8C3MbM2g+UgpIyWV/lSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725594037; c=relaxed/simple;
	bh=+Zwh9yT2VYgop534rtu8GPIEbuuPW5E+Wh5KNyNtqw0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ln0ghKb/dey0awRgc8CXdFjgU31s4OiwQ0lPga0cNTCaFUh3uWyHV83lwoSo8lkicuBwYpov4TBfiRKaeJtPlcMrPMzbSSsNQQs/HxREsyFuxHg6jtzGtkEMHouaRgN+7ohddh8iTFKYBnhQJ9X3NusH+zqGxUdacYSlcYOwIXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Qn2ZoGBi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725594031;
	bh=RZ0d5PFIW25ivcKi4DDWNz6ux6hlZa1PvGwJmj/aO68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Qn2ZoGBiS9mrWFO965J23qSqw2nfvZZsGIW2TMmcmeEt3jX1EhfVoobBdi1DgbTzv
	 yqpbIuFu7mVR8M7lE9HQ4LXSiuSOJ2X5EHsbGUT+VrzxiBh+72+qZbTXDm1TMADK8t
	 P6M7UOeqfro3GXsYjHpUbyPNRUSG2H4bgCDLSnxo+Q1HBm7Ngm8dtZGDT/dh/X07yL
	 VynZI4V/330ma5G4BS+dlwZ8ZJRjynoGBv6/om+rhHL3Y2w5VE4pjiF7rr5FW8sw5n
	 rFo7wLyucrVDv4VkMZI5xsBy4aWgDZ/Dg6dyc0G+apH+5C4UZQpbTtdzzKRn9cy1CU
	 1SEnfvrvexyrw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0MSZ58Snz4wxx;
	Fri,  6 Sep 2024 13:40:30 +1000 (AEST)
Date: Fri, 6 Sep 2024 13:40:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@outlook.com>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the sophgo tree
Message-ID: <20240906134030.6c440803@canb.auug.org.au>
In-Reply-To: <MA0P287MB282200D15F3A93CE187FA66FFE9E2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: <20240906120436.74ffdd06@canb.auug.org.au>
	<MA0P287MB282200D15F3A93CE187FA66FFE9E2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cktgZE4iuhmq.1xkMnw/bVT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cktgZE4iuhmq.1xkMnw/bVT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chen,

On Fri, 6 Sep 2024 11:24:14 +0800 Chen Wang <unicorn_wang@outlook.com> wrot=
e:
>
> The arm-soc tree contains these patches is due to I submited a PR to
> Arnd and he merged this today.
>=20
> And for the sophgo/for-next branch, it does contains these patches. I
> created the PR branch(sophgo/riscv-sophgo-dt-for-next) and
> cherry-picked these patches from sophgo/for-next and submited the PR.
> I see the commits in arm-soc are the same as that from
> sophgo/riscv-sophgo-dt-for-next, but they are different against the
> commit ids from sophgo/for-next due to cherry-pick operation.
>=20
> So my question is, do we need to make sure commit id the same between
> PR branch and sophgo/for-next branch?

If you are submitting everything that is in the for-next branch, you
should just submit that branch as is, that way you have submitted what
has been tested and all the commit id's will not change.

However, if you are submitting a subset, you should probably create a
branch with that subset (as you did) and then rebase the for-next
branch on top of that and then test the result yourself and then let it
it in linux-next for a day or 2 (to check for any new conflicts - there
should be none).  After that, you should submit the subset branch to
arm-soc.  This way (again) you have submitted what has been tested and
all the commit id's will not change.

Right now, you should rebase your for-next branch onto your
riscv-sophgo-dt-for-next branch so that the duplicate patches are
removed (they will be the same commits in both trees).
--=20
Cheers,
Stephen Rothwell

--Sig_/cktgZE4iuhmq.1xkMnw/bVT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaea4ACgkQAVBC80lX
0GwFlAf+JBfATXB7VnerOkGL3uATiJvBpKJNjLi6hoHexeNWMSz9HSMSGuc0uE5i
XvaCPaG0QwAToHE4euov0CcQ3Puoaf/vu7Gbs4tSNUMo6Ga9MPC/cYo5tQweXr1T
wOJh6um9kcMIPhM8JtU6achXftDzer/AnYYF6l4xylNcPK0XoDx2K+7lcreu3gtJ
XLhptUF9/ZtdgA0/X9Ye3FPq7MM/46piOmtLWshV+9uxckidGPyaGGjL+tkRstBU
zcjlG+1h/uUNdinrljuS+uFHezHqWobrU+E6WyNPNIApkxxxszlH9VqiwZQ3xY0L
Rxfs7+UApMzdzCX00mNHGz6XD+v2qA==
=lRet
-----END PGP SIGNATURE-----

--Sig_/cktgZE4iuhmq.1xkMnw/bVT--

