Return-Path: <linux-next+bounces-3601-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A1A96CBF1
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 02:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1741F1C2392C
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 00:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086BE440C;
	Thu,  5 Sep 2024 00:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="owcTiT5W"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73183624;
	Thu,  5 Sep 2024 00:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725497952; cv=none; b=uh3/4bBS8WqkXP9IDDgDuahlAt3gEUZfRiNm0bq/zmEKRQeftJ/msbEVFgWwUoAc3tguld8yFkLyYznNPm7FFUMIjsmHnD4nr3SmAaAqVkBo5bbCHESg9tMmUaYQvB2JKsewQ8K0jNJNlJLMegL2zQT52Vskq4M/k6QkbAahxcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725497952; c=relaxed/simple;
	bh=aziCVaD/Y6XIrJq9QRJmVBR5Gq+7J7xl3MRy5nTT5jY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nh7PTSkm1vEikc3RuMCv16KjaX+62MNwpWrQ2qx0yF+t9ZMljSpv+EHkDIey5/ECgQ10OZW8aU1iZDzhE1Q6U8rKiFnnbk13B9YRSh3oJVcZSKxJb8T/oi6TIpcmwzvwwZFdMsuLqL3iKuqHdLvrGNC1UslhP8mYSeP9VeUUT/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=owcTiT5W; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725497947;
	bh=zF0b4z/ll/74yRUk9lTlAYXkg6Y/LXY2t3U+Zxx98I8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=owcTiT5W68tiswMd8691nYR0CfHNi4tsY/2VsfWxoZ47/dnSNG2qHa06GfIH5bBcu
	 eOnBhXV0CrT5TYVFDlkhDi4i8hWT9OUBIqtcnFfaAz47fxoO9zpld+GywkNu8Yoqdk
	 SVCdKc22VYfE31rZ9hvmdqu+5/F//l13pFdY4FsCScb2V+4+v2DtAdF42X4tFeMWVj
	 sTB4i8WS0gkLjTG2C9aYKUaXZksxqzTr5PRSieRhqzqoROsgW1b3iOqQlhBkLG1im6
	 6BrDC62D8hKnrupDiZSyVsq92nGD8oB47ny7FI/jSDRyDWcQRMhYkiXPfO0F0s84Gn
	 wjdYs+mr/6kFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wzgwq2HX7z4wc3;
	Thu,  5 Sep 2024 10:59:07 +1000 (AEST)
Date: Thu, 5 Sep 2024 10:58:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Aleksa Sarai <cyphar@cyphar.com>, Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240905105809.6585eec2@canb.auug.org.au>
In-Reply-To: <20240903.020556-bouncing.saws.daring.donor-5KuFrSsG4K2W@cyphar.com>
References: <20240903092745.370fc0c6@canb.auug.org.au>
	<20240903.020556-bouncing.saws.daring.donor-5KuFrSsG4K2W@cyphar.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IAZJ=U3z_OEBnTstU_q1leB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IAZJ=U3z_OEBnTstU_q1leB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 3 Sep 2024 12:41:08 +1000 Aleksa Sarai <cyphar@cyphar.com> wrote:
