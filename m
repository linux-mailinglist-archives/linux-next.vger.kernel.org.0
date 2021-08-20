Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CB83F265C
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 07:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbhHTFOi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 01:14:38 -0400
Received: from ozlabs.org ([203.11.71.1]:37079 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231524AbhHTFOh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Aug 2021 01:14:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GrVD70z9pz9sWl;
        Fri, 20 Aug 2021 15:13:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629436439;
        bh=FFwMZyVDDJYkNVRW7LKZlhnTymbqMXwb4a751zBqNlI=;
        h=Date:From:To:Cc:Subject:From;
        b=X4IBDoEgYF/v01/iaadUuXSwPqVqKsZkzeWtfRDQdlJe48yGRadn6Iqc+sGyogvHx
         juPRtKMU8U7kuXm/KWG0lIf9+DzEP9DGR0L0Ht5Ay5q9Wc/bY5LXFSgrbhtNWL6l7u
         n7cbGieqjnso5rhwUxkjh2EDQzNDbeDdov+nI9RxBQvUMJWNf5N/mnaF4tPyXBMOIi
         s7tp+5YzNylydXjm/vysB5znp/9GqUTWuXXVawMDPvzj3F3+SoLLFXp//Grla5sGAH
         qPoqRq645IPM0hMeM8AfSH4IsLi+SHYy3llA8Vb6MBUctD4yv857SfJWRBbSeH+MsG
         cY1jZSJSlIPKA==
Date:   Fri, 20 Aug 2021 15:13:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kw@linux.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the driver-core tree with the
 pci-current tree
Message-ID: <20210820151357.793f0b31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VJ8bW44c/+v6Uw6lBiiCgHp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VJ8bW44c/+v6Uw6lBiiCgHp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  drivers/pci/pci-sysfs.c

between commit:

  045a9277b561 ("PCI/sysfs: Use correct variable for the legacy_mem sysfs o=
bject")

from the pci-current tree and commits:

  93bb8e352a91 ("sysfs: Invoke iomem_get_mapping() from the sysfs open call=
back")
  f06aff924f97 ("sysfs: Rename struct bin_attribute member to f_mapping")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/pci-sysfs.c
index 7bbf2673c7f2,f65382915f01..000000000000
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@@ -978,7 -978,7 +978,7 @@@ void pci_create_legacy_files(struct pci
  	b->legacy_mem->size =3D 1024*1024;
  	b->legacy_mem->attr.mode =3D 0600;
  	b->legacy_mem->mmap =3D pci_mmap_legacy_mem;
- 	b->legacy_mem->mapping =3D iomem_get_mapping();
 -	b->legacy_io->f_mapping =3D iomem_get_mapping;
++	b->legacy_mem->f_mapping =3D iomem_get_mapping;
  	pci_adjust_legacy_attr(b, pci_mmap_mem);
  	error =3D device_create_bin_file(&b->dev, b->legacy_mem);
  	if (error)

--Sig_/VJ8bW44c/+v6Uw6lBiiCgHp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEfOhUACgkQAVBC80lX
0GyO5Af/UHl0cfe5EahYTXVXZYteh8JEB59/RIpM/YApGllq9qEc3L7mDUkXthw6
YXXdJIVAhjkZMDKGOtNA7wiaPZzyk3iDZg49R9PQVw32Ux6KViubQInMA1mejrVb
8QlpbiST46IaYvx4l1muIPdLz+jzOadJzv8SR+HOPOPqj6c+B/Vk63JLygKNy/hy
OI7KO6Oaz7nDJVnw5LHZSLxn99CUEynOIhKcnRDemCalEJkXQdB0vgQFZ+8/wFjq
vlYz6vXUjtngD8bNQddR3VhTbY1LPTjw1tljuPX11yfqECoK0EiLBXh5QCEJxV45
uwDNpa5rM2QbBL1WrE8uLoPnFw76YA==
=NEys
-----END PGP SIGNATURE-----

--Sig_/VJ8bW44c/+v6Uw6lBiiCgHp--
