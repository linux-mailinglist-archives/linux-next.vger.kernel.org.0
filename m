Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2D1313280
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 13:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbhBHMim (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 07:38:42 -0500
Received: from ozlabs.org ([203.11.71.1]:36861 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232408AbhBHMiC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Feb 2021 07:38:02 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZ5Bj45Snz9sW3;
        Mon,  8 Feb 2021 23:37:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612787838;
        bh=fITRYfeMDlGF1ZpTsGk1421oowcp5NDKDFaWomsqXXw=;
        h=Date:From:To:Cc:Subject:From;
        b=EYLAtcKrd9v6isVw01WeyiQlS1gNgM04MoWKx6LZjJfhXMfex/VSnOZJ4vPzfZ12N
         N10dIclZk591w427APs28yUtIip1Sg9fYgran8P+G8PqKDkRklthIM7bI3xHAW3Iog
         Er4rBU2+dbn7qT9ZnUq+b7QIex5zIOK0+U+a8QKU54kziAJUv766+kBEKV7khb0iZZ
         uKJaP1rF3kKmoZAksCPAnxYxnA5t7F1p62u1MD4IBZPh1EVJ5OD1jckFrfYXfqLJTA
         3+8vQQdoFr43hjlh2C9pwZJbe+ma5xlNR+FBebFP8B0GTWuWdZFgLOs17UT97Z5QXL
         83ej3AGe9aOiw==
Date:   Mon, 8 Feb 2021 23:37:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210208233716.16d962ad@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UPZSWhGqCg0WZMm.d.qRH2X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UPZSWhGqCg0WZMm.d.qRH2X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (htmldocs)
produced this warning:

include/media/v4l2-async.h:178: warning: expecting prototype for v4l2_async=
_notifier_add_fwnode_subdev(). Prototype was for __v4l2_async_notifier_add_=
fwnode_subdev() instead
include/media/v4l2-async.h:207: warning: expecting prototype for v4l2_async=
_notifier_add_fwnode_remote_subdev(). Prototype was for __v4l2_async_notifi=
er_add_fwnode_remote_subdev() instead
include/media/v4l2-async.h:230: warning: expecting prototype for v4l2_async=
_notifier_add_i2c_subdev(). Prototype was for __v4l2_async_notifier_add_i2c=
_subdev() instead

Maybe introduced by commit

  c1cc23625062 ("media: v4l2-async: Discourage use of v4l2_async_notifier_a=
dd_subdev")

--=20
Cheers,
Stephen Rothwell

--Sig_/UPZSWhGqCg0WZMm.d.qRH2X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAhMHwACgkQAVBC80lX
0Gz3pgf/SKt7E4CLpmiH1YqJlNXDp0Jh/VCKcWvdMZOpalEf2esBq8qAc3gM72XW
TsLJMZtjuzB+or1q0QX1SWmT3X9OYbgooB8Z3YBt3SAexKuh72B24bWAtD8Us1qO
VYrBereccAcIk/eihVTpX66PbvllqUkoOLIeFRe7BPU4SvTINfD/NnrKO/HLZ6jN
a6sTsA0jKabULAdSabKAx5/TmTQOnjBw4kvK3fDVt7f6/A6HR1CKH6gK8k5QrgAm
+8blHhy08mE7kIQrdZrV6zvXc2v1qweB4oqk/QKwZg90jVs1OaAvjMlGfSNWF/OH
XP8ktklElcgtkr0ApIluapsulm/u9w==
=11j3
-----END PGP SIGNATURE-----

--Sig_/UPZSWhGqCg0WZMm.d.qRH2X--
