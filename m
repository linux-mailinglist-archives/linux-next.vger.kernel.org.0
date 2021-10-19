Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040844340C0
	for <lists+linux-next@lfdr.de>; Tue, 19 Oct 2021 23:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhJSVse (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 17:48:34 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37663 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhJSVse (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 17:48:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HYnPR0GLyz4xbX;
        Wed, 20 Oct 2021 08:46:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634679979;
        bh=67NghoYSVDIDSbX2jq03TjedMzRU5urHVLkWAReFBQ0=;
        h=Date:From:To:Cc:Subject:From;
        b=Tvmsyk6Zek2QF8muTCmn4sVE785Oy38ZNnG3nCK1/vG4o2f6Ks+okprXBDA7lPYFO
         Sj2JWqyPwBEqGKudsGOlaNd9Cr4bDIG0fnhb7geeJFJGoyCqoJeEH2C1Bt4zVKJLue
         hiBLnTZULuOSSOP+SOhXGOqQQpwLku9oOV0yiLzVYmmQFx6adxPIlUO1UECTi9iQEH
         p7rcFn4ucoiKQa52az6Du+Zo6qqvbVmo6NN6M+drKgnIhSldnzXOHvsUvHS4hEgnYH
         N1KDneswmf1sbQMFq8lW/KarFEZc6E8Iy+yH++xF7zg+oKEdZIyLNzib3twa/aeKPq
         kcoYLNGG8IISg==
Date:   Wed, 20 Oct 2021 08:46:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Zheng Liang <zhengliang6@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20211020084617.453ba30d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+3h022_UR35vHX/2xu19_1r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+3h022_UR35vHX/2xu19_1r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2fc428f6b7ca ("block, bfq: fix UAF problem in bfqg_stats_init()")

Fixes tag

  Fixes: commit fd41e60331b ("bfq-iosched: stop using blkg->stat_bytes and =
->stat_ios")

has these problem(s):

  - leading word 'commit' unexpected
  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/+3h022_UR35vHX/2xu19_1r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFvPKkACgkQAVBC80lX
0Gx7CwgAmswCbVqw1YqX3bq2a6L9e+hLHpoAaNsWpXny+poqj1NW8+kSGdA6PxNd
YhLk/0oX4U9GN6k2wHA05HDc2N+z/pkwWZx0mnIzrH1Jh6gaRppJxLYNeyTGFfu3
mYE/pzXJ4opvgkR4Qd5ZYjfirK4kgVI2ELjNSw/kRg6Yil3K41cyrGfv9Rd8Gvue
luWzrWdgFLftQR0EoYw1vEOzASJUIgc8IudE3DXYk+R2tfGFpHhI6OLIwAKfy2d7
YNrdcfAPZPBqZ0CaiR5iK5oeR8kLdl0oqoClY/FNQ2kIW2chomOkVVCb8WEI0j0Z
zrj2B5glz0adRsnCXwti5wP1rKL1KA==
=l8v9
-----END PGP SIGNATURE-----

--Sig_/+3h022_UR35vHX/2xu19_1r--
