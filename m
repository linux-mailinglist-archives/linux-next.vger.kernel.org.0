Return-Path: <linux-next+bounces-9466-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C79CCB639
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 11:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CA063028FC6
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 10:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E836933FE1F;
	Thu, 18 Dec 2025 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CW4flpKy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3E033F8CE;
	Thu, 18 Dec 2025 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766052950; cv=none; b=JV+ArIUHzfyxUwjvO3P/JqjOlSRb2NFVPEbwnIaid575JoIRKm86YCpcqjtpMKDQvhEvyKP4IJ7U03xM83toOTYtZkSWjfA1tfYq9RWIOuPci29wc4W3s8e8ZEg+EiO80tQRTxDhVUxDhWM81RdxY2q4uvXPcj61yNjkhq7Lc/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766052950; c=relaxed/simple;
	bh=OqGAGm459SDoHt0LZX+GXQvPbvWbXdY4kWNyXTshrvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rHZ3LyBy8SONTxmrhnjGh6VIFnazoCGhOweqUhWpsu2512Rj3z6+ESI4K9L81b2CNlR20dr3GxhXzl03RU9clmVfrFdi+MwfEacgWSvRtFypFg6mt+ts9lVr7+u969oBpMcWVy47lCZUFo/BRYUWRwj0WDshjaRbDQ7NlVyYLP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CW4flpKy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766052943;
	bh=mDKvZjwjDliqWsfATo3vmeEhy847txyyBEc2t0Yb0kk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CW4flpKyyT2FSwi//0qULyYz5ggFwaecR+jtHSFyfeq7BU6qTe16m2YHRE/eMo3E/
	 FqhPT6KwhMSqZSq8C21zJvoV5fEEWlgwPurAoUwCAUuaByVEa50g3qF/pG2G/GbFfP
	 8lX+zIvjDtl3Xxwowh1ytpngC5EQ1a1tc/2eTGU46zLy2k13bm3Bm/gEcxtcMJkGFq
	 3XnmmlhsX4pNAhff2YYWxIAMSPrQh9tW/RIQfCsQCy8D3eD40jGnbkQ7vaQDcuPv0O
	 /juPiVp//Z6gPA6sC03jJxEElo/cvT9TQiwEGC+/VxgaRMvonI7Uk+YIExlnC9B/Gk
	 kzbp81gPhmFpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dX64b2jPCz4w0L;
	Thu, 18 Dec 2025 21:15:43 +1100 (AEDT)
Date: Thu, 18 Dec 2025 21:15:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the devicetree tree
Message-ID: <20251218211542.20a57515@canb.auug.org.au>
In-Reply-To: <20251216121924.07a826d7@canb.auug.org.au>
References: <20251118143843.0046d6dd@canb.auug.org.au>
	<20251128161000.08b3ba05@canb.auug.org.au>
	<CAL_JsqJw+b=Ro1=cz7wMwwUdPr9eE3C=Snr0skYwTjn1RjX5cg@mail.gmail.com>
	<20251129093141.2d04c8ad@canb.auug.org.au>
	<20251216121924.07a826d7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a7lLMRExoB07ofipxcoIIfP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a7lLMRExoB07ofipxcoIIfP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 16 Dec 2025 12:19:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Sat, 29 Nov 2025 09:31:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Fri, 28 Nov 2025 08:54:34 -0600 Rob Herring <robh@kernel.org> wrote:=
 =20
> > >
> > > On Thu, Nov 27, 2025 at 11:10=E2=80=AFPM Stephen Rothwell <sfr@canb.a=
uug.org.au> wrote:   =20
> > > >
> > > > On Tue, 18 Nov 2025 14:38:43 +1100 Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:     =20
> > > > >
> > > > > After merging the devicetree tree, today's linux-next build (arm64
> > > > > defconfig) produced these warnings:
> > > > >
> > > > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: rp1.d=
tbo
> > > > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: mt798=
6a-bananapi-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo mt7986a-bana=
napi-bpi-r3-nor.dtbo mt7986a-bananapi-bpi-r3-sata.dtbo mt7986a-bananapi-bpi=
-r3-sd.dtbo mt7988a-bananapi-bpi-r4-emmc.dtbo mt7988a-bananapi-bpi-r4-pro-c=
n15.dtbo mt7988a-bananapi-bpi-r4-pro-cn18.dtbo mt7988a-bananapi-bpi-r4-pro-=
emmc.dtbo mt7988a-bananapi-bpi-r4-pro-sd.dtbo mt7988a-bananapi-bpi-r4-sd.dt=
bo mt8395-radxa-nio-12l-8-hd-panel.dtbo
> > > > > scripts/Makefile.dtbs:20: .dtbo is not applied to any base: k3-am=
62x-phyboard-lyra-gpio-fan.dtbo k3-am62-lp-sk-nand.dtbo k3-am642-phyboard-e=
lectra-gpio-fan.dtbo k3-am642-phyboard-electra-pcie-usb2.dtbo k3-am642-phyb=
oard-electra-x27-gpio1-spi1-uart3.dtbo k3-am642-phyboard-electra-peb-c-010.=
dtbo k3-am6xx-phycore-disable-eth-phy.dtbo k3-am6xx-phycore-disable-rtc.dtb=
o k3-am6xx-phycore-disable-spi-nor.dtbo k3-am6xx-phycore-qspi-nor.dtbo k3-j=
721e-evm-gesi-exp-board.dtbo k3-am67a-kontron-sa67-gpios.dtbo
> > > > >
> > > > > Exposed by commit
> > > > >
> > > > >   d8c8a575f5aa ("kbuild: Ensure .dtbo targets are applied to a ba=
se .dtb")     =20
> > > >
> > > > I am still seeing these warnings.     =20
> > >=20
> > > Patches are posted to fix all of them[1][2][3].
> > >=20
> > > Rob
> > >=20
> > > [1] https://lore.kernel.org/all/20251117211503.728354-2-robh@kernel.o=
rg/
> > > [2] https://lore.kernel.org/all/20251117211306.725678-1-robh@kernel.o=
rg/
> > > [3] https://lore.kernel.org/all/20251117211316.725960-1-robh@kernel.o=
rg/   =20
> >=20
> > Thanks. =20
>=20
> I am still seeing these warnings.

Since yesterday (I think) I have started getting these messages twice.

--=20
Cheers,
Stephen Rothwell

--Sig_/a7lLMRExoB07ofipxcoIIfP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlD1E4ACgkQAVBC80lX
0GwP7wf6A17uYiVWxeCELJz1AN11SL8MzAwBL31Pwa6F4uUonwv4hG4+x7BVxCgF
fXghfN4bNLOZFjnzEt1vaXfm+/NBohXqIrJaVX9uoqrxrj00RquSWx40+83QL1Q/
Y8gPSliPWa2Di4rGMBjlhFQu/n+0Wj/+kh3JY4JFqeGOCLn1nz3eGlE8Y/v4MYUR
jdXOcKW7KItlAbs9vkKOQPxUcTTI4npqxNWPb5wyalm7ZzjYmvPuHLrasw3uwVTS
ePXuHGj0NSBVmWH+Dq/hwlVhCAGAOWfKM3d9h+eFVgRr2/H17O2unGUbawOcH/ms
WVN7VYtOK4r5TZJeppZ4IzyGIxaPSg==
=Etpm
-----END PGP SIGNATURE-----

--Sig_/a7lLMRExoB07ofipxcoIIfP--

