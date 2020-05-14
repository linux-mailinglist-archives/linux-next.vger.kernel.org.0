Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC9D1D253F
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 04:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgENC71 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 May 2020 22:59:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57739 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725895AbgENC71 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 May 2020 22:59:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Mx8X1xhWz9sPF;
        Thu, 14 May 2020 12:59:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589425165;
        bh=4WuPgc9fJhVsh+4GTvA9+YWK+vpgizwYqNRkMBN9ABo=;
        h=Date:From:To:Cc:Subject:From;
        b=rNyJ/WeEkw4Q+RFMyDMmuq5rB7LICPmjbSGHBNS1F6qE2nfWKIkDGwkV/USDWUP4B
         R5eCAwVHaLW3wX+UVDgTkn5dfjt7ZRnaq3/+qlEhkxo4Rsn5UMqixZIb0Mbvz/q7DM
         KX7Q52LjQCcp0etf5jrHFBY1sk5ZSHT12cUTPasBRLMNwTgmLq/uqGaUjp2iFBdruj
         bFtJQuSf8hmxrsNklt+mISVHWnqC4Z0yZ4dUDy50mWoybhhRskyncCmgJ+BUsBWHa0
         iGRSNpelqYa/9IhuVTpzAsk7VVaZlejRvMayrI9B5Ou5az1edPcfWf2+BqyybISMsq
         Bj//orsLQh4Ug==
Date:   Thu, 14 May 2020 12:59:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Leon Romanovsky <leon@kernel.org>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maor Gottlieb <maorg@mellanox.com>
Subject: linux-next: manual merge of the mlx5-next tree with the rdma tree
Message-ID: <20200514125920.2c9a6509@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PoQvFm=B8iNC3=_rH+dNRLn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PoQvFm=B8iNC3=_rH+dNRLn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mlx5-next tree got a conflict in:

  drivers/infiniband/hw/mlx5/main.c

between commit:

  2be08c308f10 ("RDMA/mlx5: Delete create QP flags obfuscation")

from the rdma tree and commit:

  14c129e30152 ("{IB/net}/mlx5: Simplify don't trap code")

from the mlx5-next tree.

I fixed it up (the latter change included the former) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/PoQvFm=B8iNC3=_rH+dNRLn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl68tAgACgkQAVBC80lX
0GxDOwf+MfOL7wQlzRohcYEqSIJva64w+WElB9HnDoPmMqXP6IpZj8ytk2T1A0ig
JqZiLRaZm9dNbQ5mQBsUCSBKphpkLDSoqso5VHGafmw6crajFUQ/nIi8hQelH0b5
nmBkZ7nc+A87coRFwNTKBeJNkLwFNcr/Uo09Cuinkft6QP0jD/BBXpXizYYcG0QK
LJMKabDZaZgvB4CcPR/w0ogTnJBoYVocHQ4h2KvUo18SxZSrh/Vertyylo5/xhMo
06+WjXv0BjfCC92MiRIbA8urc8yI13KaHjo3JYKSoMXENydm/RBBp5RrJosIopxL
yQkFopymDLisYItRPheTKs1PYFLGAA==
=QV/o
-----END PGP SIGNATURE-----

--Sig_/PoQvFm=B8iNC3=_rH+dNRLn--
