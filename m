Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 045C8895BB
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 05:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfHLDV3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Aug 2019 23:21:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55657 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbfHLDV2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Aug 2019 23:21:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466LjH69nZz9sNF;
        Mon, 12 Aug 2019 13:21:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565580084;
        bh=VE6hHYFEFEkKzkHzw/++zYvbgNMOO5CoC34mA1gSgTc=;
        h=Date:From:To:Cc:Subject:From;
        b=ZAhhPwdq2HJ2yGJiTIe+DmwFmQQfsvPDP/qS75fDKFw3/qSoG5KNES4cMiOLf+yd3
         LQeIontON34/UZTuBVG4y+VaikTVtzzw6lJymEDxKk59+v9sOYBGdn/4eWpQJstX3T
         TsydNZmR0jI2VcuviHhHDvRR4y3+wge6avS+uT38wUG5rOPQdsIH3qLOXbF851t77M
         7IwqiNhLR40kqsmtDrnLc+muu4NVobhdqwoZ3zGwp5GitL0V7OYyGElZkSR4++mU+5
         x+5EE7XtyPVkyO6b5RMb+kPRyM1uH9kj3jh9IrvjMtBcQisgvlCGMVdXJ7rfC2Ax6W
         VYc/+qV37kjww==
Date:   Mon, 12 Aug 2019 13:21:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Shiju Jose <shiju.jose@huawei.com>,
        Kenneth Lee <liguozhu@hisilicon.com>,
        Hao Fang <fanghao11@huawei.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        John Garry <john.garry@huawei.com>
Subject: linux-next: build failure after merge of the crypto tree
Message-ID: <20190812132122.22ea1bb5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IZnzAHBtUJNT9g/KJliSAhQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IZnzAHBtUJNT9g/KJliSAhQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/crypto/hisilicon/qm.c: Assembler messages:
drivers/crypto/hisilicon/qm.c:334: Error: no such instruction: `ldp %rdx,%r=
cx,%bl'
drivers/crypto/hisilicon/qm.c:335: Error: no such instruction: `stp %rdx,%r=
cx,%al'
drivers/crypto/hisilicon/qm.c:336: Error: number of operands mismatch for `=
ds'

Caused by commit

  62c455ca853e ("crypto: hisilicon - add HiSilicon ZIP accelerator support")

I also got the following warnings:

WARNING: unmet direct dependencies detected for CRYPTO_DEV_HISI_QM
  Depends on [n]: CRYPTO [=3Dy] && CRYPTO_HW [=3Dy] && ARM64 && PCI [=3Dy] =
&& PCI_MSI [=3Dy]
  Selected by [m]:
  - CRYPTO_DEV_HISI_ZIP [=3Dm] && CRYPTO [=3Dy] && CRYPTO_HW [=3Dy]

WARNING: unmet direct dependencies detected for CRYPTO_HISI_SGL
  Depends on [n]: CRYPTO [=3Dy] && CRYPTO_HW [=3Dy] && ARM64
  Selected by [m]:
  - CRYPTO_DEV_HISI_ZIP [=3Dm] && CRYPTO [=3Dy] && CRYPTO_HW [=3Dy]

WARNING: unmet direct dependencies detected for CRYPTO_DEV_HISI_QM
  Depends on [n]: CRYPTO [=3Dy] && CRYPTO_HW [=3Dy] && ARM64 && PCI [=3Dy] =
&& PCI_MSI [=3Dy]
  Selected by [m]:
  - CRYPTO_DEV_HISI_ZIP [=3Dm] && CRYPTO [=3Dy] && CRYPTO_HW [=3Dy]

WARNING: unmet direct dependencies detected for CRYPTO_HISI_SGL
  Depends on [n]: CRYPTO [=3Dy] && CRYPTO_HW [=3Dy] && ARM64
  Selected by [m]:
  - CRYPTO_DEV_HISI_ZIP [=3Dm] && CRYPTO [=3Dy] && CRYPTO_HW [=3Dy]

WARNING: unmet direct dependencies detected for CRYPTO_DEV_HISI_QM
  Depends on [n]: CRYPTO [=3Dy] && CRYPTO_HW [=3Dy] && ARM64 && PCI [=3Dy] =
&& PCI_MSI [=3Dy]
  Selected by [m]:
  - CRYPTO_DEV_HISI_ZIP [=3Dm] && CRYPTO [=3Dy] && CRYPTO_HW [=3Dy]

WARNING: unmet direct dependencies detected for CRYPTO_HISI_SGL
  Depends on [n]: CRYPTO [=3Dy] && CRYPTO_HW [=3Dy] && ARM64
  Selected by [m]:
  - CRYPTO_DEV_HISI_ZIP [=3Dm] && CRYPTO [=3Dy] && CRYPTO_HW [=3Dy]
drivers/crypto/hisilicon/sgl.c: In function 'hisi_acc_sg_buf_map_to_hw_sgl':
drivers/crypto/hisilicon/sgl.c:181:14: warning: 'curr_sgl_dma' may be used =
uninitialized in this function [-Wmaybe-uninitialized]
  *hw_sgl_dma =3D curr_sgl_dma;
  ~~~~~~~~~~~~^~~~~~~~~~~~~~

This latter from commit

  dfed0098ab91 ("crypto: hisilicon - add hardware SGL support")

I have disabled CRYPTO_DEV_HISI_ZIP for now.  You should not select
CONFIG options that have dependencies (without also depending on the
same things and being very careful).

--=20
Cheers,
Stephen Rothwell

--Sig_/IZnzAHBtUJNT9g/KJliSAhQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Q2zIACgkQAVBC80lX
0GxkVgf+Or94Jq7IrJ+eQoYm2XPoBpCj7fpHFsxdJh/fcVCYtk7ce03/iSeoja10
KfbipxX2LrVn5Zt5cLA1Rj1VA1tOnFHAp2Yc9389bFlGruepm+xfaOCQHcXI52w5
yy8eFYeKFVuyxH6KUU7TNE1aoJ4qgXbSEVQMWB/UxApt7A0imtKVbhvQO5xEWcLN
IDfk5h7N/tZGbWje5DrpT5ucz3/How16HmS+QQO8uzbw3jZeDKt5CnkvcIBb3s9i
e8I3zPLn77eDzG0dee6VVUyb47dw8eMf7XgJDzzO6XRGVXAqhFwVBDIi/GCnptLa
SkcoeBY3qZJuMnI8WmxyFFqyfRktlg==
=ObT8
-----END PGP SIGNATURE-----

--Sig_/IZnzAHBtUJNT9g/KJliSAhQ--
