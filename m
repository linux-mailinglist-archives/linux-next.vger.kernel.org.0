Return-Path: <linux-next+bounces-9417-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E69CC06E7
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5D9930142D5
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9382222CB;
	Tue, 16 Dec 2025 01:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oK7RNP02"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16C716F0FE;
	Tue, 16 Dec 2025 01:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765847969; cv=none; b=YvJm+IxPKEya0r05wnAs1+nxvRg5xpMLgPsw0dm7Ncmpa54FNR6cNb79ljeHHCOtEQwaqRj1PqGNi8SJ7ePXIELWNvsWLS2QU1SQTQgTIQjiTZLY/HgdTRcKnEcAJIUz1AnYJ5uJ7PU38sq/DvfKP5wETa7lRuBhm/c4m1HnRik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765847969; c=relaxed/simple;
	bh=nWNSB0xww7X3AZBAvMQctMQowtoSg5SbO6ZP1vFTkeI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OEO9ITYuDlHfCZCQDJq/Y0j5sFtmNtuiAoRSjT3JYQ8+XYdh1YgxEyiIXBkFbmIOqq+GRzyCIIjNzOHHfcgUJahnuBHDBeGbWIdL51JSEOt73L4zG1YI5FsFsZXbzJNl5ychaCwpsc8IlwTqKUTShi+CxkA79TwEyJ+4OGq2ebY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oK7RNP02; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765847965;
	bh=SIJ6EzpQO2xxeMniSNkbhPtKWpdnFqfAz71/rDDwh44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oK7RNP028Zy7dtzQq3x3z3r319Dtz5eAGJLTTYB4m3D0RKxYbBADAR93EZMWYhisA
	 w7E+NK7YYPemi7OGmh+ZbO9NFQrT62fLsj+1FITGRmJk/1Vnobmm4bhKXLUlhlSyTw
	 45cLNJiuc13opbe8NaGQdrvSe8wepOPl7hX4xDkKThZzK4N5ZPJbIbCjI2GHIhknWl
	 BlRPrkCspBFiYlYhCUALkpGqHQZIAIvq2tc2NAQvlhiNIUNwTizWrwAy4f85g0sYbI
	 lfPMI+kMwCmSAWyBD18r/bbTj2n0iCihwHR2IwH+8OXyQs2D+EVd7s3OiJx8zxs7bU
	 6N4KSFsamVu/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVfGh6j7wz4wGT;
	Tue, 16 Dec 2025 12:19:24 +1100 (AEDT)
Date: Tue, 16 Dec 2025 12:19:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the devicetree tree
Message-ID: <20251216121924.07a826d7@canb.auug.org.au>
In-Reply-To: <20251129093141.2d04c8ad@canb.auug.org.au>
References: <20251118143843.0046d6dd@canb.auug.org.au>
	<20251128161000.08b3ba05@canb.auug.org.au>
	<CAL_JsqJw+b=Ro1=cz7wMwwUdPr9eE3C=Snr0skYwTjn1RjX5cg@mail.gmail.com>
	<20251129093141.2d04c8ad@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ki+uWTpCqAiD../wXdCmd7M";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ki+uWTpCqAiD../wXdCmd7M
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, 29 Nov 2025 09:31:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 28 Nov 2025 08:54:34 -0600 Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Nov 27, 2025 at 11:10=E2=80=AFPM Stephen Rothwell <sfr@canb.auu=
g.org.au> wrote: =20
> > >
> > > On Tue, 18 Nov 2025 14:38:43 +1100 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:   =20
> > > >
> > > > After merging the devicetree tree, today's linux-next build (arm64
> > > > defconfig) produced these warnings:
> > > >
> > > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: rp1.dtbo
> > > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: mt7986a=
-bananapi-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo mt7986a-banana=
pi-bpi-r3-nor.dtbo mt7986a-bananapi-bpi-r3-sata.dtbo mt7986a-bananapi-bpi-r=
3-sd.dtbo mt7988a-bananapi-bpi-r4-emmc.dtbo mt7988a-bananapi-bpi-r4-pro-cn1=
5.dtbo mt7988a-bananapi-bpi-r4-pro-cn18.dtbo mt7988a-bananapi-bpi-r4-pro-em=
mc.dtbo mt7988a-bananapi-bpi-r4-pro-sd.dtbo mt7988a-bananapi-bpi-r4-sd.dtbo=
 mt8395-radxa-nio-12l-8-hd-panel.dtbo
> > > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: k3-am62=
x-phyboard-lyra-gpio-fan.dtbo k3-am62-lp-sk-nand.dtbo k3-am642-phyboard-ele=
ctra-gpio-fan.dtbo k3-am642-phyboard-electra-pcie-usb2.dtbo k3-am642-phyboa=
rd-electra-x27-gpio1-spi1-uart3.dtbo k3-am642-phyboard-electra-peb-c-010.dt=
bo k3-am6xx-phycore-disable-eth-phy.dtbo k3-am6xx-phycore-disable-rtc.dtbo =
k3-am6xx-phycore-disable-spi-nor.dtbo k3-am6xx-phycore-qspi-nor.dtbo k3-j72=
1e-evm-gesi-exp-board.dtbo k3-am67a-kontron-sa67-gpios.dtbo
> > > >
> > > > Exposed by commit
> > > >
> > > >   d8c8a575f5aa ("kbuild: Ensure .dtbo targets are applied to a base=
 .dtb")   =20
> > >
> > > I am still seeing these warnings.   =20
> >=20
> > Patches are posted to fix all of them[1][2][3].
> >=20
> > Rob
> >=20
> > [1] https://lore.kernel.org/all/20251117211503.728354-2-robh@kernel.org/
> > [2] https://lore.kernel.org/all/20251117211306.725678-1-robh@kernel.org/
> > [3] https://lore.kernel.org/all/20251117211316.725960-1-robh@kernel.org=
/ =20
>=20
> Thanks.

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/ki+uWTpCqAiD../wXdCmd7M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAs5wACgkQAVBC80lX
0GyLLAf/SzJ4xI3rGWkNLQoaMiVmt2ijhN7KvQEWpw8t6BNsKz7ekFPkJmSWrM0p
CZWtvn/ZP+BDmXlpfyz0XPUOG23wQbGvBi2iCuh7xrH8eoJha8YkGaF7CclDLX/o
k8tmzAT718Gl7aamgO/73MhdqejFxVU8Rj9fdVMx68di8k9Pt15gU7A0wiZCoYl5
dyOYY/as1cawhI9An8d55+2dX99nMMcsqHVYlEFLZBGlVE/35Y29LpDbaR0GwIk5
pEXBsT2ScMP6Cc6oxdd2P0Tz2EryMnsaHtgUzKq5ottMdfxo0NHhJ4V5OUUVaOju
LZ9ibxL+STfWNmVJr1s7TFUrr3SmaQ==
=fnDu
-----END PGP SIGNATURE-----

--Sig_/ki+uWTpCqAiD../wXdCmd7M--

