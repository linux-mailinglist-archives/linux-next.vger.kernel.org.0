Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F3C35B73B
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 00:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235487AbhDKWe2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 18:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235366AbhDKWe1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Apr 2021 18:34:27 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9127CC061574;
        Sun, 11 Apr 2021 15:34:10 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJRVj5VGqz9sVt;
        Mon, 12 Apr 2021 08:34:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618180446;
        bh=n6XSnOwkmj4T9SqjwoU/4Zw423XNVZqP8Xrb9+7iKUc=;
        h=Date:From:To:Cc:Subject:From;
        b=Ep+X6V41bpsTjFj6ZRWZ2QrzGzUomreS14ojfozpuT7G1Q3uzhtPLOSVjT+QRf6JC
         ukHM2dliMI8X7YQz06xb6626TYx0I6bAxkHG3PURkyItHC2pvytCWTsjG+OcCxH2zj
         7uFcCP7x6jqp7REyAuCWjlKnxgN2eJ8LhgrPj5jmPe65vqtgBFMsccmxgTKulo5BMl
         5DvOropVyEKLFvwxwZynlSps6BThJfUwbnI4gvZIPoaAJSEwLcal0UApHv8UsvUdm4
         a60Fo+DVBJyvF0ffOax3NSDcV9NxYuasvWKMy++ZIXY0PEKCZksL+0/yAXgOs5YSAh
         JAhYBe3zX1sBw==
Date:   Mon, 12 Apr 2021 08:34:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20210412083404.2d0dcf7c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0ooZE6uvzegrzJGE+z19b+S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0ooZE6uvzegrzJGE+z19b+S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6fa6517fe62e ("ata: ahci_tegra: call tegra_powergate_power_off only when =
PM domain is not present")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/0ooZE6uvzegrzJGE+z19b+S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBzeVwACgkQAVBC80lX
0Gy1fAf7Bb8piq6ParR+CeA4F1V7QkkHFg0vblGcf7oExtPDqq1IS5Sfxu84eAm1
nzP7J/3WGlZdYMCskc0cuSR0kLvTw6zXc4x4iFXZojRe2aVNGfsIrwPY7H3IFmGe
8QtYqtOvoGCTzqy6dj1R5NuO0fWQhB1Q2zCrhGuen927RUbDsgiIAcmpB9RS+2zY
q54YeDnoVnIqahCx+Df0okuiroRCqd2qvctv7B0keF+NCJOQR5vwyUGcnnNRTtWU
i4CQNdwoP82WA+vMRUcUYKsaqKVQ8asN9cCgHRVNM7dXek7Xe7m39WbvTpOP1QF3
EiPJxC8TfSsD+uSfcX2c4Lzhjp6z6Q==
=/HPy
-----END PGP SIGNATURE-----

--Sig_/0ooZE6uvzegrzJGE+z19b+S--
