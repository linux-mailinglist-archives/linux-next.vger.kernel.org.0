Return-Path: <linux-next+bounces-7847-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB0B1AACC
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 00:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 174AB3B9BB2
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 22:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D405128C2D3;
	Mon,  4 Aug 2025 22:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VgCWAHA9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35C028B4FA;
	Mon,  4 Aug 2025 22:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754345882; cv=none; b=MKIVwJmnPq7SWqDtxhi55/o3XtnfazFfZE3RHnf7HVO0LYSyhykaB8paenXQrVeEmBTK3y3kleq/9FKDmPfONfqYHf/5KB83bWKnJSWC8s3PwKyQldrmPgdnjxgEfM4oHy1vYX5aEw7dc3/hZ6HxH4RvraIKVzU3HJEyhYtOdAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754345882; c=relaxed/simple;
	bh=wcY0Dj7p8UUSJdACzRR0/5pu4kuDnrUgAzK29YBSh6c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c4XHPBUxHv62TMi5LLIYUci/wiYbjNHTHLkk1GBBPYtXnQZOVUx0lA72Y5QMJWeGGF6bQ9OLd3iCI410uJAGqHp9K9bxy4mFUj96EAsw9cuxdpFcPL4BKh56bcjhx3K+IWHzoV2N4S4LY3iexJrnruTjUbf6WMCCRhvl4c6yhZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VgCWAHA9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754345870;
	bh=H7Mz6K7KfBw+NTTJ2AQg3o+r8btT6wqJswBUA9X6bx8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VgCWAHA9Llia8G7aiZlcJmjtP5Xq+W51xpMWE3aTP2lqesCtayscsWKGCbiEt46Qo
	 FWZg2ViZMBgVIlKMGi2Sf+8uC5+Fo5GN+JFmgqc3GCsQKMYrQ6mnvJkWa9M/m1fJH3
	 3tlOMoGG6yDFlzO1ct+arnHnZrFS44njvGumioNkssV5G7xnQ64exRnrU0PLfUu953
	 QEoPLWuclUrqf8wTflJxQJJa4IpTKh0TsHUhJDIfb4ukBRV+UAVnHFV8ClooEBU5+v
	 rfgNRC+6L75/zWXNRsu0h8CX5hG7qTrwjf5Ov+/oF7S4cs0uce8MjSd4W1p6GRNduq
	 UFBV6dsHEMXPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwrXZ2ndtz4wbr;
	Tue,  5 Aug 2025 08:17:50 +1000 (AEST)
Date: Tue, 5 Aug 2025 08:17:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexey Gladkov <legion@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <20250805081749.3be45c9a@canb.auug.org.au>
In-Reply-To: <aJBcn9jb2RseRwS3@example.org>
References: <20250730161223.63783458@canb.auug.org.au>
	<20250804112540.6b8ed4b9@canb.auug.org.au>
	<aJBcn9jb2RseRwS3@example.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FYfa1OaaHmfExziZDIZbwdJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FYfa1OaaHmfExziZDIZbwdJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Alexey,

On Mon, 4 Aug 2025 09:09:19 +0200 Alexey Gladkov <legion@kernel.org> wrote:
>
> On Mon, Aug 04, 2025 at 11:25:40AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > On Wed, 30 Jul 2025 16:12:23 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > After merging the kbuild tree, today's linux-next build (i386 defconf=
ig)
> > > failed like this:
> > >=20
> > > ld: .vmlinux.export.o: in function `__ksymtab___builtin_memcmp':
> > > .vmlinux.export.c:(___ksymtab+__builtin_memcmp+0x0): undefined refere=
nce to `__builtin_memcmp'
> > >=20
> > > Caused by commit
> > >=20
> > >   c4b487ddc51f ("modpost: Create modalias for builtin modules")
> > >=20
> > > I have reverted that commit, along with its parent and child, for
> > > today.  It's parent commit
> > >=20
> > >   66ef3890c628 ("modpost: Add modname to mod_device_table alias")
> > >=20
> > > generated this warning in the i386 defconfig build:
> > >=20
> > > scripts/mod/file2alias.c: In function =E2=80=98handle_moddevtable=E2=
=80=99:
> > > scripts/mod/file2alias.c:1480:25: warning: variable =E2=80=98modnamel=
en=E2=80=99 set but not used [-Wunused-but-set-variable]
> > >  1480 |         size_t typelen, modnamelen;
> > >       |                         ^~~~~~~~~~ =20
> >=20
> > I am still reverting those commits. =20
>=20
> I do not have my tree. Can you apply my fix for original commit instead of
> revert ?
>=20
> https://lore.kernel.org/all/20250730090025.2402129-1-legion@kernel.org/

I did wonder why this patch has not been applied to the kbuild tree?

I will apply that today to the linux-next merge, but it is presumably
delaying the kbuild tree being merged by Linus ...

--=20
Cheers,
Stephen Rothwell

--Sig_/FYfa1OaaHmfExziZDIZbwdJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiRMY0ACgkQAVBC80lX
0GxkiAf/WGry/SzTUCiSkHSqivJnEcZza5Pu0ROfTBNUhmVlvZTCb3tD/HiD9D7j
Ut0h/ShnWwhcs/9R+dbXKDqjv4LpVQSAh3qo9qTKvjQBU63zFY4H3/WqliDXDrBY
Exd90nZJi0i7O2Ls0UFfzHTblYE+GeD78RsgI/xK+i/LqICzWE+NsLelLLecjW8y
SGNgaB8dznTHoWjS8hsMskbAFv1N0Pnndo1rZNtx7Gt8sReahlSVdPPxrr/BIl6P
oN4q67vfds5PQQAUoR10Q6KUGKktsa8RsaopZdv3KtSJM/taHOtoL4QDR1I8AEXs
wfbyOO0rSOgzKWnz/74plBRkQdeogQ==
=HLYm
-----END PGP SIGNATURE-----

--Sig_/FYfa1OaaHmfExziZDIZbwdJ--

