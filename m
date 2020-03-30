Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E15FD19888D
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 01:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbgC3Xt6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 19:49:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58083 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728537AbgC3Xt5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Mar 2020 19:49:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48rq293DXQz9sRY;
        Tue, 31 Mar 2020 10:49:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585612195;
        bh=F6it0E2f0m4OGMWEREpO8165BbI/NOBUVZP/AbAM6pc=;
        h=Date:From:To:Cc:Subject:From;
        b=grY1711BQSjvgwA4+KJQL+E3oWAUraKW0biE6fsKlj+WZu4LZnZGM5k22V1oFvDfQ
         EJAUqhBnYlLACpDStpRZbIK9PMFda+FmW83RPOLDdFEjFym8Ze15PHzKBI7TUobF2f
         7+MtlmWRtvcroj/wP15TaZMEcfxXa/VLfM9r5ArN0asszvWi2BcGu1RudnuzHDb9kD
         wwiu/QwWn/DBxpSNmCbAUQcO6fM+3+XaDva2vzvlKYyLTxrHCdvTGZMPxeZvrWFhIg
         VmtUBt74tBvqL2izVDc3vdsipwP2YF751EBUE88etDyFgvxPUaRog+WXrkxjY/DkuY
         PU7ATVrx/UP7A==
Date:   Tue, 31 Mar 2020 10:49:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20200331104947.264c98e5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/srMXF9q3NUD8ClmVZPnEu2o";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/srMXF9q3NUD8ClmVZPnEu2o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/net/ethernet/intel/ice/ice_main.c

between commit:

  19cce2c6f6dc ("ice: Make print statements more compact")

from Linus' tree and commit:

  894020fdd88c ("PCI/AER: Rationalize error status register clearing")

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

diff --cc drivers/net/ethernet/intel/ice/ice_main.c
index 5ef28052c0f8,effca3fa92e0..000000000000
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@@ -3458,9 -3495,10 +3458,9 @@@ static pci_ers_result_t ice_pci_err_slo
  			result =3D PCI_ERS_RESULT_DISCONNECT;
  	}
 =20
- 	err =3D pci_cleanup_aer_uncorrect_error_status(pdev);
+ 	err =3D pci_aer_clear_nonfatal_status(pdev);
  	if (err)
- 		dev_dbg(&pdev->dev, "pci_cleanup_aer_uncorrect_error_status failed, err=
or %d\n",
 -		dev_dbg(&pdev->dev,
 -			"pci_aer_clear_nonfatal_status() failed, error %d\n",
++		dev_dbg(&pdev->dev, "pci_aer_clear_nonfatal_status() failed, error %d\n=
",
  			err);
  		/* non-fatal, continue */
 =20

--Sig_/srMXF9q3NUD8ClmVZPnEu2o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6ChZsACgkQAVBC80lX
0GxlAgf/Y5/sEI0Btcm8Ql3NzFmZADH6dx+/llBwI5PPWjomIAnApDbppd+NGqMc
rcVIb/GwaNgJbfYW1gmOfA8rTlfk8akmYcGeUxeL21W3DQfZySVE91VLQEzHupvm
J73VjwJP9CDLXL3z43+8sg4rjdZfe2tGQFx850OxUztUudhMG/36yTDVZXQuI8L/
l/bkR7W5baN6fthYnoP2sH0iy/2raUK0uuN8lA8w1ZnBG9sSIjlNOXUrndUkOv44
pGeevKzloxyDjKt9aAL9Z6DpYHto3xuT3pH51JvDXt5i90joSfNBQGgH+HRUbJ/q
Xx9m8AEnQvWkEnglrYopbHtaisBosg==
=s2wh
-----END PGP SIGNATURE-----

--Sig_/srMXF9q3NUD8ClmVZPnEu2o--
