Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 766341F75C6
	for <lists+linux-next@lfdr.de>; Fri, 12 Jun 2020 11:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgFLJOS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 12 Jun 2020 05:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbgFLJOS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Jun 2020 05:14:18 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA77C03E96F;
        Fri, 12 Jun 2020 02:14:17 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49jw5f1gZPz9s1x;
        Fri, 12 Jun 2020 19:14:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591953254;
        bh=OFe7pSR6WejLTC2rUGx9oPF64ZtQ8I2djy9fI8KRR2w=;
        h=Date:From:To:Cc:Subject:From;
        b=L2YlPGmskFQOFyyoBqts+Tola9r/aMW9PUZdiAtYOCyKJRaYBAdWV3Nw3HXc6jfxg
         k3H+MjjQYZudh7BaiuOAiievbnnJCXfbqcu4Gy/0CqlOwFUWadS2OG+IZbc4wPPo5c
         GqC/BkJXvtctvPcQK5BaqV07IVChvAO9wGjPhTA8x/59vGs4r2/d4+KuLiHsKudh+g
         NZSjeneytZlTlVHTYRFrUEzmHFSKh2QDGNjD09lsrQJXxjF6mcun8AuRxAYVFmoDZo
         X2OSRt9O2eVuDsGm/KUz8lVDKz521yiUSan0qFL0n8k5Jw2OtwRNcw5p2BVqfXFx0K
         DpCRKo/IH2G/g==
Date:   Fri, 12 Jun 2020 19:14:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the crypto-current tree
Message-ID: <20200612191412.543f8fd2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n4TX5Oe76boiL6uYs0gCcxP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n4TX5Oe76boiL6uYs0gCcxP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  dc03ab101464 ("crypto: ccp - Fix sparse warnings in sev-dev")

Fixes tag

  Fixes: 76a2b524a4b1 ("crypto: ccp - introduce SEV_GET_ID2 command")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Fixes: 76a2b524a4b1 ("crypto: ccp: Implement SEV_PDH_CERT_EXPORT ioctl comm=
and")

--=20
Cheers,
Stephen Rothwell

--Sig_/n4TX5Oe76boiL6uYs0gCcxP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7jR2QACgkQAVBC80lX
0Gx0MQf+KFPNAo2pTzotO6AypmjvmUZltCZcCAC4pWEhklog7ZrdCxJaWmpY90ZV
pysPYMHMk346NH12zudQtNHSJTuBEOyk3BT5PlZ8J01DV7YuG4FZi4L8hBGKFFUr
Rn77v43QVRU03K8Gqprf2vYZM/YQ2jZHY7dJI4qxEPIFVtImilbfOf6IiiVlsuwU
IzU2rYWj2iMdPo3QrbBtYRf3DbuzLK0mdlfCZObZAzdJBljWO8LT+KETWoVFgC8a
3p96Cw2zpcz5npm/qM1u3/wFz20zpOqAvnwMkoJpgfPoxyeeL7pFt/vXKZZU3dRJ
awDsFWUH87EvUl7I+GF/XdOit81myg==
=5eIb
-----END PGP SIGNATURE-----

--Sig_/n4TX5Oe76boiL6uYs0gCcxP--
