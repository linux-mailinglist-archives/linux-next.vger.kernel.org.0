Return-Path: <linux-next+bounces-2808-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A71924BAE
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 00:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7164C1F21FE6
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 22:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82CC12EBF3;
	Tue,  2 Jul 2024 22:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BkXYo7wW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35A51DA30E;
	Tue,  2 Jul 2024 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719960287; cv=none; b=LlT8HYknIxwdlX/eM+vogxce0L6l0Dr6A2RpcorBu7uIcNpLkS9dQFNgDR9lkVL+YYlcEpKTPL1mN6JCd/3+F4IOnTHW54qd/i1+sABTaIDj6HFv0S992r1iCigeV2OgjFflibict1khZk4U6MFlQZTYIXLTuVWTBAUJIPIPVEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719960287; c=relaxed/simple;
	bh=r6dl5o6b+tpCl+zPTrFXIMBDaTcNaBsMEkhLGNzaf8E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IcfkIzISf26HyMzlD0bsb5ZMyEmbeFzPBevbsVOuCosSyljLI5dfMXUuVrsQA9JzTqQ/vReH+msKdRwRZFvNumKxwA/tbTMbgFf43s8wHlVbXUBNkXNJc/W+GUazpi9klypzXaNqDGM8BYTjK0hqjzSQlxxOxs6Q1dsssGCfWxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BkXYo7wW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719960281;
	bh=W501ohJfK4bcCT1I0QGDVSBzpvUJBPFl9dyX+zr+M/A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BkXYo7wWsOKTFymrWDtJM8pABd5Jz8yRZ4NM//AoGbKl3gAtx+uEwdtlCHgRRYiXO
	 L1Z22jPXESqu+9oHYxxjvdafBYsEB76wrtfdKxnI1JAII52wn1hmVAHkDlJ3VDolb7
	 yJOUvRa65CxtMkcn1rzZAMc7Zwc+Eem2MRgM93soD/ijeXRlSZCAunhA+jKQy+TE90
	 OAXHfNvTCTjP8l+FoAGhjL2qGUpY9UDjn2ZfI3oj7slYErzHUIJWfpbsO0KSXcrVoi
	 mzEkuDllaWXRSsWwIkHrSEFv4KDto6hsbWonRDMaJbMv2O7qhMN/uHmM04GH26HEe+
	 0zYrh3XWVuy0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDHzF3YKlz4wny;
	Wed,  3 Jul 2024 08:44:41 +1000 (AEST)
Date: Wed, 3 Jul 2024 08:44:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yang Shi <yang@os.amperecomputing.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <20240703084440.3af9f526@canb.auug.org.au>
In-Reply-To: <37b70d3f-c46c-4df4-b52a-3c6ba5feb692@os.amperecomputing.com>
References: <20240701101641.4fea0ac2@canb.auug.org.au>
	<20240701110159.216a8d1f@canb.auug.org.au>
	<37b70d3f-c46c-4df4-b52a-3c6ba5feb692@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s0wOsfB+nzVviVkr5Uf40y=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s0wOsfB+nzVviVkr5Uf40y=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, 1 Jul 2024 11:15:17 -0700 Yang Shi <yang@os.amperecomputing.com> wr=
ote:
>
> On 6/30/24 6:01 PM, Stephen Rothwell wrote:
> >
> > On Mon, 1 Jul 2024 10:16:41 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> >> After merging the mm-hotfixes tree, today's linux-next build (powerpc
> >> ppc64_defconfig) failed like this:
> >>
> >> mm/gup.c: In function 'gup_hugepte':
> >> mm/gup.c:474:25: error: implicit declaration of function 'try_grab_fol=
io_fast'; did you mean 'try_grab_folio'? [-Werror=3Dimplicit-function-decla=
ration]
> >>    474 |                 folio =3D try_grab_folio_fast(page, refs, fla=
gs);
> >>        |                         ^~~~~~~~~~~~~~~~~~~
> >>        |                         try_grab_folio
> >> mm/gup.c:474:23: warning: assignment to 'struct folio *' from 'int' ma=
kes pointer from integer without a cast [-Wint-conversion]
> >>    474 |                 folio =3D try_grab_folio_fast(page, refs, fla=
gs);
> >>        |                       ^
> >> mm/gup.c: At top level:
> >> mm/gup.c:2747:22: error: conflicting types for 'try_grab_folio_fast'; =
have 'struct folio *(struct page *, int,  unsigned int)'
> >>   2747 | static struct folio *try_grab_folio_fast(struct page *page, i=
nt refs,
> >>        |                      ^~~~~~~~~~~~~~~~~~~
> >> mm/gup.c:474:25: note: previous implicit declaration of 'try_grab_foli=
o_fast' with type 'int()'
> >>    474 |                 folio =3D try_grab_folio_fast(page, refs, fla=
gs);
> >>        |                         ^~~~~~~~~~~~~~~~~~~
> >> cc1: some warnings being treated as errors
> >>
> >> Caused by commit
> >>
> >>    5f408bfe0d13 ("mm: gup: stop abusing try_grab_folio")
> >>
> >> I have reverted that commit for today. =20
> > And I also had to revert commit
> >
> >    52cca85b0ebf ("mm-gup-introduce-memfd_pin_folios-for-pinning-memfd-f=
olios-fix")
> >
> > from the mm-unstable branch of the mm tree. =20
>=20
> The patch attached in this mail should fix the compile error.
>=20
> https://lore.kernel.org/linux-mm/CAHbLzkowMSso-4Nufc9hcMehQsK9PNz3OSu-+en=
iU-2Mm-xjhA@mail.gmail.com/

It looks like that patch has been applied to the mm tree instead of the
mm-hotfixes tree - as a fix for commit

  50ceb37037f3 ("mm: gup: stop abusing try_grab_folio")

--=20
Cheers,
Stephen Rothwell

--Sig_/s0wOsfB+nzVviVkr5Uf40y=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEgtgACgkQAVBC80lX
0Gyi6QgAjAjm9gJaIQHcXedjj2ZE8lBIT/Otubmgndt39SS+iIpbw258k0kHUEVI
hqUhWkjndCbTndn5gzcTuUO73+6VcnY8vIPynyyGOj0e6egDlv8j2X6DDzAlm2c9
X6FFGPqhDjzT0UJIVpsUL9r7BWHTo/pg4ZpZMURuiMEgYj8+NOdwDghB0RTBNzTI
MpEcmQlqOdJlRc4984l7a0foov3N6XqqTZDGh2oH6XpU1/FaMltUfQi8U6K7rdd5
3S5VCW1OpCVKztvqWS8BU2n1E2nc6uTiZRzDtsgRjuT5AHqeTtIGbIgq6kQjbx0P
LGS0HTt44pWYZ7A1GQ5pBmKpAZoRkA==
=1saV
-----END PGP SIGNATURE-----

--Sig_/s0wOsfB+nzVviVkr5Uf40y=--

