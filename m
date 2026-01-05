Return-Path: <linux-next+bounces-9539-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79602CF2054
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 06:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B49B33009406
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 05:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24C9221542;
	Mon,  5 Jan 2026 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p1ZdKNDc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7103A1E63;
	Mon,  5 Jan 2026 05:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767591896; cv=none; b=qUMwgenCRTnOqbam6Wls2HOqOLSGAgER6wdseYNtAnGJBUByOwteC96laEzzgHDmjlRgeFAWlofzqieU0QEyetigMRQyO0mzfawzGTN/X6gultCyHzv/PZNUqac450ffOLRRw4F7UrWpCHbhmIrgL5u+Guxp7M/pknhCkFNiF6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767591896; c=relaxed/simple;
	bh=GLwCGiwv4r7v4Jjk6JrL5U3IIZMQRF4V8OcQNOk7WJs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LmPNnJEiCjjDBfsSwbv5iJNIRnZQ4M1/8wjqMgHlFZR29FoOb2rISAmzL9W3wcWDDG9e4ZzS32mi7hW8m6TpdADLxhGqfsR3qn/AVdl8yOm6/naBvxGAcgYvi/kpYbz8bXmeFrtSGG4d6u6qREqpTUHDeVw6hAG4fKc4CsWIhco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p1ZdKNDc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767591891;
	bh=B0UnySQbOR5XHMDLttiDRkOUxZNINhEeNJNEAEgakBs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p1ZdKNDcNhv/LV4in+r04DWMDE1qaelVZZvTIQHfr7BbD39czF/hRDeHrPcaEwMtg
	 69Bs0iCodlSjQ4HNs4RXu/eQnX1AUkTJK+EyZa0I8r0zH3O+1Zlzu1evC3TTNSsLgg
	 VJA7SOTkrjq463spMjvc5DWzz/q5jQ8G5Yjt+Qqj4a/BWVTy/EMZZceebUWov1Om0x
	 yZt+hcBN0NSYnp2IYJghCB2O8UJzmzwnPAF28DmmMhNvCv7RmajWM2hM/rLc3uDMb0
	 7QaMO/WgphJqsbcc6yZ2WQYTvV38BRooo5Oaocxn5BGPym2HeBSYilh9zJ6CtYmRbC
	 v+OKyQ9mExy3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dl3Ck72cYz4w26;
	Mon, 05 Jan 2026 16:44:50 +1100 (AEDT)
Date: Mon, 5 Jan 2026 16:44:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the devicetree tree
Message-ID: <20260105164450.0bce20bd@canb.auug.org.au>
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
Content-Type: multipart/signed; boundary="Sig_/2hws_74h3I8DO10Cq/67_uX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2hws_74h3I8DO10Cq/67_uX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, 28 Nov 2025 08:54:34 -0600 Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Nov 27, 2025 at 11:10=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
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

Today, we are down to just

scripts/Makefile.dtbs:20: .dtbo is not applied to any base: rp1.dtbo

--=20
Cheers,
Stephen Rothwell

--Sig_/2hws_74h3I8DO10Cq/67_uX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbT9IACgkQAVBC80lX
0Gxzhgf+O/RnenIzRkg8cChxOao6RwEfbOkLFkCSpyi1hSakd8KzE5eIRkCrOKxE
+fb70QRbloiruAMMcvmtb0KGeLz5sNSqchccrKzyGvq/JHV6wTp8GE5ZeyxjuifR
2SzFPPpM84WhKwxC6p1HdV15ccZP3I6nfkh3+vRHYdarOZWSe3BlNv0V6cMHhgOz
QbDlEMiLx7EKPjxxKbYe9UPpC0gThQY2cHwvZmvpSznxsEI5X5YvIWEZdMDMB46I
3F6T9L1DgyTmiKw7JbqHlx3GY7sCDzQZldtIfSf6YfO1sycAi1LmpHVo4qtvNDA4
2jHUpcmv8am3fxwI+wMKTRENPdq/Ew==
=OtsK
-----END PGP SIGNATURE-----

--Sig_/2hws_74h3I8DO10Cq/67_uX--

