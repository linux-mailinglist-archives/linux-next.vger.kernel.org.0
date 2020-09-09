Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A7226253F
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 04:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgIIChS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 22:37:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41003 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726642AbgIIChR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Sep 2020 22:37:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmR4S3g1Vz9sTS;
        Wed,  9 Sep 2020 12:37:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599619033;
        bh=FL5nwqAWFyPt4AMztoRWQ0zk8xgjuSYriYFeHSMcZB8=;
        h=Date:From:To:Cc:Subject:From;
        b=UljvDt04Ms50mGKijhgnNZ37d2MnUoimZGJlGULAmFw68Mt+xIvosHWmJDCNmpmDa
         R4GHWW+0ezQjOH4gaay0pIAXUQXLujLuZc8QC2zz4ty70SojrS9PWRqGljMWcPfRwO
         Iv9Pfez18ESZ0ooZcPIY9N+LeoqE9bplGWuoJis3NxuMNOUnHb23wAyG/aCuXBUVhp
         gzI9m1Akix4iWQtD2FJhpxfta9uGwsXq2OtxMH8ZlHm6lHev72Vk8AXsjs9Xvy8km7
         sYcwn5RuhMwBmpNn6IXcaxUSPJ2Uy/eVxI4AdTQERljW6rBU2k2g8of2a9yOP2bE5T
         AbIMz5WK/ePGA==
Date:   Wed, 9 Sep 2020 12:37:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the pci tree
Message-ID: <20200909123710.50b16d37@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x_Kj6nw1HxNxyZoRhN7ikuo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/x_Kj6nw1HxNxyZoRhN7ikuo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/pci/controller/dwc/pci-dra7xx.c: In function 'dra7xx_pcie_establish=
_link':
drivers/pci/controller/dwc/pci-dra7xx.c:142:6: warning: unused variable 'ex=
p_cap_off' [-Wunused-variable]
  142 |  u32 exp_cap_off =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
      |      ^~~~~~~~~~~

Introduced by commit

  3af45d34d30c ("PCI: dwc: Centralize link gen setting")

--=20
Cheers,
Stephen Rothwell

--Sig_/x_Kj6nw1HxNxyZoRhN7ikuo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9YP9YACgkQAVBC80lX
0GxYDgf9HwE0AL3bNIZ2iNsV0hHFKEXpNzlXet0XFRNM8ccvH98vD4bn1xaXAjeW
CLTMnxPBq8GB+leO+vC+cIsJ+fHieAfDP4LlZtScaAqUVnyLj+Ck4fLG2NA/iuAb
cSpF4Lepad7coLuM5awB8hdSxnxXas7x3qnuV51Nkgo6+ZEY8qoHEKsHP0BhX2vy
5vqhjWKxTIWHuSLr80idXzTt3a/r6zW4ErVCegwtR9QGHVsOEi4cbeaUxVwnSpFx
If/IM1MYxO7SI6BQ/e77VC7LoywPNNs+Y5iI8XyxX350ccPOULUJgxx3BRWigrjR
XCyd2Ac+JeUexHtZ2pCS2WQc8msjcQ==
=zdjR
-----END PGP SIGNATURE-----

--Sig_/x_Kj6nw1HxNxyZoRhN7ikuo--
