Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76AD423020B
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 07:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgG1FtJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jul 2020 01:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgG1FtJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2020 01:49:09 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677D4C061794;
        Mon, 27 Jul 2020 22:49:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BG5Mj6hMwz9sTm;
        Tue, 28 Jul 2020 15:49:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595915346;
        bh=7pmVD8Xdvv4c9LCnzIqpgqptaxY1J/8r1eRxOVHym24=;
        h=Date:From:To:Cc:Subject:From;
        b=iAV/XMBQKiPYSh+PsNrDpamjdpVDsZvLA2MyoC6R6WA+r5wty37lisenAPTpivjQP
         E3+AW2NzRQW8h3Q67PyhE2DSD6mogXFBZjYOkQgV6rtTx3ksuomA18RXR92P2buCgU
         dbUuFmnzcpxbeLglppi6RWRXhjybqwzUkdLjhkdO5y26FRTqPxz1SXEkCky3BFNmYB
         4+DGiQU2GP7GjVwhIGknVfFWmyMjxmNAxc7kPOWwcCk6sHAeSyNeyroY3OSZ6zBhFN
         HgsNBJHaO9/qs+ncoinq6s2TRewFxaYVGioPRDvnznh6zZKlOCyWZG2z3hrkMjMbiL
         T9/9q1H2iVBdg==
Date:   Tue, 28 Jul 2020 15:49:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: linux-next: manual merge of the devicetree tree with the pci tree
Message-ID: <20200728154903.51a60b8e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qzxUCl99eEfApvkgx+E75GL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qzxUCl99eEfApvkgx+E75GL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/pci/qcom,pcie.txt

between commits:

  736ae5c91712 ("dt-bindings: PCI: qcom: Add missing clks")
  b11b8cc161de ("dt-bindings: PCI: qcom: Add ext reset")
  d511580ea9c2 ("dt-bindings: PCI: qcom: Add ipq8064 rev 2 variant")

from the pci tree and commit:

  70172d196947 ("dt-bindings: pci: convert QCOM pci bindings to YAML")

from the devicetree tree.

I don;t know how to fixed it up so I just left the latter one . This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/qzxUCl99eEfApvkgx+E75GL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8fvFAACgkQAVBC80lX
0GyZGwf/dObb8tS2w5gHpUiENUNXKmqVUovTJzGcrtrG7AO4dwIcSq/DQ9SE773W
dU7X2BF9Deo5BHNj7x+2o4759mRpYAaBU1q3mdc8te9/1RUgWHmyeyJMVgKF8B7n
/UhNx68ITaoiFNVU6UFviHNKR5XIWxPCgsXtmeF7NRUYfcuJHa0vOX4SM8Gh6e1q
AfZRUFr7dJXnWr8X9CeSwxpuDjNv16YOVonLOTSxkmaQETA/Xg2AH38YInjOSKYm
IC+zQK+i/aCHWm/ck0lCEpeTIgrZnbMVaYhPWGTsi0106fU7a2JbHK6gxJoVTgM0
CTdRa8gC7OX5E6jV8h4qcU/LhPtDpw==
=c64L
-----END PGP SIGNATURE-----

--Sig_/qzxUCl99eEfApvkgx+E75GL--
