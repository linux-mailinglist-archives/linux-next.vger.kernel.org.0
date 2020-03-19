Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636DB18ADEB
	for <lists+linux-next@lfdr.de>; Thu, 19 Mar 2020 09:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgCSIGS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Mar 2020 04:06:18 -0400
Received: from ozlabs.org ([203.11.71.1]:52547 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbgCSIGS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Mar 2020 04:06:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48jfcR2SLrz9sPR;
        Thu, 19 Mar 2020 19:06:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584605175;
        bh=EH/L6fX7wgJb6pRdg36al/X3NXleOWD/3Z64SARsFMk=;
        h=Date:From:To:Cc:Subject:From;
        b=u61RNhW6t4RWzEZN1a5j0zEeQuZYw5KgDNQY5htzde6SJEO7yC6BidlMgpapfXfKN
         wfd7bLEsneBTiwAUpO/CsoZi0tjYOBiUzFN2r0zk8rW2cruyVVN2t+ivgrkVKzGypZ
         7z2gWmnmsNFWgi8DxPThfoCQehejcRm96ltSGioEs6SSWS62JDKDxC0XRUuo8JOcRG
         P/cPhSBXBo42fTeSgqiig0Umc/EOxA4xvy6QhoDZtgDuzruRN+lPadKwb/+8MBjiuz
         DmpIH/0CorvlHuTiIPPaci0UJzm+GsBh1RGavR3C2mW3baXXNLZnz8daiSRebl0YZ/
         NDHSPpvoXxlVA==
Date:   Thu, 19 Mar 2020 19:06:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greentime Hu <greentime.hu@sifive.com>
Subject: linux-next: Fixes tag needs some work in the risc-v-fixes tree
Message-ID: <20200319190613.36d687a6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uStiTNL_rbDnIIFyUCu0Kdb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uStiTNL_rbDnIIFyUCu0Kdb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3384b043ea15 ("riscv: fix the IPI missing issue in nommu mode")

Fixes tag

  Fixes: b2d36b5668f6 ("riscv: provide native clint access for M-mode")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: fcdc65375186 ("riscv: provide native clint access for M-mode")

--=20
Cheers,
Stephen Rothwell

--Sig_/uStiTNL_rbDnIIFyUCu0Kdb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5zJ/UACgkQAVBC80lX
0GwlXwf/ULRvjx5WzHutdXLTeeHiE1tzmBRKlY2teSVW2DtdlvTtVFpZCN15xu7r
lmfT0SEGpldEwVTE8G0HJwi39ZdShqfZo+cHibe5TEsFt8SRUhnr2ON2w7ZZhhyL
2sNPHAf2oa6WUIkbuLPQr8lRhwrB5FUPL2qTVN4l606TU5o6X6Q87yUcWvwtysAa
vxW86iwqCsFvQ6JZuwAvIFbnXU9eIxook2isBVPS1UYO56Iaax5PDFq0VTH3jykU
nEkLND4nceABg6mb2/+htAWliGj8uqn10bEYNxwjVCxymLCdavAhQAkPwcJ5bZZd
9Pl/wFksEPAsDLdAjr2W+/jQwllrVA==
=oR/9
-----END PGP SIGNATURE-----

--Sig_/uStiTNL_rbDnIIFyUCu0Kdb--
