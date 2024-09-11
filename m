Return-Path: <linux-next+bounces-3753-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01910974F91
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 12:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A41CE1F2577F
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 10:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82B617E900;
	Wed, 11 Sep 2024 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HLyIv147"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7B42AB4;
	Wed, 11 Sep 2024 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726050082; cv=none; b=k3vFThv3XGaube8EKZvCbr1dStlMYDfUxtkD0n+qIZ+TWXOrFyYAozdFh2GGHe/kZHsTxAhP32jJIi+do+c6ekzBFxSXgz5ZLqm9mI4n6SdpkIhFxQ6IFI3aSJRILOBckGbVLgg6w3AGDJctt0zrXMtaIHz8Lrt+GVPikLAbjRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726050082; c=relaxed/simple;
	bh=p2A2vCVb6pei6YzTYFDois9iFz9dIWj89IQgTLKIV54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SExa5UsO7XGsXQIIiO9W1+XSfvhK3rtEMVpD/UgouL4k++FjOzMvU/ARLXj9zRP5teenEwDYO2zIw8hEe5WhjRYVjK3HeAcOmG3d1eUKwhdX7SUEicG7Iq6zrOYRqI5ECjLWYfaMPvcHFe+08ona7kqinh51FF+Zwbyp3SPYcMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HLyIv147; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726050077;
	bh=6feN7h7kAlsKXM0hxfEaT/zkwz3k/oL6pEDqw/eJl1E=;
	h=Date:From:To:Cc:Subject:From;
	b=HLyIv147b08DO30+wNcCbsU6/0FV1kyZGrfj2ZmUXUto5vMczhgmXN0pw/PAqvND4
	 Cd03fE+ZMlFmYYodXbtN5ox11AAzfOcAHzJgafe4jxyMgVyBN7f2j0NbSvEjyXCyzA
	 2u2nZbqr0aPhM4jMq+2prT/8ke6cGPPzVtu+btYKjBsy/Z+bF9H2LFpNGxzmx4/Yve
	 BOypHQqCwLGQ6K1eM0PBgDrW5a701kXXy4l0fZGPpBszslE5kkrFOQORXQAAWpPYSX
	 8XrHjBi5QLnzRZO/0ZzCKqGgilNW1zG25VphsnuISEHMYgEn/sGxABzPfHq4079nlo
	 NbGzhWbDz7OxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3c6j0Zz5z4x6n;
	Wed, 11 Sep 2024 20:21:16 +1000 (AEST)
Date: Wed, 11 Sep 2024 20:21:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm tree
Message-ID: <20240911202115.2ff85943@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/77lDK24Ti0WfLosBUmEnMlc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/77lDK24Ti0WfLosBUmEnMlc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
these warnings:

fs/inode.c:242: warning: expecting prototype for inode_init_always(). Proto=
type was for inode_init_always_gfp() instead
security/security.c:749: warning: Function parameter or struct member 'gfp'=
 not described in 'lsm_inode_alloc'
security/security.c:1689: warning: Function parameter or struct member 'gfp=
' not described in 'security_inode_alloc'

Introduced by commit

  3346ada04cf5 ("bcachefs: do not use PF_MEMALLOC_NORECLAIM")

--=20
Cheers,
Stephen Rothwell

--Sig_/77lDK24Ti0WfLosBUmEnMlc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhbxsACgkQAVBC80lX
0GzekAf6ApkgLw7Dsyb8alluSSH3K6u/DadwiLM6J5AuWcymTr8ujKEegfxvebTj
hgX6uTze5Z3U3UuMil8YFcFEzwvbQF6inOQjFWiQBgNpEolra9cnz5aSBQD2Ylai
7kJVSQ/ZSyQG7nUmNrMiYjv5zMp8kfhrp04tnch1JVsYV7PxsITMuLnajgi3qH6D
o9FTzBB9sHZ/8bY1A+iyCk5jFFrCiiUXOUeFF/R9fYKcMbsvR+fEuKPOusZanMHM
w9MRaRx5FAxk1yy0PDJAdBcqrVKJwrw8IoTcosW1fAs8OGcBQOmjxOj+Yr40KuW4
U6O/dLdLW69cer8IwW7f5VWKuz8fXQ==
=uTPb
-----END PGP SIGNATURE-----

--Sig_/77lDK24Ti0WfLosBUmEnMlc--

