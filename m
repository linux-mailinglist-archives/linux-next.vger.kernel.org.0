Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399D81B0637
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 12:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgDTKHt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 06:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgDTKHt (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 06:07:49 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2837C061A0C;
        Mon, 20 Apr 2020 03:07:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 495Mns3L49z9sSd;
        Mon, 20 Apr 2020 20:07:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587377265;
        bh=fyRE88EUmcJ/xhfP/7TaFlVcAPO2aRgIMO/l87QiN50=;
        h=Date:From:To:Cc:Subject:From;
        b=p4I8LotDwEanAlLDJ+bfvVjKenoLIigPRaxoK/9trQj1OsATrk0NLqKcqwn7UYGap
         EJQ/WKBbXcNVlZ3mJ9WYe+Cihnehkye83rt5xsDOhhhRvrDHUdLLPmGcrZMcY4g9ci
         +kcl1+mDp2xq2zxPD5iHawajZJyFSedcclR3jVXlG0ufYrRZsrvpqWFkWpzLhU0WUG
         NiwVhJF/eMrMa7zkFaU886U/KLTiCvgDtCTNNzPFWathOdQ3bfTtqsG4643kyWL1NL
         wpzk8ZDbKfnwWVftJG+UAjuq2deGkajbmg57UKADFCZgRneZCzBUz+y30h5P1RsT8I
         ApiY3lkAANrmQ==
Date:   Mon, 20 Apr 2020 20:07:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>,
        Christoph Hellwig <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: linux-next: build failure after merge of the mips tree
Message-ID: <20200420200744.620c2782@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5md_9.eHnu1gkIW32nH6tg6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5md_9.eHnu1gkIW32nH6tg6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mips tree, today's linux-next build (mips gpr_defconfig)
failed like this:

arch/mips/alchemy/common/setup.c:99:9: error: implicit declaration of funct=
ion =E2=80=98remap_pfn_range=E2=80=99; did you mean =E2=80=98io_remap_pfn_r=
ange=E2=80=99? [-Werror=3Dimplicit-function-declaration]

Caused by commit

  d399157283fb ("MIPS: cleanup fixup_bigphys_addr handling")

--=20
Cheers,
Stephen Rothwell

--Sig_/5md_9.eHnu1gkIW32nH6tg6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6ddHAACgkQAVBC80lX
0GyhaQf/fbLKnAmxp3xCXCLNPDQZNt5sA4vQXe3ISEAF4apneFAGK+5Rs6BH0ERs
pv2o4uyopeMiuvUza6rNRAXulUVV0bycTgr2zCaA+i98IM5RBsAePLq9VC38J8Qa
8gTaITYQgHJ1x57780VGKbZeHkpV5SqH0Lx3GGdRe1Pi/qsThLJhebU4cr64R4en
ezAWAUJFwiTGTfNGvoHY4BVQWssLaXpaS4TZlVkrG3oohCmpMNtyRf+pznCe/5jU
gmLVLGkns59SQkMNkET/PH3k1UvdxzPvh/oPpbZRCvonra6e1tGRe3QJk/V4EUam
YYdlr6kiGx2UjZrd7WFdydFL7LOJyA==
=CDYJ
-----END PGP SIGNATURE-----

--Sig_/5md_9.eHnu1gkIW32nH6tg6--
