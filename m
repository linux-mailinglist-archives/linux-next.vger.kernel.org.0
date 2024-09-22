Return-Path: <linux-next+bounces-3937-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB097E412
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 00:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00E971C20F28
	for <lists+linux-next@lfdr.de>; Sun, 22 Sep 2024 22:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A1C273FC;
	Sun, 22 Sep 2024 22:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iroSkONY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A897E1;
	Sun, 22 Sep 2024 22:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727044429; cv=none; b=oE435jewXc/g+jLUSMOuypHyHkVS9bsApqIleps/wIQGf9si9Kh40rGCjIz0WLgDz3RPwpodPl8SDyqMLAra2j+Ng5V1kkYv117nqsH4uySZSNpaGZoPNmhgfU/IggnOP6hrg/kdi6tJPA6aJ+ycyWnqyoKBZBzewT2hw81fVS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727044429; c=relaxed/simple;
	bh=W2hGVH/6fnxEZq+LLWNfI4sIqA+vacvowMBZUudZpqg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQgK1Tb0IJZRw0L3SuzOZNgZGvKg/9lwgbKElILlijIVEFfEQgLj7s6Qhz32JPtb3/6vreWDxYZY4W754ABBNHf0V0A/QobZTJ+XvkmJUhVboctWjoYXzaerETlH6XaHYAlpxiVMfXDKylV3RgSOzr/gEVhxwpHBiiqGuHZ1G24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iroSkONY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727044416;
	bh=CW/Lnbngr6zHnhaSKXE2qJS74STqdwwRXmEaM/UjuSI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iroSkONY0sjkhnj/eE7HYgoqKtdicVQoEGP0Sjt17e0gWYNnjbnvXGdU6CBHX0Fmy
	 O86Ji1VGT3Mvjr3ZSRtG/SJYWPu2vzLiXSDcZ33G8kYZA5cP2OAnEmQiQj//OL5i3X
	 1ovybxbQpI6sO33L/tgukf8suIiIPO6Ztu7lIW4A7SEiYSNFk8sKq39RmVis2Lw+QG
	 DBA23IkIZ64nUG5VOn+ULbYaTNex4NSDfLHav/AIGrZimCASX2EugriAiBrfqsvEKN
	 EfHnKSaKyVCZFXzPeOKfzYxQaBwiHMIGubGiQo/9oOqGjOzVNaCO20YZag2F6ffLuK
	 nqhsaTS/AzPlg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XBgrb3zGhz4w2M;
	Mon, 23 Sep 2024 08:33:35 +1000 (AEST)
Date: Mon, 23 Sep 2024 08:33:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jan Kara <jack@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, Josef Bacik
 <josef@toxicpanda.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yafang Shao <laoar.shao@gmail.com>
Subject: Re: linux-next: manual merge of the ext3 tree with the mm-stable
 tree
Message-ID: <20240923083314.7b750219@canb.auug.org.au>
In-Reply-To: <20240906111900.5fcf345e@canb.auug.org.au>
References: <20240906111900.5fcf345e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HA=1Rqd_I+Vz0LP.o3+Kcbx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HA=1Rqd_I+Vz0LP.o3+Kcbx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 6 Sep 2024 11:19:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the fs-next tree got a conflict in:
>=20
>   mm/filemap.c
>=20
> between commit:
>=20
>   0a2d82946be6 ("mm: allow read-ahead with IOCB_NOWAIT set")
>=20
> from the mm-stable tree and commit:
>=20
>   d23805138ac0 ("fsnotify: generate pre-content permission event on page =
fault")
>=20
> from the ext3 tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc mm/filemap.c
> index 4fdd2e49f9dc,b722ce0ca6c5..000000000000
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@@ -46,7 -46,7 +46,8 @@@
>   #include <linux/pipe_fs_i.h>
>   #include <linux/splice.h>
>   #include <linux/rcupdate_wait.h>
>  +#include <linux/sched/mm.h>
> + #include <linux/fsnotify.h>
>   #include <asm/pgalloc.h>
>   #include <asm/tlbflush.h>
>   #include "internal.h"
> @@@ -3303,8 -3391,17 +3407,19 @@@ vm_fault_t filemap_fault(struct vm_faul
>   	if (unlikely(index >=3D max_idx))
>   		return VM_FAULT_SIGBUS;
>  =20
>  +	trace_mm_filemap_fault(mapping, index);
>  +
> + 	/*
> + 	 * If we have pre-content watchers then we need to generate events on
> + 	 * page fault so that we can populate any data before the fault.
> + 	 */
> + 	ret =3D __filemap_fsnotify_fault(vmf, &fpin);
> + 	if (unlikely(ret)) {
> + 		if (fpin)
> + 			fput(fpin);
> + 		return ret;
> + 	}
> +=20
>   	/*
>   	 * Do we have something in the page cache already?
>   	 */

This is now a conflict between the ext3 tree Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/HA=1Rqd_I+Vz0LP.o3+Kcbx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbwmyoACgkQAVBC80lX
0GzNbAgAnEhTClcgBVkFabSEi/lMy8gw8v2fNkLRuxRNIG7OUiXkSPfbjTRcG7PV
5ODgM6CtUM2Bi13CeZP9s7AeQclYJNT7ULDrioNGh7b68BPhjLP0V0Faaj/bOL6m
s5tfaw16EAaKnq6IFuC+iqrjwdVYVrqEcQgKLm1S1QtnXcYWt9PKifKZK5vWyMI/
Bxlz8ql2A87HEQ7YbD9uElcyd/Lsw0mToo1sMTOl2UF/0jMdrMjFqW3cD65xyvtv
h+EnrjbDksDoi4Hanu1xtVDhpE3NOeQZsnNOjbsPrCC6WuITXc2MxAjJxtoEXzkY
ajzV2gphJpW93Wn5VkTMc4O3ItrzFw==
=6Y2a
-----END PGP SIGNATURE-----

--Sig_/HA=1Rqd_I+Vz0LP.o3+Kcbx--

