Return-Path: <linux-next+bounces-8630-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B892BEEC46
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 22:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 418F63BF011
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 20:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B1D1E9B31;
	Sun, 19 Oct 2025 20:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JGJLSJ6D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1A31A9F8C;
	Sun, 19 Oct 2025 20:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760905763; cv=none; b=pSGX7LZYM/fZmJOzwuXDm3YPhlp/6Ljgb9BxSytQPSjCTmXbW6qRdPwJlFk7Qw/KjU5PreAcJyEsWIG83kwYfgQDBZXy5+Wi3CYG5WD5Tgq9HO9rrr2AbvwglYjk72Qsi6tFqYdE6/0ivvf0ILKf+bdYr+RItx3D1ehGKlQ8oaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760905763; c=relaxed/simple;
	bh=3IsmnWo+gFJ4C+hLpr84M09tZ033rGB0XupraGs34DY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZnGzhRxnMu6iGI+2PbwstN1PJXk3FUU1jKZFgc3eeRe2evIYCEBoGPN/WsbjJIiDakVtj0XvGZ64DxJijSV0Zg2MVZLfk1c9hjzr0haGpPKh+JpLPwJxkbR1NIbqZLS+OvP4t03EHq4hbEdJpgXGJaAZPdv7Aob0HCq6CLyDAvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JGJLSJ6D; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760905758;
	bh=XSrKlNx8+9ME+z5X84FoB/9JWe+09T0Rv/c7oO3TlFY=;
	h=Date:From:To:Cc:Subject:From;
	b=JGJLSJ6DnNWwsOVD8I5l0D20/Av02wqtpDZt0/ExZbqPXbBAXGk1LsiaGE0m0GJ9Z
	 kGNLuxJ9jL5cdZ16GTqS1ER+Q2fV9BSWm5uvNkaqWSeBTlfG0O9AQnFONB+sHCi4LK
	 SZYVXT803t1KAfF/oWGu+/JXaVL7/nCbY6A5ypVexFhKuQXdYXkPIgMD/3Bl+nj5Ar
	 wmFWd26hqFJQW601JdogqlyPI8Xz6rPefMRrCTmLRTX9vfkYdBfKz7tNMb3UoUC5OX
	 p69m66jOq5pGAU3ounnVZEtoBQToY7jqWD7akckK/vuhgLfGHNjV0yBxJ6MIx+Frpw
	 4HRTVI9H58YSw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqVXG3h7Rz4wBJ;
	Mon, 20 Oct 2025 07:29:18 +1100 (AEDT)
Date: Mon, 20 Oct 2025 07:29:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vfs-brauner tree
Message-ID: <20251020072918.00f2e12e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j9tV8=2mSXZ0EaSnnR/0XJT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/j9tV8=2mSXZ0EaSnnR/0XJT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  13549bd48bbf ("fs: WQ_PERCPU added to alloc_workqueue users")
  d33fa88429c5 ("fs: replace use of system_wq with system_percpu_wq")
  08621f25a268 ("fs: replace use of system_unbound_wq with system_dfl_wq")

These are commits

  69635d7f4b34 ("fs: WQ_PERCPU added to alloc_workqueue users")
  4ef64db06061 ("fs: replace use of system_wq with system_percpu_wq")
  7a4f92d39f66 ("fs: replace use of system_unbound_wq with system_dfl_wq")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/j9tV8=2mSXZ0EaSnnR/0XJT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1Sh4ACgkQAVBC80lX
0GxLOQf/bTKXRRh+ra01PjpTMNxfTvmhMWZoB2OUm7iNKP7tfZcdSW+vdjmwLmwi
QAuzKbkozxdo7lxCa2xFE+1+D2olGf5zacpAd61B3frImZcb9nNc6COF3xCbT6dk
F/M8Jk2Il18qU/0MFKVU1KVAs9bmcyIYbCKCvMZ+NILSr+s8dB7YvQQo/dMZ87T7
LXixl8Vl/2Egz8it74r920gK3Vykhsq6qKMqa2NmL7YA50zbsFKTDzTCYPh/7drF
acTZC078inSCreJXpu2fqR8V/8hSEnIi7cvgn0yyLU478lC0tENVUf7n/G1p7i75
DJ0BBP+0sQeU6Mv9taXNDXzAOheAQg==
=LnTW
-----END PGP SIGNATURE-----

--Sig_/j9tV8=2mSXZ0EaSnnR/0XJT--

