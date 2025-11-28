Return-Path: <linux-next+bounces-9256-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB1C90DF4
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 06:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56B5F3ABFB4
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 05:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D8519CD03;
	Fri, 28 Nov 2025 05:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XmLvFIA+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB3134CF;
	Fri, 28 Nov 2025 05:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764306605; cv=none; b=uU0swr9SrdccdRoQbudYYchWwC66qRWt28OJ1BfkhjLRyir+9MSxGgrP1PCI5Xxctv6G1w4i8tjM7Qw+KqB6Fc0hTRaXgFHdeQBrlM2ULCuTLKKycIV88dP8VAdAvzJwrTksFGnFykxrCIM3emJhwUe/eDaWkQxwQHQLqJaeigA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764306605; c=relaxed/simple;
	bh=rMNId+oXRDAYDvd+HM9iq9Pfm0NsX503y65rizMUavA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uZOe+nDyTIg07DS2CwAMGiRHM+5MOIiwHjlgaBwIgRJB+DdfiURJjGgMjR5OT/EpKAhw8LJKZ4rptGe34L+tOyZp+6qAs5M8GvXIgUbxB1m6sX4cUch/1in5fPmrATstsAsHZBVbMLQu8BqWV9E8zjhQj9kUQTfPDqmAV8mtc1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XmLvFIA+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764306600;
	bh=jd/+JBA2sk4gg4CLOUm/pQQp3FKV3gvj8wtJcQ3Vals=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XmLvFIA+F2U9YxwfUJcYBY/4GWtsNbP658D5dLyJwylDbYMc/4lBsNv7E9K3h5VEb
	 eWjsRfSEI381e04ivRzyGjj3JydAb4t60142LC2PNnAlz57FjZJYkv5/9ExmU2Qrd/
	 2K3I6QAQeoqTpZhVHPu06+gV5tZki5JtU5ZEfCw7cOZOM5stohv6CAEo/bqTqQMTyB
	 +iK3HVqCYoZZe4wzeraRhAJoERyBpTf2SVt5DEhP3R+bi07UisfiZewSJ5uTltyUyu
	 b36oQk8zbHaeC7umUS/q662/M5XREw79hoKPLyI4Rr0cnnq2yLY9pJ1PaJirXqMRgc
	 l7fVvMZhbdLRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dHhF46N86z4w9w;
	Fri, 28 Nov 2025 16:10:00 +1100 (AEDT)
Date: Fri, 28 Nov 2025 16:10:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the devicetree tree
Message-ID: <20251128161000.08b3ba05@canb.auug.org.au>
In-Reply-To: <20251118143843.0046d6dd@canb.auug.org.au>
References: <20251118143843.0046d6dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vAn9xn4rBTxNM1M/Fw2Hanm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vAn9xn4rBTxNM1M/Fw2Hanm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, 18 Nov 2025 14:38:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the devicetree tree, today's linux-next build (arm64
> defconfig) produced these warnings:
>=20
> scripts/Makefile.dtbs:20: .dtbo is not applied to any base: rp1.dtbo
> scripts/Makefile.dtbs:20: .dtbo is not applied to any base: mt7986a-banan=
api-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo mt7986a-bananapi-bpi=
-r3-nor.dtbo mt7986a-bananapi-bpi-r3-sata.dtbo mt7986a-bananapi-bpi-r3-sd.d=
tbo mt7988a-bananapi-bpi-r4-emmc.dtbo mt7988a-bananapi-bpi-r4-pro-cn15.dtbo=
 mt7988a-bananapi-bpi-r4-pro-cn18.dtbo mt7988a-bananapi-bpi-r4-pro-emmc.dtb=
o mt7988a-bananapi-bpi-r4-pro-sd.dtbo mt7988a-bananapi-bpi-r4-sd.dtbo mt839=
5-radxa-nio-12l-8-hd-panel.dtbo
> scripts/Makefile.dtbs:20: .dtbo is not applied to any base: k3-am62x-phyb=
oard-lyra-gpio-fan.dtbo k3-am62-lp-sk-nand.dtbo k3-am642-phyboard-electra-g=
pio-fan.dtbo k3-am642-phyboard-electra-pcie-usb2.dtbo k3-am642-phyboard-ele=
ctra-x27-gpio1-spi1-uart3.dtbo k3-am642-phyboard-electra-peb-c-010.dtbo k3-=
am6xx-phycore-disable-eth-phy.dtbo k3-am6xx-phycore-disable-rtc.dtbo k3-am6=
xx-phycore-disable-spi-nor.dtbo k3-am6xx-phycore-qspi-nor.dtbo k3-j721e-evm=
-gesi-exp-board.dtbo k3-am67a-kontron-sa67-gpios.dtbo
>=20
> Exposed by commit
>=20
>   d8c8a575f5aa ("kbuild: Ensure .dtbo targets are applied to a base .dtb")

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/vAn9xn4rBTxNM1M/Fw2Hanm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkpLqgACgkQAVBC80lX
0GzFTAgAjpMUqvJ6D/NaBIOqNS+il8bHtLPZ4zj0x/VX90r6StWkATvieJ+6X63e
pBZ1F2U0HI/wgdgOgoDbA9/IW0sj6T3v0j5DcnERjPXnqPJQpS7zGOZSr1s7X+Y/
XRHWCVEqP7FOmrscbQDm25f84BAdogrcoCrMCRELofxhu1JmSO20L8xSRF5wYtut
SrsArbmmzqjyWxlhpGP40DZIvKLgdrOvage2Zj/uyTdXhiWsPaOZfB/OWoag7ogR
5PmTBObDSSjLHShFScS68BVAP+FWLB8KI+ZjngmZ/rrON35gTTBrKu1qnIi2qmcP
5YVq2KehU0V28pDh9Zwfar3D3BIaTg==
=rhRP
-----END PGP SIGNATURE-----

--Sig_/vAn9xn4rBTxNM1M/Fw2Hanm--

