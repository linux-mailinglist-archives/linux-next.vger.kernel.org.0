Return-Path: <linux-next+bounces-6520-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44328AA8E3B
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 10:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC9FC174663
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 08:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F229B1F09B4;
	Mon,  5 May 2025 08:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M3BlzfUH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CC0188587;
	Mon,  5 May 2025 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433712; cv=none; b=LPuKkBxqys40H17luNxfHlQmEyPRidZVoqvFm5laDHDGx4BsJ4ZzWEibqPMcqLPU9pZr/pc9SAMHUsSdjr+UkowpFuYIimJ1G5eqPXUnQn+0yNKcYx/ngPaYVB7zP6bzA3xW9sAUPtxsbMAbXTL/Y3mbVGZSKySXkAIJi90T+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433712; c=relaxed/simple;
	bh=iANuEvws994KIRAau9L52e/YfIrj4m7Nee55DiBu8Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P9RWf2b9PIBZHiwMky97TdXuQ3H9HKt2i65IjiNMNIP5JANGBQXnu7UBjflQ8cJMBzOl2u6kpcs6Dmy9VBR9NZo5NhbDBpSUq4jjDnFveNo43orxI7A/wsgDxTnEzQRBL0VmeSToI0iR5lxG2H47Tr5wxnR9cL6JXMAUmEwmrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M3BlzfUH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746433704;
	bh=H4wh2BbxNGXJKdkKWwa953GyENEXArVD8j49VcvsinQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M3BlzfUHJZbfHWIlrJ6Q/DUB40JKqyn+QJ1QMzhBKq0siVKu1CFEy/Vz0TT7QN9cj
	 XVnYMSTfnvgffIOhe9MfhnPDSrJ0gwsLu6XuCBMLLdt5PXYFvMcYSYnXR3BbBR+CXb
	 ugwILsY2S9pmhSxV9b/jnsJMFqUJcstJQSOQFNCb9KY7b3c3v9VUq4pDHJWg6G3rcY
	 g1F7QxfNSSEX5s29nwnSeqLFKlYN7tETDQ0ao8/lHbVQ9DyLYRiAbq4Wgls/vtLUoD
	 e74OHTv/0j8UX9kNp6nJQvvLLMuv/q0zQTJa/wDy1gn2QrdcP1Si1o80mietWv8PNw
	 JPGqHMqC/OD7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZrZRW5tgmz4wbp;
	Mon,  5 May 2025 18:28:23 +1000 (AEST)
Date: Mon, 5 May 2025 18:28:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Naman Jain
 <namjain@linux.microsoft.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20250505182822.539d5b30@canb.auug.org.au>
In-Reply-To: <2b57638f-82e3-4eec-a64d-fdde782f1ddb@t-8ch.de>
References: <20250505160831.73e797b7@canb.auug.org.au>
	<20250505161215.58a03af0@canb.auug.org.au>
	<20250505171425.0d4169e2@canb.auug.org.au>
	<2b57638f-82e3-4eec-a64d-fdde782f1ddb@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mBmukpT94NRNU345SCNuyS5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mBmukpT94NRNU345SCNuyS5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, 5 May 2025 09:39:10 +0200 Thomas Wei=C3=9Fschuh <linux@weissschuh.n=
et> wrote:
>
> On 2025-05-05 17:14:25+1000, Stephen Rothwell wrote:
> >=20
> > On Mon, 5 May 2025 16:12:15 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> > >
> > > @@ -1841,7 +1841,7 @@ static struct attribute *vmbus_chan_attrs[] =3D=
 {
> > >  	NULL
> > >  };
> > > =20
> > > -static struct bin_attribute *vmbus_chan_bin_attrs[] =3D {
> > > +static const struct bin_attribute *vmbus_chan_bin_attrs[] =3D { =20
>=20
> An additional "const" would be a bit better:
>=20
> +static const struct bin_attribute *const vmbus_chan_bin_attrs[] =3D {

Added for tomorrow.

> Otherwise looks good in general.
>=20
> > It occurred to me that the above patch could be applied directly to the
> > char-misc tree if vmbus_chan_bin_attrs was assigned to .bin_attrs_new
> > instead of .bin_attrs (later in the file), right? =20
>=20
> Yes, that would also work. It will require adaption of the future patch
> removing .bin_attrs_new again, but that shouldn't be an issue.

It would be nice since it will remove a conflict that needs to be
explained to Linus.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/mBmukpT94NRNU345SCNuyS5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgYdqYACgkQAVBC80lX
0Gx20wf/WZjIe4q52wNtAByvH4upUrcTmDx3FdMUZwmWm4Y7edg1zNIb8t0S4iwO
Sf37agJOzIIMvv2QOqxs3JcxUtN3nHGIWtRYVilkk8rH/iJ29XGdeIrekZ9EJ4ZU
eJmshVMyuK5RY3H0tTbZRkwt8xO84IhDBjPPt9D4RsDTRLUxsXR3qbdYesC3IbZ/
EzH23diUHUMprzgUWw6KGLY3DWxzG7CgGfvsXI2uB9ho+I3b6UpM5oTKUGQ5D+bW
0XeoiGXLyexh+gX5SamXYofqjWvXtXsxydtEeESRF1M4v7WiZubOa39WsV8Y7fXe
pr9XEZngPjo8LN+aHtlEy2DT0HtfHw==
=P3e2
-----END PGP SIGNATURE-----

--Sig_/mBmukpT94NRNU345SCNuyS5--

