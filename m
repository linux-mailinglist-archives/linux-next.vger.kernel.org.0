Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE21729554E
	for <lists+linux-next@lfdr.de>; Thu, 22 Oct 2020 01:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442349AbgJUXqR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 19:46:17 -0400
Received: from ozlabs.org ([203.11.71.1]:51625 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442347AbgJUXqR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Oct 2020 19:46:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CGnFL1KcCz9sSn;
        Thu, 22 Oct 2020 10:46:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603323974;
        bh=kyztA3gDwEIjcE/H8P2RDcYyXZTsNoDKGn9tH3ysgxM=;
        h=Date:From:To:Cc:Subject:From;
        b=qYTmN+kJBwi6KY9d9hXIbEaRg/nRNY+oEizRdR4LnMc7n4qEfRVoMB7P4LyB6UXp/
         yvDq+yjhqWagv1U7qCR6SU8hG8LHBKEi/snxS8UtP4NCUFquLQ+U0rEK24NGLKTTT6
         28O85iX9PAroCWlDYlLJBfTDy0JOVjSicgQVDTSaE1ChA42DMsSsF9tQQtZ4VmoBIZ
         GITHPgI7rfe9tH4lr/2wZspN3L9FDgKi19Ilmwtslsosrjj2Q+ORMb8/JfernaUVbn
         FVJR8AYt2mMFi5Dxs4noSzXF3PweU/A0V5rDhYG7WHV1lzuU4rGesAz42i9exuM1Iz
         Y1AeTYfZgX9PQ==
Date:   Thu, 22 Oct 2020 10:46:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Jon Derrick <jonathan.derrick@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: linux-next: manual merge of the pci tree with the origin tree
Message-ID: <20201022104613.7ccfd540@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9/Io6Y=Uly8TY0P2q2_59hc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9/Io6Y=Uly8TY0P2q2_59hc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

FIXME: Add owner of second tree to To:
       Add author(s)/SOB of conflicting commits.

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/controller/vmd.c

between commit:

  585dfe8abc44 ("PCI: vmd: Dont abuse vector irqomain as parent")

from the origin tree and commit:

  1552b11ba15e ("PCI: vmd: Create IRQ Domain configuration helper")

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

diff --cc drivers/pci/controller/vmd.c
index aa1b12bac9a1,c8d46bd01e87..000000000000
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@@ -298,6 -298,34 +298,34 @@@ static struct msi_domain_info vmd_msi_d
  	.chip		=3D &vmd_msi_controller,
  };
 =20
+ static int vmd_create_irq_domain(struct vmd_dev *vmd)
+ {
+ 	struct fwnode_handle *fn;
+=20
+ 	fn =3D irq_domain_alloc_named_id_fwnode("VMD-MSI", vmd->sysdata.domain);
+ 	if (!fn)
+ 		return -ENODEV;
+=20
+ 	vmd->irq_domain =3D pci_msi_create_irq_domain(fn, &vmd_msi_domain_info,
 -						    x86_vector_domain);
++						    NULL);
+ 	if (!vmd->irq_domain) {
+ 		irq_domain_free_fwnode(fn);
+ 		return -ENODEV;
+ 	}
+=20
+ 	return 0;
+ }
+=20
+ static void vmd_remove_irq_domain(struct vmd_dev *vmd)
+ {
+ 	if (vmd->irq_domain) {
+ 		struct fwnode_handle *fn =3D vmd->irq_domain->fwnode;
+=20
+ 		irq_domain_remove(vmd->irq_domain);
+ 		irq_domain_free_fwnode(fn);
+ 	}
+ }
+=20
  static char __iomem *vmd_cfg_addr(struct vmd_dev *vmd, struct pci_bus *bu=
s,
  				  unsigned int devfn, int reg, int len)
  {
@@@ -568,24 -674,10 +674,16 @@@ static int vmd_enable_domain(struct vmd
 =20
  	sd->node =3D pcibus_to_node(vmd->dev->bus);
 =20
- 	fn =3D irq_domain_alloc_named_id_fwnode("VMD-MSI", vmd->sysdata.domain);
- 	if (!fn)
- 		return -ENODEV;
-=20
- 	vmd->irq_domain =3D pci_msi_create_irq_domain(fn, &vmd_msi_domain_info,
- 						    NULL);
-=20
- 	if (!vmd->irq_domain) {
- 		irq_domain_free_fwnode(fn);
- 		return -ENODEV;
- 	}
+ 	ret =3D vmd_create_irq_domain(vmd);
+ 	if (ret)
+ 		return ret;
 =20
 +	/*
 +	 * Override the irq domain bus token so the domain can be distinguished
 +	 * from a regular PCI/MSI domain.
 +	 */
 +	irq_domain_update_bus_token(vmd->irq_domain, DOMAIN_BUS_VMD_MSI);
 +
  	pci_add_resource(&resources, &vmd->resources[0]);
  	pci_add_resource_offset(&resources, &vmd->resources[1], offset[0]);
  	pci_add_resource_offset(&resources, &vmd->resources[2], offset[1]);

--Sig_/9/Io6Y=Uly8TY0P2q2_59hc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+QyEUACgkQAVBC80lX
0GwtDAgAmVUBAnX34862IaS8icR2n33zoKVrTtzdSLVyeurMYOJ1fE/h+T6SYMUq
JR/30yaF89DSp0Ixf449KpArTry5O0EE3yWjATq5i8wrhp/35rUR+VSDfYEBnIcW
1h4CFehSpEirrHWu/N1BhZW+XqgW0T46+IzV6buNWYzyOqvT/+Tqnx0kKOrEmPwI
gWfP/OUGHQd/TTztBz1VLaJvRvK8R3qC40FVN8KNffVYxQ3lyd2EGDiOqw0MgLa6
GKge+l/i5j06IQjfy4tkBtr2SV5E5j72oNTZgkDdxc92SK37kBj/kZXq/k+MkDyG
U1WwePwRhor7IIfTqJxksUE5WgEJ8g==
=1V/M
-----END PGP SIGNATURE-----

--Sig_/9/Io6Y=Uly8TY0P2q2_59hc--
