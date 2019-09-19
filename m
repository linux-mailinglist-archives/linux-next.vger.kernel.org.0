Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAB4B7981
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 14:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732129AbfISMdT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 08:33:19 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:50636 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727980AbfISMdT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 08:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=9dVLk8mYKw+x1i+VluxLDR42ncrJQLoZD/uDAvBIMpY=; b=gcvBwYKPcbcwdG1iRPJRIY0kf
        Y4N7U97m3UB4BCeUqsVZL7JRaNlUagRGQriFq9lkW7mKqK6fZ3VcXjS7zkcXqbOWlZqPNwVnmODQp
        TbjxFq6CvhjbxreLJUXKxNPXKk+JzNxK1p5/FSDYhCSoCJ2C6eNuybmKO+G+EsdarqBcA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAvcY-0002VX-HM; Thu, 19 Sep 2019 12:33:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 77BED2742939; Thu, 19 Sep 2019 13:33:13 +0100 (BST)
Date:   Thu, 19 Sep 2019 13:33:13 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20190919123313.GI3642@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rWhLK7VZz0iBluhq"
Content-Disposition: inline
X-Cookie: I'll be Grateful when they're Dead.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--rWhLK7VZz0iBluhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/controller/pci-hyperv.c

between commits:

  348dd93e40c1 ("PCI: hv: Add a Hyper-V PCI interface driver for software b=
ackchannel interface")
  467a3bb97432 ("PCI: hv: Allocate a named fwnode instead of an address-bas=
ed one")

=66rom Linus' tree and commit:

  be700103efd1 ("PCI: hv: Detect and fix Hyper-V PCI domain number collisio=
n")

=66rom the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/pci/controller/pci-hyperv.c
index 0ca73c851e0fb,3a56de6b2ec2c..0000000000000
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@@ -2820,7 -2563,7 +2862,8 @@@ static int hv_pci_probe(struct hv_devic
  			const struct hv_vmbus_device_id *dev_id)
  {
  	struct hv_pcibus_device *hbus;
 +	char *name;
+ 	u16 dom_req, dom;
  	int ret;
 =20
  	/*
@@@ -3058,11 -2810,9 +3121,14 @@@ static void __exit exit_hv_pci_drv(void
 =20
  static int __init init_hv_pci_drv(void)
  {
 +	/* Initialize PCI block r/w interface */
 +	hvpci_block_ops.read_block =3D hv_read_config_block;
 +	hvpci_block_ops.write_block =3D hv_write_config_block;
 +	hvpci_block_ops.reg_blk_invalidate =3D hv_register_block_invalidate;
 +
+ 	/* Set the invalid domain number's bit, so it will not be used */
+ 	set_bit(HVPCI_DOM_INVALID, hvpci_dom_map);
+=20
  	return vmbus_driver_register(&hv_pci_drv);
  }
 =20

--rWhLK7VZz0iBluhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2DdYgACgkQJNaLcl1U
h9DkzQf9GyjkVXwgmMP8Ki3c0H+rjj77qVGaEzv1C7KuxVsoVhfmIdz2Oj7Sssyx
TRh8Yv02VF0k5s6OpUNeCuq/QBE99n0gYYanJ2xJOVOm2mTaD0rYMefvMzsjy1K9
Nb/M6PFPvPCUvjRVE8n7hPIDdxPWi7PgcuGylpllCa0SXgmdhB1KyvjCPqscBqGK
3m3YQhZ4xXxSIOih5dn0a5sppWUlAoOzVMU3zehPf9wkzbKL2jL08HDv0EHBH8No
hpVXff8QUMUdhj0ekPEidqqQN3fpkzPtYCJ2RfwcjzCUi1hpwt8WyI2zJJDqghKi
CqBKWgIfPM9+oKSVVltw3cZP0f822w==
=4YBs
-----END PGP SIGNATURE-----

--rWhLK7VZz0iBluhq--
