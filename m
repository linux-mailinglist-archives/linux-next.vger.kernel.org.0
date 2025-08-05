Return-Path: <linux-next+bounces-7852-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A591AB1ACC9
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 05:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCD5417E22F
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 03:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B865146D45;
	Tue,  5 Aug 2025 03:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U9m0JE4C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC0441A8F;
	Tue,  5 Aug 2025 03:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754364836; cv=none; b=OVSxrgfQmIURo5K3Ay2VNJJDNZyQ6AcfKKXqWExEAqROrEPzJmmKZ9HDclglk4GP1UZ/Yu+uwl/eULNLAnEZdStOq4ulRnEZfbwgKBTgMMZjQe2uEynOIA64bH1Q/PTslMahCq+n1/Pe+3uMkrIPTx2j5TMF+e9Q/ngtRxhULcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754364836; c=relaxed/simple;
	bh=c5hbRvHNi56CBJlHWHUX+0F5W4wjFATeSJ6A7Ojq32I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQQVajUalmLPIHOtPjIHRiDYwTudtAuLfLq6obDSx1fPC1DM+vgbtNBTbRssvfzEXoTJYrXj/mDU4ZkhTDMFISqGDD03OmdM2ee/F+uMCTGaNPZpHZCDACr7o5P32dJzU40zWC3NNqAPf0ZBZ2bZT2Xv6e04sZcOpuqzuLuPQMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U9m0JE4C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754364830;
	bh=gOe7vWaA8aGttts4FU3DhE30Z4azbFtExHs33eHxJM8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U9m0JE4CVDk3Pwov1XygYUXb740EJsKdXWaGV3PW9IYSSpPFQ4UxiJAp5fb+Zv27z
	 BSuZqijbmMRBLx2kb4JIqV+5PdF1JZSXwnPw58zqcPRbbDemKwlTSD/hek4wUB2yVW
	 DaBDjNNyXksaRaq0aZcpX+qIFDF7fxdIYm3dcJE1ag44VQfsgU8A/IaZDU78PT4BFz
	 QOOCnnRiE3N1NIfQzK7JTyLuQowv3mMQxlVph5vWu/wljIU19faY+qYO2cvHN0lteW
	 Y9Lz+Gi2H6dk+7chqUXzJEf14cNBBTx7IFeeHtOFkac3kKTS4dWjang2gFt12m0Qbk
	 f5MrN2pyffHIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwzYB3N21z4wcd;
	Tue,  5 Aug 2025 13:33:50 +1000 (AEST)
Date: Tue, 5 Aug 2025 13:33:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexey Gladkov <legion@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <20250805133349.4339e693@canb.auug.org.au>
In-Reply-To: <20250805081749.3be45c9a@canb.auug.org.au>
References: <20250730161223.63783458@canb.auug.org.au>
	<20250804112540.6b8ed4b9@canb.auug.org.au>
	<aJBcn9jb2RseRwS3@example.org>
	<20250805081749.3be45c9a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H4vWhR81k8nF.kqryRuW0LH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H4vWhR81k8nF.kqryRuW0LH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 5 Aug 2025 08:17:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Mon, 4 Aug 2025 09:09:19 +0200 Alexey Gladkov <legion@kernel.org> wrot=
e:
> >
> > On Mon, Aug 04, 2025 at 11:25:40AM +1000, Stephen Rothwell wrote: =20
> > > Hi all,
> > >=20
> > > On Wed, 30 Jul 2025 16:12:23 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:   =20
> > > >
> > > > After merging the kbuild tree, today's linux-next build (i386 defco=
nfig)
> > > > failed like this:
> > > >=20
> > > > ld: .vmlinux.export.o: in function `__ksymtab___builtin_memcmp':
> > > > .vmlinux.export.c:(___ksymtab+__builtin_memcmp+0x0): undefined refe=
rence to `__builtin_memcmp'
> > > >=20
> > > > Caused by commit
> > > >=20
> > > >   c4b487ddc51f ("modpost: Create modalias for builtin modules")
> > > >=20
> > > > I have reverted that commit, along with its parent and child, for
> > > > today.  It's parent commit
> > > >=20
> > > >   66ef3890c628 ("modpost: Add modname to mod_device_table alias")
> > > >=20
> > > > generated this warning in the i386 defconfig build:
> > > >=20
> > > > scripts/mod/file2alias.c: In function =E2=80=98handle_moddevtable=
=E2=80=99:
> > > > scripts/mod/file2alias.c:1480:25: warning: variable =E2=80=98modnam=
elen=E2=80=99 set but not used [-Wunused-but-set-variable]
> > > >  1480 |         size_t typelen, modnamelen;
> > > >       |                         ^~~~~~~~~~   =20
> > >=20
> > > I am still reverting those commits.   =20
> >=20
> > I do not have my tree. Can you apply my fix for original commit instead=
 of
> > revert ?
> >=20
> > https://lore.kernel.org/all/20250730090025.2402129-1-legion@kernel.org/=
 =20
>=20
> I did wonder why this patch has not been applied to the kbuild tree?
>=20
> I will apply that today to the linux-next merge, but it is presumably
> delaying the kbuild tree being merged by Linus ...

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build test

--=20
Cheers,
Stephen Rothwell

--Sig_/H4vWhR81k8nF.kqryRuW0LH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiRe50ACgkQAVBC80lX
0GxOZQgAmLngJ1RJVeaI0y/a7GVzp2pGP1Qtq4tRUrPgM0lpKHWEZD1miqwQek+8
Cu4rOT6v8qwDbgheeFUAFUrdlaehVbryWa569ax/eBI/vKWJsm+QcMRL4+ScROLQ
O/nuF8Fg0bDRmyI9+wAE/pDx+fgTrRLCPRlX7/6Q0+6TDCkmjamy+vhL8MKZRlPD
Ozx02K5kY4y0ax0rLN4ilg1UuoTUBmJepsLF/9d7dbDDf0d0+DSFNrvqN0qwRfNG
YcA9BanQyr5t5WqeRzqhyBy/xVJioWIq7XyNcLBkF4Huxv2a0W/IYJCWgkI951VB
MZAmdWXXwsPRgs+CW/Xirtl4B7M7mA==
=8tIB
-----END PGP SIGNATURE-----

--Sig_/H4vWhR81k8nF.kqryRuW0LH--

