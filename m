Return-Path: <linux-next+bounces-3718-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1349972629
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 02:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B25B6283360
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 00:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D673C1CFB9;
	Tue, 10 Sep 2024 00:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CGy0r8XB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16821CD29;
	Tue, 10 Sep 2024 00:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725927820; cv=none; b=RBdYNoyeAcE4O4QOYPckhytTNCXWmwO08p7zqyRq9LC6/OCqBvSDgJA2WFcQY8reApav11cdPpWS7upOZjed+ObQ0PI1p0ImVGz6sAqsmjidA3rPYhZgpcEKYXqVhyc4eTH1vJ3s1K7AmMDd3Tu/iy8P7dIKdH7iq3AHcfD63TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725927820; c=relaxed/simple;
	bh=eY/Rl7lD1XWTnxw/u8a1BM6K08VMNjQ+Z0x45r6cM+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dvWc+XD8KJN53hkjV1itHq0jA+cksWyzllbVMSGibRDdK5cMLEWhHkrkXuPPr/lWBFI5OsPcclbdhEkaLE0z7lDRPROQg+W0dRNnOWf0uXvyFyRhIyzPGYQ4svoSqM4mMC4EeWTP3iC1Ce1IyZ8vF/dt2JC0QbMXsi/fkb/Vngc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CGy0r8XB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725927813;
	bh=nBX7GHBzCZ2qhNL60MASnfeZbJIth3IjhvxOSqVuh1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CGy0r8XBeDS3fjxOS6fC9tLAM/a/tLPkPNgWrRMybus8Q+xo4YWvhkjUv6GPrD7Zt
	 LjtC37aE6KbRs1fqsmGAlTA5fPnTIK/ccn8oU6FfofvasYQl8ul7mM8/ox1hG0f4z5
	 nRnWjjORgIiuRdyiQzfFOO2wYaMzoX5tQnzYrjBTxR1K+uPjXYZs8qYTE5b1A6fnG0
	 ArspvSzx082q1mXElYnbGwPUlGE1fVDQV3MbgE6TsXKvCJ1UbcUAqQq1DxxIaBMSjh
	 Qx/adBDyq8LO9uTUK+p2wh0Nq6aD3+jkb4z62Mk2OTMSaPziy/FbZNs9Qd43WVkcGk
	 7UNWsTqcBnmag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2kvS6xwlz4wc3;
	Tue, 10 Sep 2024 10:23:32 +1000 (AEST)
Date: Tue, 10 Sep 2024 10:23:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Aleksa Sarai <cyphar@cyphar.com>, Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240910102332.4f171bde@canb.auug.org.au>
In-Reply-To: <20240905105809.6585eec2@canb.auug.org.au>
References: <20240903092745.370fc0c6@canb.auug.org.au>
	<20240903.020556-bouncing.saws.daring.donor-5KuFrSsG4K2W@cyphar.com>
	<20240905105809.6585eec2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dXms8KSbUWNEEYhyoFVNzC4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dXms8KSbUWNEEYhyoFVNzC4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 5 Sep 2024 10:58:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 3 Sep 2024 12:41:08 +1000 Aleksa Sarai <cyphar@cyphar.com> wrote:
