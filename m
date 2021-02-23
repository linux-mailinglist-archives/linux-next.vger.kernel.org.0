Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83E6322313
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 01:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhBWAT4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 19:19:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhBWATz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 19:19:55 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A676C061574;
        Mon, 22 Feb 2021 16:19:15 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dl0686zyfz9sW2;
        Tue, 23 Feb 2021 11:19:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614039553;
        bh=cXslD8pfwrbp/o1ZONJWmsTNOkb3cNTVgGJgtGCHlLU=;
        h=Date:From:To:Cc:Subject:From;
        b=Mg6WcubO8PMZsxexGIyP+pA7XVwXBN4OvBQizfbe/wXQXVDJdvhdkGVEcvLFjdRwM
         n5IzmHYOGaj0ZiLbQRB2s9yOY6dH5Qd0iWTFHAK8uBBVruaw2TT8yiZVeTua4dJDjl
         sWappDddpXv0GEMjOib8ssYhTX4uI6YCxfHnddyZYzGWJIQFlHy0zI+sKieg7r9o1A
         +piG2fVF1eSmehYCO/Nhs9pkYafZSkSIaPxwprEIrRjTp/ltDimvzJ7IGToYtrfEKY
         BdC3Aqo1r8zQSm6n1oXErH84IIWmxUp3rrXruDNeA/shKecEnoPhOq5rHRRyTDs2EU
         kor/lpjRZ+3OA==
Date:   Tue, 23 Feb 2021 11:19:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20210223111911.54ea7503@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t.wZ22U=pIOyM2H7wJLYLup";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/t.wZ22U=pIOyM2H7wJLYLup
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/pci.c

between commit:

  40fb68c7725a ("Revert "PCI/ASPM: Save/restore L1SS Capability for suspend=
/resume"")

from Linus' tree and commit:

  d2bb2f9e1af6 ("PCI/ASPM: Move LTR, ASPM L1SS save/restore into PCIe save/=
restore")

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

diff --cc drivers/pci/pci.c
index b67c4327d307,13b89b1e29ed..000000000000
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@@ -1434,6 -1474,9 +1474,8 @@@ static int pci_save_pcie_state(struct p
  	pcie_capability_read_word(dev, PCI_EXP_LNKCTL2, &cap[i++]);
  	pcie_capability_read_word(dev, PCI_EXP_SLTCTL2, &cap[i++]);
 =20
+ 	pci_save_ltr_state(dev);
 -	pci_save_aspm_l1ss_state(dev);
+=20
  	return 0;
  }
 =20
@@@ -1447,6 -1490,9 +1489,8 @@@ static void pci_restore_pcie_state(stru
  	if (!save_state)
  		return;
 =20
+ 	pci_restore_ltr_state(dev);		/* LTR enabled in DEVCTL2 */
 -	pci_restore_aspm_l1ss_state(dev);	/* ASPM L1 enabled in LNKCTL */
+=20
  	cap =3D (u16 *)&save_state->cap.data[0];
  	pcie_capability_write_word(dev, PCI_EXP_DEVCTL, cap[i++]);
  	pcie_capability_write_word(dev, PCI_EXP_LNKCTL, cap[i++]);

--Sig_/t.wZ22U=pIOyM2H7wJLYLup
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA0Sf8ACgkQAVBC80lX
0GwzaAf/fYl6EnABTq2lKmIhYSSQG7rkKkczl3qzh0lFQIKaBLTC9ekwxpEa7Yia
+DneqnzIvuUrFp9fCbB7J/E69E5ubz3wVLKYqhuwmji1rHUb5DXcHojSMvZ9hZbl
s8wU3r1Er3Xjd4SPBZi3FHA9GrRsZdRYy4qXhiIh30vezm4Cb5jOc4LCF2OXbhjj
B/7CrLLEUPgJSsSoKpgOlFQq8sRuaFzAuv9n7LnVVQWf8GW6Tkba5caAphWq2Bk8
8pao3rCw1jS0OLBArdEYkQTW9e3WjtZOtJUkrOGKLCDwf22ApE7qnhrGo5UL2lHu
myg7g89uqpGvt8bWQozg3uFio4QXrw==
=F0BL
-----END PGP SIGNATURE-----

--Sig_/t.wZ22U=pIOyM2H7wJLYLup--
