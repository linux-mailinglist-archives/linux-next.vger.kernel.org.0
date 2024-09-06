Return-Path: <linux-next+bounces-3632-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBB96E75F
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 03:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 623682858B2
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 01:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C87218E0E;
	Fri,  6 Sep 2024 01:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MKIj2ttR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A8B10E0;
	Fri,  6 Sep 2024 01:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725587295; cv=none; b=ROUWsicdXLn/1HPYXDw5Z//u+gGctVwZFECtJwU5lQzFkaS7MuTnMaMoLAPAJF/Py2UFRYlhDz39WC0evMbuu4a35BoQIIeSLEON63T1t+R7SC3R0B20MThB+ua2MSXNqbd47ljPXoaKBGUGgCFn4mZFte92S/X+Qta2+C9P8UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725587295; c=relaxed/simple;
	bh=7zCL/F2SegnjDaIDN/6aX2HgHqwrif0ajQVQEgillWM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SAvFJnjYbovLpMHiY8l3xdYuT80osMP/s7jUYIJuQ0blFffHGXddj7IP7ZyBIZ6/KTmAg2slWA+MOr5v08Svn1TnSyn2wiK6rphBc8IGel00XBzlfn0gBmsT4AlFhaYNkrIrSV1SfnoEh50C5ACVJ6SO8ke5vQcYWp2yjlRvR7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MKIj2ttR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725587290;
	bh=pdg98YKJnJpUX8y4oKFacGDedcpygu8u2LZ+ChqaW6s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MKIj2ttRnjhW+TU7tGJwsvykwpcdxYilXJy14dhQbxc42pXcSD2VXZ+HVuS8iiXlb
	 Kf+/fa24Gj5xcfLdV69TV51CgZMaLeat8fuPWfGwcViT+usFYZXkbDgLJ0Faz/Izqh
	 WYzRSTbb22irCuyIUGYkGDVHq4Nj2k7TzGPJynA5ulceFDJRbxXSohuhQlWp3LzCga
	 +ZgFvXjV1HQvsN6PqwrYxZBVO5lBqM6V2jLnaL+onotcjpi1mbE7n4geHVaXgTsADE
	 Uk8X4CGFzGzJy+tqnVUD4qNS4Bex3aLOpJwLscIKaaug/UwMFQCyc2PpdLknw1u69P
	 AciXmZMTk9mLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0Jyx73H9z4wp0;
	Fri,  6 Sep 2024 11:48:09 +1000 (AEST)
Date: Fri, 6 Sep 2024 11:48:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Steve French
 <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Steve French
 <stfrench@microsoft.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the cifs
 tree
Message-ID: <20240906114809.08a545d9@canb.auug.org.au>
In-Reply-To: <20240906093821.30c5114e@canb.auug.org.au>
References: <20240906084637.295241d1@canb.auug.org.au>
	<20240906093821.30c5114e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MK_.kF7nY/TSQlrslTd9U3_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MK_.kF7nY/TSQlrslTd9U3_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 6 Sep 2024 09:38:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Fri, 6 Sep 2024 08:46:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > Today's linux-next merge of the vfs-brauner tree got a conflict in:
> >=20
> >   fs/smb/client/cifssmb.c
> >=20
> > between commit:
> >=20
> >   a68c74865f51 ("cifs: Fix SMB1 readv/writev callback in the same way a=
s SMB2/3")
> >=20
> > from the cifs tree and commit:
> >=20
> >   0fda1f8c6bf8 ("netfs: Speed up buffered reading")
> >=20
> > from the vfs-brauner tree.
> >=20
> > I fixed it up (I used the former as it is (supposedly) a much newer pat=
ch)
> > and can carry the fix as necessary. This is now fixed as far as linux-n=
ext
> > is concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts. =20
>=20
> The fixup ended up being as below.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc fs/smb/client/cifssmb.c
> index cfae2e918209,04f2a5441a89..790b3f5ea64b
> --- a/fs/smb/client/cifssmb.c
> +++ b/fs/smb/client/cifssmb.c
> @@@ -1261,16 -1261,6 +1261,15 @@@ openRetry
>   	return rc;
>   }
>  =20
>  +static void cifs_readv_worker(struct work_struct *work)
>  +{
>  +	struct cifs_io_subrequest *rdata =3D
>  +		container_of(work, struct cifs_io_subrequest, subreq.work);
>  +
> - 	netfs_subreq_terminated(&rdata->subreq,
> - 				(rdata->result =3D=3D 0 || rdata->result =3D=3D -EAGAIN) ?
> - 				rdata->got_bytes : rdata->result, true);
> ++	rdata->subreq.transferred +=3D rdata->got_bytes;
> ++	netfs_read_subreq_terminated(&rdata->subreq, rdata->result, true);
>  +}
>  +
>   static void
>   cifs_readv_callback(struct mid_q_entry *mid)
>   {

Also this (which I will roll into the above merge resolution tomorrow):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 6 Sep 2024 11:39:25 +1000
Subject: [PATCH] fix up for "netfs: Speed up buffered reading"

interacting with "cifs: Fix SMB1 readv/writev callback in the same way
as SMB2/3"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/smb/client/cifssmb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index 790b3f5ea64b..76fb2287c17b 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -1326,9 +1326,9 @@ cifs_readv_callback(struct mid_q_entry *mid)
 		__set_bit(NETFS_SREQ_HIT_EOF, &rdata->subreq.flags);
 		rdata->result =3D 0;
 	} else {
-		if (rdata->got_bytes < rdata->actual_len &&
-		    rdata->subreq.start + rdata->subreq.transferred + rdata->got_bytes =
=3D=3D
-		    ictx->remote_i_size) {
+		size_t trans =3D rdata->subreq.transferred + rdata->got_bytes;
+		if (trans < rdata->subreq.len &&
+		    rdata->subreq.start + trans =3D=3D ictx->remote_i_size) {
 			__set_bit(NETFS_SREQ_HIT_EOF, &rdata->subreq.flags);
 			rdata->result =3D 0;
 		}
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/MK_.kF7nY/TSQlrslTd9U3_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaX1kACgkQAVBC80lX
0Gz3Agf9GVTl7yTMuYijti1PvQ91bw4HKIGv0EngK3z1zjBo7XQ0YBAYTVVfTFuS
X/uGLNEyTsPxqSJYR9bknzes4a6L194c9ehZAGOh+kABQnCP3AEfx85KnqRIcJwq
bcEjgKeT3ohidbmdupg0h9JOkL3ki8syc7vETg4d8GXv5BEF/x3sbWB9df7ZXmfV
o/gQ20I290uYSmd53h+ar1X7g0bXfp4kLlt9k/Jz0tnsmOHwt4oMhm7rZ7LscJ7x
LaR+VL41e2xL3NQAZDSavb7dGpMTS9n2CzruXUu7CV69ZM/VijI1QG3HiELODFPI
G8KN9VLuIfumnaWzSD3eIzHvrK/8KA==
=qSIV
-----END PGP SIGNATURE-----

--Sig_/MK_.kF7nY/TSQlrslTd9U3_--

