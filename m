Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FCF3E3F01
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 06:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbhHIE3e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 00:29:34 -0400
Received: from ozlabs.org ([203.11.71.1]:54619 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231788AbhHIE3e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Aug 2021 00:29:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GjjlX1C8Jz9sWl;
        Mon,  9 Aug 2021 14:29:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628483353;
        bh=GpY6Zpn0SSFgumfgOMSV7jxmKuyw+SXkuDGzfUxWPiQ=;
        h=Date:From:To:Cc:Subject:From;
        b=rMIV98B5besjXwdXARZHs89+uThHLwRTLEEC6cmFGyU6hOI0o3h5I+X5uXg9VjUyf
         wblK8QThLE2rMgALuvISHZGWpPXQLmZzLBODKQ/e9Leu486SM7qx8usT56WeWkBwu0
         uIeXpNIvQwzzQ0UcLiCZSPY41Z4iJanRwCDa1bMlbrIG0pP78I9WXoySMCZnheqtQ5
         fgpSuEunC1sRfhJ9tmeivGXYf1oN5NzNYYVUzOkRe6Gq3725WmbZ3HfRgnJEYjcy62
         ecmfVNVqU1WtH+x8zxvHStrriWf3N1loLsfDmTqU6A8ZuaYPDKk4K/+i987Xs1UK7l
         2mqzIkuqVxSzw==
Date:   Mon, 9 Aug 2021 14:29:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Hao Xu <haoxu@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20210809142909.1d5fab20@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KIEW3llqG=OJyd2dUqLGnUW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KIEW3llqG=OJyd2dUqLGnUW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  fs/io-wq.c

between commit:

  21698274da5b ("io-wq: fix lack of acct->nr_workers < acct->max_workers ju=
dgement")

from Linus' tree and commit:

  e16aa0c614c6 ("io-wq: remove GFP_ATOMIC allocation off schedule out path")

from the block tree.

I fixed it up (I just used the latter version, but more may be needed?) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/KIEW3llqG=OJyd2dUqLGnUW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEQrxUACgkQAVBC80lX
0GyVngf+JaunBYc+g+eedHe1Gl8MavVh6SlLSYUYi7K0Hc7OWQWiWVT629MpN0+z
wbONyHFF/ttbjgnf4rYhKt/OTJwCvGb9RkEECUv9nphPzSPtFseMZZSGYOF8dOXb
PMbUj1o/CPjKufamBWpi9WoIURk0FwU3+GJoch9bzUUAmKX9Ow4v7aVZOiQmbPgL
0N4WJLo7+h/8TLjfq1ULTcYSO/p+FfBGtWoN8AVNZDJIp/pMmTfa2zOlgSk75NRC
Bej+lE3lWJdtD3qcUoU5XFbn7fckBgf/keQjMqwP49l8z/rKBj0rnYiDPaHfhzo9
kQ9S9U05wRrBkhne5UUTytRRMaUsAA==
=Ynxb
-----END PGP SIGNATURE-----

--Sig_/KIEW3llqG=OJyd2dUqLGnUW--
