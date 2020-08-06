Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6C723D534
	for <lists+linux-next@lfdr.de>; Thu,  6 Aug 2020 03:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgHFBvt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 21:51:49 -0400
Received: from ozlabs.org ([203.11.71.1]:34937 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgHFBvo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 5 Aug 2020 21:51:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMWgd3JmYz9sPC;
        Thu,  6 Aug 2020 11:51:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596678703;
        bh=hY6aF8lk0dgBIQGUdKWk8ajvOayIoxwiR/69jIOPWKQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hpKhnU9wl7Td7ZcXPihJnaH7qY1Yh4qzlgOyVBlSv4kW4pZwcwt8EqeJUzqxIrMbE
         7qY4eUPVqKMoohurt1NR/d4XyS2PXYVbcNFFzUSwYgOTbeqJar3oBSn7k/JoXIF9b8
         hcSgVJf0JzMvaz4JGqsMMATUre2GHJGN2D8V++BsRNIz9RYlqoVIm6dmioW4zm3Hx6
         8n606zeQlkWo0cJ9xJCkVWkJLX2wOPQLyl4bPmLMF4B/1AzHQJIFidh1+EKsmcViOz
         y++AS3/Ue1z1eGP6tm6jAcF47XMVagwKV+xFSXHE8KjqMxRjB0C6LSGQbwolt6Rg4S
         dqQY2pv3dvaDA==
Date:   Thu, 6 Aug 2020 11:51:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Jason Gunthorpe <jgg@mellanox.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Ben Skeggs <bskeggs@redhat.com>
Subject: Re: linux-next: manual merge of the hmm tree with the drm tree
Message-ID: <20200806115140.6aa46042@canb.auug.org.au>
In-Reply-To: <20200730192110.1466e63e@canb.auug.org.au>
References: <20200730192110.1466e63e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.=FcYe9T1r9uoFGqml0sKBG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.=FcYe9T1r9uoFGqml0sKBG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 30 Jul 2020 19:21:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the hmm tree got a conflict in:
>=20
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
>=20
> between commit:
>=20
>   7763d24f3ba0 ("drm/nouveau/vmm/gp100-: fix mapping 2MB sysmem pages")
>=20
> from the drm tree and commits:
>=20
>   4725c6b82a48 ("nouveau: fix mapping 2MB sysmem pages")
>   1a77decd0cae ("nouveau: fix storing invalid ptes")
>=20
> from the hmm tree.
>=20
> 7763d24f3ba0 and 4725c6b82a48 are exactly the same patch.
>=20
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.=FcYe9T1r9uoFGqml0sKBG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8rYiwACgkQAVBC80lX
0Gw7fAf+KnSav4Q90iErqeMElDcGjnp1gxUYGWuURo7kCjZP1pw2MQ/EgcbWntQF
aSSdUltwW6YFAgG/BqQwkyVXaO/mqDEPs+v3/MKcU8TGJ9gS9OWfHCE2AyACB1P7
R6iWtR8ZLu9Dfuis0grlwIiCVDjJRzmkUVliPuQ9LXBl9iccvKtGsl9OjgQEtpwn
QMR63J1pvjJmk7I/SZkUKXR7YYn//Jou1A7B/pFQZ9vryT8u/4En8BouJreW9reP
FCHH8C/N02/HN584YBXzoeG4FCwEVd4XWVtxfj326K8mE1yLOLY2AJRkNaidwx4d
vnEievjSwAUAuvAZUboFuZhyeiAV9A==
=89ZD
-----END PGP SIGNATURE-----

--Sig_/.=FcYe9T1r9uoFGqml0sKBG--
