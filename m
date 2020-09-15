Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2123C26B144
	for <lists+linux-next@lfdr.de>; Wed, 16 Sep 2020 00:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgIOW1p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Sep 2020 18:27:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46669 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727504AbgIOW1i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Sep 2020 18:27:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BrdCC0BHdz9sTN;
        Wed, 16 Sep 2020 08:27:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600208855;
        bh=hffzkyYV8waiSdgiO/5Whh0gF4DNYgLzs9mF7TL+73c=;
        h=Date:From:To:Cc:Subject:From;
        b=ahuIUFUUqOla1YAWb09A9z6SJ+VcCd0RKALSWjWyi2bze2ROMR1NLikH3AUF6ttKO
         szHEtr00gIrGRWxYz12xsOJgiLd+t7yMVlfYAr1284vcfKdVXwdzQEtWVG4hIDPXPu
         5JWStHv8Y9QOZHfTIznfPlDxwwkpe+YgcI7JZ5V8HozuH31Am20/6fSmY9YhBlG5t0
         lP5RCcdvDkvKQf0fOo+fdd8UXmbmHVWPzS8aeWxPRM6XlRAA4UEVGgbIIQkp+nOACG
         IkcCxcd7bPga2eJwICvGQvnHYj4a5TA87mT0spX/USmC86+vWaXm5fyQTyTPVXj2Us
         bx3HiAztmLHFA==
Date:   Wed, 16 Sep 2020 08:27:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the amdgpu tree
Message-ID: <20200916082733.50f872d4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TJ+G7Jo_gNzijhAJc_XCoI4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TJ+G7Jo_gNzijhAJc_XCoI4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  dd9a8f6b930b ("PCI/ERR: Fix reset logic in pcie_do_recovery() call")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/TJ+G7Jo_gNzijhAJc_XCoI4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9hP9UACgkQAVBC80lX
0GxeLwf+IpkbXyxcmfFbRzP01N2vG+wk6qyxS9RA5nwQoxn0NK4zkpRd83kV6XBv
zupQRH+NAR6mnE8q6OHrtfr7/VzfrrF+K4/ewIGxUGJ7Hbx5zfT9AgfcB3FNFdCF
rowoHuNkrFhxUkhGGNj7AWti5ef2upv6acIPudSPShrRGRy2+30JkaT6nuXxgRp8
90CNUV2/vowDP7m0lk5vHkd79WgATRVMtYWarDpU29lWljvdz7Ilad8TvX9F6AKL
rc8P3NQToqFI3n/CyXV9Rlk6MffRQ70LpYHALFrIAtZaxZqxZ6cRcuUiS/Ccz5De
brGptYjEOVMorN9ZvcghCo//6/2oHQ==
=uZbv
-----END PGP SIGNATURE-----

--Sig_/TJ+G7Jo_gNzijhAJc_XCoI4--
