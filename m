Return-Path: <linux-next+bounces-240-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A7980629D
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 00:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A358B20DFB
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 23:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A78405CD;
	Tue,  5 Dec 2023 23:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m7caZPss"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506AAB5;
	Tue,  5 Dec 2023 15:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701817352;
	bh=SAZIxx8PjWSXY2K57gjC/c7SrQkY4BdKjxWUOgYR2FI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m7caZPss2xozCilvgnc5J5opdhynNGKXqNrb4gSa6qcA4uNSzTT7yVspiMo46t5bE
	 qLbKguI7yq9vYQrlkIdQLbjGi750ihjJ97+gySad53eCzRDptu1FZMpJqmxO3UelSi
	 WwvBAto0r+gt0q6sXJ1yY/AtsQX7aCD9zn1r0sTW+uGDzLjkqlSzSspvXHQypVi/+x
	 rNldfX81lvpq1YRE5nodLrml3cx+MIeaxtY9bKGphNDp9wViJqxS1qSOTJ9ivTt4l3
	 EVmhIpz6fe0IQWkqvL8ktt066YSV/xMkIQSIijgtwl5+jpgkY1IjdOiX2dTR2VT6gU
	 aj0m5+js2FuCw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SlGJl31hDz4wcK;
	Wed,  6 Dec 2023 10:02:31 +1100 (AEDT)
Date: Wed, 6 Dec 2023 10:02:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Moore <paul@paul-moore.com>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>, Casey Schaufler <casey@schaufler-ca.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the security tree with the
 perf-current tree
Message-ID: <20231206100230.7d29859d@canb.auug.org.au>
In-Reply-To: <20231123111005.432dfc56@canb.auug.org.au>
References: <20231123111005.432dfc56@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y1vQADSf+/RAWWk.iKLskuq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y1vQADSf+/RAWWk.iKLskuq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 23 Nov 2023 11:10:05 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the security tree got a conflict in:
>=20
>   tools/perf/arch/s390/entry/syscalls/syscall.tbl
>=20
> between commit:
>=20
>   d3968c974a24 ("tools/perf: Update tools's copy of s390 syscall table")
>=20
> from the perf-current tree and commit:
>=20
>   5f42375904b0 ("LSM: wireup Linux Security Module syscalls")
>=20
> from the security tree.
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
> diff --cc tools/perf/arch/s390/entry/syscalls/syscall.tbl
> index 86fec9b080f6,5a422443cb16..000000000000
> --- a/tools/perf/arch/s390/entry/syscalls/syscall.tbl
> +++ b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
> @@@ -455,7 -455,6 +455,10 @@@
>   450  common	set_mempolicy_home_node	sys_set_mempolicy_home_node	sys_set=
_mempolicy_home_node
>   451  common	cachestat		sys_cachestat			sys_cachestat
>   452  common	fchmodat2		sys_fchmodat2			sys_fchmodat2
>  -453  common	lsm_get_self_attr	sys_lsm_get_self_attr	sys_lsm_get_self_at=
tr
>  -454  common	lsm_set_self_attr	sys_lsm_set_self_attr	sys_lsm_set_self_at=
tr
>  -455  common	lsm_list_modules	sys_lsm_list_modules	sys_lsm_list_modules
>  +453  common	map_shadow_stack	sys_map_shadow_stack		sys_map_shadow_stack
>  +454  common	futex_wake		sys_futex_wake			sys_futex_wake
>  +455  common	futex_wait		sys_futex_wait			sys_futex_wait
>  +456  common	futex_requeue		sys_futex_requeue		sys_futex_requeue
> ++459  common	lsm_get_self_attr	sys_lsm_get_self_attr	sys_lsm_get_self_at=
tr
> ++460  common	lsm_set_self_attr	sys_lsm_set_self_attr	sys_lsm_set_self_at=
tr
> ++461  common	lsm_list_modules	sys_lsm_list_modules	sys_lsm_list_modules

This is now a conflict between the security tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/y1vQADSf+/RAWWk.iKLskuq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVvrAYACgkQAVBC80lX
0GzySwf9EBEfVAkDkcg9O0O1pd941Jefyxite3OjSVFaENBzYp49o/YpwViP37mu
xr4MOxB3BPI+bdplXI+ckZknfCsyysXJIzjSDrdtER1mN3cgFWS0owXCcSDsBgpU
mbQdWC9n6kPMl4WNGWqHE8QPMlA/TXJz0gwMvJ9R3/xSTF8+KDc0D+WX79T2p1lS
ak1fQElXzTE55f00vF0LKCoPUV9WLDqHrT5GS7nogojM+bYi6iFISNy1ank2TBdm
XxFtDqc/el2Nph8EWbI/0lCCHWQm2JaoutGbbaMZ+9f0WOYn5a0p75FYTX96jjTi
oBnnXdpz1WOF+82YosDNdhaALNsbZw==
=6+1Z
-----END PGP SIGNATURE-----

--Sig_/y1vQADSf+/RAWWk.iKLskuq--

