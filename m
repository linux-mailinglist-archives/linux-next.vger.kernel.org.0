Return-Path: <linux-next+bounces-6866-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E1EABE849
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 01:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C8054C8494
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 23:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C8E219A80;
	Tue, 20 May 2025 23:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cEu+EbGS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC41854;
	Tue, 20 May 2025 23:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747784928; cv=none; b=rLidNnOcFlGB+exFjAiyi0nKNFFeMOfxzDDY2yVmZ2z4XBoB4SmG2TD4n8yRjzbC0+vxu0rnow7r3e63+rM2GqC3xMqvhhIX1rTUyHbCXpsuPEPopwFYnPElJVbFPZb86BYs0w671mUOav6MKulBlDml5ALOIfzR1YvLxYNhH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747784928; c=relaxed/simple;
	bh=PTpqCh1tVVJeodfv0Lj4AEJdR9WQMGpprko3meu0ti8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EDAIXWZL234A+BXSq3JrNkTmATtDC02y/5qwEsXunfJFL6jrGS2zSV2EWf8iQTYJPV21srBYAd+eAYBGoyq9UvUnoPWyiMdKKQOsOhMIPualSjimNJ/oLTjxCcMFLXfr8wONufE/RbjEPORRlVuQxKTs1f6q9R+5JoC02C1R50k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cEu+EbGS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747784921;
	bh=Yv0r0mT1JKHm9eDNjQhV13UnSHIC2CokXEz/Ftu3i6I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cEu+EbGSFP+POBGU5MolttJRAM4Vj9DUQ2smHtpdyazUhNGlaTLYS++BBgA5XDsPI
	 QZ1g235uWV4AAuct4m22Z3dyHXJEOxuMGCET+42j0SS1Xd6ZiQQayKu2agsE6Bmqa5
	 Moav3WdUuy3L94UZAtdsG2/jRls308T+G/dNB0CaWnMxVvQBIT4I549wqvGQCecGY+
	 MSQHCq6mSJBKnD6WSMn5IIIuGsOjd5vRTYA4ofeGktWgLunDJ2lWabhP6+yFvLv7Bl
	 zOk2P2rLwEgoE15pj4IC1SoriqnlGiucAz0RKFQvd9BMxJ4zcD9f0hEW+uIBTmyMTT
	 Hxox4UnwoPD0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2B8T3hbGz4x8Y;
	Wed, 21 May 2025 09:48:41 +1000 (AEST)
Date: Wed, 21 May 2025 09:48:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Miklos Szeredi
 <miklos@szeredi.hu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250521094840.6a5bb989@canb.auug.org.au>
In-Reply-To: <20250521094551.5c26dab0@canb.auug.org.au>
References: <20250521094551.5c26dab0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1_K33pf5o9n2+ErBjawb.HQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1_K33pf5o9n2+ErBjawb.HQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 21 May 2025 09:45:51 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> The following commit is also in the fuse tree as a different commit
> (but the same patch):
>=20
>   8d9117009dd6 ("fuse: don't allow signals to interrupt getdents copying")

also
  e0410e956b97 ("readdir: supply dir_context.count as readdir buffer size h=
int")

> This is commit
>=20
>   376464b93692 ("fuse: don't allow signals to interrupt getdents copying")

  3bd894a88be0 ("readdir: supply dir_context.count as readdir buffer size h=
int")

> in the fuse tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1_K33pf5o9n2+ErBjawb.HQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtFNgACgkQAVBC80lX
0Gyz+wf/evAh8+7HV/jx/fDPKnRyEvLuB2G/HIWIgcCv6fyBV29RquTZ0kYoVMzk
Us9NUdlXcX+Suja59RmEzQUc0UGsj41y0tFD6jczMZvf6u+c9CmyEApej5+uAggq
dTIX4ps0sWMAj/Gqxe7yhMPsizkE7PJNkJKI70of2FEdPLMw5gOR+j9GvFY5TXTd
4zMDjawkQuH+IVb+dGW/eNhDsxk89zorsPFNN6Xkqv/het5jrj/c1tEqCgxJxjUN
5sTG4Vr6+86NgN/6/xiWYxsMgxEESVtjPVWyhSbkVm3c6NdusWxogwCVH3+Dhy2i
AFG/gip/wB3r08OrXMGLu73075TeQw==
=+Yjy
-----END PGP SIGNATURE-----

--Sig_/1_K33pf5o9n2+ErBjawb.HQ--

