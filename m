Return-Path: <linux-next+bounces-6515-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3365AA8C1F
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 08:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0ECF1892306
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 06:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791EC1885B4;
	Mon,  5 May 2025 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jktOEH+I"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42842EBE;
	Mon,  5 May 2025 06:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746425542; cv=none; b=ADZy6ucNt0Lw1PMNz85uzSHQ5MEMmYT+rgVvbOcPEVTdWNfAv4WA7aazzdVPh1atEIpjAGS9X+dBrOUgVZAAjJMxYFwGE56HnbMZG4+iMpFIHBoVEyUC68aN7klBQkYqV0XMWlaAXVEA3vzeLqhy/4O6L9BR1nS0uWFd0X3nw+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746425542; c=relaxed/simple;
	bh=It3bJXFa53x7imiZUKrUC8bLqWtvv3rAkuS2B9UB8JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ns3Yoq5RjfP9URM5yJOMxqI119MbrKQ51JROBeC516lg6IJVPDVnwfTsItg1YUccTdyAy2yk5BOsrtQQAaTk6JUkUIiWwfmJp+1IwC/v3NNsm8vuLNBko2zj0WtjrfusGG9eFFzljgGtLd0AQ8f/NcFqsxUXQeJbSVtDDKxfBII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jktOEH+I; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746425537;
	bh=6ygfjZbZGo7Uyvq+spx+jGZ7fhNcT1AobI4yzC5e/4I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jktOEH+Iz2XQQ6kR4huBPcjG/da0F9uka0FuQJ64dtv1utk89wGjLRhMYHX96yHh2
	 BtJ1IFXqDoAGirTB8TQcvGuCIyFRAoxnCWKEsbHbd4uJ0JLowVmU+++lqBUGEM7hGo
	 YZhMmFCm3VE6LYSPVSohWmYWJ9J2S3Z/PLzAXIs8XEpLgS6kSp54/jMU9Bt8cC9Cyo
	 Y8Z1EY6IatjfU0QoJaP8ftiO9+ki+xVz/CK60Z+eteNiT2iZyDuYyaUDQDVNWerXX9
	 8RczJGNO4ER43AqnS8pWlcYCCoyzBq1Mtv/pTZZhEdV90d9clof9DU4NjKB8xgLq/4
	 0EOtE6CA7DOsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZrWQT1f5sz4wcm;
	Mon,  5 May 2025 16:12:16 +1000 (AEST)
Date: Mon, 5 May 2025 16:12:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naman Jain
 <namjain@linux.microsoft.com>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20250505161215.58a03af0@canb.auug.org.au>
In-Reply-To: <20250505160831.73e797b7@canb.auug.org.au>
References: <20250505160831.73e797b7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jdjJ2Gjfbk2mDa2DLa=xXMz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jdjJ2Gjfbk2mDa2DLa=xXMz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 5 May 2025 16:08:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the char-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/hv/vmbus_drv.c:1893:22: error: initialization of 'const struct bi=
n_attribute * const*' from incompatible pointer type 'struct bin_attribute =
**' [-Wincompatible-pointer-types]
>  1893 |         .bin_attrs =3D vmbus_chan_bin_attrs,
>       |                      ^~~~~~~~~~~~~~~~~~~~
> drivers/hv/vmbus_drv.c:1893:22: note: (near initialization for 'vmbus_cha=
n_group.<anonymous>.bin_attrs')
>=20
> Caused by commit
>=20
>   f31fe8165d36 ("uio_hv_generic: Fix sysfs creation path for ring buffer")
>=20
> interacting with commit
>=20
>   9bec944506fa ("sysfs: constify attribute_group::bin_attrs")
>=20
> from the driver-core tree.
>=20
> I have applied the following merge fixup for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 5 May 2025 15:56:12 +1000
Subject: [PATCH] uio_hv_generic: constify bin_attribute definitions

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/hv/vmbus_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index e3d51a316316..857109bb99a0 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1815,7 +1815,7 @@ static int hv_mmap_ring_buffer_wrapper(struct file *f=
ilp, struct kobject *kobj,
 	return channel->mmap_ring_buffer(channel, vma);
 }
=20
-static struct bin_attribute chan_attr_ring_buffer =3D {
+static const struct bin_attribute chan_attr_ring_buffer =3D {
 	.attr =3D {
 		.name =3D "ring",
 		.mode =3D 0600,
@@ -1841,7 +1841,7 @@ static struct attribute *vmbus_chan_attrs[] =3D {
 	NULL
 };
=20
-static struct bin_attribute *vmbus_chan_bin_attrs[] =3D {
+static const struct bin_attribute *vmbus_chan_bin_attrs[] =3D {
 	&chan_attr_ring_buffer,
 	NULL
 };
--=20
2.47.2

--=20
Cheers,
Stephen Rothwell

--Sig_/jdjJ2Gjfbk2mDa2DLa=xXMz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgYVr8ACgkQAVBC80lX
0Gy32Qf/QITb7d02gKaFFzPL4CUh/0ZmpYuNnVw4bFxcsE3AuOwXhbEFRhslJaYD
0v97upQtnNMeul0NUVlw0sQ1v5RDbrEnoEgcXxF2BZ7woQuCgBp9BToBgXzQAXev
oMcXxgz/0R3ZZNRAuirJElyT779JjJnkLGcyoaqzXoXkE3XASjRADG//Aw+dCGav
jm8DINCe39vsoL5ofb/otSnjYFBbDZiVVtTcK1SPP6orj/z5jp7DXjM26eZs04VJ
/cKqr544GJFZwYLTWYkAJmkKXnhagIhaVqLN1e6VIqeAf/kfeOTlJy/RDuWpI3TC
BqNdQ6sY58yDMvriUbjV4juo/4UyIQ==
=+syi
-----END PGP SIGNATURE-----

--Sig_/jdjJ2Gjfbk2mDa2DLa=xXMz--

