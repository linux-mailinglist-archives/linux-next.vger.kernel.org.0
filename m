Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF8DA97138
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 06:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725283AbfHUEmE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 00:42:04 -0400
Received: from ozlabs.org ([203.11.71.1]:57315 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbfHUEmE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Aug 2019 00:42:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Cw495LSXz9s00;
        Wed, 21 Aug 2019 14:42:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566362521;
        bh=c2ZA7UuGe1Jz51uUDHrUKKg420FVgPBPVw/Mn6rVOvw=;
        h=Date:From:To:Cc:Subject:From;
        b=kMmEHoPlFEUoGGyFj2UY2VjSsRSjyqiDy676CxJamLBacx5YYA/vE8EJxYxzdwp9/
         nowWw05L8SjsHhRig4E0D7cys2u0TzqxHaRvcZlGY97qVMlC7zs9JP3OjscyQprey4
         gbVnOs0xYSsZ8youpLY8O/GvOxAA43df89MNU04XVqTd3vw5J3J9TbKeX69xWVldTI
         I0mrQTSKo33YdfvWe8stQFbvWhxLUlsU39ipo/vZA/etpzzlVbp4d+605roC5VCMIY
         CuLN5jyRXib/C24f4kuu1isfF4l3ljOtN7WF5uOsoQ9g/fjcR5x2yBH1W/feOGzkZX
         Ou94zzEFeHWtA==
Date:   Wed, 21 Aug 2019 14:42:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <marc.zyngier@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: linux-next: manual merge of the irqchip tree with the pci tree
Message-ID: <20190821144200.7192b3a4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tdFKtA5bSqO30zf4t7_Rwin";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tdFKtA5bSqO30zf4t7_Rwin
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the irqchip tree got a conflict in:

  drivers/pci/controller/pci-hyperv.c

between commit:

  44b1ece783ff ("PCI: hv: Detect and fix Hyper-V PCI domain number collisio=
n")

from the pci tree and commit:

  467a3bb97432 ("PCI: hv: Allocate a named fwnode instead of an address-bas=
ed one")

from the irqchip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/controller/pci-hyperv.c
index 3a56de6b2ec2,97056f3dd317..000000000000
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@@ -2563,7 -2521,7 +2563,8 @@@ static int hv_pci_probe(struct hv_devic
  			const struct hv_vmbus_device_id *dev_id)
  {
  	struct hv_pcibus_device *hbus;
 +	u16 dom_req, dom;
+ 	char *name;
  	int ret;
 =20
  	/*

--Sig_/tdFKtA5bSqO30zf4t7_Rwin
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1cy5gACgkQAVBC80lX
0GxEjwf7B9JeDD7sR40T5sEE+XzFOOy6xkyorNU2attK2PW7bZ2QG5OKbns+ip8p
rad1CrQFzUjeBzusakWsavi4FOidQrS7ETFhVuJKeGCWZ3PrlMLouWCcDemsrq+A
pyvlx11HCr5UGYs/i5XQWgqTo1mq6FeaAOiJqwHitTUZ4iNQhp5Bgk+cATpocPj9
kbthcNIN8brsnT7OSVJ11Gfz3yNbqLLVG0EHpo5OihF+4Om5MpPVe9dAloygng49
sQsYuxA0qPi9VrQF86tqnX19mtBMte6QN8iDkGDscdNDwAXF+JTZgulhRWUqMn3H
5rE5SY+4NLoTsU8g9rF1BjAHFpvVOQ==
=F8xl
-----END PGP SIGNATURE-----

--Sig_/tdFKtA5bSqO30zf4t7_Rwin--
