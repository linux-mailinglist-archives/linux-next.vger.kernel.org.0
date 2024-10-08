Return-Path: <linux-next+bounces-4134-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6A1993E38
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 07:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FF2D286083
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 05:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21EBD13D298;
	Tue,  8 Oct 2024 05:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f7eXYb48"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74D613AD37;
	Tue,  8 Oct 2024 05:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728364421; cv=none; b=F5SZvN8zZT6Nuk5DbNODX+MxkHz5ClbtY68j+0gcmhRB/wDEMQa0YuWM9LwarGMi2xSYfi0oCBmsqjZUC55u6AD583ezVI0IRSfzr1qpg3u17AyU1OhjJJ/FwzFsygInxKlK8Jnu1VsE28biTOlkC+37cg3F8+GIkyEqQsVJjME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728364421; c=relaxed/simple;
	bh=666mmuV7IOu85rjREQk7r9Lew8v/JlZ/Qt2XWadUR9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m0VTnPHmlgpnldmLrBeQ5d5R6ZZ//Dhfi2P0KYO9DcdZJUZeqJZe+BXg01sinXW1rVaR7gjCjIi+dkk6zIBCwywPS4jeFWyVdnY4f4uBfWamoKrPD/FahK94I9P9Nxp4qIhN8AQlb82wrrfozVhvLQlnoFlNzOw5VtoV0ddjYTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f7eXYb48; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728364414;
	bh=i6LNvXjnCnJzf8XDg8jnUsuyvofZyiWKtQoL3PGWkqs=;
	h=Date:From:To:Cc:Subject:From;
	b=f7eXYb48ofvIpMwZvW8ZKxEELKZVHOxr4KMBgRtC9v9kx80ZmFJQ7UXYI50pxthxW
	 ccsPzR4HVFpGC+ihRh+GDOGMP2PyQ63H7XfeD9D7tDP0/kRF5qwcXVXbpZIs7kkKSx
	 NWc3exx6K82j63I8PVchGrY/zI6cQuhXIkaaHX2IKAaL/fNAShQ2orYVT7a6ebMBSG
	 HNVwfKRKMU+41REC7fEllp+FtrrrPIjjaYktE300VaTlD/en/vzt7XivBgofph5Lr+
	 e7eB8V5ytIk/BVIBHiooYc8dT0WdFvkSszzRooEnyH11EDtf0FNwpN+xSyOMg3bnuH
	 ZyvwQSv8SPPlA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XN41B5sHYz4wnw;
	Tue,  8 Oct 2024 16:13:34 +1100 (AEDT)
Date: Tue, 8 Oct 2024 16:13:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20241008161334.483211e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I4uSr6JCD=m7+46+T3U2+hP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/I4uSr6JCD=m7+46+T3U2+hP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/pinctrl/pinctrl-aw9523.c: In function 'aw9523_probe':
drivers/pinctrl/pinctrl-aw9523.c:988:17: error: label 'err_disable_vregs' u=
sed but not defined
  988 |                 goto err_disable_vregs;
      |                 ^~~~

Caused by commit

  8498e6b2b852 ("Merge branch 'devel' into for-next")

I have used the pinctrl tree from next-20241004 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/I4uSr6JCD=m7+46+T3U2+hP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcEv34ACgkQAVBC80lX
0Gyz6gf9GSkQ/cGcnFHeDnLYGeoyuOMoZL3v5AehVgme150Dm4WYeuamfKoSdI5K
6D89rVBls6zW20BmlNPWLCp6Oly/j4hGiCeUsjqorwhiq1+zHXn+0J4/CMqQZPf4
Vzc45T48Iv7QuUw3fvQ6i9MM8w4ZI0pHpAFQTj+kEoTx/Ipy78ZPW0WQBqXIO7Za
Fc6J0KAmh1RJ7FAcX3aCpcxYOXZBay+tRPfwzIaY6bcZRlMHyxD7M7MEX3Xjno7V
zzWl27+FMEkPl2tcs2iTrJCzDDKxljoJIgY59GBq2MxzCwX2U37cm5nPU3la1G8a
AZVpAnPGFg963ICu7GEOu2Q+/I7IfA==
=2q+e
-----END PGP SIGNATURE-----

--Sig_/I4uSr6JCD=m7+46+T3U2+hP--

