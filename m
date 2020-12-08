Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B3D2D20CF
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 03:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgLHC2j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 21:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbgLHC2i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 21:28:38 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93893C061793;
        Mon,  7 Dec 2020 18:27:58 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqkcC1YMnz9sVl;
        Tue,  8 Dec 2020 13:27:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607394476;
        bh=Gdnq684lFz9atgY1eOCUXr2MAA6CAdhLY3wRaXZ8zAQ=;
        h=Date:From:To:Cc:Subject:From;
        b=hZbvXxLnnkungkLgzMGYvh+9zf8f2Ys0Y3qZNCbE2l9kvCv+MINgu+w+HYapZuhdM
         QyghCZmmZoWFBOPERilNlXqCY3qAc042jjFvHcCVcj4gKQk42puS+k5O5QmXOo4Hst
         aDedSVwd4REUhOg7y3g/SV2LErlO8UI7mxIhtQUIKGGdJwyUvebVQ3DMfyTqafhEdy
         17i1xUJuspPAvJ1HzTLkK84XKnLtAxBIUwO7qzDR7gkIbsnDBzKxIIb0eFsfYIoUC3
         N1Sy3KgKBvYkOkVEjEdmPggAPhCVSm5GHvbsQlOjG2Rt453KYFg0Rl7ouM5bSVVMj/
         uOvO8CsJbkpGQ==
Date:   Tue, 8 Dec 2020 13:27:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: linux-next: manual merge of the drm tree with the pci tree
Message-ID: <20201208132632.7c3a6a41@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wlM0Vl045sL0mWGkCn0hMk+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wlM0Vl045sL0mWGkCn0hMk+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/vga/vga_switcheroo.c

between commit:

  99efde6c9bb7 ("PCI/PM: Rename pci_wakeup_bus() to pci_resume_bus()")

from the pci tree and commit:

  9572e6693cd7 ("vga_switcheroo: simplify the return expression of vga_swit=
cheroo_runtime_resume")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/vga/vga_switcheroo.c
index 8843b078ad4e,1401fd52f37a..000000000000
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@@ -1039,12 -1038,8 +1038,8 @@@ static int vga_switcheroo_runtime_resum
  	mutex_lock(&vgasr_mutex);
  	vga_switcheroo_power_switch(pdev, VGA_SWITCHEROO_ON);
  	mutex_unlock(&vgasr_mutex);
 -	pci_wakeup_bus(pdev->bus);
 +	pci_resume_bus(pdev->bus);
- 	ret =3D dev->bus->pm->runtime_resume(dev);
- 	if (ret)
- 		return ret;
-=20
- 	return 0;
+ 	return dev->bus->pm->runtime_resume(dev);
  }
 =20
  /**

--Sig_/wlM0Vl045sL0mWGkCn0hMk+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/O5KoACgkQAVBC80lX
0GyHNwgAjCac81ZtbZtstu/Gjqw5/GfHTHKRcW4TbLX4TXUgLFFkYKeXljFP4cve
q5CYQHeQo8Kh6fl3pbj0934BYUZcDSuFQgm5r7MKCAURB0Qkp5xTrKyZjnZu3oUO
q4qxK/Ljhzqu9sqTcMHOB8iDweUkPYn0BnYx/+W/gr8++rPlnNxjMUY8W+Eii1hW
fe9T6K0YuA2xpE0pTb97Hn4DgWQOv1IPiPAjoY//KxeVedV3VZuNPeNCKG/xefM6
ArZvkW1HhZk4rZsPzAyvudQbW4O9Jc3o99EdmRDos1jv6GjI70wUWIYBMre1//zh
BQkkw4LerfwLQByhsI3owyNrWIaiMQ==
=r5+o
-----END PGP SIGNATURE-----

--Sig_/wlM0Vl045sL0mWGkCn0hMk+--
