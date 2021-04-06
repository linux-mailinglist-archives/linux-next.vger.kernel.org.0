Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA292354D19
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 08:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbhDFGss (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 02:48:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36413 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233755AbhDFGss (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Apr 2021 02:48:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FDym64Hxjz9sVt;
        Tue,  6 Apr 2021 16:48:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617691719;
        bh=e18B4aWTOTst1VGH925rYt0t5PdLjg1BC/uiLF8PPHk=;
        h=Date:From:To:Cc:Subject:From;
        b=TwRE7cl7nsojY3Gbl68eBkCw2lF8MvF6s9CcsbaToxjZUVRaovaD3QSpur6PVBmBJ
         uNGDdz68C9X7goH4dZ5H8nwjv/kATxjc8KXCpj0zIqOap28+iAtMNu8LNf0xZwW64o
         klP9Noe9odnIAcP6zU8mQti7loyYuxDRSqdlWce31U0YnzFjuDVmSk5Fqm09chnmNK
         C+UWZwutLR5ll7fxDcEhD+W7L/Et+W3WbrrIKWM8hH2FsVRyY334yrFvPfIqWFuu4P
         Wd1AdK6UmUJRd/pZNRadz4gECOqWD40kONRRWBmbY+6YXmeyB3d9tqYNc5i8lrE9Fr
         GxlOpl6M43Smg==
Date:   Tue, 6 Apr 2021 16:48:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Jay Fang <f.fangjian@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the spi tree
Message-ID: <20210406164837.08685c77@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hcExklDAUu3DiWzf6FCASnB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hcExklDAUu3DiWzf6FCASnB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/spi/spi-hisi-kunpeng.c: In function 'hisi_spi_transfer_one':
drivers/spi/spi-hisi-kunpeng.c:361:9: warning: conversion from 'long unsign=
ed int' to 'unsigned int' changes value from '18446744073709551600' to '429=
4967280' [-Woverflow]
  361 |  writel(~IMR_MASK, hs->regs + HISI_SPI_IMR);
      |         ^

Introduced by commit

  c770d8631e18 ("spi: Add HiSilicon SPI Controller Driver for Kunpeng SoCs")

--=20
Cheers,
Stephen Rothwell

--Sig_/hcExklDAUu3DiWzf6FCASnB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBsBEUACgkQAVBC80lX
0GwR5ggAghRJx/8BcAGcBqmLB4LfR5OhEQS/SW4sUjNLz2eVxyoj00W7Rq7gT1Eh
Y+WayV0hmo5PeLPiM1UKb0GlaxL7y85A8qNgvP5ni/uoGoYPGEf4ll9eszTAmmug
+nPKbxu+SlAuEM/OcWdg0PVTUq2mlT2BMNOIXBh1Y3sUPURMisnOuo8o4eZuSo8q
XSys73nvOolzrqN6eS7GrP3XrRjyA17sB2m1XtO6zlNEpzqQtFr/E0K0kzvxAoEm
xKxdbhxELGYoHVfqv844hgPuG1/rBC8YcQjYj9HrYwtkrGUZBIAVJFMgcuyBxvqJ
UjWkAQ5zJp/s+vDOmPjHRDfkUtgWlw==
=DYJU
-----END PGP SIGNATURE-----

--Sig_/hcExklDAUu3DiWzf6FCASnB--
