Return-Path: <linux-next+bounces-7188-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE18AE138D
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 08:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CF0B17F60C
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 06:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C5B1DC997;
	Fri, 20 Jun 2025 06:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CCDWQLhN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A2030E844;
	Fri, 20 Jun 2025 06:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750399435; cv=none; b=siX+nRaGIBpxJj2h7y74y7k5AmqM3+BBPBhgpESw47FivLRPhjUMGR2SMVcsMhkr26JWVInaU3tEddI7njXKzEBRHdgfM+olYO/8ISAbKGaneD7B8TRem+i1BE4X5ZBjATaTvUqwFl1Dr4CNGMzaZR/uhkkCoM2HWpfpeXFM2R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750399435; c=relaxed/simple;
	bh=dEqEwodf7vN0SzfGLCwlM4Gw236rbgLtIL+40tlnfMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DcFnFJGGYkUs6Oj+zXK1D8Uhq8g23WKNWTa+bAVBB3/YSQHuhyWQChEY1pGFBmI6rRB6o7hblO6lf7UY1iLrWDWSrV1aEwTMkPho4h5GBgo/lGkSaYGW+klQ34MikBpOjznM+0Ff696t894Rsr6dzBG35J3EAeBOw0fhoHNQDsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CCDWQLhN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750399428;
	bh=QFgAX2IQC6Co+8zhnEdRbkLqxWE/aIwH3xsg4x19bik=;
	h=Date:From:To:Cc:Subject:From;
	b=CCDWQLhNzsIqvnB2tJVyRmVDje/XrtNfE02EeJav/Sox+QtVpbNVrsISI7htTN3/d
	 DCIa4/ff52KlgKZZ5lxK+svftXDLcAkojicyjsmNxxIyLJiMk8ugYUKoyljY0YCWom
	 L02pWAE6+8Bz21r1q4Joldnxt+XC29gEogGqhGXGQgqq7EgML01odS9WePV/Rnc/aP
	 wsP4f5b/3nYHM9jGm0I8uohcHMSPWpPSN5kwX4YiozsaPiLHHnLrPcfaUrfd3/ylMg
	 azIzACeLx9iD9wtJZSsVnm2TB3S0a/Wbg02nmg321vzeKoQgOl6Q81bqylObI/IN5T
	 PQleklrfGhbzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bNn3S1dyjz4x11;
	Fri, 20 Jun 2025 16:03:48 +1000 (AEST)
Date: Fri, 20 Jun 2025 16:03:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Abinash Singh <abinashlalotra@gmail.com>, Abinash Singh
 <abinashsinghlalotra@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mfd tree with the mfd-fixes tree
Message-ID: <20250620160345.48fd2d50@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qAjJ+C_uXe.ic9MtoV+Nzq.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qAjJ+C_uXe.ic9MtoV+Nzq.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mfd tree got a conflict in:

  drivers/mfd/twl4030-irq.c

between commit:

  d9d79e4f7dc9 ("mfd: Fix building without CONFIG_OF")

from the mfd-fixes tree and commit:

  3d77b3cc7cc8 ("mfd: twl4030-irq: Remove redundant 'node' variable")

from the mfd tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/qAjJ+C_uXe.ic9MtoV+Nzq.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhU+cEACgkQAVBC80lX
0Gx1zwf/cAn4az/cyRuPeFBWsEi/BmNzpgZROkAh1J2Yg2jmQBbJ2HNE40Fed95k
6K4No65T71orKztZyIDzP5iHXkGrImoIQ+iStN+R0ujBepduDlzrsyKX9t9/7nsi
KPySuoTh65uOiutVmP64AfGYxoESHaJEO2f/DMrmwABORwEcntShVEkHc9Zgrvgm
TsWX6F7u5B3J8cWS7plBVEi/jfWS3ELnRznMiDoYfICgZpsgrk0nvC7PGW9RygoT
DESW5DPrI0EZAT+UZb5KjvMPeBY0jEWPXxONH3y6XSlYtMD3BHc6c6JDGwxoOlyQ
ts9Z/QNWFVAn6M7LMmh0JDF0DYEuSg==
=2B5T
-----END PGP SIGNATURE-----

--Sig_/qAjJ+C_uXe.ic9MtoV+Nzq.--

