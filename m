Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC66B47CBF7
	for <lists+linux-next@lfdr.de>; Wed, 22 Dec 2021 04:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233648AbhLVDuW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Dec 2021 22:50:22 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:53013 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbhLVDuW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Dec 2021 22:50:22 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4JJfVJ2QHNz4xgw;
        Wed, 22 Dec 2021 14:50:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1640145020;
        bh=1gSJCMn7ct3ljzUhwcf96/8gcMJWyTknZl8h09ZvdP4=;
        h=Date:From:To:Cc:Subject:From;
        b=EaGWTISRYHyR2uf+SNDcH1WDlaPGFuczKLkIcUVRhrpgVpqD4q5PV9Pc+1ZihU3n8
         qZPWxzzdhACIWYRlGAgCtxRXspYpE8c/vnGj3N55rL3nbdarNZ0TPR1QBO0OUNDZgq
         I0TybrQ85E4BGbKRuhlsb8IS+ZjWPv/k1P4aiQZAr34Y60gnYJY7M5GV33KiGOI3m7
         /1uKBBgUr7mDUB1uhx5IvH+jMS+Ewxxfn2uDeHONq/b1wJkrqYiZsFldLkl58GID8N
         YiS9+jtWb0VhNH8M74O+5aMzQ5F8+g6Wis0eS0Fyu8FORXcnKxTgWjNrQ3YBYhT4KK
         1kyjxR39UFhig==
Date:   Wed, 22 Dec 2021 14:50:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <20211222145014.472328be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zF5D0Q+.65monPUqeOmdZ0g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zF5D0Q+.65monPUqeOmdZ0g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/nouveau/nouveau_fence.c

between commit:

  67f74302f45d ("drm/nouveau: wait for the exclusive fence after the shared=
 ones v2")

from the drm-misc-fixes tree and commit:

  40298cb45071 ("drm/nouveau: use the new iterator in nouveau_fence_sync")

from the drm tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/zF5D0Q+.65monPUqeOmdZ0g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmHCoHYACgkQAVBC80lX
0GyfUAgAoAi63KqneHolxn64MFP9kfVXtRglSldvtMUcUyZnEzL4ub6cCj7PE8/e
5RwDIHzStvITG8DeQlM+eWCAjZbDd1CLCgEgQn9HH7G+5n5DBXUL2Ll4tgxbvQho
2dpOeESgguHA2a/VMZzDmRIsHWvu0SB03qrBsnC6btt83chvDtPUP9Q3LlZSM0rO
ZXAIM1Zwt3K+sr3DZWTvXmbbIYIji4vf68dR0kYhETZw97SNWhPOSdWNb42J1Dz5
35frsST/B/MV9JEBC6ZhCauMPZgK0c+PUmUOEDiRv49Hb3fdcigWfHyZaboZpyp1
DHUwf8nd/zLDqd7stLso2zFqFpdx0w==
=xq+w
-----END PGP SIGNATURE-----

--Sig_/zF5D0Q+.65monPUqeOmdZ0g--
