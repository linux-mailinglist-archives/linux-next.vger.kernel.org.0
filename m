Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFF1277FE1
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 07:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgIYFVY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 01:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgIYFVY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2020 01:21:24 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C89C0613CE;
        Thu, 24 Sep 2020 22:21:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ByKyR3z20z9sSn;
        Fri, 25 Sep 2020 15:21:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601011281;
        bh=+H5nUWljJRBaNENXePIudCpNjngfXPop9okM/POvnc4=;
        h=Date:From:To:Cc:Subject:From;
        b=gQXIYXiWEeA3zErWTueFoLQqlvh+2YS3L+xrz08UMktGbsxEBJn4yLEmdqU+bPtFx
         AkgYnA8Zmgr/eW5oAdJ0WU7TjN6qeUe3Xi0DhigdUuaSsPDznecy6QS175Xg0fzpBZ
         s/sOrKqslZthgjDUleZCeudbuBcQpOt67UvoMvxZaJz9ppDnmyQWd6YFvBsMMsyLL7
         BNn2ahGAY+v3/EZMPlXRF9YlDGXsOfjc4lxe3B/WBerBPJBbcc0OkHGl2DHpyfD58F
         ek2g7DRbJ0pMB/PEGE48R12+rmYoaIEjdoJxDpLqKk1Pe+awVct9LI5iL0PzhNF7HI
         NWAC8lQRBzLDA==
Date:   Fri, 25 Sep 2020 15:21:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Jon Derrick <jonathan.derrick@intel.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20200925152118.2afb794b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+4mRwibApBwnnRuTcECn04g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+4mRwibApBwnnRuTcECn04g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/pci/controller/vmd.c

between commit:

  42443f036042 ("PCI: vmd: Create IRQ Domain configuration helper")

from the pci tree and commit:

  585dfe8abc44 ("PCI: vmd: Dont abuse vector irqomain as parent")

from the tip tree.

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
index 3c4418cbde1c,aa1b12bac9a1..000000000000
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@@ -304,50 -298,6 +304,50 @@@ static struct msi_domain_info vmd_msi_d
  	.chip		=3D &vmd_msi_controller,
  };
 =20
 +static void vmd_enable_msi_remapping(struct vmd_dev *vmd, bool enable)
 +{
 +	u16 reg;
 +
 +	pci_read_config_word(vmd->dev, PCI_REG_VMCONFIG, &reg);
 +	reg =3D enable ? (reg & ~0x2) : (reg | 0x2);
 +	pci_write_config_word(vmd->dev, PCI_REG_VMCONFIG, reg);
 +}
 +
 +static int vmd_create_irq_domain(struct vmd_dev *vmd)
 +{
 +	struct fwnode_handle *fn;
 +
 +	fn =3D irq_domain_alloc_named_id_fwnode("VMD-MSI", vmd->sysdata.domain);
 +	if (!fn)
 +		return -ENODEV;
 +
 +	vmd->irq_domain =3D pci_msi_create_irq_domain(fn, &vmd_msi_domain_info,
- 						    x86_vector_domain);
++						    NULL);
 +	if (!vmd->irq_domain) {
 +		irq_domain_free_fwnode(fn);
 +		return -ENODEV;
 +	}
 +
 +	return 0;
 +}
 +
 +static void vmd_remove_irq_domain(struct vmd_dev *vmd)
 +{
 +	/*
 +	 * Some production BIOS won't enable remapping between soft reboots.
 +	 * Ensure remapping is restored before unloading the driver
 +	 */
 +	if (!vmd->msix_count)
 +		vmd_enable_msi_remapping(vmd, true);
 +
 +	if (vmd->irq_domain) {
 +		struct fwnode_handle *fn =3D vmd->irq_domain->fwnode;
 +
 +		irq_domain_remove(vmd->irq_domain);
 +		irq_domain_free_fwnode(fn);
 +	}
 +}
 +
  static char __iomem *vmd_cfg_addr(struct vmd_dev *vmd, struct pci_bus *bu=
s,
  				  unsigned int devfn, int reg, int len)
  {
@@@ -717,12 -568,24 +717,18 @@@ static int vmd_enable_domain(struct vmd
 =20
  	sd->node =3D pcibus_to_node(vmd->dev->bus);
 =20
 -	fn =3D irq_domain_alloc_named_id_fwnode("VMD-MSI", vmd->sysdata.domain);
 -	if (!fn)
 -		return -ENODEV;
 -
 -	vmd->irq_domain =3D pci_msi_create_irq_domain(fn, &vmd_msi_domain_info,
 -						    NULL);
 -
 -	if (!vmd->irq_domain) {
 -		irq_domain_free_fwnode(fn);
 -		return -ENODEV;
 +	if (vmd->msix_count) {
 +		ret =3D vmd_create_irq_domain(vmd);
 +		if (ret)
 +			return ret;
  	}
 =20
+ 	/*
+ 	 * Override the irq domain bus token so the domain can be distinguished
+ 	 * from a regular PCI/MSI domain.
+ 	 */
+ 	irq_domain_update_bus_token(vmd->irq_domain, DOMAIN_BUS_VMD_MSI);
+=20
  	pci_add_resource(&resources, &vmd->resources[0]);
  	pci_add_resource_offset(&resources, &vmd->resources[1], offset[0]);
  	pci_add_resource_offset(&resources, &vmd->resources[2], offset[1]);

--Sig_/+4mRwibApBwnnRuTcECn04g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9tfk4ACgkQAVBC80lX
0Gw/6wgAmMONqa451+uteXnnR03Cmqz5H3I6/O/qtDk+VKT2UeOx5IzLmUc47ksl
K3tc5fc935hZfzBsl/4JkBeXQt+t2pGTc7WzJH+fLqzgBEs200lz+8KZHHjn6al2
dgW5o5io5enuGQ3EungELQhURdIA7SDHa74vnsCbEjFtUwd1vqr0sNrLNgSPU1xq
pALm0mGI7aXE6eYN/2wQvzrUQAYtQ9wLSYvKJS6TkLBRLFd6IfeuX/aEwqYlVlEi
hPt0PKSjrN+hWqmKYDl3274t4AirAB3WFyfCHtBHz4FzT3YI534lbz1oRMqyBO4l
HVOtwotGf0troXOm2PGzH6/A5beiGQ==
=u2aK
-----END PGP SIGNATURE-----

--Sig_/+4mRwibApBwnnRuTcECn04g--
