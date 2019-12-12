Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5A011C4F1
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 05:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727507AbfLLE0S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 23:26:18 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:37931 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727541AbfLLE0S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 23:26:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47YLMp2JKDz9s4Y;
        Thu, 12 Dec 2019 15:26:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576124774;
        bh=Eqai7+WQWBkKaqBz7HdJtgVKHhsjgX3gWrQDtFd14uU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=e7LFQ1VfcShH+XZ+HvM54md4KWtORBdcZ7ZwN8Wi42bZYbTZ4zGtTa9NXYPWF3clT
         h7XS60jIpFYNd5T3gY2f14M0C3f8cQxYURxdMNi1mbcvcE/s0vG5B9ncZb7yCfTS0v
         1AOmM7S1k1h5e5fGNGSzplAYgdnQ1VN1ApIbbapnaUVtCrknw9w8An3gVvBp101pEi
         xKyCjdCiYI86wG6D3M10iibP0XR43nRV2JppJzLQpTIkk6PxwZn1PGuHKWon6U1l8f
         2lMBWL+0fyQavmfuT/2OiVmu2lsWSTs7qiHDt/RfunWFuKWa3YubJpDPnJYBuVsX4T
         ufu1QTO4J3ntA==
Date:   Thu, 12 Dec 2019 15:26:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     David Howells <dhowells@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20191212152613.7ad30842@canb.auug.org.au>
In-Reply-To: <20191212040737.GR2889@paulmck-ThinkPad-P72>
References: <20191212134516.3b5f4a4e@canb.auug.org.au>
        <20191212040737.GR2889@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Re48kZjn=vaHox2Q=VY6NBy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Re48kZjn=vaHox2Q=VY6NBy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, 11 Dec 2019 20:07:37 -0800 "Paul E. McKenney" <paulmck@kernel.org> =
wrote:
>
> On Thu, Dec 12, 2019 at 01:45:16PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the rcu tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >=20
> > drivers/misc/watch_queue.c: In function 'watch_queue_set_filter':
> > drivers/misc/watch_queue.c:526:2: error: implicit declaration of functi=
on 'rcu_swap_protected' [-Werror=3Dimplicit-function-declaration]
> >   526 |  rcu_swap_protected(wqueue->filter, wfilter,
> >       |  ^~~~~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   af8c9224182e ("rcu: Remove rcu_swap_protected()")
> >=20
> > interacting with commit
> >=20
> >   fe78d401ca6b ("General notification queue with user mmap()'able ring =
buffer")
> >=20
> > from the keys tree.
> >=20
> > I have added the following merge fix patch for today:
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 12 Dec 2019 13:37:52 +1100
> > Subject: [PATCH] rcu: fix up for "Remove rcu_swap_protected()"
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au> =20
>=20
> Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

Thanks.

> I would be happy to take this if desired, but it would probably be better
> for this to be applied directly to the keys tree.  Either way, please let
> me know.

Well, you can't take this fix up without merging the keys tree ... and
the keys tree is currently in flux so it should be easy for it to be
applied there since rcu_replace_pointer() already exists in Linus'
tree, right?.

--=20
Cheers,
Stephen Rothwell

--Sig_/Re48kZjn=vaHox2Q=VY6NBy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3xwWUACgkQAVBC80lX
0GzCOgf7BbFJvolBAPWDOWrgwhfUfMapwwP5QE3aI7cYu0J2cWjEzbllDe5rgnfe
3XpBtxZvs6wHs+g3Hnu+VwNY8bX6JzZ3pDsS4f+3vpotS72ZdTnenXM4XLYncb60
h5AQ0Rzxr7xVxVBPpsdNx09W7zmquL/ZtC5s4+KEt/1d2+bavVByzVXZEZWuQcqY
79AeTsPjCDX7map9eEqmFK8dsrKQO2w4/i327LmmSQBmalImHwmPtAoFY19C2MNr
rAvmVLDwVZjMxaH2HumnhNEIs18QI7nEKHOaIABgOMxpwIJ6kyVqAhQ4Lp2PGlE9
W6g6mMOGDJiXADlh09bMi5gkIjbCCA==
=tcPR
-----END PGP SIGNATURE-----

--Sig_/Re48kZjn=vaHox2Q=VY6NBy--
