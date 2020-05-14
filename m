Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06351D246C
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 03:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgENBCd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 May 2020 21:02:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38179 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgENBCd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 May 2020 21:02:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49MtYf748zz9sSf;
        Thu, 14 May 2020 11:02:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589418151;
        bh=SYHlSh6/z5acDrKOTCmTNV/WDbLLOcAYzHiL81DN2UQ=;
        h=Date:From:To:Cc:Subject:From;
        b=h8tVOSPD18w9lV6yo7yrVV1oOFdxWg12RQomk9WL4SUChULTdniI2vd5ZdwNyiXG0
         Yw8/4PNyOZlMdZW3wK0OrUMOQyixIHBRplgqPthnXcgrGPU2Apck9tXka1iG+XKdcJ
         dL+2eA/zKaFTaYpX7hM0OV+0FtE4iTqgmZ/982lASxbgg6+O+gLgaLWJ1JIJn75DY6
         7V86oOV3osZ1l2wYPGn3owMvve4+fR8J0HBulQRdottdTFymrrUK+G4olLJE45hNQT
         21b5jVa8PzF4w6+sf600Gliy5SDd9QyTt/YEvpJIjMUltb+ll2AdgjtbHLICKK3fME
         O29bqRq1gpEEg==
Date:   Thu, 14 May 2020 11:02:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20200514110223.4d7a650d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4_7=.=APp2=ZtDH25ON__Rk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4_7=.=APp2=ZtDH25ON__Rk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/quirks.c

between commit:

  0a8f41023e8a ("PCI: Move Apex Edge TPU class quirk to fix BAR assignment")

from Linus' tree and commit:

  68f5fc4ea9dd ("PCI: Avoid Pericom USB controller OHCI/EHCI PME# defect")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/quirks.c
index ca9ed5774eb1,7b4a98d0f0fd..000000000000
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@@ -5568,9 -5568,15 +5568,22 @@@ static void pci_fixup_no_d0_pme(struct=20
  }
  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x2142, pci_fixup_no_d0_pm=
e);
 =20
 +static void apex_pci_fixup_class(struct pci_dev *pdev)
 +{
 +	pdev->class =3D (PCI_CLASS_SYSTEM_OTHER << 8) | pdev->class;
 +}
 +DECLARE_PCI_FIXUP_CLASS_HEADER(0x1ac1, 0x089a,
 +			       PCI_CLASS_NOT_DEFINED, 8, apex_pci_fixup_class);
++
+ /*
+  * Device [12d8:0x400e] and [12d8:0x400f]
+  * These devices advertise PME# support in all power states but don't
+  * reliably assert it.
+  */
+ static void pci_fixup_no_pme(struct pci_dev *dev)
+ {
+ 	pci_info(dev, "PME# is unreliable, disabling it\n");
+ 	dev->pme_support =3D 0;
+ }
+ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_PERICOM, 0x400e, pci_fixup_no_pme);
+ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_PERICOM, 0x400f, pci_fixup_no_pme);

--Sig_/4_7=.=APp2=ZtDH25ON__Rk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl68mJ8ACgkQAVBC80lX
0GzVRAgAiCuF/XJvZSuf0mLKm7rBnRqdTrWrPrJyIWsuitoXeNRnauH4Favinj+W
R/YKpDYOFKI09tDY6CcCo9xS11KfrvLAefnHouVUeN0ROr4vQXaLSIKf/VJXO29U
RW2Pj6fH91rfnibDlosRArxKVaX83MTRBeNSvlOlqMBTqpJHfBV4wvjWrGKnUBvi
AxvXRgh6iXKkkYs3m/Bqma4y+PkEp/HDvFqDzkHA7nZJrzwexqElwgxOJAwvwXCB
E3rxZoxIqqFFcAwFUOjmYXlVj0EoX4YrPah6q+V04fjuPcNk/OR38vQIzehNFStm
ZXC01LsltoAuhIUj94jzXvXtbpS2Mg==
=5Vlv
-----END PGP SIGNATURE-----

--Sig_/4_7=.=APp2=ZtDH25ON__Rk--
