Return-Path: <linux-next+bounces-3558-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA596917D
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 04:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73F31F232DD
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 02:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3555919F100;
	Tue,  3 Sep 2024 02:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cyphar.com header.i=@cyphar.com header.b="yuOmn9kL"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27D41A4E6B;
	Tue,  3 Sep 2024 02:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725331282; cv=none; b=Rgun0Z+/oPMAy//u7NE4quNZronYQPAUIP8H7PCiyWJv4XYF2QIkWbpauxsYAqO4DWZRHEttA8n41+A3Ey28ycwDCZKpJFNKLgr0A4M9iPtmek4bJ0GG0Ugp+aSkwY7tfsNkyqC3jrkXjK1bDuyt3UdkzySn/pVV3y0NZxgjMQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725331282; c=relaxed/simple;
	bh=Wa1zM6bNrwR88Y5BC7oBrpAqXdO+Rizt0sscrZ6Kcqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqP5HvUJejNT8/pZaiQ7PThZvkMjz1YvLOSNFHHGcfcabHJYJ0ccOxiFKH86EC4D74SZJ7hJJFDhOV/h8lIDWwPND1FyZePVFBRzY+EMujPLUT4WsXi8lwNO9deGxqkw+Tii7ZmWdEpflHQfIhBoDD5NMu/gARdQ6Oa1dGmVedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyphar.com; spf=pass smtp.mailfrom=cyphar.com; dkim=pass (2048-bit key) header.d=cyphar.com header.i=@cyphar.com header.b=yuOmn9kL; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyphar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyphar.com
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4WyVHb5G1rz9t2M;
	Tue,  3 Sep 2024 04:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyphar.com; s=MBO0001;
	t=1725331275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cdb+1GKopFYZ6fkeo954uJCwRSa2DekSkoETuvgxvtA=;
	b=yuOmn9kLmB4ZLT2ZlhiXh0Fn1JT7CvrcOYPoqQ74TshxokKPfxXv2iKZD6W2Q+uJ+QNVAc
	A1xcXxuqssOGF+D6tglOdvxdall6GBNwTkiREYHp2kymTs4FCvP9JHqIlGeGJIZPe/YlI1
	sxhxtrI92bpV6ID/gAa5nqw5Ijg0O8c0rnEgQDE632kuIUVQlPEiYKSMR/PuYSxFzmh0gr
	9KKfjuNDXSiuBJZUjYPAph+0dOD2kGOIiIm2GguTvNRH3EgRHI2VAfNIJEMcfCuJ196GP8
	guSYDMqFguvdri6aK5y/Ikvk6DXuPXDH++pPjJ/rxzs3LKOZtn7KDHGZHQYVkQ==
Date: Tue, 3 Sep 2024 12:41:08 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240903.020556-bouncing.saws.daring.donor-5KuFrSsG4K2W@cyphar.com>
References: <20240903092745.370fc0c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zrzolbxm3amv6sky"
Content-Disposition: inline
In-Reply-To: <20240903092745.370fc0c6@canb.auug.org.au>


--zrzolbxm3amv6sky
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2024-09-03, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>=20
> After merging the vfs-brauner tree, today's linux-next build (native perf)
> failed like this:
>=20
> In file included from trace/beauty/fs_at_flags.c:21:
> perf/trace/beauty/generated/fs_at_flags_array.c:10:31: error: initialized=
 field overwritten [-Werror=3Doverride-init]
>    10 |         [ilog2(0x0001) + 1] =3D "RENAME_NOREPLACE",
>       |                               ^~~~~~~~~~~~~~~~~~
> perf/trace/beauty/generated/fs_at_flags_array.c:10:31: note: (near initia=
lization for 'fs_at_flags[1]')
> perf/trace/beauty/generated/fs_at_flags_array.c:14:30: error: initialized=
 field overwritten [-Werror=3Doverride-init]
>    14 |         [ilog2(0x200) + 1] =3D "HANDLE_FID",
>       |                              ^~~~~~~~~~~~
> perf/trace/beauty/generated/fs_at_flags_array.c:14:30: note: (near initia=
lization for 'fs_at_flags[10]')
> perf/trace/beauty/generated/fs_at_flags_array.c:15:30: error: initialized=
 field overwritten [-Werror=3Doverride-init]
>    15 |         [ilog2(0x001) + 1] =3D "HANDLE_MNT_ID_UNIQUE",
>       |                              ^~~~~~~~~~~~~~~~~~~~~~
> perf/trace/beauty/generated/fs_at_flags_array.c:15:30: note: (near initia=
lization for 'fs_at_flags[1]')
>=20
> Caused by commit
>=20
>   34cf40849654 ("uapi: explain how per-syscall AT_* flags should be alloc=
ated")
>=20
> I have used the vfs-brauner tree from next-20240902 for today.

Ah okay, the overlapping flag definitions in the copied over fcntl.h are
causing issues. We could just drop that part of the patch, or (since the
new flags aren't handled by perf/trace/beauty) we could just do
something simple like:

diff --git a/tools/perf/trace/beauty/fs_at_flags.sh b/tools/perf/trace/beau=
ty/fs_at_flags.sh
index 456f59addf74..930384029599 100755
--- a/tools/perf/trace/beauty/fs_at_flags.sh
+++ b/tools/perf/trace/beauty/fs_at_flags.sh
@@ -13,9 +13,13 @@ printf "static const char *fs_at_flags[] =3D {\n"
 regex=3D'^[[:space:]]*#[[:space:]]*define[[:space:]]+AT_([^_]+[[:alnum:]_]=
+)[[:space:]]+(0x[[:xdigit:]]+)[[:space:]]*.*'
 # AT_EACCESS is only meaningful to faccessat, so we will special case it t=
here...
 # AT_STATX_SYNC_TYPE is not a bit, its a mask of AT_STATX_SYNC_AS_STAT, AT=
_STATX_FORCE_SYNC and AT_STATX_DONT_SYNC
+# AT_RENAME_* flags are just aliases of RENAME_* flags and we don't need t=
o include them.
+# AT_HANDLE_* flags are only meaningful for name_to_handle_at, which we do=
n't support.
 grep -E $regex ${linux_fcntl} | \
        grep -v AT_EACCESS | \
        grep -v AT_STATX_SYNC_TYPE | \
+       grep -Ev "AT_RENAME_(NOREPLACE|EXCHANGE|WHITEOUT)" | \
+       grep -Ev "AT_HANDLE_(FID|MNT_ID_UNIQUE)" | \
        sed -r "s/$regex/\2 \1/g"       | \
        xargs printf "\t[ilog2(%s) + 1] =3D \"%s\",\n"
 printf "};\n"

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--zrzolbxm3amv6sky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQS2TklVsp+j1GPyqQYol/rSt+lEbwUCZtZ3RAAKCRAol/rSt+lE
b7sAAQCFtjLgggGfMHrkeCVnkiOyZLLKa9vZcO4TLxkdLdRSawD1GHSqElC0mzao
duVwVlWVIE/D/kr3RHPhwVPtsqSxCQ==
=o2D0
-----END PGP SIGNATURE-----

--zrzolbxm3amv6sky--

