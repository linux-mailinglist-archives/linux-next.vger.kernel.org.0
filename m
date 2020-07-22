Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A393228DB1
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 03:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgGVBjZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 21:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727795AbgGVBjZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2020 21:39:25 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0185FC061794;
        Tue, 21 Jul 2020 18:39:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBJ6K5JtDz9sPB;
        Wed, 22 Jul 2020 11:39:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595381961;
        bh=WHwCUA6+aBBZaQRwlAjT9rFspJZTYA3kgO9KG2fmgYg=;
        h=Date:From:To:Cc:Subject:From;
        b=P7dBpEToG6jN78/5fqn/BqoUjC7DEuOeZjPko8HcV3A3QKdU0ky1LqrwW/I90SiRo
         dx1wUgcHnyzLTcykU06OooTJm5RkV7p2L7R3bMucTiMr/T00StVUxyufmg8Huht9EG
         Qw4WuMDmv37wN6knwWtOJww3EENnYWvVSLzmdKpVZlP8ZxGSTvvL5d0d8x0U2hkrBa
         aC80y4E3fGp6lUggPu53jayn5caxVz21qhRIxhp3idiOUD9M7OEDsiT3CBauBHVptX
         Sy0PiEgS2l/LgvQPMbVSt+YX3ZgWqPyWg0WERzqaDWGT9+s/nV9VX31H+zD2cHTfrp
         1XNJolzPUWkrA==
Date:   Wed, 22 Jul 2020 11:39:20 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the pci tree
Message-ID: <20200722113920.393deb21@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AQZnIG.g1aGCXExNuR72w3i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AQZnIG.g1aGCXExNuR72w3i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/pci/pci.c:2176:6: error: redefinition of 'pcie_clear_device_status'
 2176 | void pcie_clear_device_status(struct pci_dev *dev)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/pci/pci.c:37:
drivers/pci/pci.h:668:20: note: previous definition of 'pcie_clear_device_s=
tatus' was here
  668 | static inline void pcie_clear_device_status(struct pci_dev *dev) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  02c111e4a5a3 ("PCI/ERR: Rename pci_aer_clear_device_status() to pcie_clea=
r_device_status()")

CONFIG_PCIEAER is not set for this build.

I have used the pci tree from next-20200721 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/AQZnIG.g1aGCXExNuR72w3i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8XmMgACgkQAVBC80lX
0GzTGgf/SmT8oqHfvhAe3Aqjgfr6BxtKDyZtBN1KiFKt+Hy1Re1HCSlHlnW6/ijr
qvoB7Xp6qVc8vvIoE5+qrRCtYyncKlyGpG4x2dmtMBQRBrJmUTtC2xZA/wSCnH0V
lI13kkvovCDAdQStSO3TzbqwI9nDirthtmHbp9R5Xr81eIb9TWpgX5BtmvILDYV+
e0ZztxqTwDViIO8rDAC0lKKSl+OGp4pLN6Ol7vZ5+WtHvmO0e6dhwMa+kG7QdhMA
rOe2LWQ3jdauwrj1mK+ZpzTHOEsbV4DmE+BTXlyKidHkf5SUq/1NA0S7vbFj4Nn9
w28oULgZkR65+07Q1wnGjojGqBWGlw==
=le/i
-----END PGP SIGNATURE-----

--Sig_/AQZnIG.g1aGCXExNuR72w3i--
