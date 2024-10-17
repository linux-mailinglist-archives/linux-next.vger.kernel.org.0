Return-Path: <linux-next+bounces-4314-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A493F9A188C
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 04:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FD291F2707D
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 02:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227FB1EA6F;
	Thu, 17 Oct 2024 02:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AnKPGcpd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB5726AF3;
	Thu, 17 Oct 2024 02:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729131746; cv=none; b=lr7ptkfNPj/jn0vcai5KfyqdjzSz5u0PyZQucd1eSpTmYpopplmNatVRkf8ibBA37JVT45WgCrnm/GXw4r4Cz0inL3GTbEmOOyjIrMuJ/I+i96zBfBOHBV/WvvXTazM/1yMzcgouBSBZzTy6B6Vcc4cuMlHAArUz46pDtZ/t7Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729131746; c=relaxed/simple;
	bh=qK9I66EIkkJ6TTRCHctUTehfA1edxYFDCd/ryZfBszg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AfHMRqeu6AkI3FS/7u6q/EzACLNG3Lx/mYUnlsG/4wqL2ibtUUdK5o9WSQ5h9vveibQdc8TTfltGR3oRHGCq6prsuHCKBwgfQC0d+gxXfpztT9pPWz3iDK3bT9SexnDQnrh0cqNJsa9x26H2B7psl22eDMqusXMYSbDyEaxcMnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AnKPGcpd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729131739;
	bh=3+uvP5+fF810lXEIvkXAFM7eJXacaUxQEWeOjxRpnzo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AnKPGcpd16z214nVd+c2r8jxDCaNg/lmByC7kXuQ1sp8w9EEB+3Hr7D7ejFO9dvsB
	 T1PhOHCL0GuHVB5pNgqX4//LRCmpPLFjCYve0Y3jUeoD9V9sZG0BjU4js2UUhtOZTj
	 7MOFVg/eDNEJzf5GvhrUAp6v6KvsHJYAFaGdxqsSu2wY0xovRYyHi6yGtRFRH7t8g+
	 zU9aXNqiB0iGt0WNId7mNj1vUaFrJlRkWSq08p8WY9adNJvkH/Vvzp7BE8Gv1gHyjm
	 TfbYVSTZBjZWeNhALHZk40VefGmSMGvT3ZJq0LuRxgvjwfjpIT7vKUHtGUrUA7arFA
	 QjYveWxIWXxVg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XTWnQ0LhXz4wcs;
	Thu, 17 Oct 2024 13:22:18 +1100 (AEDT)
Date: Thu, 17 Oct 2024 13:22:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the sched-ext tree with the tip
 tree
Message-ID: <20241017132218.71347a64@canb.auug.org.au>
In-Reply-To: <20241015134904.0f897940@canb.auug.org.au>
References: <20241015134904.0f897940@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K6OZpg8pXvSPU/DNqyv=uC0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K6OZpg8pXvSPU/DNqyv=uC0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Oct 2024 13:49:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the sched-ext tree got a conflict in:
>=20
>   kernel/sched/ext.c
>=20
> between commit:
>=20
>   98442f0ccd82 ("sched: Fix delayed_dequeue vs switched_from_fair()")
>=20
> from the tip tree and commit:
>=20
>   3fdb9ebcec10 ("sched_ext: Start schedulers with consistent p->scx.slice=
 values")
>=20
> from the sched-ext tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc kernel/sched/ext.c
> index 5c8453f6a5b5,281652d5df8b..000000000000
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@@ -4475,8 -4560,7 +4560,7 @@@ static void scx_ops_disable_workfn(stru
>  =20
>   		sched_deq_and_put_task(p, DEQUEUE_SAVE | DEQUEUE_MOVE, &ctx);
>  =20
> - 		p->scx.slice =3D min_t(u64, p->scx.slice, SCX_SLICE_DFL);
>  -		__setscheduler_prio(p, p->prio);
>  +		p->sched_class =3D __setscheduler_class(p, p->prio);
>   		check_class_changing(task_rq(p), p, old_class);
>  =20
>   		sched_enq_and_set_task(&ctx);
> @@@ -5192,7 -5270,8 +5270,8 @@@ static int scx_ops_enable(struct sched_
>  =20
>   		sched_deq_and_put_task(p, DEQUEUE_SAVE | DEQUEUE_MOVE, &ctx);
>  =20
> + 		p->scx.slice =3D SCX_SLICE_DFL;
>  -		__setscheduler_prio(p, p->prio);
>  +		p->sched_class =3D __setscheduler_class(p, p->prio);
>   		check_class_changing(task_rq(p), p, old_class);
>  =20
>   		sched_enq_and_set_task(&ctx);

This is now a conflict between the tip tree and Linus' tree.  Also
between the bcachefs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/K6OZpg8pXvSPU/DNqyv=uC0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcQdNoACgkQAVBC80lX
0GwPwAf/Szd5ExYcyYoDdCDLRVYvVMjyS9bNSSQdefVZERPp4F0u8SKDptBDvQXL
Z6VQxp3Lpu6lie8qokl5UdoSkEIPu0orodvV8zrKpXRFPKVKS5TPXCnrA+FAVoFw
uzYCzKFQg4YuyaLEbd1FhQgJmBDs98E8wTxsZSkuefKMn2exIye4a9RRx386uMGn
kzng3Jq81NEW9KhDv2deMMNStiqn7N+KEUGrVSNkGKHdzWuCEUUnkwiNFxyfFupC
Y29yhKZnws97f0Z+tQqLco4HPnQbku+1ewdLy09eWMTbyWmU0TsVBu0ygUuerTg+
JzVzIOJQd6BMcFB9PMNa8rDnUt7V7w==
=R2rz
-----END PGP SIGNATURE-----

--Sig_/K6OZpg8pXvSPU/DNqyv=uC0--

