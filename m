Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685913F3D3C
	for <lists+linux-next@lfdr.de>; Sun, 22 Aug 2021 05:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbhHVDZS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 21 Aug 2021 23:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232183AbhHVDZS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 21 Aug 2021 23:25:18 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C0DC061575;
        Sat, 21 Aug 2021 20:24:37 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gsghx6mjgz9sSs;
        Sun, 22 Aug 2021 13:24:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629602674;
        bh=uqwGJlbJhsw7jrDys5ETsOpwRgCB9jcd4AWGPgIaf4g=;
        h=Date:From:To:Cc:Subject:From;
        b=F1FYoLvyqY1wRzb7zVPEJd8LonwZ8slCSkJuDzqnR9zRXiQW2/ZMF1pD8v833/IBd
         +ndnvQRAFGsPC8pTuHSoWBlBeF1DUemBf1DZGR5MECuY3oOBCjEYVEAoQKovFJE6ny
         j4kbUZM5vOz1ykRPECyBvEnkjuBNdDFw/nESQmsWCOz85aK+U48bhpb4vHOPi4+sWM
         dQHnn2flAADgD51z8FpOu9CUdKXeZalPurzYuEjqMn/NOIrVMf99ZMmlDQZbbydM5P
         21wuCpnRrUg9Ex0MUGcGbhas/o63kqV7696NGpqWXY/YpgDvymIRVMTv8iAUtsU5ky
         btYZn8FUQye+A==
Date:   Sun, 22 Aug 2021 13:24:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20210822132433.4e952ee4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ja.vceWgyMiYhZQ7p/=jjUY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ja.vceWgyMiYhZQ7p/=jjUY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  071e5f53b789 ("block: always initialize bio->bi_pool")

Fixes tag

  Fixes: Fixes: a4aa1b0494ea ("bio: optimize initialization of a bio")

has these problem(s):

  - Extra "Fixes:" word

--=20
Cheers,
Stephen Rothwell

--Sig_/ja.vceWgyMiYhZQ7p/=jjUY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEhw3EACgkQAVBC80lX
0GyPywf+MR4xGHXGt7rhiGOaap7lnPCZAFJKPbJUiILq2ZjsO+wtiOT4yvcjSMIL
uwlrazhjXq2idcCMkUzvoifhVQnfl54AODWlGx5WqY7ot36YHE1vA9hHRq+WxI/q
SyzGzf18r+A24VZS0bC4cYnH6jhw7zz8MKlLsyPCrzzHyWwjYj+6poXnhRwPkx2V
1HEH/Mh+VCoe1vilA36a0IT70UsDoQ3vuUVT5v8qr6dE91HfhNteyC3uqnmPKTsv
rvqZ0JQlwOCV9/hz2hJpkLqa4UvdCUbtHhj1FhRGszBflYEwmpe/M+MU40mOgAxb
32PYVlnlIxMd5jJkGnk2CRZZrGe6fA==
=ukDX
-----END PGP SIGNATURE-----

--Sig_/ja.vceWgyMiYhZQ7p/=jjUY--
