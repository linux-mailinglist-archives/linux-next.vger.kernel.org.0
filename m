Return-Path: <linux-next+bounces-4812-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A06EF9D318F
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 02:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F085CB228FF
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 01:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451B04683;
	Wed, 20 Nov 2024 01:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qA/mpMzr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05DA8C0B;
	Wed, 20 Nov 2024 01:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732064489; cv=none; b=qR1r3VW6k5Cfm4/BQCn0o3kIDBcCQg87h66r10zQhlXbAu4JiHoubxNq8oFjoLbrhXXIEV8y+yFuAWX3G6b/NrP9PqLPqoZiWiFVtfWPjh6VloTOxJPxHCdtqN1Y3yzozj3HQmTGzMhLiNXiYPLgZNgYXC2MVp7gjNVdDPztVfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732064489; c=relaxed/simple;
	bh=86rI4yHT+Xy5fAhAPkf3DGh2bhr73xWCJJTW9SENqPs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZCvvAgqc6Yomo23tmS4kwPOEHeRvviix5pus/xeFDKBlRPsdC8ziZnQyNVY8RWfBCCemIUkf8+HX+a1gzFtpOrK4ZUnILtnHll56xakZzFSgyt4Jm7Am32vBe8iJ21oS96gLAryfChYGYEEn5bE1uCwBhfFfStlhmVHm5dIAXqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qA/mpMzr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732064482;
	bh=LtYbFcmqnXDyLX/FTHTFkv4+vEgQhjek1e3tNg+0Huw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qA/mpMzrooQAOpMyn69FgFyc3LYyvBQjc2Xyf1BqtjCX5zgRC/5r8oG0vcY1SxpW/
	 aKe/deLi0Yb186BgafhDZPAl3Jb7U9tP2AQ0252M9E+Bgx00YcUxEJZBt/DseFFXPF
	 rPlRtkd6YubFdyjZ53ljTY8A3uwHxqigG3SKLIiZ8nbpQn5I/yDbx8jjCePfeBnPGD
	 lS6nNVic5HOyDIdhkyur0q6PCEj4LqvrbdyF5dutj9Z3kDkKVvRbDusP3hUiV3zrCY
	 +QUMu/CNagOo5ZblejENnGP+QoHejngmnQEMAVMm51RDiaFHllzZdiZUbqMMG1vHzv
	 4h1UCWKtxVQOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtNNL1DdTz4xgh;
	Wed, 20 Nov 2024 12:01:22 +1100 (AEDT)
Date: Wed, 20 Nov 2024 12:01:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm tree
Message-ID: <20241120120124.03f09ac5@canb.auug.org.au>
In-Reply-To: <20241028111058.4419a9ed@canb.auug.org.au>
References: <20241028111058.4419a9ed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mNYoeTMFayWJ+kutP=iB5i5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mNYoeTMFayWJ+kutP=iB5i5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 28 Oct 2024 11:10:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the arm64 tree got a conflict in:
>=20
>   include/linux/mm.h
>=20
> between commit:
>=20
>   e87ec503cf2e ("mm/codetag: uninline and move pgalloc_tag_copy and pgall=
oc_tag_split")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   91e102e79740 ("prctl: arch-agnostic prctl for shadow stack")
>=20
> from the arm64 tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc include/linux/mm.h
> index 086ba524d3ba,8852c39c7695..000000000000
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@@ -4166,4 -4174,65 +4178,8 @@@ static inline int do_mseal(unsigned lon
>   }
>   #endif
>  =20
>  -#ifdef CONFIG_MEM_ALLOC_PROFILING
>  -static inline void pgalloc_tag_split(struct folio *folio, int old_order=
, int new_order)
>  -{
>  -	int i;
>  -	struct alloc_tag *tag;
>  -	unsigned int nr_pages =3D 1 << new_order;
>  -
>  -	if (!mem_alloc_profiling_enabled())
>  -		return;
>  -
>  -	tag =3D pgalloc_tag_get(&folio->page);
>  -	if (!tag)
>  -		return;
>  -
>  -	for (i =3D nr_pages; i < (1 << old_order); i +=3D nr_pages) {
>  -		union codetag_ref *ref =3D get_page_tag_ref(folio_page(folio, i));
>  -
>  -		if (ref) {
>  -			/* Set new reference to point to the original tag */
>  -			alloc_tag_ref_set(ref, tag);
>  -			put_page_tag_ref(ref);
>  -		}
>  -	}
>  -}
>  -
>  -static inline void pgalloc_tag_copy(struct folio *new, struct folio *ol=
d)
>  -{
>  -	struct alloc_tag *tag;
>  -	union codetag_ref *ref;
>  -
>  -	tag =3D pgalloc_tag_get(&old->page);
>  -	if (!tag)
>  -		return;
>  -
>  -	ref =3D get_page_tag_ref(&new->page);
>  -	if (!ref)
>  -		return;
>  -
>  -	/* Clear the old ref to the original allocation tag. */
>  -	clear_page_tag_ref(&old->page);
>  -	/* Decrement the counters of the tag on get_new_folio. */
>  -	alloc_tag_sub(ref, folio_nr_pages(new));
>  -
>  -	__alloc_tag_ref_set(ref, tag);
>  -
>  -	put_page_tag_ref(ref);
>  -}
>  -#else /* !CONFIG_MEM_ALLOC_PROFILING */
>  -static inline void pgalloc_tag_split(struct folio *folio, int old_order=
, int new_order)
>  -{
>  -}
>  -
>  -static inline void pgalloc_tag_copy(struct folio *new, struct folio *ol=
d)
>  -{
>  -}
>  -#endif /* CONFIG_MEM_ALLOC_PROFILING */
>  -
> + int arch_get_shadow_stack_status(struct task_struct *t, unsigned long _=
_user *status);
> + int arch_set_shadow_stack_status(struct task_struct *t, unsigned long s=
tatus);
> + int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long =
status);
> +=20
>   #endif /* _LINUX_MM_H */

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/mNYoeTMFayWJ+kutP=iB5i5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc9NOQACgkQAVBC80lX
0GwL/gf/fU+R0nMPjK94Rg55KqEAU3Sz2yfG2I4u8vJ46PkmHYycLmSpy8hzkQ+m
tiLD5fmhOGEHww92UZulAHKgxS/VcZD1jjY9QoeObCAsEgO/BLB6PQfQC0bL3XRr
ypvIKstMyLM0QQgwqf/mYoBNdD/W+4L9J1+Cf8jdvFui7X4aFVfXthIVXPGMuXEE
wAJVTgfyw8FU2Y6Xc7m0tNuw6/h/WnNPTf6M2Eke78SLN2l6oQDNHS+dFHbXiixk
cpr4Eg7Aoip45IgHb1E2Fn0nvEkR9lzd32kPqaOr86zdySezLZB0d5KWhVK1zP4C
f6yxI3Nkxdr9Pc/HxxFoB7LuhqlgvA==
=ztrn
-----END PGP SIGNATURE-----

--Sig_/mNYoeTMFayWJ+kutP=iB5i5--

