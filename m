Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEF1430CC4
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 00:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbhJQW5k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Oct 2021 18:57:40 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:54683 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233442AbhJQW5k (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 Oct 2021 18:57:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXb2837r5z4xbT;
        Mon, 18 Oct 2021 09:55:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634511328;
        bh=9WqkwRQu05GrAEfhShhd3twouja2E2uPIdIhfR23DPE=;
        h=Date:From:To:Cc:Subject:From;
        b=XvaLieQ6BXF7tl2z4ceCxUVT1Znh8+p9TjL/fbO7Nh+LAcmMMz4vYVwOsGIjLJYZ5
         Sz7SAuDlcqqD1oa1OEbccMeI093pwdcQestwoMYU3DHv5041QTU/dQta94HzFscxHU
         0LO0+T2QoqZzGyxLsVUZYWrGMTzts7CI0sBQ6KDX5KtRhez3na4IW3/xU18pTkMlKm
         5bAnY4UNcQuQ9kfuqUpqhw4J4reATdJ0YRlg7WsvPojZ/OikdFGsA61xR9H3vHPfSA
         GIcy1OXalTLhNwbgSEcFQwZRr0Y/D0S5QUdwnI0qlZpkMOXGh4gFurxP6Zi1354WwU
         9kZpOZl3f/4ww==
Date:   Mon, 18 Oct 2021 09:55:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pci tree
Message-ID: <20211018095525.39bea5b0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0GVZ/qL34XxV3Jm=BrqhzDr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0GVZ/qL34XxV3Jm=BrqhzDr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/misc/cxl/pci.c: In function 'cxl_vphb_error_detected':
drivers/misc/cxl/pci.c:1816:15: error: assignment discards 'const' qualifie=
r from pointer target type [-Werror=3Ddiscarded-qualifiers]
 1816 |   err_handler =3D afu_drv->err_handler;
      |               ^
drivers/misc/cxl/pci.c: In function 'cxl_pci_slot_reset':
drivers/misc/cxl/pci.c:2041:16: error: assignment discards 'const' qualifie=
r from pointer target type [-Werror=3Ddiscarded-qualifiers]
 2041 |    err_handler =3D afu_drv->err_handler;
      |                ^
drivers/misc/cxl/pci.c: In function 'cxl_pci_resume':
drivers/misc/cxl/pci.c:2090:16: error: assignment discards 'const' qualifie=
r from pointer target type [-Werror=3Ddiscarded-qualifiers]
 2090 |    err_handler =3D afu_drv->err_handler;
      |                ^
cc1: all warnings being treated as errors

Caused by commit

  115c9d41e583 ("cxl: Factor out common dev->driver expressions")

I have used the pci tree from next-20211015 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/0GVZ/qL34XxV3Jm=BrqhzDr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFsqd0ACgkQAVBC80lX
0GxqVgf+K7FkvcKIuK5pWKGVpCdnKYZO/zK11tlc7Tiy/xFwhvmvCVP6UqYTTpgQ
mqOgGr0+adM0s0Yu3RQ3etFUC7DlAEHZKM38a6RWRmsSxID3p3Z5n1ZZSTaKUjMM
ZpUjOobiexf2fHKDDcThPuwoiRUuTQueYHT9jikupt/yo8wC3uR3b683xfS9kuGD
rVjUXUFZy+d3z0/o4udTUyKC6zxsla3RhSwtmxkVL6U4Dyq1DBpwzaiBRI9T1dXf
W+hGT1nxYgWgzZOU7dqfvtGSqdr9QpTTYs9m1gO9fELiiq+ZlIWF4boQbJa4ybqJ
hqLeOLyU/80/oaLwODbkxccpnJWv2g==
=zioy
-----END PGP SIGNATURE-----

--Sig_/0GVZ/qL34XxV3Jm=BrqhzDr--
