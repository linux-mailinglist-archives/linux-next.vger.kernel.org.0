Return-Path: <linux-next+bounces-5165-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E61A0AD7C
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 03:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12C53A760D
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 02:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C68E14A0A8;
	Mon, 13 Jan 2025 02:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="vERb9DFb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE26E13C8F3;
	Mon, 13 Jan 2025 02:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736735857; cv=none; b=RGmyeqmY6QdjNMZeg1zVYUsqIwfhd163WKbeJzhVVGxmflEbuoGUw+6AEl3BEIizdtjBrb3uOr0VBvrdqg2p5jp8gTe/3rwc0x7PmzX3gm5W/ITbp/CSBLq6GMCBgwAkvco6jVBxxdKoZ+Y4xalbQH3By4BSJHPqQmk4KWYUXPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736735857; c=relaxed/simple;
	bh=pFW5mOGHu3V9iCs8rXTPJc952AlpLbu59iDfcyZ79js=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TQShs4AqXU7zF3cYRsePLoW0Gg3PLn9vRTqnS6hmgqqM158JvuN8uHd+UGQuajZj2SsKrI9ylxpKmz5st2LBtGjGqwc8xR0tU7OVNaqKg/V+Tv+bga+sdCeyIgZ0Yke777OfXGjcMmCbb652LlKVilroAosAr4hZ0RKFprEDfQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=vERb9DFb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736735844;
	bh=oKPSd4r/LKBAkEq9y3/vZTP82JiJE45JvpaJy819wpg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vERb9DFbUFVb1D5LNGjG46UqfJkDPJ1BhHi1F9NsoysPfssqpMOP3bohapJ/wnRnP
	 yGz1ApdDD5wymdfVgqcSdnZQ0aImJcIWxMlfQgO+ykxmJ8dGBsxjPFu3h1AGG/YA7G
	 nNot4zJ/p7GCH1rvPJn+LkO0anIWNgZBOnn2Y8xvo4ylKHiKssJdtCtcxddxj/N3i/
	 aKr1CpnArpNm1iGUE36+e88fdA1GoE6g+zIGtLhDDQW5aSk1wZeX5DZ4CCI8v6X+lp
	 8ZNbVZO14tJKda6wffa4StVm6WWYLBGB4jggcnsKHxvG5up48KEpRMIVDwaIddASA9
	 S3x3hqRZdCf6Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWbyD3DtSz4w2H;
	Mon, 13 Jan 2025 13:37:24 +1100 (AEDT)
Date: Mon, 13 Jan 2025 13:37:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Jens Axboe <axboe@kernel.dk>, Song Liu <song@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "yukuai (C)" <yukuai3@huawei.com>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20250113133730.6f56fc79@canb.auug.org.au>
In-Reply-To: <138ea43c-223b-ac64-bff7-9ccb5f3dbd7a@huaweicloud.com>
References: <20250113125142.001f056b@canb.auug.org.au>
	<138ea43c-223b-ac64-bff7-9ccb5f3dbd7a@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5mBWJuvxpLzn1_H2Ql0m=I1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5mBWJuvxpLzn1_H2Ql0m=I1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Kuai,

On Mon, 13 Jan 2025 10:13:31 +0800 Yu Kuai <yukuai1@huaweicloud.com> wrote:
>
> =E5=9C=A8 2025/01/13 9:51, Stephen Rothwell =E5=86=99=E9=81=93:
> >=20
> > After merging the block tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >=20
> > make[5]: *** No rule to make target 'drivers/md/md-linear.o', needed by=
 'drivers/md/built-in.a'.  Stop.
> >=20
> > Looks like a missed "git add".
> >=20
> > Caused by commit
> >=20
> >    7ad00dd67641 ("md: reintroduce md-linear") =20
>=20
> So, I do checked today's linux-next tree, the above commit is not here.
>=20
> 2b88851f583d (HEAD -> master, tag: next-20250110, origin/master) Add linu=
x-next specific files for 20250110
>=20
> Are you sure about this report?

That is last Friday's linux-next release.  Today's is not released yet
... and the commit won't be in there because I used an old version of
the block tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5mBWJuvxpLzn1_H2Ql0m=I1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEfGsACgkQAVBC80lX
0GygwQgAiWvEUin+x3VXuL0RDrCd73FZPaQ79XI/4gkFzaFdIfxyC0/eqfYCOfr7
73NDm9sUSAjcMHbOW/OJihDjXTW4+kfLIBca26262LhUg2TAqyXOYuz8pm1hKGug
MMoWQMBgPHL2cGQZ1v/yzIXlQGHFYx34+FWT5lQdwxP6x9wfqhzukYuvVe3j626n
/Od9obSOFmurMPQ2gd65lIDeW6e8Lm8vs0/neMjTm4DOHEv3RoM/x974Hvim6enr
zUct939B118GW/wonhfXH/swVHJbcAQEhAzVuzX0oCuCnbbx+X4hNYd5+zOwNmpw
3ISis/Fjk6EOgCf0h5WquWaccDai4g==
=8rBY
-----END PGP SIGNATURE-----

--Sig_/5mBWJuvxpLzn1_H2Ql0m=I1--

