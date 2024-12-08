Return-Path: <linux-next+bounces-4897-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB949E87CF
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 21:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68C0118823C8
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 20:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C63170A19;
	Sun,  8 Dec 2024 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GLsD99mM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C728D54279;
	Sun,  8 Dec 2024 20:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733690356; cv=none; b=LssXZfEXggnwn4+WDeWz+CKi/8igyDrzByZ8fsAL9lGaH5w62iSH/Z1aAY17hoccAykfuVM5aU2TAyZkOL3FCFoFkSJikhyhdo0WArlAnjvGvbZ91kCBG8f0NWj7tDPrMWujg3tjBgWWzW7fnTR0mOgAVRD/d/N63vThNOlYAls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733690356; c=relaxed/simple;
	bh=RVvvQQVbVlpl/dNEstJsWJ4QiOqaPo8iuUQA/p9U5CE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aty3cYmaAyXXHMB41fxIBh2XxiQqDqv90UpPoxXHBaG6lgm0kyGUBFMqqvgxYuMC0vWI4xyX9FBEeIJ5IZSC4SyCYMG21qykdG9G5qNaaXkT3DszQMyzVUCfDyLQSg7PioZ2v6fQB1tvMZWMF1fyrr+iSSLJ0cNygnBeZySfDD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GLsD99mM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733690347;
	bh=3qduQgUXlNzSJLwLhKzTWAmzuJvY2A7KQAMklc6LQKY=;
	h=Date:From:To:Cc:Subject:From;
	b=GLsD99mMpXDBuZw1xELCcTuT2901m30z5m9hXtK+PJBmdpoBc42p6txrXjXJpmO+9
	 zYnIFSKDkDYOsMAWlLbGFg8gulCQghwOS26jZjoaVyASXv3ycqH+vpwVzdYQ9xbdlQ
	 yKnNRGoHlbEbdskHqbmHl4VRuujNUBTb4emUMXnMgSEUUR9P+CfJKX27JX8HpVPaW3
	 /NeKlQpzItEXxoMr1MBjFtkDEW6I6YLCV8havpNZtU/7sBZhWlPrheCLDQFpLTqnsi
	 xjw69Q0810VwHAbLLCiG8UL7b1t9Ib1JrAN5vBb56BNLPk4bx1BmG3Dr/CqQFHX1Yt
	 zTLfwJsC3L1RQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y5xfz3TnQz4wby;
	Mon,  9 Dec 2024 07:39:07 +1100 (AEDT)
Date: Mon, 9 Dec 2024 07:39:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20241209073910.061d2f31@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8TlIxpdTmELN6k=Iit/8eeJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8TlIxpdTmELN6k=Iit/8eeJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  ad0d88dc33bb ("Bluetooth: SCO: remove the redundant sco_conn_put")
  4ae007fdffc9 ("Bluetooth: MGMT: Fix possible deadlocks")
  4f562bec2bbf ("Bluetooth: MGMT: Fix slab-use-after-free Read in set_power=
ed_sync")

These are commits

  ed9588554943 ("Bluetooth: SCO: remove the redundant sco_conn_put")
  a66dfaf18fd6 ("Bluetooth: MGMT: Fix possible deadlocks")
  0b882940665c ("Bluetooth: MGMT: Fix slab-use-after-free Read in set_power=
ed_sync")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/8TlIxpdTmELN6k=Iit/8eeJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWA+4ACgkQAVBC80lX
0GxskAf7BSvWgN/c1Kt7BiEaUdAa4jB3J6Sy9y5oRaMqWIThegVN0Fc8ic04A0Xx
wGrBOGLE5tOJge38uFCriagMcdC5764x+KZwr8StkXbxmlYtNm2gaQZPUQBhw14i
NdFP2w7nanGgSc9bL9C/doR4JCUU5lDcHB7d6Y9pwhwcCEIRy2DVUQxE/6m8hn41
YBn9Ia1Q+FxLd0bgok9awny6LJSVTNtNk3hqO07FLSL1mxYComh5Sq10BRj9qKnY
35ehwV7SU+Ud44MEj3MGnuKdruqbhitiqF2stirjkK6L/5SlYOr0bVUIZqcuB6eC
xbxvFD/VQVQmrgEq1zpBsKTRGSG5Tw==
=U1SJ
-----END PGP SIGNATURE-----

--Sig_/8TlIxpdTmELN6k=Iit/8eeJ--

