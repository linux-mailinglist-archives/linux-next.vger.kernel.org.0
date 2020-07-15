Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5871220230
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 04:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgGOCO1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 22:14:27 -0400
Received: from ozlabs.org ([203.11.71.1]:43087 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726396AbgGOCO1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jul 2020 22:14:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B61D10Lnjz9sQt;
        Wed, 15 Jul 2020 12:14:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594779265;
        bh=x5qy5Ql+78M5FEN2qcySDNOA2DzrgzQoHNS5zgAWbuo=;
        h=Date:From:To:Cc:Subject:From;
        b=sl1cn0xrPaywVl+jIg2uNO2ghJ7ubo2VatvWtriHmP/DkDrg79WVVpgzVhebogKxM
         EiQX0y5ot921v9azxPrqubGeCqgiOoQXijzWWi4kPYehPLt3ArwFUKPekfrH/tDd9k
         JQ6dbv/fPLjjrz/DCCkYl5pTwesn5HLogbxSxqzGVQRUYmCrLiJbABQs14qW8wDd10
         fnQl/VPXvyCavwqZ/zEICp5j1Gqekwbmfrybzz0hX2nBxVt4V7GgPODG5gCk9HFfyS
         XsT+VwNBaUZjqz+j/GPRaxDKey1kTiICIDO1sFt82LYL3lgdMdYViljF3zJ6JcbN7t
         CqinfDR3vZO9w==
Date:   Wed, 15 Jul 2020 12:14:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20200715121423.6c20731b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zHMNky4_eNOtOABo7nmMj_B";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zHMNky4_eNOtOABo7nmMj_B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

block/blk-timeout.c: In function 'blk_round_jiffies':
block/blk-timeout.c:96:14: error: 'CONFIG_HZ_ROUGH_MASK' undeclared (first =
use in this function)
   96 |  return (j + CONFIG_HZ_ROUGH_MASK) + 1;
      |              ^~~~~~~~~~~~~~~~~~~~

Caused by commit

  91ba0f529364 ("block: relax jiffies rounding for timeouts")

CONFIG_HZ_ROUGH_MASK is not defined for this build even though
CONFIG_HZ_100 is set. The arm arch does not include kernel/Kconfig.hz.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/zHMNky4_eNOtOABo7nmMj_B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8OZn8ACgkQAVBC80lX
0GymkQf/Tu4diojhWkbXGAG8O3MpFmDlUFeQ6OOZk3gJ/9RMvNwjB6zEUF4i6ZzL
jqQt4IwLeYP20yigdE8lrF6/x30PrxlD7Q1WW1c+lKt1LJ4ZYNyX99uhHWXl2kC5
obTu66RplNgUr4/XIwRnXqTqyXvAO2qHXG3eYAXFwwBwgasY9wDwZ1zCzwLVyBw9
1rMwJIybRNXWwyZVhqNDHJQSk6F7EwaMhghGxdRtqjemPK1xtrykAzJYrXT9Fpy+
fOMZY0cQxS6jC+WXRqzgEx/C3XpJE/i0jDJhfjMhm0GZ130bXfHRImBZrWgXHdJk
G6WwVoKrXqRxql7u7H80tuPT+lz8Gg==
=jY+6
-----END PGP SIGNATURE-----

--Sig_/zHMNky4_eNOtOABo7nmMj_B--
