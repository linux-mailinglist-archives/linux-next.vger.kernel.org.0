Return-Path: <linux-next+bounces-7089-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E802ACFC42
	for <lists+linux-next@lfdr.de>; Fri,  6 Jun 2025 07:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5BF33ABCAA
	for <lists+linux-next@lfdr.de>; Fri,  6 Jun 2025 05:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52B51C9EB1;
	Fri,  6 Jun 2025 05:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JuiFu5Ha"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BD84683
	for <linux-next@vger.kernel.org>; Fri,  6 Jun 2025 05:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749188186; cv=none; b=TplQKlsPJtkxcihpxjL45OSwF3o27YIKlkIPoUt1jD7yM+6SJaMdPPLxtqDlAhdToUTo5ermGgWJZm+tuW+kqR6I+j/vE5WvQ26hkwcqwJXIglRYYnWN6KALQVdJFcfyRYD3H/C+SQpXJtSGVLtN44ZEG7sGVuY9xhxBo41MqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749188186; c=relaxed/simple;
	bh=q2OjkNmrIkx6di8Uw8dvGk1kmCORn9mX2xQtnIbqTFY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kCKbOUkkTJq4tDBvCQlsFlimiGczM2GSit6HqPOUol8YgVHZA1hsr/iXMKHLQfNdQg+2t+BGqh0KJbIvu7MjzwuzmZSBCuOJzoHtGym5rJwpJEM6uKB0d0lSuB/qDdeO8ScWF52Hkerub/QxUpGTUnE4q6b+pc/3M+PCqnITF90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JuiFu5Ha; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749188177;
	bh=ktYOYijJroMYF659uqAeadiP9C0oWYSYIJhsY3D7K00=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JuiFu5HaJQHSy/r3/44qWsyAGleVBDCy1IX8HZoJpYVGVjAG+iEWzfEMg8V7yu9q7
	 tcsi3JbzydifDI4HSc6usti41Q9+yiKLDXJRZ7Q1l12LpwsUE3+wvasmrSIxcZliVK
	 5nXMEXk0nO1KFGzKPZ1IgSnS6Jjl+ZF11LpihsRFWygnlJ5L5suKRWv/w3VDFy2Xxh
	 KpFSCkTpjr1AGSNcqEziRZs7+mGETgZRWBqYmqChAxg66j0tHwPOkilrPuiBcc7A3V
	 CvT08/acSQZGER+qW3d+7Wu0apn12ECU0WcPSuEQcVUA+J1rdmGI9ydK071TeH4QAl
	 lFZ5D/YH41lyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bD9691lVXz4wbX;
	Fri,  6 Jun 2025 15:36:17 +1000 (AEST)
Date: Fri, 6 Jun 2025 15:36:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-next@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>
Subject: Re: Add libcrypto trees to linux-next
Message-ID: <20250606153616.1cbbf48b@canb.auug.org.au>
In-Reply-To: <20250606011222.GA1228@sol>
References: <20250606011222.GA1228@sol>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/akZT0LZiFZEDfnJ7NHsRX2s";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/akZT0LZiFZEDfnJ7NHsRX2s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Thu, 5 Jun 2025 18:12:22 -0700 Eric Biggers <ebiggers@kernel.org> wrote:
>
> Hi Stephen, could you add the following to linux-next:
>=20
>     Repo: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.=
git
>     Branches: libcrypto-next and libcrypto-fixes
>=20
> It should match the CRYPTO LIBRARY entry in MAINTAINERS.

Added from Tuesday (Monday is a public holiday here).

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

--Sig_/akZT0LZiFZEDfnJ7NHsRX2s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhCflAACgkQAVBC80lX
0Gx0XAgAg1BDAKQFHHATZwAYwB6rIiy+JHUMYInwNU5Zn5oC6B9iOk/SEwUs8jBh
QGKTYTccXrLJHuzSCvdKXAefPDzAWdtkfFMeuSkJIIZTUEPmmC5uj+mbznjjHVL4
ZAPdecyNvRh8+563+qqO978n13iktmwedV2DoqpnqsrCFkC8J0FYNFf8erTJcWKA
Ic/7dl9BZmNs+BAooFXz6eSPPEJG9iVoBvGaP/Ji8Rr7vUq2CsPekmkzy+FqKeKa
alS10mN/ejmVduc/sV9qMqKeB6vudCL6MUx8hLQowTkZ4qmQ3xD89VoV9Hagg20G
NnkciEj/0hfZlPHAGD6FhKO+YQncSA==
=mUpn
-----END PGP SIGNATURE-----

--Sig_/akZT0LZiFZEDfnJ7NHsRX2s--

