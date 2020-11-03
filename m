Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCAB2A3CDC
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 07:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgKCGhs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 01:37:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgKCGhs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2020 01:37:48 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2456AC0617A6;
        Mon,  2 Nov 2020 22:37:48 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQKpb5Dh4z9sSn;
        Tue,  3 Nov 2020 17:37:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604385464;
        bh=jwa7l37ShXjEipYKBujztvx9bwANE1eQ39mwURzxH3M=;
        h=Date:From:To:Cc:Subject:From;
        b=rZomYGFrys74KRRwXhnV1V2pTWHu21v/kLL1nL3HgfCL0F6UoO7SaacObajZomwdP
         15Ja6a8oNA8IbZfFK1oh0A9FhjNT+jO3STwzSMUnGi/2KmTV0DKIdiLq/2qiJ/QbSj
         yupAdbFQ6rzcXqT1uCvay+IOdgUsJCA5AlfVW3m31pHkdEd6p2C1rmcPn1aoE9HXyv
         ttk6H9bo+5/JPyRBUtYUbxORPiZhS0RSR2K03IAEcLUov5MU4E8q0jldOHM2kf2Puw
         tha+OPu4pHTVhEMoRwURBCAYFdQjeUy4YWYmICdBaTe5wx6Fd0ykqSL7R9hO01Hkcw
         lyW/wXjvAj6eQ==
Date:   Tue, 3 Nov 2020 17:37:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the nand tree
Message-ID: <20201103173739.0071761a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rvcVtLU2F8hEEUFzWPIRKZz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rvcVtLU2F8hEEUFzWPIRKZz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (htmldocs)
produced these warnings:

Error: Cannot open file drivers/mtd/nand/raw/nand_ecc.c
Error: Cannot open file drivers/mtd/nand/raw/nand_ecc.c

Caused by commit

  5c859c18150b ("mtd: nand: ecc-hamming: Move Hamming code to the generic N=
AND layer")

Tha sbove file is referred to in:

Documentation/driver-api/mtd/nand_ecc.rst
Documentation/driver-api/mtdnand.rst

--=20
Cheers,
Stephen Rothwell

--Sig_/rvcVtLU2F8hEEUFzWPIRKZz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+g+rQACgkQAVBC80lX
0GxKoQgAi3m6o9CYzkv8fQ5Y0JE3WkongFEiFdjvb7N0HDPDTRD3lSi5YWRGJGOF
TMB5zS5itadRKfOsfqXf51fm7/W7E70giNjFsdGdos+tiPsWWkpGV7lq/aNRr/TP
ZdEEapuKETc4tcnnWrnhAqGDAB31FLYdvJO5UAG1UnSMa9X4Uw5t+jqAIgIlTNzl
udZ+/QrRCxFgMEyn3/fD0Kv/EV5ysHQnfiGako2o2/zyTB+GIyzpJMmOxObSq4xd
11akelsAkdb4nVTiDaIFwI5hfXndW04JWzTo0t+O719POae6OTr/KZZSYz7SXrsX
qxW5YsLjoqu6bI/OwQWJdcF1MdWNSg==
=ZgjA
-----END PGP SIGNATURE-----

--Sig_/rvcVtLU2F8hEEUFzWPIRKZz--
