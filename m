Return-Path: <linux-next+bounces-5366-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508DA27E5E
	for <lists+linux-next@lfdr.de>; Tue,  4 Feb 2025 23:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 864443A2250
	for <lists+linux-next@lfdr.de>; Tue,  4 Feb 2025 22:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C67219A8E;
	Tue,  4 Feb 2025 22:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UOkicxD4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A4214AD2B;
	Tue,  4 Feb 2025 22:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738708738; cv=none; b=nNQKg1wYOxCkpCYUkduTlOHcOS73A/bgzZ0o6RXUsqxWUtDo7adVQgj+yC9kFn5npFFdJH0h74hoCf00nMqgmLJROmBWFjsCmCn7noeNKb4e56r9Q7N+ickyUPzwrQQcg6F5lKl+shf3MD0NmZSiZ2y3HIdudQtXtJB5CR/HKHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738708738; c=relaxed/simple;
	bh=Td08mtUxL+Ct5HUnAge9bgEfYjkHpRDL3veq6FpQh1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L5pq6lHh7ziccEiKStaUjWIWw1UoV1DonJsKcR0YwNtpY6zdCTBa609Hw9x+A9MErY4NioFrYJCRi2FjoZENGl0wI3258jXzMYj6AOlt2azTLyb+W0KlzhJhOCQlK8IL7Pt6iY3h6OncCNUhepZbtk3qaEVwHn37xdBRnJOfSDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UOkicxD4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738708719;
	bh=0sE/bFHwTZY0AsxoNR6LL6Ttp3qsG/luyeKJ7ONf/2I=;
	h=Date:From:To:Cc:Subject:From;
	b=UOkicxD4Nk+gMMSk0Sy0hXBBAJWeSxqR3qvUSYvmI6mb/ss9zDIfv0fPgW89pimfD
	 Q0x9O12yYqvpYqqRCUtTOPgagRBy9uEkeCFsd+f+ZvaGd2I6QuryKVXZvPTFQ0yJMB
	 rPOzyhlD+w2ZgwCMcl3YZmNxYTlTkvA3hWlS1+MNWzHSoxG+SSzxMnHB4uEZ8XPICH
	 JsRm2lXxXGASgbaS2jK+2A08LjyeUYqMDOAe6F0yna5nUPh8C5eZgHOMn6ZuVcYfna
	 UOBsslG+qvN62cptz5s2+vkZhtcrjuqNMKl78+SG44zYSm1iUjEVqCfOCGBLqfGhfl
	 Gle/toQsPJi+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YndZ74tb6z4w2H;
	Wed,  5 Feb 2025 09:38:39 +1100 (AEDT)
Date: Wed, 5 Feb 2025 09:38:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with Linus' tree
Message-ID: <20250205093823.4567f09f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JQEtaHT+hZ786TKACTAFjBI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JQEtaHT+hZ786TKACTAFjBI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got conflicts in:

  fs/dcache.c
  fs/erofs/zdata.c
  fs/gfs2/quota.c
  include/linux/lockref.h

between commits:

  4b193fa75eff ("lockref: remove lockref_put_not_zero")
  6d2868d5b6fc ("lockref: use bool for false/true returns")
  25d8060418b4 ("lockref: drop superfluous externs")
  63440d1c6dd1 ("lockref: add a lockref_init helper")
  8c32b87c4f88 ("dcache: use lockref_init for d_lockref")
  6f86f1465b59 ("erofs: use lockref_init for pcl->lockref")
  3e652eba244c ("gfs2: use lockref_init for qd_lockref")

from Linus' tree (plus further commits affecting these same files in other
trees) and commits:

  74b5da771c89 ("lockref: remove lockref_put_not_zero")
  57bd981b2db7 ("lockref: use bool for false/true returns")
  80e2823cbe59 ("lockref: drop superfluous externs")
  5f0c395edf59 ("lockref: add a lockref_init helper")
  24706068b7b6 ("dcache: use lockref_init for d_lockref")
  160a93170d53 ("erofs: use lockref_init for pcl->lockref")
  0ef3858b15e3 ("gfs2: use lockref_init for qd_lockref")

from the vfs-brauner tree.

I fixed it up (these commits are just duplicates, so I used the former
vresions of these files) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Please clean up the vfs-brauner tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/JQEtaHT+hZ786TKACTAFjBI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeilt8ACgkQAVBC80lX
0GwW0Qf/R4XPvt/edHqlnVrvZzEQlcVQO5awkI7X2vqriYJgEPww2Yg4NFJ4PQuy
5ulZT8JnQY3gJByVGKQVP5IeGyy0DmqhVvNiMLQW53BCPS0FCCDuy6E1UQedCitZ
/yPc3+iLiZqoIcLOq0LKNIV+BZjLU33NAke4VDkBgF6zEyxsv0s3x492qP0/Xwor
nTXDIi6aQHHwekrQRztpMpUt4/koGlJYRqdiU6Msxkp4t/hIMI9kUOrX9yrtaHC6
6hP548b0xJ59daoMrqNX4iuN6NktPPJXy4W9t6PDMnJn0a+eWnShBPk7yJihLXNW
alKYNqM+JSdmaVPS33mnojhkLs9IRg==
=MRL0
-----END PGP SIGNATURE-----

--Sig_/JQEtaHT+hZ786TKACTAFjBI--

