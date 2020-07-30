Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4EC6232F68
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 11:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgG3JVO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 05:21:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35637 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726819AbgG3JVO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jul 2020 05:21:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BHPzW4lDHz9sRW;
        Thu, 30 Jul 2020 19:21:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596100872;
        bh=HymJxLyhuj6x4wWusnqF1TWQRVPeZEbCZQaN4ytnQRE=;
        h=Date:From:To:Cc:Subject:From;
        b=tSakvzJ0vZFZqTMJnDEfJFB6Mj88ql+OdAd+T8L2CmNVSH7h8E/lhTY78dalcjNGG
         PfgMoTfxCqSLcc+3acpq7X5diQIJ5nJqJfzrI/2HcU0fGlYoBGecMS1f0fVNySrY9y
         LjQKuD1qWFLlyeVl6/IRNNE0DVGJn9Zt5z/2JqfIkVVdX+VguVGKoHfJ28WnH5/81N
         u+EshReNPkzq6d4p5Jo6reVYVEq5CAB5wIfhKzx0MaewDIqkEDM5Ad20h06B0tIg7o
         XdCeVdrMGfpbCQHfA1+LW1bwnWejSRLHfSEGXTViWjU2pajxKH8kwpug0C8BlM+4mJ
         FvRNHMV+cU2yw==
Date:   Thu, 30 Jul 2020 19:21:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Gunthorpe <jgg@mellanox.com>, Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Ben Skeggs <bskeggs@redhat.com>
Subject: linux-next: manual merge of the hmm tree with the drm tree
Message-ID: <20200730192110.1466e63e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=asMPzKFIyvS5tUFx9ohdsS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=asMPzKFIyvS5tUFx9ohdsS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the hmm tree got a conflict in:

  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c

between commit:

  7763d24f3ba0 ("drm/nouveau/vmm/gp100-: fix mapping 2MB sysmem pages")

from the drm tree and commits:

  4725c6b82a48 ("nouveau: fix mapping 2MB sysmem pages")
  1a77decd0cae ("nouveau: fix storing invalid ptes")

from the hmm tree.

7763d24f3ba0 and 4725c6b82a48 are exactly the same patch.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/=asMPzKFIyvS5tUFx9ohdsS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ikQYACgkQAVBC80lX
0GwLHAf/fhu5r/e8oR5ESD2bSd0s7oiMyg/40Hav5nfrbBLCAkfvqZnnFyKQplUp
wFmOMgXwnXgmomuQ2Ab3lQcyiZFlwFyskRKj7/PaUojnq2omoRf8cXXk0cu7M7uE
vhe6uszwc+KDaaCDzfu30FsYUno3U6iYV4G92Td57KQCvacIezUPCm6YA+7ThV4+
MTJJKMb8zygb8dXUEx+FHPRQciLTuyjmAz2h1hUHrYJpx2BHgafrCr0jRcHbfUA+
l83tTi31lnW70YdUw9vuKgcHGnLd6ZriuZrGzoPRBmD2OWWXEoe/uDbxvOS+KYoY
DyCKIaW0rBemCmTzMu5ryErWF+DX9g==
=4fl9
-----END PGP SIGNATURE-----

--Sig_/=asMPzKFIyvS5tUFx9ohdsS--
