Return-Path: <linux-next+bounces-6569-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D56AAD8D4
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 09:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD76E1C231C3
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 07:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92637220F28;
	Wed,  7 May 2025 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aPPqy4mG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B0F220F4F;
	Wed,  7 May 2025 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603791; cv=none; b=P0GLtNdPEzL3bPUE+LQX6STuigy2DcdGvFE0ld9iy42ZGtdHXeYWdoo4VEglp42TolpdJb3ZIikMiIARdoW2cBz0pdZGPWVxWBPaYpwDS476wYxWMHbqRQBBQWEXrp0GyLROtV9CsdSEj5VWt9XKucWvLRTcIC+qwBlzCxH4mko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603791; c=relaxed/simple;
	bh=LQMEWXehX4rRpcL+oCxpYue5fCODE4T/GyVy/NcJyjY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n0Ig8L9QF8leGat+b4KlS5N9bflFJ73GuNu5TUzfYlWHPUivboP/UMu7GEczFowpQ+TswANd74EMCzdUggdZ6Yw34KkJXPmcu7xTvpqtwye2godwe4NMsrGj/xam2/dFdqq3ZC2A78zmulcTLFVM9wcwnFeXI96gvXzmLyjxQc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aPPqy4mG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746603784;
	bh=7pUzUY31at0/wATfAeIe+epC9GtihotMHvlIHhHOsAw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aPPqy4mGB/dZUuhPkfymL5itWcr9Yi4OTIV2Ctidr1WDSac3aW2ooeiHbD+aMu6sU
	 4GWSN1Tpwz3l/X0LMemcPmxbhmruc2LImLdOykXkB5QhwEYskfMFIfKUibbq5Syx4t
	 SjV/ue72dX2Xg1cA7iqY9e21yvFVEHg9zVcqJKlaTXYh59FTxtNvq8Sc1veuh9BeDu
	 VcdPTfq4LFgGOPe8TKrQS1eRabBwRtg4MRAcO5I3gfjdG+mdmwZHtgBb9siDP4Ww7w
	 E9ukkiFjJh+RllWzjiQNDHN1J6W/WwccmnwOWQ+WlFijphGjEN4T0gMtsNdkAh1fFf
	 AShq0yfs+XtBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZsnLJ6D0Pz4x5k;
	Wed,  7 May 2025 17:43:03 +1000 (AEST)
Date: Wed, 7 May 2025 17:43:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the vfs-fixes tree
Message-ID: <20250507174302.57e3eb62@canb.auug.org.au>
In-Reply-To: <20250429191520.5aa5f923@canb.auug.org.au>
References: <20250429191520.5aa5f923@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NQI4.3F8iM9xdCCSiFmryaA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NQI4.3F8iM9xdCCSiFmryaA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 29 Apr 2025 19:15:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> In commit
>=20
>   72dbec48ca3c ("do_umount(): add missing barrier before refcount checks =
in sync case")

This is now commit

  b2478f9bd75a ("do_umount(): add missing barrier before refcount checks in=
 sync case")

> Fixes tag
>=20
>   Fixes: 48a066e72d97 ("RCU'd vsfmounts")
>=20
> has these problem(s):
>=20
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format=3D'Fixes: %h ("%s")'
>=20
> So:
>=20
> Fixes: 48a066e72d97 ("RCU'd vfsmounts")

--=20
Cheers,
Stephen Rothwell

--Sig_/NQI4.3F8iM9xdCCSiFmryaA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgbDwYACgkQAVBC80lX
0GyhLAf/W40yK8MB7ZpSinl86+oMnjmDAXbbpHnDztSkio/ykIzybyAhV4/FoYo1
5D70AC4oFBscqXceLT4Krfu8hjqBhMOMgHnbbjUMNwJb03HGd8cqrxTTNhql6sxS
/aYYDa+mFVkgRw1AvJNmrIYYzqoLZaxuoFsZ8HJ4lDJh96DjK86FoKXqGsHmTZ1e
7T/maNe6xuJRW6sRXw6/xz+e4oGIyX+/tBb0h0S0vTJLvJ7eTtpWh8Vzq0Imkl8/
OlsEqWVMu2kArMmzbTeonfWcsPQesVhIh/LqkbICK1dLD0CjihBLProGRDgY758Q
AzJlKWLty9a+oUGMZWk4rawr7cBw1A==
=pqdc
-----END PGP SIGNATURE-----

--Sig_/NQI4.3F8iM9xdCCSiFmryaA--

