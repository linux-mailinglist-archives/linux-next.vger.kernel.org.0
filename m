Return-Path: <linux-next+bounces-9269-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D90DC9342B
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 23:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 24C2B4E17A4
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 22:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B1B23FC49;
	Fri, 28 Nov 2025 22:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nqRJdnSv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5AE22F76F;
	Fri, 28 Nov 2025 22:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764369111; cv=none; b=hWDDFPvzTCXeuMrRJ2kBl9VFSeu5shDld1xySw7FSopcKyMoVjW4G6cyAVNJD3C4x/7MWjhjLimEh5iOFDOA0KGudmyP5BT/5iPPir5u5Z83ouS0ZAJH6hYJQQjnRrcc3lqlHjgKiTighVbUSh4xpVyTWgeuUp+26RNlemgh+58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764369111; c=relaxed/simple;
	bh=ylgzZ0JovYIbezeo5m8OWs4ZHcJ8Tk6LWElSxAg1ASo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RIUakXqQiRp/JkhqZsr28OvikKOyQvBecZRYamBz/8lg2BycF05cObdDOzab8Awo03sS8QQ8/1+h7DOTbn9eMtLMlTq/tUHnPo1LAZqMZLHaCvttxtEcvNXnI5zHrzWxKN0lBtsNgV6ck1bgYPrSKrRrYt4trDLSQXXLl0E+upg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nqRJdnSv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764369103;
	bh=KyEpEHiPkUzxw3kJInxheIXxmLj46QhZuYxL1oMKOUM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nqRJdnSvmwWmCKNhi8GahRwabnQrMVTqG+9gQgDx5KtIla/1hmbfelz2Il3h2J3TI
	 ttrYCDt2DiZkAfx14kGE7JiT/Gy7cI4/wcgv9Iq6T/clWTnXRepjO8Ei8y0CoOP2vL
	 iR8xlWqGz+SW6/NIeRTYPWkYsn0KotDfsxR2zStwqcjOWfMvw51GE+MQZVhczmSMoW
	 IxNygk6Zx02N5m0XGz8rFr/oh/hnBiOScMX83C11NH8Ef4V/MyUph6uZWrtcXoiSJ3
	 OU6KCfNTdLW2rGSY+iJI8rRBBbgq/8UWVawmHwTRSTapuzsThEkHAq9LE90SgxLkBb
	 2gA7QyeuuX9Cg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dJ7M33ttyz4wCk;
	Sat, 29 Nov 2025 09:31:43 +1100 (AEDT)
Date: Sat, 29 Nov 2025 09:31:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the devicetree tree
Message-ID: <20251129093141.2d04c8ad@canb.auug.org.au>
In-Reply-To: <CAL_JsqJw+b=Ro1=cz7wMwwUdPr9eE3C=Snr0skYwTjn1RjX5cg@mail.gmail.com>
References: <20251118143843.0046d6dd@canb.auug.org.au>
	<20251128161000.08b3ba05@canb.auug.org.au>
	<CAL_JsqJw+b=Ro1=cz7wMwwUdPr9eE3C=Snr0skYwTjn1RjX5cg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JqTcF5T/Ee/X2QSyEJOYTQ9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JqTcF5T/Ee/X2QSyEJOYTQ9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, 28 Nov 2025 08:54:34 -0600 Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Nov 27, 2025 at 11:10=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> >
> > Hi Stephen,
> >
> > On Tue, 18 Nov 2025 14:38:43 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > Hi all,
> > >
> > > After merging the devicetree tree, today's linux-next build (arm64
> > > defconfig) produced these warnings:
> > >
> > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: rp1.dtbo
> > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: mt7986a-b=
ananapi-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo mt7986a-bananapi=
-bpi-r3-nor.dtbo mt7986a-bananapi-bpi-r3-sata.dtbo mt7986a-bananapi-bpi-r3-=
sd.dtbo mt7988a-bananapi-bpi-r4-emmc.dtbo mt7988a-bananapi-bpi-r4-pro-cn15.=
dtbo mt7988a-bananapi-bpi-r4-pro-cn18.dtbo mt7988a-bananapi-bpi-r4-pro-emmc=
.dtbo mt7988a-bananapi-bpi-r4-pro-sd.dtbo mt7988a-bananapi-bpi-r4-sd.dtbo m=
t8395-radxa-nio-12l-8-hd-panel.dtbo
> > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: k3-am62x-=
phyboard-lyra-gpio-fan.dtbo k3-am62-lp-sk-nand.dtbo k3-am642-phyboard-elect=
ra-gpio-fan.dtbo k3-am642-phyboard-electra-pcie-usb2.dtbo k3-am642-phyboard=
-electra-x27-gpio1-spi1-uart3.dtbo k3-am642-phyboard-electra-peb-c-010.dtbo=
 k3-am6xx-phycore-disable-eth-phy.dtbo k3-am6xx-phycore-disable-rtc.dtbo k3=
-am6xx-phycore-disable-spi-nor.dtbo k3-am6xx-phycore-qspi-nor.dtbo k3-j721e=
-evm-gesi-exp-board.dtbo k3-am67a-kontron-sa67-gpios.dtbo
> > >
> > > Exposed by commit
> > >
> > >   d8c8a575f5aa ("kbuild: Ensure .dtbo targets are applied to a base .=
dtb") =20
> >
> > I am still seeing these warnings. =20
>=20
> Patches are posted to fix all of them[1][2][3].
>=20
> Rob
>=20
> [1] https://lore.kernel.org/all/20251117211503.728354-2-robh@kernel.org/
> [2] https://lore.kernel.org/all/20251117211306.725678-1-robh@kernel.org/
> [3] https://lore.kernel.org/all/20251117211316.725960-1-robh@kernel.org/

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/JqTcF5T/Ee/X2QSyEJOYTQ9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkqIs4ACgkQAVBC80lX
0GzQqAf/fAKkuZUVqPChIafo9IGqROzHBlrqb6MVqt/e4Uoi2yL9kXM8UYD3pgrr
0ynQLNPSAWiuucibTDBGiW1nsJ0T2eNc8aUuuzcSuUghISU8OuHCQ9K6Wy/dp1wx
Tn4SRJK9VoJpXxZ6dyl59iNTTWsIOfoMkurQFNxgGBgbc1B2Ofa3MmGfkcxuyouI
bOvy58S271jb2/Rs5T2RB8+8jdKnQNUlNfcLFUlIItavrUj8fb2DwVH4p/6CNng6
hqMWVKLRnia6b2+vGdppIW5bayh1L/vr3nJmYtjaKpUR0EYKcU6AeNcR56qoaJbY
z6kwp0lZ1MtUMkOd7yJ60MOaZXe58w==
=83Kg
-----END PGP SIGNATURE-----

--Sig_/JqTcF5T/Ee/X2QSyEJOYTQ9--

