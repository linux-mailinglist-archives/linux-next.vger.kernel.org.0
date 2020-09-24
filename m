Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51812767D1
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 06:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgIXE04 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 00:26:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41371 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbgIXE04 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Sep 2020 00:26:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bxhp56n57z9sTH;
        Thu, 24 Sep 2020 14:26:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600921614;
        bh=244cn+GKaiYF8lfm3vJXQLjZYom9qlhNtFg7QdkUQK8=;
        h=Date:From:To:Cc:Subject:From;
        b=FmI8xKASVXqT9pMElsjZa/BUyduLIZQuMo+40pctkiesCykelvqZAUfP6OIEn/7LE
         KEFFxZkvdvy1S3Vg3UH5p7lQbEcJpAXZMutzsroCczTsgKMt4wm4m2J7MU2WGeHl+5
         kZSF1mTCE8HItIeanCBrVK2ITBxP/DBKP66gd9lgBigv0XtkO/qJoVvnUpImo99MGn
         DgjcXsHQqkNk+39udwltcxrurYpK3tF47yMxaaMjW52w4zfaMGZetn+98rcE+q5aUx
         98HeS3LQUrpiLqkAVf5Gy6wMCqwHFIzHsIyRVkjbKUGQew6VaB+Gd+zvqeTLaF8fKR
         kNbQ/pkuMhamw==
Date:   Thu, 24 Sep 2020 14:26:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Williamson <alex.williamson@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Niklas Schnelle <schnelle@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the vfio tree with the s390 tree
Message-ID: <20200924142651.28382ed7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sJfuOahk28wU5Tj00PRZfid";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sJfuOahk28wU5Tj00PRZfid
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfio tree got a conflict in:

  arch/s390/pci/pci_bus.c

between commit:

  abb95b7550f8 ("s390/pci: consolidate SR-IOV specific code")

from the s390 tree and commit:

  08b6e22b850c ("s390/pci: Mark all VFs as not implementing PCI_COMMAND_MEM=
ORY")

from the vfio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/s390/pci/pci_bus.c
index 0c0db7c3a404,c93486a9989b..000000000000
--- a/arch/s390/pci/pci_bus.c
+++ b/arch/s390/pci/pci_bus.c
@@@ -135,9 -197,10 +135,10 @@@ void pcibios_bus_add_device(struct pci_
  	 * With pdev->no_vf_scan the common PCI probing code does not
  	 * perform PF/VF linking.
  	 */
- 	if (zdev->vfn)
+ 	if (zdev->vfn) {
 -		zpci_bus_setup_virtfn(zdev->zbus, pdev, zdev->vfn);
 +		zpci_iov_setup_virtfn(zdev->zbus, pdev, zdev->vfn);
-=20
+ 		pdev->no_command_memory =3D 1;
+ 	}
  }
 =20
  static int zpci_bus_add_device(struct zpci_bus *zbus, struct zpci_dev *zd=
ev)

--Sig_/sJfuOahk28wU5Tj00PRZfid
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9sIAsACgkQAVBC80lX
0GyOAgf+LjgOiCcwzMMnKNDvP6LkQyqCIbQbP34iL0HJKKZbGAqACogClUany100
3AIFhxmBwk//IHC4r0hINIrDgYF1S61pInBinqRbujAMKnzXtVucgn0k4/UXF483
tMYXj4KmkSI1k5d5VtEwDTRQrThNuNZ9c4aL2xQv4qWISjX8p2B4yhnYETeWkzMn
824FwYr7JIqgLSmLuwefy9gGpFmaOe5pv7NZsqdwMulXyJA5hr1yFChl9rihZkYG
TeLReCo88f7kvpsuwYQNfkV27l3t8wc7zJ4XftxRy79sFogVr7UJRUj3brBzP0It
1+K5TfpBFjqT2rs6vWfgaFeHqMYujw==
=idjt
-----END PGP SIGNATURE-----

--Sig_/sJfuOahk28wU5Tj00PRZfid--
