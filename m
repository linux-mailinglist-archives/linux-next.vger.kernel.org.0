Return-Path: <linux-next+bounces-8273-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B69EB540C2
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 05:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6A8A1C27D68
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 03:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85F021CA14;
	Fri, 12 Sep 2025 03:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qZvMVQts"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDBD238172;
	Fri, 12 Sep 2025 03:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757646565; cv=none; b=A4EbDJy80v2/oXm1ncq/ju3gwKnSqqLz66i2LNDFDDQkH3X33oQ3Wx4Pak/nP3Y6qAyx2GlLoBK/Jd9Ft6KhI7EJQ4fS7dQq0eKKjPYZgWFZTkkhYtPCOJr/EOLmwR/piwhiiSaCSz92vawQ6e12JPYoCo9dI70yz7Ej4e4iEhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757646565; c=relaxed/simple;
	bh=B81/jnUYFFJNGLgq+DF/lrcVdMCt9jjWI/oz3kboBWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DnpO6k3vvqPn7CRj7idG/21RtC348vZ5vVaZg8C8pNfDAuYyiMTQh9lJsaoxPPJEXtl3hQn1Sb40eT3raZwAZyZsw7zD/ZmHtAqpC2xJ4XUFlGrCld8ZKhKdoKolIVIqQyFqAIdlHZmRB1oSzKwc3oCuHwCaz110z5p1HmL0bZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qZvMVQts; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757646560;
	bh=Jvo5xVx06CZyFP9ehlbSgoowblGfaRR6C1yLXHZGJLU=;
	h=Date:From:To:Cc:Subject:From;
	b=qZvMVQts2E7+sWp/MnzJw1cfDYtfwa20HjSIfMEqKeCOisnXPEeZU126gXACB6XFJ
	 0jAUGkoCKWdLazz/6cQJSHjuod8dvQMOetkVXuJ4sgnCmUTyW6KmiR3o+94/qkI6qC
	 YUVz08N4A0L2aH0Qa0Vyf/D0n46rGfrPm93O0dWPJodCF1W/gSax9ivbb7nNrawoU8
	 zz1ksAIa23sMTSufQ3aTdmbpM4ZDtxQIDKr+tvD3+EtxGiy60kB9H7jvdhbjNa+TsZ
	 HJx7fiZV8qtf+x5c0T1zufPoAJ+XE+NNcW/3v8/KXw44W0JhyMzkg4caipsx72iIz/
	 3tADmAKsVo9SA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cNKCM6FBdz4w90;
	Fri, 12 Sep 2025 13:09:19 +1000 (AEST)
Date: Fri, 12 Sep 2025 13:09:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tip tree
Message-ID: <20250912130919.47804780@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ya97+aNjeMUMMCwRVp0l6Qz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ya97+aNjeMUMMCwRVp0l6Qz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mfd tree as a different commit
(but the same patch):

  23fc2a41a2c6 ("dt-bindings: mfd: aspeed: Add AST2700 SCU compatibles")

This is commit

  9ea57a192d35 ("dt-bindings: mfd: aspeed: Add AST2700 SCU compatibles")

in the mfd tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ya97+aNjeMUMMCwRVp0l6Qz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjDjt8ACgkQAVBC80lX
0GzWcQf/Y9XEJS0GpyvB9bUoa8zY9CWzURXtRFr97wFL8hQfBP+QHXB2ooN1wAZz
t6vY93lIWKN02huFL88rcw8QcljPoL9VYiqSgKmlGweHBnA1VYLERfB4sqGBFMVQ
ktliqoT/IWnsFVLup4+1n96Y990sukiXVf5FhI38Wb2C9Rse7Jpp+1uQ3QVaqz4y
6/vktFzLqbxnxPBtKtAf+wCKEnPKHqBvKuiA5huby23qtviMN1ogES/4UIChhnwQ
LxY+tM/xP2Eq98hF/s9h+oX2XQvKdxloywcMo4MFYWtO35FglBmwndDwPbHzHxjd
/kQv3aN4pBjAPeWcyrf4D881MkwyYA==
=RLD5
-----END PGP SIGNATURE-----

--Sig_/ya97+aNjeMUMMCwRVp0l6Qz--

