Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538B3426397
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 06:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234092AbhJHERL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 00:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbhJHERL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 00:17:11 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7995FC061570;
        Thu,  7 Oct 2021 21:15:16 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQZbk2RV2z4xbT;
        Fri,  8 Oct 2021 15:15:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633666514;
        bh=LlWlQcgR3nkYPu6AbYBB/tniUeJoatKhaXoqQKVAvvA=;
        h=Date:From:To:Cc:Subject:From;
        b=Yf0c7nalULOz13GYQ3EtOGKKHCdCyRZLKXsmnfzUO7fE9U6tVVbYS12RHLiadMlUr
         nCtlVwEh+VPda+EH3Lv0/eL156IXJAYqsvjx2pLhGrfDe2WteBN0jF29AQfBDqcW5e
         14NWo7PlwtcRM4SGkgHEHfti6+/LIXBpuKJ54jrbczXlLcMEc46k0Rhv2oVxdQgc/2
         p2wq+mwZUZFLrvEARgXRwdyYdKJxxCuiEvAcXN/PZG0y0a1QhL+ORzmBpkr1LQ3XGT
         yA7gPdZWuKWSoGeKM6Xi+TukHvZKhBBNLA/ToxS0LwqYp2rIQyo28NxIr4FrvawkHt
         r7I4bXw2Jk/DA==
Date:   Fri, 8 Oct 2021 15:15:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the staging tree
Message-ID: <20211008151511.5a7c6e56@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_wyvob4P2K=KQ4WjW8sF8M5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_wyvob4P2K=KQ4WjW8sF8M5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the staging tree, today's linux-next build (mips
nlm_xlp_defconfig) failed like this:

drivers/pci/pci.c:4210: undefined reference to `pci_remap_iospace'

Caused by commit

  9f76779f2418 ("MIPS: implement architecture-specific 'pci_remap_iospace()=
'")

CONFIG_PCI_DRIVERS_GENERIC is not set for this build, so
arch/mips/pci/pci-generic.c is not built.

--=20
Cheers,
Stephen Rothwell

--Sig_/_wyvob4P2K=KQ4WjW8sF8M5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFfxc8ACgkQAVBC80lX
0GzLTwf9HRKRcrzQpRUWPiqv6wGHqmfQYsPIrAW59TmQMyD+PR+yoyajiTrdDL8d
L3y7az+MOCi7zSw35Nf9Z2L5F+6AcDdojK6YW1bfoOqwE+/Lg1rITaw0qzbwM/x9
jOWTJVdYEf5ZrptYX/+plO3agvYFKZpxPl2ZCjJrm10Teq7+n0KuRMwPTKm2BH4C
ib/vcRHZoNlZFZLZqFxPRPhCbLV3GT2iLDq3tID337nuGwprioExJAF4/ornzp4O
QAUIPXwsGtRFUZFOYRjof+oaOg5fCJ+3Ypu9WWlzFHgw/Q+ueP2+qC9JGciKZpmp
CuML90TTMYPuNb8JM6GRNFpEejWZUw==
=WT2Z
-----END PGP SIGNATURE-----

--Sig_/_wyvob4P2K=KQ4WjW8sF8M5--
