Return-Path: <linux-next+bounces-9274-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E2EC95489
	for <lists+linux-next@lfdr.de>; Sun, 30 Nov 2025 21:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DECDC341A08
	for <lists+linux-next@lfdr.de>; Sun, 30 Nov 2025 20:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946782BF3DF;
	Sun, 30 Nov 2025 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rRvzm3j8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A28C21E098;
	Sun, 30 Nov 2025 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764535005; cv=none; b=BDHU2snQ9r6VDLcA6+/ultrv95T5N1BWugEFF0siA5C1upLdccQObdy3Q68i412qT5HcqilbE4ODyf2a2GrbAKpxHsGUdb9OVMk0kMnHdhcXgJe4ODzcbmF2OOgqBh+aAo0sEdFiQUWrzwuw7JNbXH2M4Bjy+YtRTqyTCX2xAZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764535005; c=relaxed/simple;
	bh=vD4bbev70voGZaQZMrVULhVu9ivWoYMN3UvTWWOfTDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=doC9Z8tFpSB5C4HWga9t4rHtkA++JJCFbT8O2ftGWtkTJjgjbccHtiJyoYf/cZUhrGPpTDZvpk6OV0S0mlHgeikXcnSKpaN5EYK7TuZcBTTd7W+zTIq4+CU+X6c/h5g202UFOcap1SCn4mPMDWMT0nV7EaFCyv9LSDuz+oEvgP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rRvzm3j8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764534994;
	bh=vNPq2jyc4I7LnCHpH0KpmT+Y92EUkcO6IyjJBL9ucEE=;
	h=Date:From:To:Cc:Subject:From;
	b=rRvzm3j8yz6LxtapZ/sLsx0AyO/Owl8qhTrTIj4qGP8lR8rNPL0HeNuxLjWDs0Dc6
	 nKcI7SW8uSt9LV+jca9S3HhkC8qSoXvdE4XbIoc1FJwmFtwmjQvCEvWeYIe3nA1+fI
	 ni1miMv7sBwnBS1/XdUWlgabRosgPcA5XKTvrW5ZMCP2quRMl/a/BhDRZc3AmH4h4X
	 LCTWQZ9jszzdZNeSDY3lirUGlDR4GEyhhq8tRlb1BQ7ygRZEZrJkDlGGRn4WSpv+5F
	 SMX2EqO2rCvT4v/qURmZ+Z5BP2NHD9LWEGvJFoaf7t0+FzVCDR9d4LYxirDXqgIenI
	 EdpjU0KrSyo4w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKJjG4DtQz4wCm;
	Mon, 01 Dec 2025 07:36:34 +1100 (AEDT)
Date: Mon, 1 Dec 2025 07:36:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the ksmbd tree
Message-ID: <20251201073633.3537d4e4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uj2EL3mCSEJulhm5MiErK8U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uj2EL3mCSEJulhm5MiErK8U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the cifs tree as different commits
(but the same patches):

  84af72563cf5 ("cifs: Use netfs_alloc/free_folioq_buffer()")
  ca7d71facd2d ("smb: client: show smb lease key in open_dirs output")
  f51a3d69fad8 ("smb: client: show smb lease key in open_files output")

These are commits

  bda97f51ec68 ("cifs: Use netfs_alloc/free_folioq_buffer()")
  0f473792215e ("smb: client: show smb lease key in open_dirs output")
  62d937a4a699 ("smb: client: show smb lease key in open_files output")

in the cifs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/uj2EL3mCSEJulhm5MiErK8U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmksqtEACgkQAVBC80lX
0Gz55gf/cYbJvY/XmF/rtuznhkVhYATWPaAmrxNbvygn6h2Atm8xWxvhKSjebr8e
U6WdrADjEK01kJc0kqESugmNsWHbUSVN0J31MVNy/+MtGHP7vMKjNfqGKFvBYcCb
KdIf1SQRR8gY4rX5PqkQmV2NOKy4Vc9WuE2Ix+EdNTFRXDN5LVNd+OO8p1ZsOyO3
Uv9sX8npY1gxb5kt4FQBRuoxO5NXTGCvlLjFuV0awqySIopBQwd4Ni1+BsZp8zBs
dFRUgoHvyE6kWTTIn0FKmGz3z6owvDJDat0Rw/NVyMFpli9dn7HP1BcNJwS++09b
Pl1stFRyBtO+Yied72oMvpKipfqZfg==
=FUoV
-----END PGP SIGNATURE-----

--Sig_/uj2EL3mCSEJulhm5MiErK8U--

