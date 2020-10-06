Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D964D28432E
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 02:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgJFALD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 20:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgJFALD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2020 20:11:03 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D47C0613CE;
        Mon,  5 Oct 2020 17:11:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C4yYH6yLGz9sSs;
        Tue,  6 Oct 2020 11:10:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601943060;
        bh=grlygd68bJmDQe90g/yhOmhuKH9aYwkw2nsh45pylqQ=;
        h=Date:From:To:Cc:Subject:From;
        b=fTU0UcaYs2kVJP6dTy4qWNovjAOtvDbnXA4w0AgvoPAfm68OihSt5Dnuts8lSdX5N
         hAnYyqu+S/HE663mHTBjWrmn/oV5Mm4SfBFfTZ/8Sjkcn+fCrYQbnxLewtHKfKyrmh
         pdkhGwk70ZafEjqpODcLY+4t/PlL9oPGhZP3bHzvUcyTWb+GQ09Yhw3xxyooXyrBJn
         7yHT9p5U+cBamqfnngYLpF8atBWl+/5ym52c6jPzwpmZcEXaYdxjU5wo43LbaUOqj2
         6oTF9n2mzivWSzSe+S/s18zq8FR20fPIs817Ei+v1r7X+GzXw9KIxan/GD8/nOHTl/
         5zORKDTVbFsyQ==
Date:   Tue, 6 Oct 2020 11:10:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Subject: linux-next: manual merge of the arm-soc tree with the dma-mapping
 tree
Message-ID: <20201006111059.78dc03de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DtlBu2xnMQ3r/VCICAMJB_P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DtlBu2xnMQ3r/VCICAMJB_P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  arch/arm/mach-imx/mach-mx31moboard.c

between commit:

  f47e22d65d08 ("dma-mapping: split <linux/dma-mapping.h>")

from the dma-mapping tree and commit:

  c93197b0041d ("ARM: imx: Remove i.MX31 board files")

from the arm-soc tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/DtlBu2xnMQ3r/VCICAMJB_P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl97thMACgkQAVBC80lX
0Gx54wf/dpCy7119s6iYwVQuupYwUywIl6EuY+Q9BLJ9q3kblTI7AZYAXCGXx3SM
l8nGnUB8u/UzpbFdtZPdQSferEyMXDNFy11XTlnKWTZdDCpZoa3y3UxvkaHwnx/E
I5JhCl2/cj/iKm4SluZ7KVF388FIMlJCtkQ6UJkEhATajM/xZdwWSMoc8nKX+3gy
rDpLdvU4evgp2BbD0/OiEFl0hUriHY+v5KqSLd2+eQE/Rvp3RCVdkPRmyrHwiAZt
b6MyAe0vtk25s+kPuHAMVHCOOH25CRnDJGutjxoEBJ+DZXbWPWZWMC+7GXAjGggJ
fHbf2ZigHVwRr7lTLNeJr0ilHEGVQg==
=a0Lo
-----END PGP SIGNATURE-----

--Sig_/DtlBu2xnMQ3r/VCICAMJB_P--
