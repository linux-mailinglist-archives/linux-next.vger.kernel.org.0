Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7613F6B8E
	for <lists+linux-next@lfdr.de>; Wed, 25 Aug 2021 00:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237393AbhHXWKX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 18:10:23 -0400
Received: from ozlabs.org ([203.11.71.1]:43791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237289AbhHXWKW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Aug 2021 18:10:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GvNZ82DRcz9sT6;
        Wed, 25 Aug 2021 08:09:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629842976;
        bh=IwDuruj7zyT4gAHqpSM7wbmeBHjfRD1P+8GtAnh8ueY=;
        h=Date:From:To:Cc:Subject:From;
        b=dGtJFGl6jPD/876XYmPcjW3Un8t9bzxI1QSnp6yAhUuvpzktBNotDn61EmDxZ2bC9
         yCGT6e5jya9XesMrcfHkrXe3xs6sOt32SxEjKd6YM8s33U7fIo9MU3MrhW//q2k6xj
         qnCdWfb4+v7KYU8zYy/UPC5jHR0UPbY5/UvDiJjJNv6CQIUX15qzfDDcEKKhNhwCQS
         uMqRRGbppos+A8yG00m2+i1E7T+e6UQd6nc9XQo4qmmnCTBly/Z5ZveuOh4WE2dtjo
         1qXAoha4I8sl5wn4Bj5m/Y3o6GaPcawoaTBmwdiB7ROsfpsJkD175xe9A8i53oDN4d
         ib3O1vf1jn+cA==
Date:   Wed, 25 Aug 2021 08:09:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the clk-imx tree
Message-ID: <20210825080935.78a2288c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tv/X/1QWgCWAz7sc6sA6uvg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tv/X/1QWgCWAz7sc6sA6uvg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8ee749ec7fc6 ("clk: imx8mn: use correct mux type for clkout path")

Fixes tag

  Fixes: af4df655040 ("clk: imx8mn: add clkout1/2 support")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 3af4df655040 ("clk: imx8mn: add clkout1/2 support")

--=20
Cheers,
Stephen Rothwell

--Sig_/tv/X/1QWgCWAz7sc6sA6uvg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmElbh8ACgkQAVBC80lX
0GxDrQf+O4IG+Y3AEx73yfLYrQ3W0oe/8ZWNrhh66xjb3giykJUxcOPT15CXouVt
8Z4rsatXnsfDy1WzIr48kGSYGaDrZ5W4CHrd3jplqgzRJ9n550HJGjBbHBSvkVwS
TNJhVLTNWc3MYyvcWlR6ekMLc9wlLI6HiyX6bhM0/gwzyrQLXl5np2O4uZaMRdWP
iQjWwmIbUc2aG0aCnYFnV42pBh4pbOYzKhepad7pCh4zf54xvoHajZwExVo/PkWi
MDDpZ8f8730KImbjd5hZ2LZEfsNlgyFGrOzwwDI2AtouQl5LrGmbk8O1ENtYWnr1
KjuYZg5bh6C3U9vI2WyzIL1CLSfWTA==
=eHYk
-----END PGP SIGNATURE-----

--Sig_/tv/X/1QWgCWAz7sc6sA6uvg--
