Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC2A28FAD5
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 23:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731611AbgJOVsG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 17:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731609AbgJOVsG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 17:48:06 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22AC4C061755;
        Thu, 15 Oct 2020 14:48:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CC2vj1Zjnz9sTq;
        Fri, 16 Oct 2020 08:48:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602798482;
        bh=y+PyG7Pez8nHYgyOaKmZ+ioJh2g3Z1VEFlszf/9unr4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aP4+ObHWVuKgRIYz9cg8sR6QPkgncQon829e0u2MuC0sIeWZzvLwcPnqKq6uJ+p5t
         PchzDjgv40KSn4PByMmsdVkOBKVO+oo0qqItTgSlJ/iS44l95PA9QEvJBY42DDMKj8
         divQqOctPjv1W3yeyNwzZXdvunFUVfZ2FTM92LESOUJ+7vBQFSEFUaj+zElRagwwai
         U8H6PtU7geOo8b2lVJVBFu/xSrgoEM/lUY7newI7UXcZG/VuRLmNqxLGdPyAL+oHal
         GtPO7+bnKJpejOfwqL/khw5TH4t8dnf8He4NwzGs1rOBE6IX5Lj/r9BdLiqCovKzni
         CJeQRaJSO9TNg==
Date:   Fri, 16 Oct 2020 08:47:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Jim Quinlan <jquinlan@broadcom.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the pci tree
Message-ID: <20201016084759.7070223e@canb.auug.org.au>
In-Reply-To: <20200921151807.637905c0@canb.auug.org.au>
References: <20200921151807.637905c0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zu7+YcAPt0kAkgR4FprMCIX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zu7+YcAPt0kAkgR4FprMCIX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 21 Sep 2020 15:18:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the usb tree got a conflict in:
>=20
>   drivers/pci/controller/pcie-brcmstb.c
>=20
> between commit:
>=20
>   1cf1b0a6dd95 ("PCI: brcmstb: Add bcm7278 register info")
>=20
> from the pci tree and commit:
>=20
>   f48cc509c935 ("Revert "PCI: brcmstb: Wait for Raspberry Pi's firmware w=
hen present"")
>=20
> from the usb tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/pci/controller/pcie-brcmstb.c
> index 6e7aa82a54a3,bac63d04297f..000000000000
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@@ -1213,8 -929,6 +1211,7 @@@ static int brcm_pcie_probe(struct platf
>   {
>   	struct device_node *np =3D pdev->dev.of_node, *msi_np;
>   	struct pci_host_bridge *bridge;
> - 	struct device_node *fw_np;
>  +	const struct pcie_cfg_data *data;
>   	struct brcm_pcie *pcie;
>   	int ret;
>  =20

This is now a conflict between the pci tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/zu7+YcAPt0kAkgR4FprMCIX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Iw48ACgkQAVBC80lX
0Gx+IAf+NOsAtXjfjq2LeyM57QIkV0e531Cugye4XD97xydxAYnPTUfj89BbXfCg
JMD7RkTr37ZuNWZ1R2URb25PGMYzCp7QrJf/RPx9idHytWczGR+xu5IayaxESVAD
FVINkPlrafQSVxw+1YECE/RDJ8z/3qa8C5RbRotTzAXw+6R6fH8x3OJn6+CXVmAx
MGDMN4gxgMsw99yTfn4fc2i9hX5H+QDCM/FUeWaENJjSHANK37dJnwRnfRr31C/7
KjvdQ7ESBLq7LsugJvt0203Fmii6jHhtkooFVHKgdRHu2RkDnrGTIkTB+nn8p0bp
dHdB7s4I8jhNsv1BZhs+1ZRyfVA6oQ==
=6TLt
-----END PGP SIGNATURE-----

--Sig_/zu7+YcAPt0kAkgR4FprMCIX--
