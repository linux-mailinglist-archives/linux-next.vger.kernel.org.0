Return-Path: <linux-next+bounces-3170-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528F941347
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 15:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB6EB1C23A4E
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 13:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB7919EEB8;
	Tue, 30 Jul 2024 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PmlKvsKZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA01EA90;
	Tue, 30 Jul 2024 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722346621; cv=none; b=QNxDhN5xNqU0/WgMOsr/KH9mlI3XNFMKU9ZqZ2f5ijATWC5rRXHmvyPD19y1XFB7UAJRllyZTeocY7G0ZVAAloFQ4mdszhbBrIGJOdJgEA4s/GyGSnv8z7faA6/KbNog6TGuw0q9YsUyJpI7wzb89UmHRkCNRsAkLOnzVtSOZnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722346621; c=relaxed/simple;
	bh=ua+G5d37uwwyS39oprVNhzO7VDHeERuJds3F6946j5w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=arUlTF9VqLUEy+kITyoaizJoVo9hpqGULgav1pWcjcJcS8sxSnOtukVpwK9tclVoe7QjDaq3V+Gri2T/6yRrvejUnPJpGuMfWR0NEQtBYl7Bx/AsH5nqrNmyxdUJNUfQ2Udto4mY3+3nKmCUElSZMQ9hKb7/olQDM/DSkw3h914=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PmlKvsKZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722346615;
	bh=PLa6/dSPTqUd40ji8hY6ASbBV5wUY8onxJlxww0sZyA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PmlKvsKZGAXTtT+2kPbGfwN5j4T1zuwCz8cKpsB/dpE3bLFcYyJyzwKs6+S/rE5o9
	 JXK83prXTjmBP5KTZ8nxJ47bKhckRuR6+zbxIXAb5wWvWnQKaXrdOCXrlJyfUtjx3N
	 N+kKyXG2ZZZVSYI/t0oIWXfs8hQRYV8tMMzJzBuZIzwDYvOa45Km3+Axe311nQOd2x
	 Hw27JEXoARTSYu9t1onPrgfAcfJ9QThNK67xrTB5CUnX5OmxL3/QVdJzSxVbq2IRoL
	 dUCzy0Ms/q40Q+r9H2h531FovndysjuC3rJeKJojI25zEqeF/NZhCUgkpZWt2hI0Ov
	 39jNga8xD6i7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WYGVH6FGQz4wcK;
	Tue, 30 Jul 2024 23:36:55 +1000 (AEST)
Date: Tue, 30 Jul 2024 23:36:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the device-mapper tree
Message-ID: <20240730233655.25f77daa@canb.auug.org.au>
In-Reply-To: <aa4b337-e1dd-4091-ab2-6b41de205fd1@redhat.com>
References: <20240709185733.4aac356a@canb.auug.org.au>
	<49ab648e-3c89-d4d-f2f7-3c1e2aa2cab@redhat.com>
	<20240710082824.30c8161d@canb.auug.org.au>
	<622b892-d792-382c-46f8-fe5cfdba4df1@redhat.com>
	<20240730200737.67bb4d4f@canb.auug.org.au>
	<aa4b337-e1dd-4091-ab2-6b41de205fd1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bVjLCT6W2gGl0D=OboQWUF_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bVjLCT6W2gGl0D=OboQWUF_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mikulas,

On Tue, 30 Jul 2024 13:54:13 +0200 (CEST) Mikulas Patocka <mpatocka@redhat.=
com> wrote:
>
> On Tue, 30 Jul 2024, Stephen Rothwell wrote:
>=20
> > On Wed, 10 Jul 2024 17:48:39 +0200 (CEST) Mikulas Patocka <mpatocka@red=
hat.com> wrote: =20
> > >
> > > On Wed, 10 Jul 2024, Stephen Rothwell wrote:
> > >  =20
> > > > On Tue, 9 Jul 2024 11:56:27 +0200 (CEST) Mikulas Patocka <mpatocka@=
redhat.com> wrote:   =20
> > > > >
> > > > > On Tue, 9 Jul 2024, Stephen Rothwell wrote:
> > > > >    =20
> > > > > > After merging the device-mapper tree, today's linux-next build =
(htmldocs)
> > > > > > produced this warning:
> > > > > >=20
> > > > > > Documentation/admin-guide/device-mapper/dm-crypt.rst:168: ERROR=
: Unexpected indentation.
> > > > > >=20
> > > > > > Introduced by commit
> > > > > >=20
> > > > > >   04a1020ad350 ("dm-crypt: limit the size of encryption request=
s")   =20
> > > > >=20
> > > > > How should it be fixed? Delete the '-' character? Or some other c=
hange?   =20
> > > >=20
> > > > Looking a few lines above shows indented paragraphs without the '-'
> > > > which seems to work.   =20
> > >=20
> > > I hopefully fixed that. =20
> >=20
> > I am sill seeing this warning. =20
>=20
> So, send a patch for it.
>=20
> I don't know whats wrong with that documentation file.

I am not sure either, but the following fixes it for me (but I don't
know if this produces the current output, sorry):

diff --git a/Documentation/admin-guide/device-mapper/dm-crypt.rst b/Documen=
tation/admin-guide/device-mapper/dm-crypt.rst
index e625830d335e..08ff2df77be7 100644
--- a/Documentation/admin-guide/device-mapper/dm-crypt.rst
+++ b/Documentation/admin-guide/device-mapper/dm-crypt.rst
@@ -161,9 +161,9 @@ iv_large_sectors
    if this flag is specified.
=20
=20
-Module parameters::
-max_read_size
-max_write_size
+Module parameters:
+
+max_read_size max_write_size
    Maximum size of read or write requests. When a request larger than this=
 size
    is received, dm-crypt will split the request. The splitting improves
    concurrency (the split requests could be encrypted in parallel by multi=
ple

--=20
Cheers,
Stephen Rothwell

--Sig_/bVjLCT6W2gGl0D=OboQWUF_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmao7HcACgkQAVBC80lX
0Gz6XAf+JnSTQz6bneZH05T8Qre/BDQTTnTMbej0RFrfWdKf07BUGYIG8mRjZnH4
0blCxo8bejekLH9xuonH0tXXzzjdzN8W2f1qYnu4FFANJ/k1PTezH+f01cNSoEBs
kfCghcG54Uq40tCrtQGQtCRs+dp2AGTeHpu2dhG0x/UwSxEGZwLT5OicwSaCCaSM
HU6i5Z6laPI9j3RcSBHpKQrkmpbWAfIzY5/3X+mmsHB44G+SgZTb1e9tUQMljlN5
DftlBzG1GgRXEc9cCf9QqFh2hnQ1GqxTx/0el+Pc74nathWF0UKbPnslk8hu7949
//U60AmW7OWowhglL6rk3Kctb8zrrA==
=qmYx
-----END PGP SIGNATURE-----

--Sig_/bVjLCT6W2gGl0D=OboQWUF_--

