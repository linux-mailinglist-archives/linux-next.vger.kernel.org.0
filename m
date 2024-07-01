Return-Path: <linux-next+bounces-2733-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A6091D599
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 03:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4F981C20A88
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDF2848E;
	Mon,  1 Jul 2024 01:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r2T1h3Ex"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88B847B;
	Mon,  1 Jul 2024 01:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719795723; cv=none; b=QDR1z0WiVoKn3p2Wi4tbSbera4tUBt1tPb2uDM9z9FcnMxIcWTd3IuDTvOF1KGpr94QrzwT2nKMxZcVS8nZXRy/zfOyfgEIwVRF3+XPO+JdyqqSqMGtZGnIgEjcuv6h+NXwx64WXJf587wKOr1n1ZOA7APZcIlgvvGX4DBNXOcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719795723; c=relaxed/simple;
	bh=xf6c8fGXpfBatazEilvd0KFIn3ONZFBvIfq2B05C48g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=as2V5fB37UeXSjjVJA86S79rZt8/4D2BUUTir9NW8tzUDH/PltXwczzrfDstwqwbAKi52oDKzJZA7nuKDj3ybSKtnBsEP8Zdtvsas+1JNNG/bx/oTA0V9rT48Qu6jj3c5dEo0ggfp2g7EduzTKe6OlefT/wv0JX/cisSglx9IAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=r2T1h3Ex; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719795720;
	bh=CAuAcqS+lkUWa/7ILC0BW4+iqtqGg9F3vnxXm+SZzXM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r2T1h3Ex7VDf4trm9ObjDwXXf651mCtKWzXT0pQybliE9KfVWejO7bCNwMay7kKWB
	 35GwNMHF0+EMmoWcsyT472TMqxJwBwtCBfmvJ+0qXYMNfZ+giImy9wYoHZYAMUckNw
	 AtyOAGjae901Gke06iyx1efc5Xu/Q0pSzaQAbIZU63gAmtuREgaNGpChimhsqA4yKB
	 HRfwDYdQniWuZfP20KSemlyuGP4TTuvvc+a4fuoCMKN8yQNY1VRYAKLzWwdQIDN9f8
	 72oO0pGugPVCPj6ML6t7Fl4sd8ZSY8Unogzk9xZYCJXFWmdo/je63POGoB7r2AZubG
	 /y2pyN4Obm27Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC76c046lz4wbp;
	Mon,  1 Jul 2024 11:01:59 +1000 (AEST)
Date: Mon, 1 Jul 2024 11:01:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yang Shi <yang@os.amperecomputing.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <20240701110159.216a8d1f@canb.auug.org.au>
In-Reply-To: <20240701101641.4fea0ac2@canb.auug.org.au>
References: <20240701101641.4fea0ac2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X0gLt73.20zC2b2QN/=UpdC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/X0gLt73.20zC2b2QN/=UpdC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 1 Jul 2024 10:16:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the mm-hotfixes tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> mm/gup.c: In function 'gup_hugepte':
> mm/gup.c:474:25: error: implicit declaration of function 'try_grab_folio_=
fast'; did you mean 'try_grab_folio'? [-Werror=3Dimplicit-function-declarat=
ion]
>   474 |                 folio =3D try_grab_folio_fast(page, refs, flags);
>       |                         ^~~~~~~~~~~~~~~~~~~
>       |                         try_grab_folio
> mm/gup.c:474:23: warning: assignment to 'struct folio *' from 'int' makes=
 pointer from integer without a cast [-Wint-conversion]
>   474 |                 folio =3D try_grab_folio_fast(page, refs, flags);
>       |                       ^
> mm/gup.c: At top level:
> mm/gup.c:2747:22: error: conflicting types for 'try_grab_folio_fast'; hav=
e 'struct folio *(struct page *, int,  unsigned int)'
>  2747 | static struct folio *try_grab_folio_fast(struct page *page, int r=
efs,
>       |                      ^~~~~~~~~~~~~~~~~~~
> mm/gup.c:474:25: note: previous implicit declaration of 'try_grab_folio_f=
ast' with type 'int()'
>   474 |                 folio =3D try_grab_folio_fast(page, refs, flags);
>       |                         ^~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
>=20
> Caused by commit
>=20
>   5f408bfe0d13 ("mm: gup: stop abusing try_grab_folio")
>=20
> I have reverted that commit for today.

And I also had to revert commit

  52cca85b0ebf ("mm-gup-introduce-memfd_pin_folios-for-pinning-memfd-folios=
-fix")

from the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/X0gLt73.20zC2b2QN/=UpdC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCAAcACgkQAVBC80lX
0GxcWwgAldXuJUqIlFpf5b+rbBaxD39WrHO0mMg9M2pXEhPa/zzL+PdU1V1bbWHl
TcPJaHYPsudkfJklXW8eahX/yl9vhf6A3oEZKPl5xyo0bYdVdLkKl/fjYWvJ6HR4
zrFYPajKQjx18T9H2Vh7mX3s8E5ts5M86nicLb6/gy8vwoFDOjS+KlHkTkWwREBZ
zgXG3aYdeK9mvQZWqL+xkm/A2AV2Nsz9jT+d9R5j78hZRVH/rWgnpMCv8IQCkJDi
apySZP9kUoj3F5u2jv93GFTxxAAC2ofieuu3DBBxDipFJk+bmfYF3uZ1/h+Msv9X
qpHxahUtm6osSGfHIACiXp6lk1psiQ==
=4UPw
-----END PGP SIGNATURE-----

--Sig_/X0gLt73.20zC2b2QN/=UpdC--

