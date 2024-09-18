Return-Path: <linux-next+bounces-3914-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DA697C199
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 23:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 542C428388B
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 21:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08D51CB31D;
	Wed, 18 Sep 2024 21:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZcbOeVKT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256AE1CB30E;
	Wed, 18 Sep 2024 21:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726696545; cv=none; b=QSEpT5F+3o3dkCyeJJBlbTTfIxfJVezniiuxBPU+hSAZwy3l6YAAN3LFr0SyZhDaNqvlFMeXodZPttJajouwXuf0wXoHbLycI1cDa1BUML2Cki4UqlCwQ9LJLcIhcXnYXzMDpaga/08ggWKn667BzKK0iWuYB3342XzOvpoDCYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726696545; c=relaxed/simple;
	bh=7xGLH2wonaWgv/SjhCQ5ocdIj473nkr7jvxg2Yjg5Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=skVWqkoE8gEm+w3TtXyJqV9IW1bMMmMo0uZx4pKs4nLhyTOlNvxnNoqprp7BQ+eQnTiBxR2uAso1fFeIILonnpQEe6hWSQzNViL+H+rIiGEe7y30pJhSoXXrRoi1iQnGR3EqnootQ0Ylv5o3pMzxcaq9IcKJmxSJZp5GFzfGb1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZcbOeVKT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726696540;
	bh=DausSjUsXG5RNspjazc8sw44PBL+2niaH9kAnQLZEQ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZcbOeVKT3jR3X4JMzy+A8MggPJUxyabdz0wGbhOSZmktpPr7G2u+ySfniBQn3YVZq
	 sTY+E3UP/zIqdZz3ceoBzWVStACwWHUro3AOqHOTYvg3pwznAULGa4Uo2YADjAUnq2
	 MON4fV7SvPBi8yguELID3KKjel/zmeY7367fyQ+KCvaOvEy482F6LxcX70nQUNUU7T
	 +AuzpAlJFfVqSfoP3QGdBfWMHTKsH7mykB2Bmk5hD5t59IlaE/1lmPxq6KbpY6pURa
	 dVY1ROoNIAeXmCwvhO5hBmeeqC78a1nbuzCc0rnceTEX4Sm6dZOW+KCBzjXmA2BYB6
	 EoYXobdm16fYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8CBg6Sssz4xQc;
	Thu, 19 Sep 2024 07:55:39 +1000 (AEST)
Date: Thu, 19 Sep 2024 07:55:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the s390 tree
Message-ID: <20240919075539.27f5b782@canb.auug.org.au>
In-Reply-To: <CAHmME9pX5AiKHGW=+umdDW-JDpHjqomDLstrCMLqCm13ZQ_+4g@mail.gmail.com>
References: <20240919072627.2639bbe9@canb.auug.org.au>
	<CAHmME9pX5AiKHGW=+umdDW-JDpHjqomDLstrCMLqCm13ZQ_+4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wo.b.7hMnK.f92PZS64DE0V";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wo.b.7hMnK.f92PZS64DE0V
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Wed, 18 Sep 2024 23:28:11 +0200 "Jason A. Donenfeld" <Jason@zx2c4.com> w=
rote:
>
> On Wed, Sep 18, 2024 at 11:26=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
> >
> > The following commit is also in Linus Torvalds' tree as a different com=
mit
> > (but the same patch):
> >
> >   0147addc4fb7 ("s390/facility: Disable compile time optimization for d=
ecompressor code")
> >
> > This is commit
> >
> >   26d4959681e3 ("s390/facility: Disable compile time optimization for d=
ecompressor code")
> >
> > in Linus' tree. =20
>=20
> From [1]:
>=20
> "Please note that the first patch of this series is already in linux-next
> [1], but given that it is so small it seems to be the easiest to apply it
> also on your tree; but I'm sure somebody will complain :)"
>=20
> So I think this is to be expected.

Yeah, no worries.  I just report them in case there was a mistake or
lack of communication.  Clearly not in this case.
--=20
Cheers,
Stephen Rothwell

--Sig_/wo.b.7hMnK.f92PZS64DE0V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbrTFsACgkQAVBC80lX
0GwN+Af/QuwkIixGaTFO+C77b3BeWpVBsooye1PHaZsW5F+ir3PM2G3oZcSEtBBG
GuYaGJyUVPoSXHXc15MVb7RhFm4oM83qU99dizTyWh0hup19n2v7Sjo97p7f380k
A+vz8m/baLnzzBrRgNdc2mxIi5bFdL7oObCJuV17LktmUe15d18HUDIKrgg493ew
fxmVR1nV7qLdb2L8nK6r53Q13lmxUqQxxG0OmXGa15K+KlkYB+N8fB4W7ITJNCTc
/0llGk2p86RysGSa2k9XX9l8G8oE101X9gMU3xMIEVGqH8XrhXMmsm2P6dsBbum+
9cenlWGFkDJz5pwTOf/o98okl3TrPA==
=3OvV
-----END PGP SIGNATURE-----

--Sig_/wo.b.7hMnK.f92PZS64DE0V--