>
> On 2024-09-03, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >=20
> > After merging the vfs-brauner tree, today's linux-next build (native pe=
rf)
> > failed like this:
> >=20
> > In file included from trace/beauty/fs_at_flags.c:21:
> > perf/trace/beauty/generated/fs_at_flags_array.c:10:31: error: initializ=
ed field overwritten [-Werror=3Doverride-init]
> >    10 |         [ilog2(0x0001) + 1] =3D "RENAME_NOREPLACE",
> >       |                               ^~~~~~~~~~~~~~~~~~
> > perf/trace/beauty/generated/fs_at_flags_array.c:10:31: note: (near init=
ialization for 'fs_at_flags[1]')
> > perf/trace/beauty/generated/fs_at_flags_array.c:14:30: error: initializ=
ed field overwritten [-Werror=3Doverride-init]
> >    14 |         [ilog2(0x200) + 1] =3D "HANDLE_FID",
> >       |                              ^~~~~~~~~~~~
> > perf/trace/beauty/generated/fs_at_flags_array.c:14:30: note: (near init=
ialization for 'fs_at_flags[10]')
> > perf/trace/beauty/generated/fs_at_flags_array.c:15:30: error: initializ=
ed field overwritten [-Werror=3Doverride-init]
> >    15 |         [ilog2(0x001) + 1] =3D "HANDLE_MNT_ID_UNIQUE",
> >       |                              ^~~~~~~~~~~~~~~~~~~~~~
> > perf/trace/beauty/generated/fs_at_flags_array.c:15:30: note: (near init=
ialization for 'fs_at_flags[1]')
> >=20
> > Caused by commit
> >=20
> >   34cf40849654 ("uapi: explain how per-syscall AT_* flags should be all=
ocated")
> >=20
> > I have used the vfs-brauner tree from next-20240902 for today. =20
>=20
> Ah okay, the overlapping flag definitions in the copied over fcntl.h are
> causing issues. We could just drop that part of the patch, or (since the
> new flags aren't handled by perf/trace/beauty) we could just do
> something simple like:
>=20
> diff --git a/tools/perf/trace/beauty/fs_at_flags.sh b/tools/perf/trace/be=
auty/fs_at_flags.sh
> index 456f59addf74..930384029599 100755
> --- a/tools/perf/trace/beauty/fs_at_flags.sh
> +++ b/tools/perf/trace/beauty/fs_at_flags.sh
> @@ -13,9 +13,13 @@ printf "static const char *fs_at_flags[] =3D {\n"
>  regex=3D'^[[:space:]]*#[[:space:]]*define[[:space:]]+AT_([^_]+[[:alnum:]=
_]+)[[:space:]]+(0x[[:xdigit:]]+)[[:space:]]*.*'
>  # AT_EACCESS is only meaningful to faccessat, so we will special case it=
 there...
>  # AT_STATX_SYNC_TYPE is not a bit, its a mask of AT_STATX_SYNC_AS_STAT, =
AT_STATX_FORCE_SYNC and AT_STATX_DONT_SYNC
> +# AT_RENAME_* flags are just aliases of RENAME_* flags and we don't need=
 to include them.
> +# AT_HANDLE_* flags are only meaningful for name_to_handle_at, which we =
don't support.
>  grep -E $regex ${linux_fcntl} | \
>         grep -v AT_EACCESS | \
>         grep -v AT_STATX_SYNC_TYPE | \
> +       grep -Ev "AT_RENAME_(NOREPLACE|EXCHANGE|WHITEOUT)" | \
> +       grep -Ev "AT_HANDLE_(FID|MNT_ID_UNIQUE)" | \
>         sed -r "s/$regex/\2 \1/g"       | \
>         xargs printf "\t[ilog2(%s) + 1] =3D \"%s\",\n"
>  printf "};\n"

I have applied that by hand for today.  Please submit it and get it
applied.

--=20
Cheers,
Stephen Rothwell

--Sig_/IAZJ=U3z_OEBnTstU_q1leB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbZAiEACgkQAVBC80lX
0Gx3lAf+N7/+gZu6rn4lZRz+ANHkjL0BzPtqTCa0y8J8ELQzmfaMfeZigJhOWQh5
u3PtsRrW72n7dU+PJebV2XNIR4n4Uyw/m5TmgcL/UXlh9HTTqC5lUVNOmFVaEbOY
J8tquQdiPzZ2t/q1SNwORDaNygWkdlPEhwJ5ArwYLdTlOs7b2yRqjFfnQj6sH2Ag
BF4DQqNppN/eeCpZxC/1g/k8lJPqZPn2OJkVWLMPEVlWeDBjO7x4COWa1DTiffhT
fVIFuGPI32cTOTfHr0Ul1PU8topvODwTPhX4zRTb3c0LZAXzQrl238qKxYYw09R5
EKLCBX41wB16BqCAIHBTLtKzaxG3nQ==
=Qcfh
-----END PGP SIGNATURE-----

--Sig_/IAZJ=U3z_OEBnTstU_q1leB--

