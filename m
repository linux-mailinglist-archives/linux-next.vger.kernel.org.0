Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1FE14023A
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2020 04:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387638AbgAQDJP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 22:09:15 -0500
Received: from ozlabs.org ([203.11.71.1]:39947 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727015AbgAQDJP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jan 2020 22:09:15 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47zQyG6xjwz9sR4;
        Fri, 17 Jan 2020 14:09:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579230551;
        bh=WnXChPUFc+zhN5LtWYszDaW6aqw+zrBegH2YMUiFSpY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AswfFvDaJb8CTRST7kEf/5l4i6LbiYumwnnvBXZFwNNQ24PNVg02B88D4Q4tKgfgv
         XNmwM5nuEF9bzyuU51ys3YUP3XI+xgPFUOkjGva1whUtjQs9KORvhoTSuTT6lOlxfe
         cVBIPVMiVykvkS5AdlUdVU1YdN8lHJjebI12/PA4yPr4b9I0NjD7dpyt7WhxCXtQtk
         zJ08/K27QKw6+nQaWu5GDmhYdiSOEqbyg43oLbdkRzDtTog8HPijBwZj4E91Sm5CEJ
         kRDN7szKzfkUNvHzWQIts5bSIpPYCTyhttsmCiSXfYQcFONAHssr8rh3q7XUojVhGk
         Tur0i0MqyYWyg==
Date:   Fri, 17 Jan 2020 14:09:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20200117140909.3406a796@canb.auug.org.au>
In-Reply-To: <20191212134516.3b5f4a4e@canb.auug.org.au>
References: <20191212134516.3b5f4a4e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q5rLF4yRE0_=lsFVVYMAi5T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/q5rLF4yRE0_=lsFVVYMAi5T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 12 Dec 2019 13:45:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> drivers/misc/watch_queue.c: In function 'watch_queue_set_filter':
> drivers/misc/watch_queue.c:526:2: error: implicit declaration of function=
 'rcu_swap_protected' [-Werror=3Dimplicit-function-declaration]
>   526 |  rcu_swap_protected(wqueue->filter, wfilter,
>       |  ^~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   af8c9224182e ("rcu: Remove rcu_swap_protected()")
>=20
> interacting with commit
>=20
>   fe78d401ca6b ("General notification queue with user mmap()'able ring bu=
ffer")
>=20
> from the keys tree.
>=20
> I have added the following merge fix patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 12 Dec 2019 13:37:52 +1100
> Subject: [PATCH] rcu: fix up for "Remove rcu_swap_protected()"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/misc/watch_queue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/misc/watch_queue.c b/drivers/misc/watch_queue.c
> index b3fc59b4ef6c..a4a77ec977ac 100644
> --- a/drivers/misc/watch_queue.c
> +++ b/drivers/misc/watch_queue.c
> @@ -523,8 +523,8 @@ static long watch_queue_set_filter(struct inode *inod=
e,
>  	kfree(tf);
>  set:
>  	inode_lock(inode);
> -	rcu_swap_protected(wqueue->filter, wfilter,
> -			   lockdep_is_held(&inode->i_rwsem));
> +	wfilter =3D rcu_replace_pointer(wqueue->filter, wfilter,
> +				      lockdep_is_held(&inode->i_rwsem));
>  	inode_unlock(inode);
>  	if (wfilter)
>  		kfree_rcu(wfilter, rcu);

This has bee replaced with this patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 12 Dec 2019 13:37:52 +1100
Subject: [PATCH] rcu: fix up for "Remove rcu_swap_protected()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/watch_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index d48f422f391a..f195cbbbb3d3 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -354,8 +354,8 @@ long watch_queue_set_filter(struct pipe_inode_info *pip=
e,
 	kfree(tf);
 set:
 	pipe_lock(pipe);
-	rcu_swap_protected(wqueue->filter, wfilter,
-			   lockdep_is_held(&pipe->mutex));
+	wfilter =3D rcu_replace_pointer(wqueue->filter, wfilter,
+				      lockdep_is_held(&pipe->mutex));
 	pipe_unlock(pipe);
 	if (wfilter)
 		kfree_rcu(wfilter, rcu);

--=20
Cheers,
Stephen Rothwell

--Sig_/q5rLF4yRE0_=lsFVVYMAi5T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4hJVUACgkQAVBC80lX
0Gz5uAf/dJrBBqbLcW2qt+m0CpZF+FIvQDPIJ2HrWBW4lPIsuzti/G3sicVE/qPA
p4exfR/9no3ACn/gcrp4b7oOfWe6rMG3c4fIxFspEKCrzrXGCN29upxtI0dLl8Ht
DbA+m769heFqcczXqd4e5QaJ9/mwf06+2+A/EjNHFxvpeUJsl3g5i1ERQIVryNF5
YymbBbK78EesZ8okKzNelf+7TrsDkO0z/E34axG/RV8i5K+AkB5sc5dCYPOru4sl
aqQZUZOM3Vjo2QKP+amTYTvBacEOvRPGnTfANYTyiBYH2jZmtoKbA+Xx17Bd7kSE
NpmaeVjg+J9RrBsXmnBDEdl6C+CtJA==
=rCTe
-----END PGP SIGNATURE-----

--Sig_/q5rLF4yRE0_=lsFVVYMAi5T--
