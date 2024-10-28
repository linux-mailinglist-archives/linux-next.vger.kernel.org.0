Return-Path: <linux-next+bounces-4502-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE3B9B3B42
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 21:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E02EF1C22148
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 20:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7044D1DFDB1;
	Mon, 28 Oct 2024 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="n3HmviBx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557001DF753;
	Mon, 28 Oct 2024 20:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730146847; cv=none; b=J+LtrrmapXQfmHQcx5IbT6sazStqqOMYsYY7dvWaKsTJGbS48h3nDU19G4pWVDYLVDskdgJXHPakq+kkKaex/KHOhr/Z7SK+dVwMUtP2+8eZvWO+pmj+R91rxbOsM+lRQ8hXGxolR3723wnaalHoQdXn91Xb36zoY2zTx59m28w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730146847; c=relaxed/simple;
	bh=JIAL/B9LSSO2253gj6bdT9YDEY5La0uoIG/9VNNFf7U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hE8Ujm1qoF5CAY1wxKfX9bkcbX7RWXI2PcMhQC18JBcEcyRf9tHmoQabD2XIGB8wC0xWu1yvXvjdxObTRROL62vCYEQu27/T1PsdNQLLs58goPon5yPKERji3C/zbH58kTTzHUTpRZnOPJyOaUToysaAv/cyZ7xgirM/zzqN8m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=n3HmviBx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730146839;
	bh=DmMA20Dp9bgnxIXZhoxHWH21U3W1ORRWukXGjmhfLc4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n3HmviBxJQQkK+O866NFCKN2UKENemltmh0h9GA0kMblDXB+jLIYWFT3W5u2sSirK
	 TM+9bWTJukLvTJ3i77zM06G2wBonvemnYwYKAz6TbbW4GXIzwTlnZfAnDPrt0BIw6m
	 y1jYn3Ch43hN3wf9bDu0CzwHW9LGGp2jlzCNFIKZ0Gq7bgBlcMDFWVBT3IpcrCRSl/
	 raN15fjdiGZI/BfReO8ZMbYbZL5U8sjLpgcz3GaONWWrH0rrUpjWmOfm4JZWmbMzqP
	 EVBvcNISjuWplDENmqp6kfN72PZafKCe0/ofYDWfa28t/jHFJUgLayfpMokvs+Qs82
	 NBh1wYDPx/oiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XclBb2H6mz4wcj;
	Tue, 29 Oct 2024 07:20:39 +1100 (AEDT)
Date: Tue, 29 Oct 2024 07:20:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>
Cc: Su Hua <suhua.tanke@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the memblock tree
Message-ID: <20241029072039.39d850dc@canb.auug.org.au>
In-Reply-To: <CALe3CaA9cc8fagJwA5ux6-U8mKTK=DEGU1Mb3LeCeKPrUGS5ig@mail.gmail.com>
References: <20241022173921.6fdbdd38@canb.auug.org.au>
	<ZxtAWopjlF9unBno@kernel.org>
	<CALe3CaAehCC6WOpCAGtMX3qsTqMc8jh3kn1Fz_m7_7_M6SMgfQ@mail.gmail.com>
	<CALe3CaDW9vWcrukmWP+tj-ToSUh8p6==goL+B3aiGvxBDg79Ww@mail.gmail.com>
	<ZxtZ5q5HH-gu0zeQ@kernel.org>
	<CALe3CaA9cc8fagJwA5ux6-U8mKTK=DEGU1Mb3LeCeKPrUGS5ig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rfjuhZyjcX6L0rF_oF7j93E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rfjuhZyjcX6L0rF_oF7j93E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, 26 Oct 2024 07:36:13 +0800 Su Hua <suhua.tanke@gmail.com> wrote:
>
> Mike Rapoport <rppt@kernel.org> =E4=BA=8E2024=E5=B9=B410=E6=9C=8825=E6=97=
=A5=E5=91=A8=E4=BA=94 16:46=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Oct 25, 2024 at 04:33:16PM +0800, Su Hua wrote: =20
> > > Su Hua <suhua.tanke@gmail.com> =E4=BA=8E2024=E5=B9=B410=E6=9C=8825=E6=
=97=A5=E5=91=A8=E4=BA=94 16:19=E5=86=99=E9=81=93=EF=BC=9A =20
> > > >
> > > > Appreciate everyone.
> > > >
> > > > Mike Rapoport <rppt@kernel.org> =E4=BA=8E2024=E5=B9=B410=E6=9C=8825=
=E6=97=A5=E5=91=A8=E4=BA=94 14:57=E5=86=99=E9=81=93=EF=BC=9A =20
> > > > >
> > > > > Hi Stephen,
> > > > >
> > > > > On Tue, Oct 22, 2024 at 05:39:21PM +1100, Stephen Rothwell wrote:=
 =20
