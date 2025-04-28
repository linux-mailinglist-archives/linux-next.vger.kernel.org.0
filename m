Return-Path: <linux-next+bounces-6397-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A5A9E5BC
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 03:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4782178222
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 01:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D447C78F29;
	Mon, 28 Apr 2025 01:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BLYWPp+/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6CB433BE;
	Mon, 28 Apr 2025 01:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745803327; cv=none; b=Px6rkBMGZtRUAABovdlQQN979sX0GahORHKXM9tj4m9dQ5ons6UvKWElhNTXp4Bb5W22q8l13EFxW2D6LvocVnJkCdFLzZUfVpaO4KcfDzgIZ8aTzVulNkSrSVDKEnB61IzURfS4cdj/VXBc2JjlOECmHkCipgwQYbx8Mmon7uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745803327; c=relaxed/simple;
	bh=j5d09lBf0CaYSXdJfSAsHyCKoy1EAOeKZTGuKNvyYYI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k9FUpZBLm8YSO9VijgJF9p1LOgtW8SgWzCpj0ovMOJZxkPnMgv9DBz64cOiDhvyN5BXs3BcESCNdEKRfEUtkwuXZFKnIGismujZefBGIfjsWRa4y9XfcfCEqwH50QuwoSweWRiUZ166D1U9/YfGjNS2Lgun1GjewS/CSAgwSbY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BLYWPp+/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745803321;
	bh=Cizhn5ooGjyOUcNiTkbhfxtpUZX4xCKYf2VBpgQiRTI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BLYWPp+/bpUQACgGWYNb8sh1sSBoyUobDTO+b8MRAtsXVXJapIj/0w03+ZdryK8wz
	 /wQzgNzcbPB16aK5YOf7pHGLdCP2/2JQXGPV1qLAkrugnCpXEjTcULNJ/9S/TD+O4Z
	 LQZIdbrkefjZlzyUV01OSSZAd+SAifbS/YD2m6lGRIR8atjdx+bHzpkrnKWVwE9Au8
	 HbNg3H9HFQoVnt53EqhtUVKzntSnJckEYe9OktbVd/pxEKl2aDebrIvpDqmC6JV1WD
	 sY6mUqEbS+dMSuZfkvZtg77lfPCja3gk8HpMn6ffZPHJ9dmiUwi0rJEyQipdKIab4V
	 ykSSaDx2jRCmg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm5Jm5HZPz4x0t;
	Mon, 28 Apr 2025 11:22:00 +1000 (AEST)
Date: Mon, 28 Apr 2025 11:22:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Wolfram Sang
 <wsa@the-dreams.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Jai Luthra
 <jai.luthra@ideasonboard.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the i2c tree
Message-ID: <20250428112200.6f5cf3bd@canb.auug.org.au>
In-Reply-To: <20250428104905.2b54643f@canb.auug.org.au>
References: <20250428104905.2b54643f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vx.K=Zfz7JC=ysoj3/0EJnN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Vx.K=Zfz7JC=ysoj3/0EJnN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 28 Apr 2025 10:49:05 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the v4l-dvb tree got a conflict in:
>=20
>   drivers/media/i2c/ds90ub960.c
>=20
> between commits:
>=20
>   3ec29d51b546 ("media: i2c: ds90ub960: Protect alias_use_mask with a mut=
ex")
>   818bd489f137 ("i2c: use client addresses directly in ATR interface")
>=20
> from the i2c tree and commits:
>=20
>   24868501a744 ("media: i2c: ds90ub9xx: Add err parameter to read/write f=
uncs")
>   2ca499384e98 ("media: i2c: ds90ub960: Add RX port iteration support")
>=20
> from the v4l-dvb tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The actual resolution is below ...

--=20
Cheers,
Stephen Rothwell

--Sig_/Vx.K=Zfz7JC=ysoj3/0EJnN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgO2DgACgkQAVBC80lX
0GywcQf/Yiov9YrMRFzRN0JIX26/NvwZtJucBLua+J2WXLp12CKjRKwJukDJ0+jf
UZRpWDQ9dEd4JKO3f1z16aegfyqZ3KoXNxOoXKnqnbfEj7CZsqO+VcR/z+Qnp4o4
KU2QmWRIGjzeG5yQ2oGkb+KiRecq9Hg34a3i7RYMwPWWcOufd6iEORKd5B5MBlRn
wimJEpSVbQtLw6W+Lpww+mSvjLz8W80sZPHoFqlXs/nEs8LJ9227Uz3rECT+6RKv
q1QRuAWe/5ZjV2f34y/C7nhSVZlvUw9AD9ALHxtVz+2PWyqipyg8tmVG3z0W8ai8
4uT8UUg6DadVU3C9O8EVli4vexl3jg==
=TKe4
-----END PGP SIGNATURE-----

--Sig_/Vx.K=Zfz7JC=ysoj3/0EJnN--

