Return-Path: <linux-next+bounces-3044-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EAC933488
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 01:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C62BF1C226FD
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 23:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60233144317;
	Tue, 16 Jul 2024 23:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fC4Ns9+u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DB214389F;
	Tue, 16 Jul 2024 23:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721172445; cv=none; b=HTuD30GkwG2S1ZcbaePmUDBlj9vRBdBinnRpZ7o/LkX3GsdvibgqsmsFrYsx6/Gb1ZxOvTNAn5Qhtkb7KRiiKM+eR3YOidRf5md+MRkQotdmf0lvAzIRBXlNuBO0Ebr0ih10F97EyOHYRu5ECQ5WItZllWx/n9mvIvRoylbt1FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721172445; c=relaxed/simple;
	bh=PzP2BwKqbwtLqzrDSMqw6g7N4Sox5X5/U8Z5I1XIPeM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u0MiH31dJLDwyhpwlStGB4QONdf3vzwNCgzI62AaaY3MHnh4SJ2yXwX6hIC4Jlx52OmFG7bRQ5D6zuuZmQEwLtx3yjcxCfvt3r2AakjfnverxuStwowCKzbKxpx+6QrWF3JgIily/xCzccBN0gzxm6DCqfEys95UBcrM/IcJOqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fC4Ns9+u; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721172432;
	bh=pvYQIHAlg1jMG36TFJqQN6xI1kxOhEaBgSTL/aRuTXA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fC4Ns9+umCUGXyutC/9IaykmY0NCka7Q18+JVxXA/lBJFR7sAP5zf3WUI2kykBlPv
	 q4Zh1qUserbQenvQ8KIxsq5ihK2EA5X5Wy3oqDp6qPrBNSw5Ns4+7LtiZLquz+STAK
	 8skrtSngZzUmwrS8BlH2OaBHBiTDkCXn58SOz8w2l82jZzgKoPhLwS4KB/2AmVUk6f
	 mj2xAUb9x5ayiV42+yQfKjEo+cW0dnyV2jCUN4MDeskI1/kd0yCXIXUBwRuywQ87lC
	 nbQh9dfsYiWux6ku0kKTT8uCv40ccowgcMjrC0uuedPpZf9FDaBS/5uAZhoDkoi7yP
	 ewCzoc2DRV8Ug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNwFn0b1Gz4wcl;
	Wed, 17 Jul 2024 09:27:08 +1000 (AEST)
Date: Wed, 17 Jul 2024 09:27:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, Yury Norov
 <yury.norov@gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20240717092708.0a40aca4@canb.auug.org.au>
In-Reply-To: <20240612112746.3130d68b@canb.auug.org.au>
References: <20240612112746.3130d68b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U8NksPP_0/Nsod4.FVN2DGj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U8NksPP_0/Nsod4.FVN2DGj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 12 Jun 2024 11:27:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   include/linux/cacheinfo.h
>=20
> between commit:
>=20
>   f6a9651bfd74 ("cpumask: make core headers including cpumask_types.h whe=
re possible")
>=20
> from the mm-nonmm-unstable branch of the mm tree and commit:
>=20
>   685cb1674060 ("cacheinfo: Add function to get cacheinfo for a given CPU=
 and cache level")
>=20
> from the tip tree.
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
> diff --cc include/linux/cacheinfo.h
> index 286db104e054,3dde175f4108..000000000000
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@@ -3,7 -3,8 +3,8 @@@
>   #define _LINUX_CACHEINFO_H
>  =20
>   #include <linux/bitops.h>
> + #include <linux/cpuhplock.h>
>  -#include <linux/cpumask.h>
>  +#include <linux/cpumask_types.h>
>   #include <linux/smp.h>
>  =20
>   struct device_node;

This is now a conflict between the mm-nonmm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/U8NksPP_0/Nsod4.FVN2DGj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaXAcwACgkQAVBC80lX
0GzciAgApgO9e/9WzCSTN3fg+5s303eseNP3IdGX21gdDlD2mM0PsFy80rS6fRnT
uiI/9qhzQxUA8zEps490j/+uz734kNKlDJHW2KrNS4qYbt79h+AZoV6dKfkGCV4h
l0guZQVFdwOm7soE2VDIa9aGVyLnaTSLXmOwi1r2AJuKrqz69CRMg9pETYNqfllW
U/AZVOe2ClyyxbIezIeiTP1jVN14ODMnlAsym95q2UVzcIJ7l9apUWy0L6PqFrFj
09Q5VBr1M09wTuMLCHTwbYX4J5uE1AdNafAAeNi1f05Wm7RrkNkpLPFlVrVuPKhU
VNqQO/esxjBQI+o0T+D19045o9W7eA==
=U/om
-----END PGP SIGNATURE-----

--Sig_/U8NksPP_0/Nsod4.FVN2DGj--

