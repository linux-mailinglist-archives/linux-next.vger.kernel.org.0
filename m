Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FA3A2D42
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 05:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfH3DXQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 23:23:16 -0400
Received: from ozlabs.org ([203.11.71.1]:46815 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727110AbfH3DXQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 23:23:16 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46KPv557Yhz9sBp;
        Fri, 30 Aug 2019 13:23:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567135394;
        bh=DlMZpx9JLw6FpGJqnRsg4MduuAtGcbTRcEilo9uw5GE=;
        h=Date:From:To:Cc:Subject:From;
        b=Kndc677L4fmiJdjBupBs8cYaFIP/yLvhV9EKfpdOnX45XjiF/OwffAJYFgs4yJmt/
         ahtniWGlyjEV3hRDzYFIFyBbw6C5xsVsiI9hts9hYhVLFSK/gayScNI3+hgjVPtgMB
         h/BAbz/AQ93MKujKbJ8rKbwsiAKc26Szc5diCGeGx2OIW4ToeQpibA3MDBSVNLDeD7
         4rf2ekv0IA4+EoVRGyrwNlFNovkFrpKQL/UBMJ6jSAPop0LxtE24440jrELcHJzKUz
         TY96uPaXB8/QQ2AYh3dD+SLZyRzyK9vOABAGzvr+iq+jQL7WvQB+B5cJ9Mxv+xDmLL
         C6H6l5PZHukHQ==
Date:   Fri, 30 Aug 2019 13:23:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vidya Sagar <vidyas@nvidia.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: linux-next: build failure after merge of the pci tree
Message-ID: <20190830132311.7190ccc3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pGCNff_UST=WNs=d1cfgadG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pGCNff_UST=WNs=d1cfgadG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/pci/controller/dwc/pcie-tegra194.c:24:10: fatal error: linux/pci-as=
pm.h: No such file or directory
   24 | #include <linux/pci-aspm.h>
      |          ^~~~~~~~~~~~~~~~~~

Caused by commit

  81564976b1a9 ("PCI: tegra: Add Tegra194 PCIe support")

I have reverted that commit for todat.

--=20
Cheers,
Stephen Rothwell

--Sig_/pGCNff_UST=WNs=d1cfgadG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1olp8ACgkQAVBC80lX
0Gz8Xgf+OxfC7BXDr0MqFr8QdQPGKrsOf2IBzZKMiMeK4z1eU6OTB3q/3iaT7W/y
oBJfPWxig5KOa+r5zmJaDY6unrBw/pGt2Hz6SyCmK4w3Aek7piWJptas74ePgj2c
qX82CPcQiUm1ispZtWy6piukJKvjvvhUiFnDHKQCXyqyOiR8efo/PnAWEB9AWIij
9edR/Rp3dX3JL7Wou+yPaSitldQRzOPb1SjrY2/4sUY5BKKTRN2PVmlWjTysm00Z
FmtYbkEWj+s4jYwjFZsxIvDjIqmVFlPc/airgL1K2CRk2di7sNBzCfwX7St94Eoh
ispVOdGhhoaT+smsz/otOZeLjcpTMQ==
=8N99
-----END PGP SIGNATURE-----

--Sig_/pGCNff_UST=WNs=d1cfgadG--
