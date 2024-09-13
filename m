Return-Path: <linux-next+bounces-3819-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED731977875
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 07:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 771C2B26223
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 05:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC311A0BF6;
	Fri, 13 Sep 2024 05:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tb7m+Zsz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA92D1D52B;
	Fri, 13 Sep 2024 05:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726206283; cv=none; b=lvsydUZkhad+su4Rr9i39BV6y92ACXj2BhoLmlPa65nu0xcXdhYrF87mEJ5/lHdwwUSE4Y5qEpj4D+EYK0MOHBRyoVVhRXHgNrMjW7Ce9nFOHlEFfi4CJpufsHyLhaYSyDxwdq3QiIQ+VmMsrmbkcvtdvLoDQSZIDPCwTFt2Vfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726206283; c=relaxed/simple;
	bh=y0vunahOwbyq+pBN+DnwkZltqno78Hmh2YHmyIimOM0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IV2fRxIIIC3liP5npox/y8Wo1/UpLn4uTCVrPa/sx2+6NYtv+qiJWmYImaaFdiRTy5OCPk3AP6A3hoNRbWk9CFQM/raPcVC3OWDleTd3Q+gaOkIPFoNqAMxa9lZFwyJrUvgSoAfE5sopdeFKlfZZFUiTsCVZoW5kNAFQ1P3odF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Tb7m+Zsz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726206275;
	bh=Oc4UPSV+MqwV3Yrw5FWaiaSkA/TSezeDNS9FcjUTgUc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tb7m+ZszdoEXPKnaJ9JIsqfvbHF9xNPnDl0gx1hf1jShOUwXCEuvqOl9GrZ/k80zx
	 OptFT6GldNQDd9hWOmuudoB2W0KVPoAGomDSXZApHFQgO6UEwO3XSzT9B6TE5NMZPn
	 7IoPqbVLLPW97vKAbHVEr1qWdxNKp9n+LOdCQj3jCB9LlrDKwGu4LXP31v1g13gKso
	 SL64syuwE8HBdfUSCBUUa39/LIxYcd9alkr6a5HhE3/fpN2+t7HGONsWk0oIIC1QvU
	 i1zOXnzLyzTQ/1O/PhGyGi7s7SSzRygzbPcdJhLtDHIAG7udKfrbOi0nvWcL8cDQD3
	 uwkLX3RFW2cMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4jtT08Nhz4wnw;
	Fri, 13 Sep 2024 15:44:32 +1000 (AEST)
Date: Fri, 13 Sep 2024 15:44:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Guenter Roeck <linux@roeck-us.net>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Message-ID: <20240913154431.14297f94@canb.auug.org.au>
In-Reply-To: <20240911145543.270c9c9c@canb.auug.org.au>
References: <20240911145543.270c9c9c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/98JP5/tzIjANEHTM=pcyrQf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/98JP5/tzIjANEHTM=pcyrQf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Sep 2024 14:55:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the watchdog tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> ERROR: modpost: missing MODULE_LICENSE() in drivers/watchdog/rzv2h_wdt.o
>=20
> Caused by commit
>=20
>   f6febd0a30b6 ("watchdog: Add Watchdog Timer driver for RZ/V2H(P)")
>=20
> I have used the watchdog tree from next-20240910 for today.

I am still seeing this failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/98JP5/tzIjANEHTM=pcyrQf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbj0T8ACgkQAVBC80lX
0GwASAf/aLMZ+UhTHD5f4f2nlakMPAF8mxdx1uTmdEH+83iKxhTF3KWsrRpnqcEf
Any3a24IkXHp3GJRFc/qiymqW9fpb4csi0pQRrBf4tqd7c4FZV18403U9rvWAtbq
g/ZO61I8JpxilzRcduDrfCYUA5/GoL1a37qsIUgZOenyhF/qr/QlMGj4HPaZcWRM
KmUaHZldi7mXJU9kKbgpTIx8BZru9c8Iej/h8I6Ftc7BdEqmVSgHlEZKrOrgEppb
Z1cgAaqUnErEvuJkozumFtgRu/aVAq2jUljiH6EwdvPSr2ILgXlheB8OnduEVa0n
mQCBznphSoAlFA9XOLHsbN9Dg0eljA==
=vWLj
-----END PGP SIGNATURE-----

--Sig_/98JP5/tzIjANEHTM=pcyrQf--

