Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F5E28C790
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 05:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729034AbgJMDcE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 23:32:04 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36735 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727831AbgJMDcE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Oct 2020 23:32:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9Lgy0G52z9sT6;
        Tue, 13 Oct 2020 14:31:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602559920;
        bh=pcqQKMqu/v6E7EW9EuyfTuERMjMjwKZutSMUE0Itlro=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LUc7dfuoAaYhBBjbGy5C2d1n2EdgA4ONDQgSTep7yVNHy07cY7MzwbdyDm2y58Wh+
         AnUDPBA1y/1E1zAGYzm6iZAG3MCryrC6LdCXSZBAKWgVpQqkm6vWuVcDJZan0KTt+6
         NDwxBOSaYnSnpmhbXTNxyif8FnagU9B9SpxEwiD1xWxLq1Ons5ToI8IVHY8Ca6VAAb
         pM/VT4bkVgnNeMuYDO9WyzQ8ykmnC1WKTqgwCu7lYIUYFH+VKJrCFMM7NpZN8iIgau
         fmXMKcMAoydTsqXp75ILSU8btP5jcxXtCz76bM0QMAN1sfkdnm46pdw6HIa43M+2/w
         Eay7OBoLaJtfA==
Date:   Tue, 13 Oct 2020 14:31:57 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Jon Derrick <jonathan.derrick@intel.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20201013143157.17997431@canb.auug.org.au>
In-Reply-To: <20200925152118.2afb794b@canb.auug.org.au>
References: <20200925152118.2afb794b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ou_=82KajkqloYjc_fX96qr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ou_=82KajkqloYjc_fX96qr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 25 Sep 2020 15:21:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   drivers/pci/controller/vmd.c
>=20
> between commit:
>=20
>   42443f036042 ("PCI: vmd: Create IRQ Domain configuration helper")
>=20
> from the pci tree and commit:
>=20
>   585dfe8abc44 ("PCI: vmd: Dont abuse vector irqomain as parent")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/pci/controller/vmd.c
> index 3c4418cbde1c,aa1b12bac9a1..000000000000
> --- a/drivers/pci/controller/vmd.c
> +++ b/drivers/pci/controller/vmd.c
> @@@ -304,50 -298,6 +304,50 @@@ static struct msi_domain_info vmd_msi_d
>   	.chip		=3D &vmd_msi_controller,
>   };
>  =20
>  +static void vmd_enable_msi_remapping(struct vmd_dev *vmd, bool enable)
>  +{
>  +	u16 reg;
>  +
>  +	pci_read_config_word(vmd->dev, PCI_REG_VMCONFIG, &reg);
>  +	reg =3D enable ? (reg & ~0x2) : (reg | 0x2);
>  +	pci_write_config_word(vmd->dev, PCI_REG_VMCONFIG, reg);
>  +}
>  +
>  +static int vmd_create_irq_domain(struct vmd_dev *vmd)
>  +{
>  +	struct fwnode_handle *fn;
>  +
>  +	fn =3D irq_domain_alloc_named_id_fwnode("VMD-MSI", vmd->sysdata.domain=
);
>  +	if (!fn)
>  +		return -ENODEV;
>  +
>  +	vmd->irq_domain =3D pci_msi_create_irq_domain(fn, &vmd_msi_domain_info,
> - 						    x86_vector_domain);
> ++						    NULL);
>  +	if (!vmd->irq_domain) {
>  +		irq_domain_free_fwnode(fn);
>  +		return -ENODEV;
>  +	}
>  +
>  +	return 0;
>  +}
>  +
>  +static void vmd_remove_irq_domain(struct vmd_dev *vmd)
>  +{
>  +	/*
>  +	 * Some production BIOS won't enable remapping between soft reboots.
>  +	 * Ensure remapping is restored before unloading the driver
>  +	 */
>  +	if (!vmd->msix_count)
>  +		vmd_enable_msi_remapping(vmd, true);
>  +
>  +	if (vmd->irq_domain) {
>  +		struct fwnode_handle *fn =3D vmd->irq_domain->fwnode;
>  +
>  +		irq_domain_remove(vmd->irq_domain);
>  +		irq_domain_free_fwnode(fn);
>  +	}
>  +}
>  +
>   static char __iomem *vmd_cfg_addr(struct vmd_dev *vmd, struct pci_bus *=
bus,
>   				  unsigned int devfn, int reg, int len)
>   {
> @@@ -717,12 -568,24 +717,18 @@@ static int vmd_enable_domain(struct vmd
>  =20
>   	sd->node =3D pcibus_to_node(vmd->dev->bus);
>  =20
>  -	fn =3D irq_domain_alloc_named_id_fwnode("VMD-MSI", vmd->sysdata.domain=
);
>  -	if (!fn)
>  -		return -ENODEV;
>  -
>  -	vmd->irq_domain =3D pci_msi_create_irq_domain(fn, &vmd_msi_domain_info,
>  -						    NULL);
>  -
>  -	if (!vmd->irq_domain) {
>  -		irq_domain_free_fwnode(fn);
>  -		return -ENODEV;
>  +	if (vmd->msix_count) {
>  +		ret =3D vmd_create_irq_domain(vmd);
>  +		if (ret)
>  +			return ret;
>   	}
>  =20
> + 	/*
> + 	 * Override the irq domain bus token so the domain can be distinguished
> + 	 * from a regular PCI/MSI domain.
> + 	 */
> + 	irq_domain_update_bus_token(vmd->irq_domain, DOMAIN_BUS_VMD_MSI);
> +=20
>   	pci_add_resource(&resources, &vmd->resources[0]);
>   	pci_add_resource_offset(&resources, &vmd->resources[1], offset[0]);
>   	pci_add_resource_offset(&resources, &vmd->resources[2], offset[1]);

This is now a conflict between the pci tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ou_=82KajkqloYjc_fX96qr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+FH60ACgkQAVBC80lX
0GzhvQf/SK2A93bwmefRKIkzgHCV4c/azFrXQkwZ6LEtLDyegjwEMAvvRx5nmUtn
4X6eQLKFzZXQaWKhhoG6yWZSVTbhqcX33pfTOj4jewTLDeXZzbK8jT10QSVUBjm/
w9Mb/1O+oiLYBzNaEyvBAwtn0e+gp4oXiiz3ZvcteHbgUWE6g1jZsRT9XxscysU3
/p77oEzkGAsSdYmrLMvemgh3fiZClLCnVeyRWHi0qMupwcDGdTmeT61Qqu8bNwbo
qKiPwwSsusEguiKYBWYm492RwkqmLSxyIC6bq456ZnU2IrNvZS6IfgwuVHoWbENU
aG+22WXJ6En3amw/NayyJOWil5ODTg==
=GRsx
-----END PGP SIGNATURE-----

--Sig_/Ou_=82KajkqloYjc_fX96qr--
