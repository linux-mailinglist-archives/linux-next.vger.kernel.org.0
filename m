Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4189C2C1872
	for <lists+linux-next@lfdr.de>; Mon, 23 Nov 2020 23:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731220AbgKWWb0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 17:31:26 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36457 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728305AbgKWWb0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Nov 2020 17:31:26 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cg21d1ZnDz9sSf;
        Tue, 24 Nov 2020 09:31:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606170683;
        bh=3e332xL2aimc79/LA762XWtBQ+l1Duqb8e2E0dlZqvM=;
        h=Date:From:To:Cc:Subject:From;
        b=F5tEHVTsN+uq84/53cKbJ0iAhKIm0bDBdRxUlA2xQHuVcKdc5qDsMVSUnE1sqHuTK
         BurUDVKPjv/bMNWzcH2mHix9hIwGJWpgldePI7kjGuvF36H/pqp7k3Hbwe1lX+xRHW
         4Gbq8jNQOMveHDfBdufUJxfYjSVg1UkmWeX/0QkjoaHkDIyJDVQMIRnv3o6IXN+epV
         x5mQeU0mt3ngjoEtPGZIoAr7wz3axRHqQ1cdqWOx2F4m2EIDwA6zYR5wwxnZP4jvHt
         v3xj+FdgJgQRfuPsoH0dKM1kHe6kwAAtaurJ3k5l3KAtta6aClmV+6ckD05dUPtoGV
         UQbyC/joGoJxw==
Date:   Tue, 24 Nov 2020 09:31:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Maxime Ripard <maxime@cerno.tech>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the arm-soc tree
Message-ID: <20201124093115.0f358046@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i2j6NpuFv9FrvFeuSiMUv8e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/i2j6NpuFv9FrvFeuSiMUv8e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/soc/sunxi/sunxi_mbus.c: In function 'sunxi_mbus_notifier':
drivers/soc/sunxi/sunxi_mbus.c:93:8: error: implicit declaration of functio=
n 'dma_direct_set_offset' [-Werror=3Dimplicit-function-declaration]
   93 |  ret =3D dma_direct_set_offset(dev, PHYS_OFFSET, 0, SZ_4G);
      |        ^~~~~~~~~~~~~~~~~~~~~

Caused by commit

  b4bdc4fbf8d0 ("soc: sunxi: Deal with the MBUS DMA offsets in a central pl=
ace")

probably interacting with commit

  16fee29b0735 ("dma-mapping: remove the dma_direct_set_offset export")

which is also in the arm-soc tree ...

I have used the arm-soc tree from next-20201123 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/i2j6NpuFv9FrvFeuSiMUv8e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+8ODQACgkQAVBC80lX
0Gx28gf9E09r++xNv4Qg+ELzyjfPKImETDdE/+G1ASnpiSuYtCsxlrOqJfTIOYYv
dcstfKPLN+gxNuHwr0IEGH1F8cQqbRbn1S7zij0mC930D0fbTJupKm3VI3iJVv/9
j+geXeFMgrrCzlIBDobL2+W5+7g4knHkfQOcBfBsFkvzRKALCzY1Q6yP8dZMbenb
7k8n66l++2H308wQHOASXwgEILLEyQ7JBuuYXQPl2717onnY8ghSFRCXYg2UH5EO
7IVDduTi+E4AMstj64rmbTEUWiCOHFa1p7XI78DHwmR2FawEPLvMlzYKLvgdvhUj
51x58iHure9UWxhLx4rhuUlmEczLNw==
=1xOk
-----END PGP SIGNATURE-----

--Sig_/i2j6NpuFv9FrvFeuSiMUv8e--
