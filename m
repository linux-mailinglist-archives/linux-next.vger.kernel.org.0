Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528B7357CA2
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 08:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhDHGfs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 02:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhDHGfq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 02:35:46 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF913C061760;
        Wed,  7 Apr 2021 23:35:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGBN117Wpz9sTD;
        Thu,  8 Apr 2021 16:35:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617863729;
        bh=sd4NiQdmVyyEmcQXDZzxR48wvz6eM9ue6+EtR9W+nwk=;
        h=Date:From:To:Cc:Subject:From;
        b=MD5wQeK7A9RmsEXXaM8OFOFKCajEP2ZclSxZPajBl1mQH7lCz8+snn2FQ+DE6epXi
         QPn6SIldqV6zbKzBtJ8Hp+bse3Sp4oj8RfRrDmHOQfbl2PWPH6Xgl7DKIaWQ6D8WV0
         XM7IcgLR9xLk91qPrVbAHMbh9g9axqruMdOKyQak4EfErDjfn/VXvu11fy8wB13c9O
         UDjGest9zET8zyZZEkQKu+7pUY3f/A+4rdvCPr170ko2KQYsdxHrJnfRfvQVHEsQ+M
         aH9XFR87+oxpeSM750PHf5mcvK/36nSE5T8Aha6Eh2FNcCZThNUXMEsXDQuoXBeWhD
         QrrsRAH3xmmog==
Date:   Thu, 8 Apr 2021 16:35:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the irqchip tree
Message-ID: <20210408163528.180240af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W_Bat7xdPOBP3AX6mzNARoo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/W_Bat7xdPOBP3AX6mzNARoo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the irqchip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/irqchip/irq-wpcm450-aic.c:9:10: fatal error: asm/exception.h: No su=
ch file or directory
    9 | #include <asm/exception.h>
      |          ^~~~~~~~~~~~~~~~~

Caused by commit

  fead4dd49663 ("irqchip: Add driver for WPCM450 interrupt controller")

I have used the irqchip tree from next-20210407 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/W_Bat7xdPOBP3AX6mzNARoo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBupDAACgkQAVBC80lX
0Gy3MQf+NLlJBrp8ewz7Ud9FnuqFaDhF/fhVNPdhRtxCwmscdX7JexuD5btrsQ2K
4aEpoEpsQZBm09f/BLQRH1kQYV6dFOozmw46cCgLDcRJnvZWy8E7U/gI9LqnCja9
vjjEfg9nC8nrmtHbeETVxc0PEhB4/ba7B8yInLixbNSPLVnY6VOoPzQqjJ+IRMkk
VEnFLW8VUWiEb1W1THwwE02pMIs7B/Q+sbxGeZBLwfxBWmxUUAJL6jqi8NARE//3
/+JAOerzTJ3204pEcms8bb/UNlZJnuvD00HdX26yjUfl3SOw91FtKxHyAl28B/XJ
6k1abugOnH3hyr6T3kcSaatpfWkC9A==
=ovGO
-----END PGP SIGNATURE-----

--Sig_/W_Bat7xdPOBP3AX6mzNARoo--
