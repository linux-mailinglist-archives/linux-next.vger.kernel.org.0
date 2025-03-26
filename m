Return-Path: <linux-next+bounces-6018-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE16AA7100B
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 06:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77CAD16A3F4
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 05:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEE813633F;
	Wed, 26 Mar 2025 05:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fEBGEaq2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4657463CB;
	Wed, 26 Mar 2025 05:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742965445; cv=none; b=EL1GOSF9OcpYccfN36fS09CDh2moGtL/5UFuzlRCFrPUyz9Bb7gkFuESO/c4StSVKR6SqTq9l6240Q+2+sTFGyze/rdgmsuhJ69322cNBJCizUDEfJ8dqKENPcQP1C5oiuVXWjTJiNnzE8pEUd8+PKY8PgGPiQxdbuk9yMd8lt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742965445; c=relaxed/simple;
	bh=UkZgK3gWJKAeQy2tP8yA4E4vLiiRi7TPEAZHE0dakTs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s+Ws5zMhUEAQl/XzK01bFnmerPgCeyegm+Qd0oA8gYZgss+awY4wfGFlgVB6B6sNPWTVMmjGLDlYlAo+WVW8WNFe4i/r2hBgEWB2nQyE/VzL8aGnCu0hO+uXuFB66yuul8JMn7qsYM0CMYi2geZvpPojp8MQPd3u/+APRQp62GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fEBGEaq2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742965441;
	bh=NFxtqBMZtHnsUq+2u1R60ro6bjUVCSqvC75Ith8qvkA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fEBGEaq2phtJafyOG3vLFwvy88lWmOdfuiFIkPPqtq140aKa+K+V0xnqSD9LIpHOb
	 CQM1LGzasl8NH3QsoKdzlKZRuFUEpD9QFKWAA7PrvCNI+NvBnyq2yIsDeWmQltj6vm
	 vQ4WDTGTtY3xzADIrp9JnVM1JhQLJItv8RK/ARsUU2riYEtCJv1Uccy2cNUnV88Krv
	 yNdi6n7m0tbw3nvPa9oMjAWM86z15l9wAdmBxwhIveVtFMGkp+Q2hOcimYaUQdLOAn
	 m36W6Nchku2CJMVh4VH4pjG1iB9DQipzrlKwW5wKGq+5rJ9Ls/kG6uuRzkx91NmcP4
	 tHYnyNFY45jIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZMvp93HzRz4wd0;
	Wed, 26 Mar 2025 16:04:01 +1100 (AEDT)
Date: Wed, 26 Mar 2025 16:04:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: Re: linux-next: manual merge of the tip tree with the mailbox tree
Message-ID: <20250326160400.53093aaf@canb.auug.org.au>
In-Reply-To: <20250303144637.71c25bc3@canb.auug.org.au>
References: <20250303144637.71c25bc3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/84mi_IAQ.EDINn3Qazw2nEK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/84mi_IAQ.EDINn3Qazw2nEK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 3 Mar 2025 14:46:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/mailbox/mailbox.c
>=20
> between commit:
>=20
>   791d7e70a9f4 ("mailbox: Switch to use hrtimer_setup()")
>=20
> from the mailbox tree and commit:
>=20
>   c158a29c5c5b ("mailbox: Switch to use hrtimer_setup()")
>=20
> from the tip tree.
>=20
> I fixed it up (I just used the former - only a whitespace difference) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

This is now a conflict between Linus' tree and the mailbox tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/84mi_IAQ.EDINn3Qazw2nEK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfjisAACgkQAVBC80lX
0GyqUQgAhbcLgeaMi9z9q8QJzspY1hmsw5qL2wqfABtRUadY54llbZReJB2Ebwv1
zK07e9Lb+nkwKByEB7RowUctM0+BuPUV6MDcLtzuoKmDvo68WMFfXn+XH1Ioc7VB
ZUxKMzI4oS9VHgnHir1amj1Wm3r5qkEwMFTlIug74ofg8m7nYNVOS/ef3xxAz1wU
qt7jldztmo/KWH4hRAJ9oFiTM5T0acM55V69pVlLMa0TyWQYqfQe+mkaIr1/vjK0
dnXtF4EjKg1H8k98hMxe/RrCdlTqmMP7KEXStmdrznanXkZPpW1DZ8sbMHOESKF5
M694brZ+7u/OCXqJsHjp8krXCEs5sQ==
=uXR2
-----END PGP SIGNATURE-----

--Sig_/84mi_IAQ.EDINn3Qazw2nEK--