> > > > > > Hi all,
> > > > > >
> > > > > > After merging the memblock tree, today's linux-next build
> > > > > > (powerpc_pseries_le_defconfig) failed my qemu boot test like th=
is:
> > > > > >
> > > > > > Kernel panic - not syncing: Attempted to kill the idle task!
> > > > > >
> > > > > > Caused by commit
> > > > > >
> > > > > >   ad48825232a9 ("memblock: uniformly initialize all reserved pa=
ges to MIGRATE_MOVABLE")
> > > > > >
> > > > > > I bisected the failure to this commit and have reverted it for =
today. =20
> > > > >
> > > > > Apparently set_pfnblock_flags_mask() is unhappy when called for
> > > > > uninitialized struct page. With the patch below
> > > > >
> > > > > qemu-system-ppc64el -M pseries -cpu power10 -smp 16 -m 32G -vga n=
one -nographic -kernel $KERNEL
> > > > >
> > > > > boots up to mounting root filesystem.
> > > > >
> > > > > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > > > > index 49dbd30e71ad..2395970314e7 100644
> > > > > --- a/mm/mm_init.c
> > > > > +++ b/mm/mm_init.c
> > > > > @@ -723,10 +723,10 @@ static void __meminit init_reserved_page(un=
signed long pfn, int nid)
> > > > >                         break;
> > > > >         }
> > > > >
> > > > > +       __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
> > > > > +
> > > > >         if (pageblock_aligned(pfn))
> > > > >                 set_pageblock_migratetype(pfn_to_page(pfn), MIGRA=
TE_MOVABLE);
> > > > > -
> > > > > -       __init_single_page(pfn_to_page(pfn), pfn, zid, nid); =20
> > > >
> > > > Indeed, when #ifdef NODE_NOT_IN_PAGE_FLAGS is defined, there is no
> > > > problem, and this is why my
> > > > test environment did not reveal any issues. However, when
> > > > NODE_NOT_IN_PAGE_FLAGS is not defined,
> > > > page_to_nid needs to use page->flags to get the node ID, which depe=
nds
> > > > on __init_single_page for initialization. =20
> > >
> > > Hi Mike
> > > Could you please advise whether the fix for this issue should be
> > > submitted by you or me
> > > as a new patch, or should I submit a patch that adjusts the code
> > > position, just like this: =20
> >
> > I've folded the update into your original commit, it's now in for-next
> > branch of memblock tree =20
>=20
> Okay, thank you.
>=20
> > > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > > index 4ba5607aaf19..5a8114fb02ae 100644
> > > --- a/mm/mm_init.c
> > > +++ b/mm/mm_init.c
> > > @@ -723,6 +723,9 @@ static void __meminit init_reserved_page(unsigned
> > > long pfn, int nid)
> > >                         break;
> > >         }
> > >         __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
> > > +
> > > +       if (pageblock_aligned(pfn))
> > > +               set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_M=
OVABLE);
> > >  }
> > >  #else

This has returned, so I applied by hand the above discussed fix.

--=20
Cheers,
Stephen Rothwell

--Sig_/rfjuhZyjcX6L0rF_oF7j93E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcf8hcACgkQAVBC80lX
0GwuRwf9FEiyWziOdmHIyifnqukteOOGzcBvz4Oi3PyoOrkVGSIsfoMGGSfAzXiz
V+Kb6KSUYOdO/1fUDJ3iyRgdlQWJmXcWTTwsiCFVUsZn8225mt3s9McOb6xMhslU
VodkGnmP8uS0a+/0ZR/KcDXSKqmi1qv1//JCkv7q9X3u/LtJIq4uEkBKgBlpM28j
KesnohmGvcPaW0S6KlAKYHG/XTdwQcEXCY5AuLLKEvs5vYCKIH8vU/+VpQXXa5jv
NY1LFf/FfzHfR1i7IvKFD0YwpJD+LQTdewBKi6dvk7bBkWH1fo/17J/biKBJTvoE
UUlAz9tsxNrk49CpxVMRDxNH/4uR9g==
=1KDL
-----END PGP SIGNATURE-----

--Sig_/rfjuhZyjcX6L0rF_oF7j93E--

