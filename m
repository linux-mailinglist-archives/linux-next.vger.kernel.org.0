Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28632451AEB
	for <lists+linux-next@lfdr.de>; Tue, 16 Nov 2021 00:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348705AbhKOXp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Nov 2021 18:45:58 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:35903 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349289AbhKOXmY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Nov 2021 18:42:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HtQdT4BVvz4xft;
        Tue, 16 Nov 2021 10:39:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637019565;
        bh=ucoeyBX960HR7Tugy9/YQEyFDb9mM0IWRwUD2FjJRWs=;
        h=Date:From:To:Cc:Subject:From;
        b=Om+yy47uiJwtLcSBaK1zNrsy1vSyRifS6tIayDlUwp1vnhd8hn+d9PJSTUtcXZU+2
         c3oIOLrjYumRwxahXT7vg5PvobuvChAW02COT5kJP7LmzpqOXsFvkKgc3d+0FAZfkZ
         qEvxk84oeLA8JVYz4yHrc4MpoipVeI9vnMaMXnvQaUzwMdnQ2/fYdWadDnzdRNDf49
         pHrhv8FRPyLbHxkNf/pkgifMhQ7Zm8B+i8NHtY8skAA8K27dTX+zmuBHJNSyd6GBqh
         VZaqMz/TB72kbuR6nOQiCKYoNEMfOuKdnnK8UV3fAffJFAX5Ilz7s+MJYzpbVH3+en
         ZZ6odggE9qS/Q==
Date:   Tue, 16 Nov 2021 10:39:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Li Zhijian <lizhijian@cn.fujitsu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the gpio-sim tree with the
 gpio-brgl-fixes tree
Message-ID: <20211116103924.3a26ba23@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XR0f4sYqyUQ5TPungndR/bD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XR0f4sYqyUQ5TPungndR/bD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-sim tree got a conflict in:

  tools/testing/selftests/gpio/Makefile

between commits:

  92a59d7f381d ("selftests: gpio: fix gpio compiling error")
  4f4d0af7b2d9 ("selftests: gpio: restore CFLAGS options")

from the gpio-brgl-fixes tree and commits:

  79d93060a28e ("selftests: gpio: provide a helper for reading chip info")
  60283bc9fceb ("selftests: gpio: add a helper for reading GPIO line names")

from the gpio-sim tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/XR0f4sYqyUQ5TPungndR/bD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGS76wACgkQAVBC80lX
0GxnkggAjc5rkjoyw4RLbXJBfNU1zPAcFM9qwq/St7w1I25bqYepLCsvh2hkIY2g
WmX2RxKB9V9gyzwff95UJ4nlo5c5ue8LLVjX60ejELV0so2HYYQxyxjFJqkz84A2
zDc4z2dSUe7pgMbGxfuffwuKdggQGrbiXZV+MlUAjCmCw1vwC10TnJ72/qywLnMH
jPxK3kTIY9f7oaMXaWd/yfLjLVLMtca919W3bYWeuxjX5hbWhNZbol7VrZqc1Kyq
RADaiMw1Wu7U+SQhig+xhNrfe68hnHj9bPzSdRkZhF/TxqkimcIhr093a86NuxdC
MFBidE+cG8szcEoxneS5fcr6L/Jydg==
=UXXZ
-----END PGP SIGNATURE-----

--Sig_/XR0f4sYqyUQ5TPungndR/bD--
