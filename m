Return-Path: <linux-next+bounces-6205-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E71A87435
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 00:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2989F16E226
	for <lists+linux-next@lfdr.de>; Sun, 13 Apr 2025 22:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3694A185B73;
	Sun, 13 Apr 2025 22:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qXtWBi6O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B610B2BB13;
	Sun, 13 Apr 2025 22:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583014; cv=none; b=Ee3pkRpyHubwqCGm5vo4wrEyicwA0hSyJYx7pqa77hXW4g7weLnoJEwn9fgm+aiAjOr/9SnSvb/eAXOy5PdXm3PpbklI9whEx24pCc08sqZ0fN0XcM4i9h/a+QRc+5FqP8t+LV3g8QsiW36fDOqqQturD+v1/j4NQ97XHhDVm5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583014; c=relaxed/simple;
	bh=p8rl0ugrPz+r9s3XevtrYuL3Y1lu3KCTloWrHJurTAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iOPEpI6Jbl9BYWN0FbqH8LzVkbjm6KjGasAfrnGmu4b8dx2VxYoFx2e1GPseWN3d5AgkSBro4XyuCjwxcwq70LDjWAFZk57IERyOQegKMkljeNvDkqQncUwe0k7LeMnJ0m6J7rAtdXpDptf5cc8jGdpDGiIhvyDop8o6YNNIw5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qXtWBi6O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744583001;
	bh=rPQgq1AS+YFBd1TdDwePG8f7kNMtqqCLvqIFBXZR/nI=;
	h=Date:From:To:Cc:Subject:From;
	b=qXtWBi6O5Vh5cCTb8HSEt2eOWCclc6hZQB9kOFJxCnSUQbm/uVQyMBETiCou11xOr
	 XqqPZyRGO2sjNg7HkaZMv3lVpDF1m3FPLSjDzIqDEG0bjmKLT+OTOSduKoZbYcbjsB
	 UKZkXxMtJNHU9gMO21Ka+GYQmnV1/CPnMvvyD5sU1gpXa76s6OU6HBx+tTB3/S/Ea5
	 w7p8ZJiQmgLXq4gx2wuOPeZodTMvqfViF/pF6U9Wdzx6q3H/zqkB4K/09KlS1TpCur
	 qB6FT+Dq5Sk5w9WEy4ny9VXxjP8uD5PepzjyR98DARRDssumzJkz6PV6k6w0veCxpV
	 TY5VK0lT5EueA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZbQ154cVJz4wcj;
	Mon, 14 Apr 2025 08:23:21 +1000 (AEST)
Date: Mon, 14 Apr 2025 08:23:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20250414082306.577df183@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ETrtgT.A3l8Kj9cO9qllcYW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ETrtgT.A3l8Kj9cO9qllcYW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a8fca9b51158 ("fs/fs_parse: Correct comments of fs_validate_description()=
")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/ETrtgT.A3l8Kj9cO9qllcYW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf8OUoACgkQAVBC80lX
0Gyv2wgAhm5J7joVQGnaJCkZGl+dh+vsx/0F4CMYeS4+yJ5HCN8MiLfT5na2ZxbD
kEVsm2HtzCCZpYuJyRHbnrX9oQ92ZseU2kknaHoHSwpBUPzoIHhI9WmWSjhG/6tq
xgu2BZNt47vLF4W8XKZ1wRvnd/gYf91aIlVFEbUU1vjdLNGh+kpAtLdqWur0O5Sq
Jhdr+1H2uvNtUSNff81QPDCHzF54yGpm/rtnLPsgZfXiUyTSUx0j6Aorx6UoAFmf
RI6S43o6dJIQUk/cBiLHyIu6eOAev1+1JL8KfNyzD3IiliTkjaX2meDUw2MmNt0V
nkwswtrDc9jSA0EAK1Kp9YigKb/JIg==
=jNlX
-----END PGP SIGNATURE-----

--Sig_/ETrtgT.A3l8Kj9cO9qllcYW--

