Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65BAD268253
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 03:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgINBkn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Sep 2020 21:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbgINBkn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Sep 2020 21:40:43 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90B7C06174A;
        Sun, 13 Sep 2020 18:40:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BqTZl739Sz9sSs;
        Mon, 14 Sep 2020 11:40:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600047632;
        bh=/yCJ8elKP1QQENEZBnQ5hHOj9ioJVTXN6Py42n2Nv/0=;
        h=Date:From:To:Cc:Subject:From;
        b=HkOcpfuMpMvs5MND37akdSD6Kq5ksFolzsmMxk2UfpM1WLCnUgqcTeFaKrJRu6mv3
         pAWXhGL/bq0P6GooLaAnwOzaRmufjEpEIF6+s2Mc052rdzHTbqabrO4bdeITcvB2lK
         unip2KBLrl9V/+F4/S5j3La0RTSqe1ZLn4Ye+24qdb75mc4NSGyZP0ACk8YZrnJWpV
         bEfkOVt9wXiC8Bpx0edxDA0HAGSHrvkyi+tSOE+5yUtqN/HiN+1Af0CFUkNX80tcfD
         gYgC06Ssq/sU6Ks/qXsQb2r4s3yU1wu1BnfhlRzJbCPsN8R+CBvRKr6fD0Ad+YyyeX
         BAexG3ftWwZoA==
Date:   Mon, 14 Sep 2020 11:40:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the nand tree
Message-ID: <20200914114029.44b7f292@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tAmxs+g7HRi280xCd+CxMV1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tAmxs+g7HRi280xCd+CxMV1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: In function 'common_nfc_set_geo=
metry':
drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:514:3: warning: initialization d=
iscards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  514 |   nanddev_get_ecc_requirements(&chip->base);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  950c7c7026ca ("mtd: rawnand: Use nanddev_get/set_ecc_requirements() when =
relevant")

--=20
Cheers,
Stephen Rothwell

--Sig_/tAmxs+g7HRi280xCd+CxMV1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9eyg0ACgkQAVBC80lX
0Gw83wf+PNXqPUyCWPz54ZgSMvBMrAS6dJG1dso02gJsTtydwfqUPDSj8jF+f7k+
akqCuYUdSzSwGAZXjmZSUBl/SYCPaaD9jjxwfT1p3o75VUJyP++jQh3OEnpeqnmL
OmD5Phtcrd+P8V8TNDUYYMi3heSLq5o5SWLsfly6wEGN7nS49AAI1KhdPL3P1PWB
DjPxi31l9qAhQ086QYeKL5A2RsKgNLR7ShYzOCMSEW1xIJqBuiyZ6XABxMR220cl
EXMOAusNbstPQIHKopAjnWFeh9K876CJclf3mF42uPCFbc72UyfcFt/qIlEMYsf3
rGI4LxhHkvqQVH1EqTXRKZNNlOy+Ww==
=bAie
-----END PGP SIGNATURE-----

--Sig_/tAmxs+g7HRi280xCd+CxMV1--
