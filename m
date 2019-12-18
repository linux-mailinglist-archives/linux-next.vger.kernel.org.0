Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCF4123C6F
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 02:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfLRBcK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 20:32:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:45823 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbfLRBcK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Dec 2019 20:32:10 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47cyD72b80z9sR4;
        Wed, 18 Dec 2019 12:32:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576632727;
        bh=X7zeR8tDH1dzwRzZD1XqaXw2O2I5zVhAdgRg08YwIe0=;
        h=Date:From:To:Cc:Subject:From;
        b=KUs203s6MhshnFSZieElEyOrsqcmCKo2YNtxgtW8iQ3Vx/eYtPZqnybPlZ5c90tag
         rYvBCaBTb8A5ulvL22LcENJ8B2GolzJKwow/X+ATODqzBWXsInJL40os5pYPiBpxDX
         dy4OCFOyBLNnkIiNetFSlE1izvQWzsdBTlMr2JZcfkSie40SPUeqZ+g0aujwpl8ZZJ
         mrmCFz0MgPkZDRdzcZr4NJ1vMxtm/68rlDG8McjgnvXX/ePpvKHopC+btj/rqPRPXo
         dIt82G4fbap/UhEZBbhXDLUDx+5PnT+DpQH0DKSVaiePoXWWgNoDNhKx+i3BSzeoJa
         7sJELmI5xnl4g==
Date:   Wed, 18 Dec 2019 12:32:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>,
        Dan Williams <dan.j.williams@intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the generic-ioremap tree with the
 nvdimm-fixes tree
Message-ID: <20191218123205.3fb9c793@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xYBdxsUlJukQA6RU6UX2hxr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xYBdxsUlJukQA6RU6UX2hxr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the generic-ioremap tree got a conflict in:

  tools/testing/nvdimm/Kbuild

between commit:

  c14685547762 ("tools/testing/nvdimm: Fix mock support for ioremap")

from the nvdimm-fixes tree and commit:

  1188dd7d3fbd ("remove ioremap_nocache and devm_ioremap_nocache")

from the generic-ioremap tree.

I fixed it up (the latter is a superset of the former) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/xYBdxsUlJukQA6RU6UX2hxr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl35gZUACgkQAVBC80lX
0GyuFAgAje7evSUN9BTHsEob2etfDNNngoT/JRGv+dbN7gETIzTarPyOHkiBN7vc
lle78q817LaDp6X2hV4u6LG9VLYuEl2Pzxrf5847J9WsxJwAc32CDGpsc+dkRA0U
QLFP7yJvU5bNoyf7AOCtIejuB1GZZp+JDd5eHFndHwIX0+wjNNWltAW3CX7lYzrT
9zPFqwr1GZ9Y4BJndvohSyKvcOfBz7Z4rZxkvaAchMs8KPTnLzbkIF/LqN56Fp3C
lmYFA3+LZBBQjiq+aitlfzoqUQYFRln/iCx5dpTUh9E3PqN0jv9wyPJSGC+WKnfy
8cjEQWGWKaldYvT3D8EfdQTpHBHeNg==
=JMP1
-----END PGP SIGNATURE-----

--Sig_/xYBdxsUlJukQA6RU6UX2hxr--
