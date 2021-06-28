Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54AF73B5D4A
	for <lists+linux-next@lfdr.de>; Mon, 28 Jun 2021 13:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232743AbhF1LrC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 07:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbhF1LrB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Jun 2021 07:47:01 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A36C061574;
        Mon, 28 Jun 2021 04:44:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GD5PD1xXdz9sVt;
        Mon, 28 Jun 2021 21:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624880672;
        bh=7Pb3MnxHOl/+eVEKU5ze5W1VhogzyJb/L35VwUoyH+A=;
        h=Date:From:To:Cc:Subject:From;
        b=V7d7oy4/KN+V7cIb8tRkQD6ApnmWPXWLD0r/atDiSwrFFOTlmifBVU1jw7pyqjhlP
         Zdn4IbzWvYp+FJ0F630CLq7dlSdlkLM4dnMib7ZOLVeQBGme5ABdpkRy2fUeKFfAsW
         WkDpbLV3dd/e90qqXU2A3JKcc4b42Gaml9ibJR14gTdx5R4w1prA0NXMw75WAyicjK
         EqQyvTyO1bM29FluwXZwySAX8tE6GD6m3mPU5o5vZ6bCMhNUhFO9GHPokcMoU/AG0L
         F6IlNH0vS4Z6Up2etWZxjuRiNneGKskPWDkk7Gg1Ej8Et7vNvhBniuVIWIXD4Dy9DR
         +0sE7oE5G/17Q==
Date:   Mon, 28 Jun 2021 21:44:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Robert Hancock <robert.hancock@calian.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the clk tree
Message-ID: <20210628214430.6b3607d5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1QVTU.+H6zquvIjKLrMdMvW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1QVTU.+H6zquvIjKLrMdMvW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3c9b49b0031a ("clk: si5341: Update initialization magic")

Fixes tag

  Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  71dcc4d1f7d2 ("clk: si5341: Check for input clock presence and PLL lock o=
n startup")

Fixes tag

  Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  78f6f406026d ("clk: si5341: Avoid divide errors due to bogus register con=
tents")

Fixes tag

  Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  6e7d2de1e000 ("clk: si5341: Wait for DEVICE_READY on startup")

Fixes tag

  Fixes: 3044a860fd ("clk: Add Si5341/Si5340 driver")

has these problem(s):

  - SHA1 should be at least 12 digits long

This can be fixed for the future by setting core.abbrev to 12 (or more)
or (for git v2.11 or later) just making sure it is not set (or set to
"auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/1QVTU.+H6zquvIjKLrMdMvW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDZth4ACgkQAVBC80lX
0Gyxhwf+O9YeXvX2knf2jhvuQBCd07ZrhZpXSBH+6wYT1kS9lSyNyRBuEeQmnQQW
xEEkUouflkkP28vTMa4Lj96y4eZyIpCONekNBYuoxgJhFMkNGAn+IjX3PxMZt3xx
bTXGJGaWHyIIrEqadzxhWwDJj8db4MCQqLoa+fUA4rTVdRjPJFiq7QXGdVgmgqWE
cexSz6UqKNIq16C5d3y04KhOTHv7Bqci+uvGRh6SnEAkuaK7vsae7xSUdCqJOZJs
Fgu6kIULxJuO7wCHQwwPofR5ohD9o5LRLtV+RrBoQaXRqhWTHWuWF77TIQyXci5E
skBnT6Oq+Xg4LIJmvFTb3p0RcCkMDw==
=g7Gf
-----END PGP SIGNATURE-----

--Sig_/1QVTU.+H6zquvIjKLrMdMvW--
