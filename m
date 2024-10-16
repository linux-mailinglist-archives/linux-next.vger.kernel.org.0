Return-Path: <linux-next+bounces-4291-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5EB99FF46
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 05:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 511FE286055
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 03:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0C04204D;
	Wed, 16 Oct 2024 03:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lrMSiPkB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21F113B787;
	Wed, 16 Oct 2024 03:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729048732; cv=none; b=AGVVjO1G7nzxgvALUbbEP7W1N2oDRvp0bu4i5BRzZN7QecjLSk3ux7Tnoa4VktW/2/5T0s49QCqHA5LNewC/YhSdkZmaGOBROwZFJEf5xMhlwOgtXtfAbhVwP5wJeMEPgUHoYOWxHC8v9jJx3LfQ5CRcF7SesxzNWaTFrUU3t4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729048732; c=relaxed/simple;
	bh=p9b2WPG73nAp8ay4b0eF2XCrq4TBKFA/SNrwcHHJIRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l3m6wHgYWpPxim08u0y6L00g2QIxGVnIOyS9HQYjV9S1lGlfH6x7K/UxZ/1HhIVjkBovUuz7HkvJCaY+KZX9xqItrLWOoJ3FI8BS79bZxTkwVH8iABsaJ6+p8F3G1m2at7ggpVbQUCg4+MNEyyHuGucnULO/7Nx8ypuzGFh7nRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lrMSiPkB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729048725;
	bh=GDdbVBGUXiUgxT/q1KulNXtsBxpIEUfeuCQMrRIgcNY=;
	h=Date:From:To:Cc:Subject:From;
	b=lrMSiPkBIv5xzSVxwj19fmKzI4PhoQWoeIepzr1zk2ttnYhy6C3bm/HrOBnqC3cpk
	 Mw4eiXUwCBQDsZJ5yytSDOFiZgfTzztsynwDR3YyR/i1EdTYPq90lF6gbbnD6kEkS7
	 1eLlu7TH/dHsNpCv7iARiTUiVopgZFAyMyyP2Mby0RRAfXDf0euZ3jC0/K6PQatWbj
	 JwJt5OhjLtBYzCeAgNFr9rF0y6q4b7tEuzWHgO51D+9BTQE0xWuE4iwdLTEZujwfzS
	 HCtrvbCDj/q7Qt2v5vz5J0R2wM1reOx/sgyhrNpOGLOBXnOMQPT2ztYl/71SjesYYB
	 +MuUjh2ZCxCjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSx50488kz4wxm;
	Wed, 16 Oct 2024 14:18:44 +1100 (AEDT)
Date: Wed, 16 Oct 2024 14:18:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sergio Paracuellos
 <sergio.paracuellos@gmail.com>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Message-ID: <20241016141844.1080e1aa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MyuMygpt=evBWB192439rPu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MyuMygpt=evBWB192439rPu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/staging/media/omap4iss/iss.c

between commit:

  95397784be23 ("media: staging: drop omap4iss")

from the v4l-dvb tree and commit:

  c1a5060ec800 ("staging: Switch back to struct platform_driver::remove()")

from the staging tree.

I fixed it up (I deleted the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/MyuMygpt=evBWB192439rPu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcPMJQACgkQAVBC80lX
0GzglQf9Eb31Yb01bVViqWo83cwE5v2d6Bg37+BGZau3CrWRpOMeYQq0OFsgibnJ
BN6EPrCY5nhxAY26YOg6rkRkL/xnM8Q0+dLEjK1SVyxIvIwvGM6fuQ5FEwU1lgYz
4dDvu6Oa+MLeEHcIqWQLVxtxqfYt59OXljpWSKW4vbYi5PgzSGKPvGSSTvRZ5DkA
kTVE1MahRrX2VIlKTlqna6A8DdIIiFt6dL8ay6n0s6sHP7p0nTZlzQrpB6TV8Vs6
OcBZrhl/OSiXa3LvTL49BLo0j3U10ymvmVia5j2VmwZaqb9weti1HdAhjNxHraxq
B5/F8I+Ypn5sZbtINc41/TPyAcusWA==
=MWzY
-----END PGP SIGNATURE-----

--Sig_/MyuMygpt=evBWB192439rPu--

