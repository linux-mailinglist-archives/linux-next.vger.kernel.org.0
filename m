Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE563B5BCE
	for <lists+linux-next@lfdr.de>; Mon, 28 Jun 2021 11:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhF1J6w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 05:58:52 -0400
Received: from ozlabs.org ([203.11.71.1]:33141 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230256AbhF1J6v (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Jun 2021 05:58:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GD30S1CY7z9sT6;
        Mon, 28 Jun 2021 19:56:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624874185;
        bh=DZNIfQVrWlttYmCGu5ye7TC2D4EmqHr4nUgO5sXzjgk=;
        h=Date:From:To:Cc:Subject:From;
        b=EmkkJGQl34vveOjjKzzYJgX5nZD5E15svrS++il3/H0V3u+twTf7UeWqTkFMzBIH7
         RYYC7tfJPOGgl+9mt6iCNkk8zcqFB34jWu5frapNsgV21bMCfNp4LZFzbmsPxaGOnj
         3bYB7DHlVmttqQ7pvmP/+pxzbxXK2TlerGeNSHAi6wKg17GufrYXG3nrbObJCbyMzq
         BYumoyNVNTXyaJqNLAXVLuFgzfD5Ounld7DWtGigEvmKfJGxCPQKYTY5REO0AjD6uP
         apMU+pLL42KvX683JYxaZVs+oyXg3W41XifaAsuF9B/znMIqYQWujO63j6GiEqI0TP
         CXlqnJwmsNYmg==
Date:   Mon, 28 Jun 2021 19:56:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm tree with the powerpc tree
Message-ID: <20210628195621.05913135@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kXpS+cmPI/L.YfNVhvGYYgt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kXpS+cmPI/L.YfNVhvGYYgt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/powerpc/kernel/setup-common.c

between commit:

  56afad885228 ("powerpc: Remove klimit")

from the powerpc tree and commit:

  6e6e0df2a484 ("powerpc: convert to setup_initial_init_mm()")

from the akpm tree.

I fixed it up (I just used the latter since it had also decided to use
_end directly) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/kXpS+cmPI/L.YfNVhvGYYgt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDZnMUACgkQAVBC80lX
0GzotwgAjN0ousRTuOOhlqsVHvuzF8YYXVwitj4vN9tnoCKkARvV09Plv4Bk1+Lg
0ruFkGISlkHDSWTArOxNGLMabbQcQCSeS7hYke549ubyB+t+kQ5m+XQtcKYqeR8U
Wxz9J52BVczf8aqzjYzffFRn3Io9+JHsfT/J34HGuAgrcay1oyiE+Ohgv49L+qzC
bQ0BYpJnL5N0+luT9UJFxn+MhHJ5O9WfSwl/STeHuadhxE0RF04oCQWlLv1y0XFR
IEKr0XkBaku7AYTvwhQ7a0nyVW/z4vSrN0SrmdcKBaEMYypQ90YV/ARoHW41L4Y9
wEvsUYcoAmnqZd/gltnMZgfX2wmbeg==
=seFv
-----END PGP SIGNATURE-----

--Sig_/kXpS+cmPI/L.YfNVhvGYYgt--
