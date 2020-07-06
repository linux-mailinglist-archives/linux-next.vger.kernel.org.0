Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E265215166
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 05:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgGFD4Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jul 2020 23:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728703AbgGFD4Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Jul 2020 23:56:25 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59D5C061794;
        Sun,  5 Jul 2020 20:56:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0Wvp3BNhz9sDX;
        Mon,  6 Jul 2020 13:56:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594007783;
        bh=/GNJJfWsDedN7nVwHZr6z5cQt0v1HcsF+F3L1Pwaz90=;
        h=Date:From:To:Cc:Subject:From;
        b=MrXZoUTyNi7bONm8l2xVKk21phHM1bS15MV7wvzBU3o5dXbkYWE1NR16W42ZJuvRR
         9BTBCNSPY2zoNr9XrxnnCm3bbVwQd18e09o//S0TaXboE0SOHfMQMIr8dk2EWemZDK
         Yhh3Ct5yic5LevCa3XTEi2dfGnUjzPTU6nWz5PQM78ij9LROb6fr6mRPSJTT8ECDli
         6zvkY0S2bOv9ksdP2IYaofA2L4Q+bAkl/2ZuosIz9dIHiKOsJjBd2PEfmjq/vBWNhr
         eRsdt8YrWBsjAD/SBhYXxrv0ljHdKzEXh6g9R5X7CrISJ9cDaQASquIvoKjzVm6LHw
         yAPsdinAaRo1g==
Date:   Mon, 6 Jul 2020 13:56:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dave Jiang <dave.jiang@intel.com>
Subject: linux-next: manual merge of the dmaengine tree with the
 dmaengine-fixes tree
Message-ID: <20200706135621.0113ebf9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O_.bJSqbvpcSYxxIO4hO7HV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O_.bJSqbvpcSYxxIO4hO7HV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dmaengine tree got a conflict in:

  drivers/dma/idxd/sysfs.c

between commit:

  da32b28c95a7 ("dmaengine: idxd: cleanup workqueue config after disabling")

from the dmaengine-fixes tree and commit:

  f50b150e315e ("dmaengine: idxd: add work queue drain support")

from the dmaengine tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/dma/idxd/sysfs.c
index 2e2c5082f322,6f0711a822a1..000000000000
--- a/drivers/dma/idxd/sysfs.c
+++ b/drivers/dma/idxd/sysfs.c
@@@ -313,14 -303,7 +303,12 @@@ static int idxd_config_bus_remove(struc
  		}
 =20
  		idxd_unregister_dma_device(idxd);
- 		spin_lock_irqsave(&idxd->dev_lock, flags);
  		rc =3D idxd_device_disable(idxd);
 +		for (i =3D 0; i < idxd->max_wqs; i++) {
 +			struct idxd_wq *wq =3D &idxd->wqs[i];
 +
 +			idxd_wq_disable_cleanup(wq);
 +		}
- 		spin_unlock_irqrestore(&idxd->dev_lock, flags);
  		module_put(THIS_MODULE);
  		if (rc < 0)
  			dev_warn(dev, "Device disable failed\n");

--Sig_/O_.bJSqbvpcSYxxIO4hO7HV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8CoOUACgkQAVBC80lX
0Gxepgf9Exf0v/hgKm9nThGRVGpJkNO8LnCNxkLEHsBLHIRnm/QfrC58JJ6UHfEh
egt9UBDiuuiyok+aMPt4G3hYvspuoaeweBxoVQTLIymcnme5CEfTaPBR/WvSNTuq
xdY/dJR7Bv1kRx3ZLapFEAboQg3J/E+UECB3+PTpi7rhCWurFf8PNspRXcFcWcQC
oU4i1eN0c+A+LxnG7cExx1sgf56WfV4wjdMzUKyT+ME4MY24MWlmfJXYHBHoegrC
RW2BcDC31KnIagCzLKLKrynuZGwuCqM+cEaiidZzk4akR3/ir3SGzW5Ze7xU1+Rw
8cL+X6Di9jrkuXggD+T99u8yAo4UIg==
=9vKe
-----END PGP SIGNATURE-----

--Sig_/O_.bJSqbvpcSYxxIO4hO7HV--
