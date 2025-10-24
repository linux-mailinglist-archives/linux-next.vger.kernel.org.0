Return-Path: <linux-next+bounces-8699-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E599C03FE2
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 03:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E49A1A68371
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 01:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0808017F4F6;
	Fri, 24 Oct 2025 01:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jM0/U0+b"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B545E15539A;
	Fri, 24 Oct 2025 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761268174; cv=none; b=XYk8LO7B8QZsGEpROWPiOogKKkmHtEntuDAuPnh7tjAeCMu1fYD7z2QVy1S+rGunaeLU/ESqVTvSNcH8F/5sRMQ6LS02uE0Ww/WEkbO3TsUsGdOFsmpMTBM3BlYMqfUXEx0CM+2Q5ea98DPpqAxeacFNhisPqj4HgFZp1/oxtIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761268174; c=relaxed/simple;
	bh=HWbHAfRq/coQG08pzS9jXB0r9W3Kq9HX9FDLjNjQR1E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oTXJS1FWoOGw7mwyF4wYgEAxYb5Jg2VSv+bQxqTTDOP317+ZUNFv4I4+NGELcwNXztbyhFE6/Al5P+pXAuU0i/pqPm5SlaXF3FFzd4+mWKtvK5M5q6Jb9DN6/tgBoXWR4Ejmpwaoqe7gza21UCkXngyAbSE3bcY1L9n0mMY4e2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jM0/U0+b; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761268162;
	bh=ccAumRbR+3KNj4PW/tPaAgU5gtE21kuALA29m5YZuYQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jM0/U0+byw1/JcfM1cjkIvPqCTySHuR6pmpkUGJPccXkg7g3vIouFiHSRVXg+hMyl
	 humvi8uSIMO9f5XPknuwBjPfK+M458SVVpqhtpTBkBTGriY27vTxHbZugO2jIJZcxz
	 SGgYZxPOVLoxMDgwueehFm0l6L+xIrdX+lLPxHONqVjDrmJBCrQdg7ibPe2iRCzkM/
	 0vhYFXj9QOJADzOJ+4fjf8hFd9+GrT7NkgTAJJh/SV6m64vqYIApaNO5+2V3FSb4Sw
	 VIIQT63kfxJQEdkRCDo8i+KC7Lc6z9yHguaN+inNvdFr9UqkNLNDwLzJjGohfby+zH
	 eZyEGresFVHfQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ct4YZ15M7z4w9m;
	Fri, 24 Oct 2025 12:09:22 +1100 (AEDT)
Date: Fri, 24 Oct 2025 12:09:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Shuming Fan <shumingf@realtek.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc-fixes
 tree
Message-ID: <20251024120920.23f707f5@canb.auug.org.au>
In-Reply-To: <86578286-39f7-4d08-a41b-cd7e15f1bfaa@sirena.org.uk>
References: <20251024101931.49f46027@canb.auug.org.au>
	<86578286-39f7-4d08-a41b-cd7e15f1bfaa@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.aSx_8+nUq_paeHDRSyY0A0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.aSx_8+nUq_paeHDRSyY0A0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri, 24 Oct 2025 00:49:11 +0100 Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Oct 24, 2025 at 10:19:31AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the sound-asoc-fixes tree, today's linux-next build
> > (x86_64 allmodconfig) failed like this:
> >=20
> > sound/soc/sdw_utils/soc_sdw_utils.c:316:18: error: 'struct asoc_sdw_cod=
ec_info' has no member named 'name_prefix'
> >   316 |                 .name_prefix =3D "rt1320",
> >       |                  ^~~~~~~~~~~
> > sound/soc/sdw_utils/soc_sdw_utils.c:316:32: error: initialization of 'i=
nt' from 'char *' makes integer from pointer without a cast [-Wint-conversi=
on]
> >   316 |                 .name_prefix =3D "rt1320",
> >       |                                ^~~~~~~~ =20
>=20
> And I do x86 allmodconfig builds which should stop something that breaks
> getting published...

Yeah, so there must be an interaction with something merged before your
tree ... but I couldn't find anything obvious, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/.aSx_8+nUq_paeHDRSyY0A0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj60cAACgkQAVBC80lX
0GwbUAf/RiGtJQqzsAwDBW6Qk9G3Q6n/QqBrMdzzJbWUect0XCYFu841B1cpaTFu
PK1NdnGJOQPZofyHyKW+rtsnkQNT2zGeYsjwsOSqvmfpSD7KAH04PeBjt5a3KRkd
IdMHPGX08sqviOUUFZ1uE9D1YgGTQ+Fd7X2FB1pVZqjoI20X1EkA5+J9HeE60iOi
W+7VDO9uZwEuwgLXwN7C3z5Lz3lHwGnkMpO4Pk1+Avt90Jsx3uVuqIUFbqmh3axO
bGbrj+ji2AzVxTuTxhnnrYvX+qNJN3o9HUH39D9G9huo8s2ZaDBiafiEvYYriwT0
PWCQ7j46C5BmFE7zgL9XBr7D4Q5cRQ==
=vZE7
-----END PGP SIGNATURE-----

--Sig_/.aSx_8+nUq_paeHDRSyY0A0--

