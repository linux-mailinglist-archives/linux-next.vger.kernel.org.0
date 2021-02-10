Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB15316372
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 11:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhBJKOo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 05:14:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhBJKMl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 05:12:41 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B305C061574;
        Wed, 10 Feb 2021 02:11:53 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DbFsy4nhDz9sCD;
        Wed, 10 Feb 2021 21:11:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612951911;
        bh=+0rlFVBPe1mgKL57jA7Vl8PRGyLhCeJnf5Wjm/q/nk0=;
        h=Date:From:To:Cc:Subject:From;
        b=h7UQRY9dAxSJeEcm1ACnphYOGgZiumDqS4VvyhgeshEAZBD6RrJ5d//sMGSfCR8QB
         w/QTRO450Bdbtzsav4MppZ3Euxu93Yr1Rs/0PsylLVei2NfKvmkK7HzUskwZHgqEGm
         Y/sNDQQ/GIjTLqhYcP1jVXGGnYNtchJOg67ICqVer+kvzK2zx9nWFlIYqOjbpqVSWV
         vbbRQffDqGIGt2EUgT4faeDnnzzlSPnyzuzQoy1V5182Ac0b/oMVmwJi0n+Rvbpqnf
         Pp6tT9UgABrlXghgQQMe0/86frMLTbYkuMFL8Dflybkv4HjhJDDEksUMLb/K0zo9+c
         T80CXmEgwGZZQ==
Date:   Wed, 10 Feb 2021 21:11:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leonro@nvidia.com>,
        Parav Pandit <parav@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the rdma tree
Message-ID: <20210210211149.3498db8a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T0YWGGVFmbF.8aAegWcf_cG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T0YWGGVFmbF.8aAegWcf_cG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rdma tree, today's linux-next build (htmldocs) produced
this warning:

drivers/infiniband/core/device.c:859: warning: Function parameter or member=
 'dev' not described in 'ib_port_immutable_read'
drivers/infiniband/core/device.c:859: warning: Function parameter or member=
 'port' not described in 'ib_port_immutable_read'

Introduced by commit

  7416790e2245 ("RDMA/core: Introduce and use API to read port immutable da=
ta")

--=20
Cheers,
Stephen Rothwell

--Sig_/T0YWGGVFmbF.8aAegWcf_cG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAjsWUACgkQAVBC80lX
0GzSTQf9FxK3QBsWXVFCkWBuZB2W4EegpedijkEN4DSALIK/L3392dsSLV8OHQVR
b/j/Lxs/4r9vvtDRGIzGmNuHl4un6jCOeRkqi4es7DYs/e8IM2dxRsbtI8WZo+Yc
HZnMM4OR50DxMQOsI58nLKaun4jdTVLzlV4eN+MTuzPiZ6GY5C1y2Hgi0KdBkFBA
XfaCtgu40nWMthQaWN4ZVj+u+T+NFTqjyNKKSc8lvd3IeZuH2jz8A0qnphw9a5y6
7V/QauDcViQD/qVZs0UjXcr4e5tO5R+6Masn7hJqOi517/KGziK2d308U1wdGECU
/X/YEyEa+3rby9+U8lVEN54CzsxbIg==
=4CBO
-----END PGP SIGNATURE-----

--Sig_/T0YWGGVFmbF.8aAegWcf_cG--
