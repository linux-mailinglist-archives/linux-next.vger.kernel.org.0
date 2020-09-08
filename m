Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D462608FC
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 05:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgIHDfl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Sep 2020 23:35:41 -0400
Received: from ozlabs.org ([203.11.71.1]:39449 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728327AbgIHDfk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Sep 2020 23:35:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BlrQK6Vrbz9sT6;
        Tue,  8 Sep 2020 13:35:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599536138;
        bh=hmUo+ue5BTunrdrOnAjLr0o75jxoawOM7P1KpTi7tJ0=;
        h=Date:From:To:Cc:Subject:From;
        b=WF675lbFf5FLyYzQ6h8KqJ+rx1ZCZpewRKijiwF3Lr95eIQNdSQyaR3I5bT/0QcYu
         VaeppLpAJS6+/rKV7dkZ7l5poU3jdS8HyyuzXSdr8+XLUn8mMQ1hFdvOM4m12XsKIH
         x45Tdx37r9V0IwubaaZKRs/LekkrKsqMH6dl858E8KwkqonrR62spZgRKzKChjkhD7
         FfJBQBthvpvsm3NMJVV36Gia3xc1NdAcOb8INqm5Xlq4rkvdv73HgSxl01y/JsJjk9
         nfV2kC+oJTenA6n9vD3vun2VYFOuxFfjVzDpbgEHkt0my37tyanM/tto4UJ3P4aNB5
         8kmF6dHj/sIdA==
Date:   Tue, 8 Sep 2020 13:35:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the nand tree
Message-ID: <20200908133536.6ab7a7f0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tgg14zL0GiowthGSPrL/Wln";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tgg14zL0GiowthGSPrL/Wln
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c: In function 'common_nfc_set_geo=
metry':
drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:513:33: error: 'chip' undeclared=
 (first use in this function)
  513 |   nanddev_get_ecc_requirements(&chip->base);
      |                                 ^~~~
drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:513:33: note: each undeclared id=
entifier is reported only once for each function it appears in

Caused by commit

  aa5faaa5f95c ("mtd: rawnand: Use nanddev_get/set_ecc_requirements() when =
relevant")

I have used the nand tree from next-20200903 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/tgg14zL0GiowthGSPrL/Wln
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9W/AgACgkQAVBC80lX
0GzMjQf/e2bwIz+QCe+ttucH/cr0+dP56lGo7cq6mLRKN7cmk03iGG3Acr2FFfc2
PriSexj/JtRe8DXQB4cydKFiZsDYXfE4Zv2j9Y8Z/qQPZXV/zuICopXqS5jc8/6E
Hda5Bdomb9Gqos36RCGVqXV0aQ1kwWzoGFQhTnNxVOxsbZyaBygTXE9p3qYqAwmf
tUUIAJP9MXZBBhTJpAYJlFCJEUR9svXuBayZuh9qhRZ++6AyO9UBcT4ZjmOw6RDN
N1F2eOnPNCxDXxlklM2ZYZ15jAxaWiZh9xYO817SOFdRK6j5jvdEOrip1Jyv9/DH
poWk7e4h8cEQbcWpAMVQdwIb0JbAZQ==
=vXnl
-----END PGP SIGNATURE-----

--Sig_/tgg14zL0GiowthGSPrL/Wln--
