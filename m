Return-Path: <linux-next+bounces-744-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0923182E969
	for <lists+linux-next@lfdr.de>; Tue, 16 Jan 2024 07:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10DE71C229DF
	for <lists+linux-next@lfdr.de>; Tue, 16 Jan 2024 06:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC70DDB1;
	Tue, 16 Jan 2024 06:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oZspjkgP"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE98D524
	for <linux-next@vger.kernel.org>; Tue, 16 Jan 2024 06:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1705385464;
	bh=s1PAqF+eIa44rDy9nkd4s2KW1BNaz6Qa9W4VrkMguF0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oZspjkgPEoJ4UblqWuSi6lF7dXS2G7ZaDY7acGXKdEiJyhC8ZHx1m8r96sB28mTTg
	 q4p4UyoiWgby8C+/nfl7IF7bgk5ji2WaY2aauDvqTKLruC+01iSewIWRw4HSNLuKVB
	 mgcfxmgHj0S+s5M9tz2UWUf6AUDl9PRA5F5rlhgGQGxskqPnIcsBFjUdJm6HQxsrR9
	 WBZfqHkAJtzaX1WXm8hiejytagFwX+OkFJtTTMBmS1Efq73hBjce6lf/W3719GkQnl
	 42aSxw68f4KuVuwYToqtsmpocEVUEuD3n0NOIhOYAE6qoqKvWt0EnF/9KkYMrn/3JT
	 XmZZCKLkRnhNw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TDdtJ3xR2z4wqN;
	Tue, 16 Jan 2024 17:11:04 +1100 (AEDT)
Date: Tue, 16 Jan 2024 17:10:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 kernel@pengutronix.de, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: New location for the pwm tree
Message-ID: <20240116171038.1e38cc19@canb.auug.org.au>
In-Reply-To: <or6a5skoqw6d34bon273rwr245mioklxeclh5wf3u77gjbi7kh@dl7l3xveehwd>
References: <or6a5skoqw6d34bon273rwr245mioklxeclh5wf3u77gjbi7kh@dl7l3xveehwd>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UKRwu8wxIM4Zwh.3EE83GSp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UKRwu8wxIM4Zwh.3EE83GSp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Sat, 13 Jan 2024 08:54:53 +0100 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@p=
engutronix.de> wrote:
>
> now that commit 7afc0e7f681e ("MAINTAINERS: pwm: Thierry steps down, Uwe
> takes over") is in Linus Torvalds's tree, can you please update the
> location of the pwm tree from
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.g=
it#for-next
>=20
> to
>=20
> 	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git#pwm/f=
or-next

Done from tomorrow.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/UKRwu8wxIM4Zwh.3EE83GSp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWmHd8ACgkQAVBC80lX
0Gyg5wf9EVHHpfcuY1HQpiQ5Eg1l/oE23HiVinJVBQI4DAW1VzD4aRgtHvaXsK3+
4KmGyp/J1Efocrb4u6I/h7X5vj3eqGwfWNBmhNPGrcWdQMqrQC5rZkGecwQJBfBA
NcAYA8qYimzU0iNryFzBOmNsB7DtJ2ragRd72BevMJi9QZH03JfqdrWghR9a/5/y
jXfXpVt2P8up0CDHwX+RCbzUHA0kM1ePhVxli4OkX53mFqbXh6AFVj7ede6Sg1xY
LgDl8OAvw6dt8IPX2w5C4VCcdqmR8IxudESYaqLsl8wGiq0LYNo5nvcDg6aDnFQo
oR+d/2j0MpnE1VviCuEXzctlFrFoVw==
=6Qw8
-----END PGP SIGNATURE-----

--Sig_/UKRwu8wxIM4Zwh.3EE83GSp--

