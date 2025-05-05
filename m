Return-Path: <linux-next+bounces-6516-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC91AA8CDF
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 09:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F3D91722AC
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 07:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8329D19FA93;
	Mon,  5 May 2025 07:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sYzFqotT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B602E62C;
	Mon,  5 May 2025 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746429275; cv=none; b=k776wsqLdTyUWBnyFw2+/IYPaxaJjvCmCc0xv/VsWthZBzLO1yRBKqdZKBO7ZrWCaXhqUX7SCeNYQie/mYfc09/NQDqwSEZiCgLG21Bb74tuzhhyGsUibcgz0Al7UjTsEFofa/j3ElaHm8wNvGk2zGvavz5FRrWj7ejEVETnJDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746429275; c=relaxed/simple;
	bh=ZqbgTFa9JXaATrM/UKF+9Mf3mzlYyVqltlYj9s+p6Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dkQY2kJ/sFMcC1Phy70WHgwyNhqczItORDQHzr5Z3V5qeKar4TST+dv8Vm1FDcf6vX3GvtKef78YyZg2vfdnwyYbNdGbKquHH3PkYvdbgRh1r+w9OFrnh2hApmOAUl8J2GL+L7XJCF0GedYjQ0DmOVxEOaKGPIGJT64HcApLb+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sYzFqotT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746429266;
	bh=HGXhisl5k+Q4Wf2F0QHV+DiOw5/o1HTutjf5uWAtzb8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sYzFqotTYOPML3fmLF/AUXGpOrYLLWNpBtzp1Df0kZmgjC1mYdxK5T7LzBmWKM5zR
	 Ow3oxhdQMYn76jBTMnd8uCEr7VBWMjdU2Q6Nf0lNaAEk+XtpsHLdPfyTGNLcKlqoM5
	 aL9Weyivz1RuOB0Zf8P0S3JMPUELqnSJhJZzwpw9A4epGE0hrFXlO9tDMfmj3IQw0D
	 E8x9XAr8zAiuEEEmumm/347dlYcZjskFwnW+r2j52pynNTSJclZfvtFH6fOqZRLUvy
	 RKgdZquxxvjaDE5377d4VvMhaw1S+vd8H82i9Eh/EWzzmZ1DaS4j8Pir0BYS5x2mU2
	 7e67CvfwwI5/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZrXpB11kZz4x1V;
	Mon,  5 May 2025 17:14:25 +1000 (AEST)
Date: Mon, 5 May 2025 17:14:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naman Jain
 <namjain@linux.microsoft.com>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20250505171425.0d4169e2@canb.auug.org.au>
In-Reply-To: <20250505161215.58a03af0@canb.auug.org.au>
References: <20250505160831.73e797b7@canb.auug.org.au>
	<20250505161215.58a03af0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7ZapFkYBP.o_yIrBt1OkQ/Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7ZapFkYBP.o_yIrBt1OkQ/Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 5 May 2025 16:12:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Mon, 5 May 2025 16:08:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the char-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/hv/vmbus_drv.c:1893:22: error: initialization of 'const struct =
bin_attribute * const*' from incompatible pointer type 'struct bin_attribut=
e **' [-Wincompatible-pointer-types]
> >  1893 |         .bin_attrs =3D vmbus_chan_bin_attrs,
> >       |                      ^~~~~~~~~~~~~~~~~~~~
> > drivers/hv/vmbus_drv.c:1893:22: note: (near initialization for 'vmbus_c=
han_group.<anonymous>.bin_attrs')
> >=20
> > Caused by commit
> >=20
> >   f31fe8165d36 ("uio_hv_generic: Fix sysfs creation path for ring buffe=
r")
> >=20
> > interacting with commit
> >=20
> >   9bec944506fa ("sysfs: constify attribute_group::bin_attrs")
> >=20
> > from the driver-core tree.
> >=20
> > I have applied the following merge fixup for today. =20
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 5 May 2025 15:56:12 +1000
> Subject: [PATCH] uio_hv_generic: constify bin_attribute definitions
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/hv/vmbus_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index e3d51a316316..857109bb99a0 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -1815,7 +1815,7 @@ static int hv_mmap_ring_buffer_wrapper(struct file =
*filp, struct kobject *kobj,
>  	return channel->mmap_ring_buffer(channel, vma);
>  }
> =20
> -static struct bin_attribute chan_attr_ring_buffer =3D {
> +static const struct bin_attribute chan_attr_ring_buffer =3D {
>  	.attr =3D {
>  		.name =3D "ring",
>  		.mode =3D 0600,
> @@ -1841,7 +1841,7 @@ static struct attribute *vmbus_chan_attrs[] =3D {
>  	NULL
>  };
> =20
> -static struct bin_attribute *vmbus_chan_bin_attrs[] =3D {
> +static const struct bin_attribute *vmbus_chan_bin_attrs[] =3D {
>  	&chan_attr_ring_buffer,
>  	NULL
>  };
> --=20
> 2.47.2

It occurred to me that the above patch could be applied directly to the
char-misc tree if vmbus_chan_bin_attrs was assigned to .bin_attrs_new
instead of .bin_attrs (later in the file), right?
--=20
Cheers,
Stephen Rothwell

--Sig_/7ZapFkYBP.o_yIrBt1OkQ/Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgYZVEACgkQAVBC80lX
0GwnSwf/Wplht6l90ljMl3jyqW80UAcTKj9vsdF7yHpcOZ+oqe4xWgIDeNqTQlNN
1dszItOrL4nOXWTLCLzJ3qk56702iwC5E+qF7wc5p87Rm/I9a0ccWsaZ0bjJsXcv
TLkhUNzKjgCrZmFXYmeyZRTnf3lRB7n7Af7zbNuuSuKqxDWW+2rIPa2GVhK8HJ6d
GSjfS+AvTg5p6vzTxxYJgPmoQfJxZpPcb82LbecPgZ1n876wkDjfTC7OEF3eCc0Q
TME6lbQakIN8VApU5n2mH7urNwbF8nS/LPXrUtSu2KILPQqqQSdgV+RORq63ZSTe
FB4lEt5ga6NrOaTUvaLN4WTQCfJUoA==
=bi2s
-----END PGP SIGNATURE-----

--Sig_/7ZapFkYBP.o_yIrBt1OkQ/Z--

