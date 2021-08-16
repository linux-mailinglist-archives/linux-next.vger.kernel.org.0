Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB443EDFB6
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 00:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbhHPWJC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Aug 2021 18:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbhHPWJB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Aug 2021 18:09:01 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58AA7C061764;
        Mon, 16 Aug 2021 15:08:29 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GpSwT2QCfz9sRf;
        Tue, 17 Aug 2021 08:08:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629151707;
        bh=8q8aIwaUFH6ZOWfn7eInIolS8NOorpSDnLwylTkBT1Y=;
        h=Date:From:To:Cc:Subject:From;
        b=isSiPnR9q9IEFCAu+LSGBm62u9fx4lm3HTA6w7tHmKLMwqkw6E2AWWU1s+xChfTIB
         MfpSA7hRpzbQowif5lQBQCtsbGDyDQPATg9H7qWpneYR6e+HGd9+XHXqh8lXDjNDkX
         g1p+navToKSAA/sRFZiAwKe4FChJN5VkCxk/6S6iCYUvxPoVMsxOVUGpUwBmEf8ONL
         kP/xyT6SA1iKZ/A4m95iQF5wfiRxicJ6kMQQ/1nBRwdpaAxhGWdCC3CsTJsKj4ZqBI
         4vgvxP9ExpkWVsa6jBL+s6PHW4DOCMHgH4mZ6fSEPcjPdTY0SvY0HA0Z6c4EZhJIZs
         hbGICcG4b/+hQ==
Date:   Tue, 17 Aug 2021 08:08:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Jaime Liao <jaimeliao@mxic.com.tw>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the nand tree
Message-ID: <20210817080824.7fa1ee3b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FmjS8eLZ5U_dSYeHMN9/3Fq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FmjS8eLZ5U_dSYeHMN9/3Fq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  c26b316307ff ("mtd: spinand: macronix: Add Quad support for serial NAND f=
lash")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/FmjS8eLZ5U_dSYeHMN9/3Fq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEa4dgACgkQAVBC80lX
0Gy0GQf9G9xGYzVh/7zOd7pspeZvjwihIl4asCbj1imW0HwWhMXBxR42TF27cj9d
O/lOG5MZVn0U2dINXn6gQ6M5meMzIb4QC9/bJ6uYjzdFumiMrzodoh51LhQC0VdR
xRXtgXFcQMEWvf5OULISXq6TEv9Zi8agjGxWPnRRjP1+3u5sJ/Vk+7jFra1cyQrD
TWzccT30c6GREYQ9zbNdRjnceeZReTAha3QJf4o7NluUea2Fd6uAS6VcZWT4p8Tf
sP+8wVwdXFJ0J31CkZsTx1N9kWfoC+mHu+QDtXwwjfr8LLSsWMzVVTVNIB9emrt1
Qvrec05GBxXe214V4GmwP5DrGok4kg==
=l/ZP
-----END PGP SIGNATURE-----

--Sig_/FmjS8eLZ5U_dSYeHMN9/3Fq--
