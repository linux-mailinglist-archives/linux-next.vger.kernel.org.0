Return-Path: <linux-next+bounces-2931-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7415892DD2C
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 01:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30BDF28148B
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 23:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69BC156238;
	Wed, 10 Jul 2024 23:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i3Np4jzr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B202012B169;
	Wed, 10 Jul 2024 23:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720655467; cv=none; b=frfh7nDChYzj3+mTgXF92mMjNnB+EZbA2oHRbfQgFt1/YiY/k18BAzP9lTU3uUJcOrhdXPNIDzutZ0cKyLXojD30PHmWhun7Y+wC6+iottI+qQOR2vwGx8rM8U2zbEjjFDHiTijiX4IjOuK87F/ukp798Tn+9j+jI5i2A2gKLAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720655467; c=relaxed/simple;
	bh=mtsASaRHLqCYOck08Oznj4zFQ0NoMEVAeyzbF/s/GWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B4D3yKLwnEzhIj8tkIsmh6mQ4RRTqBmhkH7Vr3R0QN7CPTygHYaWOoEypXJKGLRaXdUlpOA7zmgIzxmdIe+IZN3dOL3kgSuS38oMxSU2JBqtV8yRQZ+iGW/ZESfQXsZbglbqizCLwRw1n4mNrFbMWZV0RGFX3LCea2X9gKeIFSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i3Np4jzr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720655458;
	bh=gmaq3glubBaHvlPPSZbCguHSxQhUdcxR8i8ZKyuSizc=;
	h=Date:From:To:Cc:Subject:From;
	b=i3Np4jzr3EC02FU/vme++F3LYHbzDZuxiVM32qgeu+wRvQfkHbK4AShO2ouPhwWG8
	 qeIVZDriTdyzPOiGpSYmIVVGjIj11O9nljNMQLnQsjhnJk2J3UNuVWst45MdKfyISv
	 j9LOtsN7qD6tYaaRm8ep99Cyx8yD2+bXwK/XHwqGSfdUHKPnVA3Y9Ief23IC78BD7L
	 e+DGnNzrUDpcMNtL7pIHm8ONvWDf+Lk5xRIUeibgiB+HcuCdhOde56dRs+1gdgGFoK
	 9NaG9GXwsUus9c4vL7FMKyMVS11GYKFxKc8oUTPKftidHELQTRAU9zUYOJJ6VLfjhh
	 /XgJvvcnbAywg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKF421Jd7z4w2D;
	Thu, 11 Jul 2024 09:50:58 +1000 (AEST)
Date: Thu, 11 Jul 2024 09:50:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the bcachefs tree with Linus' tree
Message-ID: <20240711095057.469a268a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nQyA8CJS2klhp_UN.TA7=.7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nQyA8CJS2klhp_UN.TA7=.7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bcachefs tree got a conflict in:

  fs/bcachefs/alloc_background.c

between commit:

  d39881d2da2a ("bcachefs: add check for missing fragmentation in check_all=
oc_to_lru_ref()")

from Linus' tree and commit:

  f75ad706a1cf ("bcachefs: fsck_err() may now take a btree_trans")

from the bcachefs tree.

I fixed it up (I just used the former where they conflicted) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/nQyA8CJS2klhp_UN.TA7=.7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaPHmEACgkQAVBC80lX
0GxaKgf/edr1S35gOhQEjJXLBw3C5y1q4xyVmUoIcaRiGGDpUa7b8um2xNkKUYOR
4q6YynRmRLABKVPSlxbjhWEMsNtp2oZqpucxVK7T2few1RUo9Xh+eQcj99jN4Qr1
PJjwqzsi0IDISkVnIZQIfgBCS2lvveNQ6lNppHCRnwhukqATfMxiVehtG11bHtuI
N5F9TuVUQZow1OxyQe5XVhNw/E8mkG8XRuw2hh6ndq5qBOaY3KNT1ST4B/vE/tVf
ZtRBt955o9qjrNxZrb5FJc+DECLbQUfZqTfkNyTdj2CHGQYty3S2bFM6N2nzAxqd
wW+dth/qKTB9KDW5+6WaGrTR3GFdhQ==
=pRhl
-----END PGP SIGNATURE-----

--Sig_/nQyA8CJS2klhp_UN.TA7=.7--

