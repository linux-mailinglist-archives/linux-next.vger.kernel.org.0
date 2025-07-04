Return-Path: <linux-next+bounces-7353-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E80CFAF8755
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 07:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D7791C8492A
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 05:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7C91DDC23;
	Fri,  4 Jul 2025 05:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WJe2YdyP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133DD1F4C83;
	Fri,  4 Jul 2025 05:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751607405; cv=none; b=GSEG9sDW3ho0t8nx8FNBm6qdS4azHwpQemhA2WZmXak1/oiTzpPrlQFZGk/zuZtqJ7E5thxYTifMyuSWGIwIHzzFC/JbDbjAHy0nkNQhQALVhTSgsGLULj/1JPehHS5TtrTuqtSGXjZK2/0MVbtccbAFaimDNdtDPKd4J7l8qy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751607405; c=relaxed/simple;
	bh=aOFFC88eadZ/lfWdT1RatTc4Luu3iT+OEmcc3SP1XkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Hz14XTIeUdumlbqitR356NGSU56GsSdpihI7FXfhnnjSbJ36nuhjv7Wr0n0ycUcWOIsJk7+now/5OuhM2tw0NnHeD/GdJOdJykibrmnoUQULtPseL2/MNjH16erj7falOmksbXb8CV54LN9vhEjvV4vNmL6jsrt7Ndl3odO1lgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WJe2YdyP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751607364;
	bh=W3UgNNqrdzpfz1qqFDW6EwAPY3FCIVUI2jDuZH1lZYA=;
	h=Date:From:To:Cc:Subject:From;
	b=WJe2YdyPqH7wTwJc7Q9IvXONtMJRzivSh3OeBTBD/aRBDx6KJXn3XaIk9dEZ5EqLa
	 InjpaJxOXmPn+cNBNrD+BLhSNWQ2n9SUWU8rBf3ageuOqsCJWeQpTToGQpBNyjvNxm
	 sjCvNmoxcJxJ18bi09BovEO+Y9COxhxTpGjtH8oDgSTYLxj5SZ21PePLIeR1d2j3Gf
	 CF8mq9+d6tLSRk7wMrG73jLhm4gw1XM8rdJlSrDyLBWxQmS6uPPnOoEcjKCEHrvGHJ
	 RPaEoFbI+XCvTxADJL20vJXyCTGrmJ6tlnM4RlpSJbbg4S6TPxKb1XvuPaYZZUAmLg
	 tePkWY1m//AjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bYMn01WhPz4wxJ;
	Fri,  4 Jul 2025 15:36:02 +1000 (AEST)
Date: Fri, 4 Jul 2025 15:36:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: John Johansen <john.johansen@canonical.com>, Eric Biggers
 <ebiggers@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, Eric Biggers
 <ebiggers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the apparmor tree with the libcrypto
 tree
Message-ID: <20250704153630.0fb1e2f3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kkZXgFjLOxkmQj.emUZKjeE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kkZXgFjLOxkmQj.emUZKjeE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the apparmor tree got a conflict in:

  security/apparmor/crypto.c

between commit:

  ad7ca74e1c60 ("apparmor: use SHA-256 library API instead of crypto_shash =
API")

from the libcrypto tree and commit:

  e9ed1eb8f621 ("apparmor: use SHA-256 library API instead of crypto_shash =
API")

from the apparmor tree.

I fixed it up (I used the former version since it appears to be much
newer) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/kkZXgFjLOxkmQj.emUZKjeE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhnaF4ACgkQAVBC80lX
0GxeiggAkDv2/TJPOYDSQUzNo//w3nYS3nh+5bXNaq+t4ErRXiiURnUFDQvbuyAZ
h5zW7aPgU7JGcQAswBtDM/c7Dxsd9q+OoIwI/q8+ZL8ExXMv53wwFaHIOeqjb0Ph
hccdORP7MAlKZDaT3gGDCgKQ/S9Knm1Kf0eaSDaQx8xKV0k+chZgZHgtZcNgzuEl
cjdHJzz3s5LM8sOjSAFnrqru2LgrTCkIbibyfuYhaUATBKUUA0yqtS2xAQHVXYU9
2tkdy8PkH+xzKv2FwEUjsNb+xyRRsVDAhpiiZeNNUwBDF9fXwHBFngkhafOZELOA
Xisj3bN85X9+YoZNhgV+kU3QVLwVLA==
=LQ0i
-----END PGP SIGNATURE-----

--Sig_/kkZXgFjLOxkmQj.emUZKjeE--

