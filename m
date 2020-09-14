Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D3A268255
	for <lists+linux-next@lfdr.de>; Mon, 14 Sep 2020 03:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgINBp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Sep 2020 21:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgINBp5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Sep 2020 21:45:57 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD556C06174A;
        Sun, 13 Sep 2020 18:45:56 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BqThx5XJJz9sTK;
        Mon, 14 Sep 2020 11:45:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600047953;
        bh=HE7+phsgdIrkOpl961/KbwrL4E/mYEgCy604Q/N5JCM=;
        h=Date:From:To:Cc:Subject:From;
        b=ZA6LcdXVWGSfOM+WElt6wP6E/H0ooPlugamLaYD1XLxXn+Bm+RHARjuty68UwYZnq
         WrXlvRD1DKLljm6qMp4G+EkKpjONuPvWyOVBner95igWRp21NFzfI0HBlNRAyzFQuN
         /7RoQLCqsPZcoh4ZhDopwJSd+SdjRc+i2fUumQIY7PfvkwMx2wGYGxTZ5RZFPrYblM
         mkGRN2AptniR3NKuDaUaGRkbXgJPaqtkKGYONp2nXlCv8b2AaDwIczztaL0AUr04Iq
         gXKy0JBfuyzSxWU1OKeoU3K5CtrawzLM1JMtrMfzBrP7iAVYgUrWGP0+kkNP4eMdvC
         zyMeQR+ZnD/Bg==
Date:   Mon, 14 Sep 2020 11:45:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the nand tree
Message-ID: <20200914114552.5030ef1e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/epc+0kP530EpO2lFcNv869s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/epc+0kP530EpO2lFcNv869s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/mtd/nand/onenand/onenand_omap2.c:27:10: fatal error: asm/mach/flash=
.h: No such file or directory
   27 | #include <asm/mach/flash.h>
      |          ^~~~~~~~~~~~~~~~~~

Caused by commit

  26e1a8efc63d ("mtd: onenand: omap2: Allow for compile-testing on !ARM")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/epc+0kP530EpO2lFcNv869s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ey1AACgkQAVBC80lX
0Gx7AAf9E5/xUA15H8Q2AalqUUHzLyLXCrRsyLoqk04x+VByxgOn81w0iS+qzNTT
aYH10MTuPp/T4xxgpUiem6dRnppMhCDm7FK2APLzxgxPFoMOxhF8UqwCm7adHbVR
iWdi4zI82uLaXOLMxQgytEK3drZYVWMgUp+3hRY90DBJuBDJp9CYFVcl9e3sIidf
RFNF4j9fPxWEB55/BXMCuxMqBat0REYF+jPJrWp4aYNaDG+a9HbRQSkY5Ftb1iFL
4nBrENWYAN6uveiEJYYDQpzENu/8ne6Yb2ekdzulnS0k7+fwua6MNWSgTGcCKxxe
K03kRYzo+Bcp8gk5jGUy7QvfyVy4dQ==
=MH47
-----END PGP SIGNATURE-----

--Sig_/epc+0kP530EpO2lFcNv869s--
