Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74C0A85763
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 03:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730467AbfHHBC4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 21:02:56 -0400
Received: from ozlabs.org ([203.11.71.1]:51949 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730038AbfHHBC4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 21:02:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463qqL2m70z9sDB;
        Thu,  8 Aug 2019 11:02:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565226174;
        bh=rytzrJWveCjlLR2Vr9/FK4k0uSCORguM0Mk1WpmNR3Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DqjGwHRy4+q/gWbapE9BlPorJyBmFXM56KhAyuxoGcjILNG5B93iLGJy2/orFaEAt
         9B+XbayGP3YAcUJMkFBrZ0zxdYreX/rswbYBOJMQr4ndSwT2w1lBMxKxBSZj4iLiL8
         SvokAQteyNmlDV6HOCysEzxd5Wn7+S5NH4dGPb7l7asPs/4z0NYE3dqkZZOtgfwbwN
         /Rn9VyKLjyD9ytu7+C+XpBrRkeO9eTyD4UW060HusLHGXraw5mD5R5gO1ZzmhUlEfs
         GlMXlsM/IsP1PWtEM0JBCUgH/wfqBcmMk7alkMIk50JGR9ObRwC1oOASFMI1kXWOcw
         RNHUl1tTTSN8A==
Date:   Thu, 8 Aug 2019 11:02:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-next@vger.kernel.org
Subject: Re: next/master build: 230 builds: 12 failed, 218 passed, 15
 errors, 1179 warnings (next-20190807)
Message-ID: <20190808110253.364cca5a@canb.auug.org.au>
In-Reply-To: <5d4ab6db.1c69fb81.94ca.18df@mx.google.com>
References: <5d4ab6db.1c69fb81.94ca.18df@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j.V1PHIOh_pd5ryDIeL=58W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j.V1PHIOh_pd5ryDIeL=58W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 07 Aug 2019 04:32:43 -0700 (PDT) "kernelci.org bot" <bot@kernelci.o=
rg> wrote:
>
> Errors summary:
>=20
>     5    include/linux/build_bug.h:16:45: error: negative width in bit-fi=
eld '<anonymous>'
>     5    drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:1046:26: error: an=
onymous bit-field has negative width (-1)

These should be gone when today's linux-next is released - the patch
has been removed for now.

--=20
Cheers,
Stephen Rothwell

--Sig_/j.V1PHIOh_pd5ryDIeL=58W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1LdL0ACgkQAVBC80lX
0GyyVggAiWmooaHr8dPmUBxlduc30uN3n2oAFRGBllnqeNMe6/705z5fMBpv0HvX
th8cHyCVHcVbftiwzuPPa6B4/KKoME4aPvhTgu0MCjuG8P3xXs1v76sjcTQEC6uF
6l8H0bbc9Gzjr+TZ4eoOaJ0fmE1n5g7JqrEHoW9Ggs4dz68xCz4lovyqyXEkyCEk
J9/pglbnjqkwe5zKtEtXeuXgofTs30NqSMQEdMa9/Z3i6CZHN5la/PpBBp4c/k9l
eNbU1PoP9l2h9hYdYrKSqLdvPxCQspfbMwahC+vJ1zr9aA/dhWmFmkTtxHRdzqZ5
cRJstZk8rVY8jFQe3w2fv4MC9O9FRg==
=WChu
-----END PGP SIGNATURE-----

--Sig_/j.V1PHIOh_pd5ryDIeL=58W--