> >
> > On 2024-09-03, Stephen Rothwell <sfr@canb.auug.org.au> wrote: =20
> > > Hi all,
> > >=20
> > > After merging the vfs-brauner tree, today's linux-next build (native =
perf)
> > > failed like this:
> > >=20
> > > In file included from trace/beauty/fs_at_flags.c:21:
> > > perf/trace/beauty/generated/fs_at_flags_array.c:10:31: error: initial=
ized field overwritten [-Werror=3Doverride-init]
> > >    10 |         [ilog2(0x0001) + 1] =3D "RENAME_NOREPLACE",
> > >       |                               ^~~~~~~~~~~~~~~~~~
> > > perf/trace/beauty/generated/fs_at_flags_array.c:10:31: note: (near in=
itialization for 'fs_at_flags[1]')
> > > perf/trace/beauty/generated/fs_at_flags_array.c:14:30: error: initial=
ized field overwritten [-Werror=3Doverride-init]
> > >    14 |         [ilog2(0x200) + 1] =3D "HANDLE_FID",
> > >       |                              ^~~~~~~~~~~~
> > > perf/trace/beauty/generated/fs_at_flags_array.c:14:30: note: (near in=
itialization for 'fs_at_flags[10]')
> > > perf/trace/beauty/generated/fs_at_flags_array.c:15:30: error: initial=
ized field overwritten [-Werror=3Doverride-init]
> > >    15 |         [ilog2(0x001) + 1] =3D "HANDLE_MNT_ID_UNIQUE",
> > >       |                              ^~~~~~~~~~~~~~~~~~~~~~
> > > perf/trace/beauty/generated/fs_at_flags_array.c:15:30: note: (near in=
itialization for 'fs_at_flags[1]')
> > >=20
> > > Caused by commit
> > >=20
> > >   34cf40849654 ("uapi: explain how per-syscall AT_* flags should be a=
llocated")
> > >=20
> > > I have used the vfs-brauner tree from next-20240902 for today.   =20
> >=20
> > Ah okay, the overlapping flag definitions in the copied over fcntl.h are
> > causing issues. We could just drop that part of the patch, or (since the
> > new flags aren't handled by perf/trace/beauty) we could just do
> > something simple like:
> >=20
> > diff --git a/tools/perf/trace/beauty/fs_at_flags.sh b/tools/perf/trace/=
beauty/fs_at_flags.sh
> > index 456f59addf74..930384029599 100755
> > --- a/tools/perf/trace/beauty/fs_at_flags.sh
> > +++ b/tools/perf/trace/beauty/fs_at_flags.sh
> > @@ -13,9 +13,13 @@ printf "static const char *fs_at_flags[] =3D {\n"
> >  regex=3D'^[[:space:]]*#[[:space:]]*define[[:space:]]+AT_([^_]+[[:alnum=
:]_]+)[[:space:]]+(0x[[:xdigit:]]+)[[:space:]]*.*'
> >  # AT_EACCESS is only meaningful to faccessat, so we will special case =
it there...
> >  # AT_STATX_SYNC_TYPE is not a bit, its a mask of AT_STATX_SYNC_AS_STAT=
, AT_STATX_FORCE_SYNC and AT_STATX_DONT_SYNC
> > +# AT_RENAME_* flags are just aliases of RENAME_* flags and we don't ne=
ed to include them.
> > +# AT_HANDLE_* flags are only meaningful for name_to_handle_at, which w=
e don't support.
> >  grep -E $regex ${linux_fcntl} | \
> >         grep -v AT_EACCESS | \
> >         grep -v AT_STATX_SYNC_TYPE | \
> > +       grep -Ev "AT_RENAME_(NOREPLACE|EXCHANGE|WHITEOUT)" | \
> > +       grep -Ev "AT_HANDLE_(FID|MNT_ID_UNIQUE)" | \
> >         sed -r "s/$regex/\2 \1/g"       | \
> >         xargs printf "\t[ilog2(%s) + 1] =3D \"%s\",\n"
> >  printf "};\n" =20
>=20
> I have applied that by hand for today.  Please submit it and get it
> applied.

I am still applying this build fix patch.
--=20
Cheers,
Stephen Rothwell

--Sig_/dXms8KSbUWNEEYhyoFVNzC4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbfkYQACgkQAVBC80lX
0Gxlsgf9Gw3EUBLGQppIzdGj6oYlHBmKmHk5no6zA28uiaeCi7NxfBT3Fa9iu+On
5cZ0G+cpWONk8aWObYoJpq8PAOWEg1EkkolCZyRCPxMATxkMCuDoPwurGQgZW5oz
cWmaEuGgIZYcM7Xxm11DILIRRtdiX+q0PIJuV0R03yk5XCXFYMIS50lZK1PY2i6D
OYRGtTlVlvj91znonT1Sf5E6vhEmTxJbpKNV56Ni+y3pdc/wqZfGkqKkYrXON4sq
w55ghRB9Dv1bT3taWHo6rtHujtWhW4SlbWeT2HFis0vDV0o2G7yt4vitvV1voltm
jBz2OPijVQCaeDGNW6LP1/6VjufKzg==
=uW9f
-----END PGP SIGNATURE-----

--Sig_/dXms8KSbUWNEEYhyoFVNzC4--

