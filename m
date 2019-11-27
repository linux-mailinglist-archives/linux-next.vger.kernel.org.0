Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B6710C0B1
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 00:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbfK0XjH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Nov 2019 18:39:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50031 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbfK0XjH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Nov 2019 18:39:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Ncft6Qqwz9sS3;
        Thu, 28 Nov 2019 10:39:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574897942;
        bh=w1LH2k7ptcCnsILry43RjKE7GrL+RUe5GvbJ+pVWI90=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YSSbTi4EBv6SnIAsOHKbWnAauiXvBEnhcXECQzBW7mvN0snKeIsNidprQXb4hnuIr
         7CP/gK2shdcjEojCvQeSOMs/CjoAOXmmLT01ne8hyIAs6dc2RXRX+ad53FmA6Uj21r
         yMLW/CzjGsl5AIrUjnwu4fWiIsMXLlnyhxjZLLLdo7tEA9i52LxR2wLWMw6dvXlekh
         SxKH4AW72rJkjJfENca4Q7OGsXGk/THSXmq2g5Fs/1l2fNXoWLN/P9/lsXbJKjv1n4
         e9pPHflYBUja1KWL+azipkL30xXCSbS0qyXKloGf3VM/12XUpSsUwjJqFg8D34m1UE
         DzyRR92B4UeCA==
Date:   Thu, 28 Nov 2019 10:39:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>, Qian Cai <cai@lca.pw>,
        Linus <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191128103902.658e2a14@canb.auug.org.au>
In-Reply-To: <20191106135340.3fa45898@canb.auug.org.au>
References: <20191010131448.482da2b2@canb.auug.org.au>
        <20191106135340.3fa45898@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SRXdzPhxahcd.RHlGpCCP=T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SRXdzPhxahcd.RHlGpCCP=T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 6 Nov 2019 13:53:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> On Thu, 10 Oct 2019 13:14:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > I added the following merge fix patch for today:
> >  =20
>=20
> This patch is now just:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 10 Oct 2019 13:08:43 +1100
> Subject: [PATCH] drm/i915: update for mutex_release API change
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/i915_active.c    | 2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i9=
15_active.c
> index aa37c07004b9..a47387174434 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -385,7 +385,7 @@ void i915_active_set_exclusive(struct i915_active *re=
f, struct dma_fence *f)
>  	mutex_acquire(&ref->mutex.dep_map, 0, 0, _THIS_IP_);
>  	if (!__i915_active_fence_set(&ref->excl, f))
>  		atomic_inc(&ref->count);
> -	mutex_release(&ref->mutex.dep_map, 0, _THIS_IP_);
> +	mutex_release(&ref->mutex.dep_map, _THIS_IP_);
>  }
> =20
>  bool i915_active_acquire_if_busy(struct i915_active *ref)
> --=20
> 2.23.0

This merge fix patch is now needed for the merge between the drm tree
and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/SRXdzPhxahcd.RHlGpCCP=T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3fCRYACgkQAVBC80lX
0Gybgwf+O6nFUE7lTsaL1+COw7BFmjwftB8S6FHMm61I6xICZcYb60/ByuZqIdjc
Koi3o90c7FiZ6HAUwMEiv+uoFtpf2X3SToTR64IGMNZ3YhYLuckt4Gd81dwuRu3y
1AJPxfvswRRihJCyVrtHtOiDaHSoX56WQ8u+0pj6JNz2SC5n6tc7vym4vQ1IicQ6
/HyUA9C9Cf412RreJBu8Iosn/ec2lySsVLplmwqEXKZAgbAZUjwL5FmJrcsWPOy7
+Y6uQqNtj9Vxgion2a+yzAFOavqL2HzeyOVgXBKkIVwIRhavmKwwml9TI2jSssXI
k3T0CiDT2B6BF2IJP6XqFyngeIEyyg==
=GNgk
-----END PGP SIGNATURE-----

--Sig_/SRXdzPhxahcd.RHlGpCCP=T--
