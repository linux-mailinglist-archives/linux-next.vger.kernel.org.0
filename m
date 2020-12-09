Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC402D4088
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 12:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730354AbgLILBr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 06:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730351AbgLILBr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 06:01:47 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F58BC0613D6;
        Wed,  9 Dec 2020 03:01:06 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrYxq5HpPz9sWK;
        Wed,  9 Dec 2020 22:01:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607511663;
        bh=r/+GDOAquGqdEZzrfqtfidqClQ+Qy/mmW4yr/SaiIGs=;
        h=Date:From:To:Cc:Subject:From;
        b=XiMPL5A4IbeMeNE3K663OW8J/txEMWtx3Kk/v841f7llOtuE11PvGSI6VH9ZM0asc
         N6FsXHUKN3TPAsl+LQ3z7U5O5MNb4Tak10bcgWHezZGp0truYA08NVFliP7Y7JFiEA
         qaVPgWxtIva8KGl7TTmhdA3bVIcQIQ785jZZ6k1rej+OyY8K35Osde24w6bQzRZEZs
         I3BgUviRdr+c1PBuBrh9+sQSL6LNdqUEbAdriTLL+u2mRGu43dGL2aJTwAd6G+64PE
         ffa+HtCEagwEDF9q3Zrn+28+4yg3VqX3rpBKSFQl2Nmyia90NFbbyGqZIuVSPqax0b
         tOzaEWDHiVcwA==
Date:   Wed, 9 Dec 2020 22:01:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20201209220102.04ecee26@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YpPyNQR/DJ_TJ406ZLTpqxI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YpPyNQR/DJ_TJ406ZLTpqxI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ab7eff24a1e9 ("dt-bindings: net: dsa: b53: Add YAML bindings")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/YpPyNQR/DJ_TJ406ZLTpqxI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Qrm4ACgkQAVBC80lX
0Gw86gf9Gskg+S3ROvXZv+qMCqkwGPrpora52Uqp8cvCQIa2DG9FDQAY44JKcT27
fKC2EJuMLV8Qnq42GqeEdKV4K5acMrrRa4+tmCXulIm0WGJpTt2Bq/p+V4HKYbcb
ne9643X0hTOgnBhrMnag99D9MVSzoHRLd6guiCZtYEsXHtrSRN6i5Tg+mU1cTeQT
hBKjJsYIy5H8D8nQT91a0of4oPCFCbB/wKq7ak2dS4ZEFtGWzy+qkHXnkix59oO8
fHMaaUAJVL8cMUivii2iX5eK18sgeyLQzYhiKOatBouRHubqPgLe3TcZXuua6RVY
0AWeBMe+STY1SwY3KxiTNkrQescyYg==
=AkHD
-----END PGP SIGNATURE-----

--Sig_/YpPyNQR/DJ_TJ406ZLTpqxI--
