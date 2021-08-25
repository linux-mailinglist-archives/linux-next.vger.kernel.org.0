Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157F63F6CD6
	for <lists+linux-next@lfdr.de>; Wed, 25 Aug 2021 02:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235748AbhHYA6c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 20:58:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40849 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231552AbhHYA6c (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Aug 2021 20:58:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GvSJ66YyZz9sWl;
        Wed, 25 Aug 2021 10:57:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629853063;
        bh=LKzzNu1B6oO7OWbw8m1pg0b96ufNvNad45RG+/Gy9O4=;
        h=Date:From:To:Cc:Subject:From;
        b=Z9MuQTFcaHOk+Hy83IEpUTt3ydqjo3yEMcH3aGEdWtVhyR7tYMIkycQHrblm0viMS
         B8HJvaB00oA5VbgJCZTkCguUffHVi428/UvrgHp5b0lS4ezMUSNUSLf/Gij7RzzYcT
         bjFpJBczR2EQvVOmRiFJyU1DlXf1w0qX5hS/F2OuSeSCTeDHaQEU3f0TIw3ofsjEvh
         rGopMmAA3qnVZf5+ksFTodzdlqUTAarWV6vf98viyVbDEOhpkGqXZzP34ISMVJjZjt
         VP4AgnhiVw2secQz5SOBGWOvQIlvjMqzPHQoXA3vB4eA0lOiHlP2DnESJP/WCkVxcm
         /2qg5ckBHbScw==
Date:   Wed, 25 Aug 2021 10:57:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rahul Tanwar <rtanwar@maxlinear.com>,
        Srikanth Thokala <srikanth.thokala@intel.com>,
        Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Message-ID: <20210825105741.4ee2fa1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jFu=OuqXXYt.e=cyn4P6Azj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jFu=OuqXXYt.e=cyn4P6Azj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  MAINTAINERS

between commit:

  e2f55370b422 ("MAINTAINERS: Add Rahul Tanwar as Intel LGM Gateway PCIe ma=
intainer")

from Linus' tree and commit:

  0c87f90b4c13 ("PCI: keembay: Add support for Intel Keem Bay")

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
index 0e03d2903c07,23e614e9c669..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -14463,13 -14422,13 +14463,20 @@@ S:	Maintaine
  F:	Documentation/devicetree/bindings/pci/hisilicon-histb-pcie.txt
  F:	drivers/pci/controller/dwc/pcie-histb.c
 =20
+ PCIE DRIVER FOR INTEL KEEM BAY
+ M:	Srikanth Thokala <srikanth.thokala@intel.com>
+ L:	linux-pci@vger.kernel.org
+ S:	Supported
+ F:	Documentation/devicetree/bindings/pci/intel,keembay-pcie*
+ F:	drivers/pci/controller/dwc/pcie-keembay.c
+=20
 +PCIE DRIVER FOR INTEL LGM GW SOC
 +M:	Rahul Tanwar <rtanwar@maxlinear.com>
 +L:	linux-pci@vger.kernel.org
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/pci/intel-gw-pcie.yaml
 +F:	drivers/pci/controller/dwc/pcie-intel-gw.c
 +
  PCIE DRIVER FOR MEDIATEK
  M:	Ryder Lee <ryder.lee@mediatek.com>
  M:	Jianjun Wang <jianjun.wang@mediatek.com>

--Sig_/jFu=OuqXXYt.e=cyn4P6Azj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEllYUACgkQAVBC80lX
0GxwWAf/WYi4pDc/xU6oDQkul7a80hZytXM7u8hfavwR/UNNFycsenCVnk4GIKpt
XnB+1uy0QHvaAsKfcQ9nmoeqRZ+MUIskiriXHvRwM0W7m1Ex7alSwfumhorGWlRL
oJSTxS92r6N8o4QYY6dDkV26cKh2kKMOZex+GetbTi29hN4rf+MCoxmJYSUadsRU
oL6g+yL5yLZVmHRoQ5hwswmZ+t0/B8A1ZCvb4W1+lvHE+KDgrsuEllZzjb41zPh+
HOsu0Kefm3qLeUEJIK2IryM++OMK2+nNZOks4am8vzQWAzZENBPfGPfFRehatNrl
A38lZqIT3jYSLf3hB5LwKUJoMsk2zw==
=C/Wc
-----END PGP SIGNATURE-----

--Sig_/jFu=OuqXXYt.e=cyn4P6Azj--
