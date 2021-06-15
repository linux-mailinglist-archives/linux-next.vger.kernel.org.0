Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E073A7401
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 04:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhFOCfE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Jun 2021 22:35:04 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51417 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229649AbhFOCfE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Jun 2021 22:35:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G3rbB38Ffz9s24;
        Tue, 15 Jun 2021 11:39:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623721175;
        bh=bOhTI7o+PdpYMoKU9KNxyet2ETe62XZScIPvP+N/xXM=;
        h=Date:From:To:Cc:Subject:From;
        b=oiyWxZ4jP7EokekE0sBJeiSU/WvvrYepu0JO7PXlHKDRHKgX3x40rL9bsfnpowWSN
         v5pMWAuW3kS80JKNGi8WucY1FbfMlSLa5QNuGh6hvubhTJU/D2IV01O/yHAfcKaU2u
         nRhZOvYU/br167KeLUrK7HHTUBQS5jkIN7OMCTHJ2MnLRbzyuBbHrdbl22cKNJlT8p
         cJqxthTcRb7RwPolMDkvQF3ZsoVeHBX/ysW+gYJTG3N7j+Lc96079HaVnV+kftX0aC
         yeiJssvwCivAi/ePHMdLrEujPaf0zA6EigxAOBL3yaqSFj/mviAfO7ZV4ydOO3fn0G
         m45Th070kXJAw==
Date:   Tue, 15 Jun 2021 11:39:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the crypto tree with Linus' tree
Message-ID: <20210615113932.322a3186@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/boe+D/qNj2=0uef7llGtZMh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/boe+D/qNj2=0uef7llGtZMh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crypto tree got a conflict in:

  drivers/crypto/cavium/nitrox/nitrox_main.c

between commit:

  6a3239a738d8 ("Revert "crypto: cavium/nitrox - add an error message to ex=
plain the failure of pci_request_mem_regions"")

from Linus' tree and commit:

  0dc64297c8ac ("crypto: cavium/nitrox - Fix an error rhandling path in 'ni=
trox_probe()'")

from the crypto tree.

I fixed it up (I just used the latter since it also did what the former
did) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/boe+D/qNj2=0uef7llGtZMh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDIBNQACgkQAVBC80lX
0GzcuAf8DhLw/frgCfNKQFW47NftZFMHAzUkKGbDvF+EVTfE+AzsCVOtwAq0NuSx
qoijibo0zgxTQEFEMlcXihjY1KDpe0CtEKUlaWdJk7UPD/XYcIgao8D4kqMLGErZ
sqRpg1jSFzwjbyruqWYhrx4Rz1NGp/RaqPH92Ljb7eXvCcGGHSlsmpJsoyRTXZcH
yEYSVdA0bnsKpA5fEDnxr1YtiYduRsjotUVE3sOFpKMVWdqCQPcyOauHEUJlkfru
rGjqML5ycupHGr1KEeDI9qtgm+BS724xLYAvR7PzaEChHj6Emu2A7c8QyZxfOn6c
ugjbF7o69+uGDCumYiyFbBzmzhXwOA==
=5EeB
-----END PGP SIGNATURE-----

--Sig_/boe+D/qNj2=0uef7llGtZMh--
