Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1205239D3F
	for <lists+linux-next@lfdr.de>; Mon,  3 Aug 2020 03:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgHCBgZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 2 Aug 2020 21:36:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59139 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbgHCBgZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Aug 2020 21:36:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKgTL2gDjz9sR4;
        Mon,  3 Aug 2020 11:36:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596418583;
        bh=PRtsXniWkKEieJSVsKxBiZKfDhPg+R812rt3/H5ilng=;
        h=Date:From:To:Cc:Subject:From;
        b=hcPAvsm8wAYGTFUcmfMccEOFBqkr0Sk8f+r/ivr9M9k8B/fW+thcqscRwaOjFvp9f
         SBS7jiPTsC2boud5fzqCCUHuBNGxLtXx3sfAMdp2dUCLXC8ec18irlTvjW1q5R6Jba
         teGE6b6bhAYVdfJCgj6oAIlyQbKu+7bFQsZl+fuU5tLGc+L7qXcMb+PX51q/a7O+Zn
         MASJQG1X39nZlwqlWIx9kUmkynQEA42983JiUa7cnQh9t81d76yhQFYZjkhU4/La+M
         lhy+C1SAH+WKx8UAvTtFygSDTuyG7dJHuY9bqJgwvsDU3RmJbjzK9oOTtPN4uBlZTM
         TKli57O0DdE3A==
Date:   Mon, 3 Aug 2020 11:36:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>
Subject: linux-next: build failure after merge of the pci tree
Message-ID: <20200803113620.25de9de3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zyqByTSa56DhGmoVC3dav1t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zyqByTSa56DhGmoVC3dav1t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/pci/controller/pcie-xilinx-cpm.c: In function 'xilinx_cpm_pcie_prob=
e':
drivers/pci/controller/pcie-xilinx-cpm.c:553:8: error: implicit declaration=
 of function 'pci_parse_request_of_pci_ranges' [-Werror=3Dimplicit-function=
-declaration]
  553 |  err =3D pci_parse_request_of_pci_ranges(dev, &bridge->windows,
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  f0fdb84da7a9 ("PCI: Move DT resource setup into devm_pci_alloc_host_bridg=
e()")

interacting with commit

  e5672b8109a9 ("PCI: xilinx-cpm: Add Versal CPM Root Port driver")

I have used the pci tree from next-20200731 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/zyqByTSa56DhGmoVC3dav1t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8nahQACgkQAVBC80lX
0Gz0iwf/Z37CX1IIpP4V8rCT655N2AFijLY5FCx2zzyzdVLqB+PFYyLyrtYfyImS
IZ126InkSLzeZyY7+MEEP6nN7x1xceqqGj44APzN7PkOQxp3kcb0P9WT8IeqAKcV
GRbpOoyI91E51D7OWGK5O86ICuTJvUP7AzpBxaOhy8MDCtXbZqTq45WrBbKAw8Us
3SqiPzvmkYYU2alB4Oxr4ywRlMHK27xIQRy2Fz9400zVLe8ZVG/gCOv/LqObJ5zH
3zI3gjoCclIi2xaTejj/2y+1g3EBNLzGmDmJpxZ/hjx5wF5gXZpVypGY0K28SUBr
8JlMHOgye29X8nv4Jgg4q96z+db1UA==
=Lhv6
-----END PGP SIGNATURE-----

--Sig_/zyqByTSa56DhGmoVC3dav1t--
