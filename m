Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9E9E271A57
	for <lists+linux-next@lfdr.de>; Mon, 21 Sep 2020 07:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIUFSO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Sep 2020 01:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgIUFSO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Sep 2020 01:18:14 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14098C061755;
        Sun, 20 Sep 2020 22:18:14 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bvt4d3x0Xz9sR4;
        Mon, 21 Sep 2020 15:18:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600665491;
        bh=Hh4xj2jPivYdeHaxLSo7KgWAKFpLMU7I7ybHbjiP3p0=;
        h=Date:From:To:Cc:Subject:From;
        b=W77gqC4LHd29lI3tnJ6105GoATQK6fROLOYQC1pBSY5zQHrJsmSW6B6Wh6EWJ66ej
         sZMOMH+8BCW+fyVA3KoQffXna/yTazZJ1aESp/cfyFrFtJAvcvuFogn6xZNYCXW1/z
         7sj7TEwA3Gl33YG8fywVpYEUaCWUaXO4ELmkTVTzgLpcUvN2q/DBYtgC7hCdGYbcEc
         oWuErpFKFjvj6wk39adf+EdOATpX5Uls9ZPREfyCxLtNbQyVLI0Dh0f11gQd4+AZ98
         bVD8srESt4Ppi9z/Wz21pzacfeVINe0wPc4MAnSskI3CSDu3ezmQBtUGjAZwUwBVJQ
         ZnelMZxzoHW6Q==
Date:   Mon, 21 Sep 2020 15:18:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Jim Quinlan <jquinlan@broadcom.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the usb tree with the pci tree
Message-ID: <20200921151807.637905c0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nqdGVLMfBAT8Rvf3qCHfRxy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nqdGVLMfBAT8Rvf3qCHfRxy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/pci/controller/pcie-brcmstb.c

between commit:

  1cf1b0a6dd95 ("PCI: brcmstb: Add bcm7278 register info")

from the pci tree and commit:

  f48cc509c935 ("Revert "PCI: brcmstb: Wait for Raspberry Pi's firmware whe=
n present"")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/controller/pcie-brcmstb.c
index 6e7aa82a54a3,bac63d04297f..000000000000
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@@ -1213,8 -929,6 +1211,7 @@@ static int brcm_pcie_probe(struct platf
  {
  	struct device_node *np =3D pdev->dev.of_node, *msi_np;
  	struct pci_host_bridge *bridge;
- 	struct device_node *fw_np;
 +	const struct pcie_cfg_data *data;
  	struct brcm_pcie *pcie;
  	int ret;
 =20

--Sig_/nqdGVLMfBAT8Rvf3qCHfRxy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9oN48ACgkQAVBC80lX
0GwlNAf+PGQHE3ysNK68/6po12G/AkWK40hqnzJNMPAsCX+3aBobVrVHHOQDn7dK
7Y5rUxgbxcFBnM7o0mSPOZUyA7lbS6jX3ZxLi6gT76FCD77BogZy28ZxA/cA3Q6S
QlAUKDK6Df5xp1wMfNbbCBLrDkHJ2zzaDa0leb+tpW4yAur2+zy56mic58NNPPkq
JYBx+9F9XVN7tgqDMNVqSGQPwksV0GcwPbYZQW1YLsw75nsKGBWJ+JjfT2Obhvds
k60T4Aeuh2BBrqQaSAzXIJd0icgdfKrphBsnGFNIA9bdphjYYrPxVv+gfKFPDJHf
wBselLMg04zOk0HZ6CE2AIqQVX0BiA==
=kk6c
-----END PGP SIGNATURE-----

--Sig_/nqdGVLMfBAT8Rvf3qCHfRxy--
