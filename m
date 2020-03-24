Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F6C191DCC
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 00:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgCXX6H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Mar 2020 19:58:07 -0400
Received: from ozlabs.org ([203.11.71.1]:45161 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727102AbgCXX6H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Mar 2020 19:58:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48n7VM5VrYz9sPR;
        Wed, 25 Mar 2020 10:58:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585094285;
        bh=iTrfw4pZsF5SHP+vx5dIJNtqfgY/gSyiWePmLr2G+mY=;
        h=Date:From:To:Cc:Subject:From;
        b=dE2Mu/Aseg5reZ4nL6SuoO2U5kTjzOApduDtpVpZ1W0rW2I3AwAVEgGWYmAud/b+k
         ZZOEdUmbXsNvORdhZksJrNgC524kwcLh5nEDRzuaUGEwh8qVpfUoYqtV/ttpgDAB1E
         LebFmlqJASCaOlCIoP56Fwq5euYKExcVYNeSFFmUFsbg5cOLWGswEikgwcFVlt4XG6
         ty4+X83qHUZqGl7r8hfBOlGN2tHyp/Ci87sYaRDB8I8cIgahD4vKupq8awso51LK7n
         pHTH5QY9Z6L9f/l9K0BKjIyvgwd5ihpL+oJyL+Rs0TxRKRZcP4FJulGy3XORRO+/wf
         RTUj+Aczs4Nlg==
Date:   Wed, 25 Mar 2020 10:58:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20200325105800.12716fcf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cQFlObfw3Gf7xl2wq2+UTuA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cQFlObfw3Gf7xl2wq2+UTuA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  MAINTAINERS

between commit:

  5901b51f3e5d ("MAINTAINERS: Correct Cadence PCI driver path")

from Linus' tree and commit:

  11be8af70d86 ("dt-bindings: PCI: Convert PCIe Host/Endpoint in Cadence pl=
atform to DT schema")

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

diff --cc MAINTAINERS
index d8fc7bb5f784,fc2fc22dbc8b..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -12754,8 -12739,8 +12754,8 @@@ PCI DRIVER FOR CADENCE PCIE I
  M:	Tom Joseph <tjoseph@cadence.com>
  L:	linux-pci@vger.kernel.org
  S:	Maintained
- F:	Documentation/devicetree/bindings/pci/cdns,*.txt
+ F:	Documentation/devicetree/bindings/pci/cdns,*
 -F:	drivers/pci/controller/pcie-cadence*
 +F:	drivers/pci/controller/cadence/
 =20
  PCI DRIVER FOR FREESCALE LAYERSCAPE
  M:	Minghuan Lian <minghuan.Lian@nxp.com>

--Sig_/cQFlObfw3Gf7xl2wq2+UTuA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl56nogACgkQAVBC80lX
0Gw/OAgAo/nKNkKB+KUEaemL/UG1iRjAFPAFtEKeknMmnLc6Jd+9mSU+jPKbrHhW
q6H3Hw650VqVKuezPDmTUuCEKwU0TZZF6qbnbyFGDA4SU36qhlt4XW7qkFaf/2fh
g7xZH7EoD9DsknBNYfMYny0Q4eYRoJJIj2tXUEN0OCRJTEreMUi72WYpX7AtU68K
r+XQ/LH2LgJ0DJUVLG3kK79textsjNrTLstkkklIvn4v0bDGvRlG9x+0P+IF/dpr
hB4zSBkf2BgQ4W8Rc2VXmxkHyDSE3PPJbBVBnjWWj08QFwVrXCEUXjLmBMOlBXDc
UfmkJ7J8TqNlMTeEoTaak0bgUIp9Vg==
=Nzob
-----END PGP SIGNATURE-----

--Sig_/cQFlObfw3Gf7xl2wq2+UTuA--
