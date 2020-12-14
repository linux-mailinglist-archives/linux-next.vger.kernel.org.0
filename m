Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B9A2DA1C7
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503076AbgLNUkN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:40:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388128AbgLNUj4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 15:39:56 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F05BC0613D3;
        Mon, 14 Dec 2020 12:39:16 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvtXc4XVgz9sTL;
        Tue, 15 Dec 2020 07:39:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607978354;
        bh=xNRk9vCzobU5ytFmyBeryGq2ILq88SjE2MR9A3laYkI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=am8teifgBHQhs5j70Hw4GxEi7eCNHuncg6gp5exK2VLxCftMcf6xVd0B0ENYBJhRq
         vGcTRWskD5tRWQjVbc3DGOqoAI/tcOM3FKJW4dI1FtWG2g6zzRyjYUx9I2pXNqcZgi
         mge07LzuWjseD55BEzXB5Hhr+OqxynEoIupW/bejaWpgKvgfriv4nNMM9CCOHfXm+W
         2ZxAvFKH01sxB9StfxOt3xaqroXfCyf8KceQz0N8BAGirQdvGenAtxSEhV17xEKdUp
         sAQTBqcLlRLpxorWp08zq1Buie563UGt74FnSqFV6qYqrYNR949DTm0cU65IIC7gNG
         AUI9ygZtiLBWA==
Date:   Tue, 15 Dec 2020 07:39:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: linux-next: manual merge of the drm tree with the pci tree
Message-ID: <20201215073911.78ff2d2c@canb.auug.org.au>
In-Reply-To: <20201208132632.7c3a6a41@canb.auug.org.au>
References: <20201208132632.7c3a6a41@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PAmygmgGvxp39l6tC.N8h3S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PAmygmgGvxp39l6tC.N8h3S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Dec 2020 13:27:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/vga/vga_switcheroo.c
>=20
> between commit:
>=20
>   99efde6c9bb7 ("PCI/PM: Rename pci_wakeup_bus() to pci_resume_bus()")
>=20
> from the pci tree and commit:
>=20
>   9572e6693cd7 ("vga_switcheroo: simplify the return expression of vga_sw=
itcheroo_runtime_resume")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/vga/vga_switcheroo.c
> index 8843b078ad4e,1401fd52f37a..000000000000
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@@ -1039,12 -1038,8 +1038,8 @@@ static int vga_switcheroo_runtime_resum
>   	mutex_lock(&vgasr_mutex);
>   	vga_switcheroo_power_switch(pdev, VGA_SWITCHEROO_ON);
>   	mutex_unlock(&vgasr_mutex);
>  -	pci_wakeup_bus(pdev->bus);
>  +	pci_resume_bus(pdev->bus);
> - 	ret =3D dev->bus->pm->runtime_resume(dev);
> - 	if (ret)
> - 		return ret;
> -=20
> - 	return 0;
> + 	return dev->bus->pm->runtime_resume(dev);
>   }
>  =20
>   /**

This is now a conflict between the pci tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/PAmygmgGvxp39l6tC.N8h3S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XzW8ACgkQAVBC80lX
0Gy+LAf/Ui4yUuk+gLiSJLeGmLyFcjAXb9AL/Beuzyss9Wzd7sxc5J2xkwlCeI1m
wewPVrhBXOTN0m9ihjgPTYbQDEflueYUXE2Lgvye0D4TnMOOwZF7q9R7EBhDpDas
YK6hyq/paNbJ2KfkT89nVOqma44c4/zH1LO+aMZxNplJEOoVcTtTWDMwa+J4SyF3
XoNTj3r2SHxIdu4R42UGF58ZjG7W/URvFyAfJDmCG+saurE49Z6BISI0kKqIuupV
VHiSArKjwZ1IMltX85Pdp0i8QFSKy6uFS8vZflKIoKW0qmqi8cNa9eesHOe24tv2
65BfWTjTkXVLlg52ezqSsphDvwe2Lg==
=8k7E
-----END PGP SIGNATURE-----

--Sig_/PAmygmgGvxp39l6tC.N8h3S--
