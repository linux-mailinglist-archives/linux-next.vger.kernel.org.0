Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4737D27A44B
	for <lists+linux-next@lfdr.de>; Sun, 27 Sep 2020 23:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgI0Vu6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Sep 2020 17:50:58 -0400
Received: from ozlabs.org ([203.11.71.1]:49683 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726316AbgI0Vu6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 27 Sep 2020 17:50:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BzzqD0bCxz9sSC;
        Mon, 28 Sep 2020 07:50:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601243456;
        bh=kc4ZEIiDYCGQChkjdqccv8Z/nVKIUk7a8gUkrFr5d0s=;
        h=Date:From:To:Cc:Subject:From;
        b=D1txudQqiCwQ4pr/Y8M0jK7OlNZ895fxhiCRctayyqP3zq5yBMIlI012f5705sW3W
         amgIy/TCGGostk/R8dT/lLnDMT35eLks3uY8j8QC8Sy11Ez3bxKuDixkUaAjFJIOFv
         j2jiDl/5xuLH/klTYhvByvGx+aU2+kqxktCVT5kUQuLxB0IocZ3e1zOtNxjE0d8BJx
         AVIKpQk5dLY3EWf908/ziSgu8DnSFJiKS5opR5PyUd5z/xnVs4vra1OVHORSH4kvDw
         EI/MeydsCp8KVJIt4QQzY8Z4gq+kAtU073nBU88yvhhmR93cvb4M0bH84iAAw03Lxn
         Ma7yX/Kc50D3w==
Date:   Mon, 28 Sep 2020 07:50:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: linux-next: Signed-off-by missing for commit in the v4l-dvb tree
Message-ID: <20200928075047.4fa3a02e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OFyrCD0h=n8UYghmsYJ/Byp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OFyrCD0h=n8UYghmsYJ/Byp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  2f8c737ed2c1 ("media: MAINTAINERS: add documentation files for rkisp1")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/OFyrCD0h=n8UYghmsYJ/Byp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9xCTcACgkQAVBC80lX
0GyRJggAl0vG8io0AKC6Q4+mKsThnN4X0virtqYFnT+15vUJsOCum4mevfaHww6g
2CzIe4he9J53V5o+fumeDKS8J4elXGcOswiKH4gU+k82RsE8hNJZpA3pQ1M67b5a
Khw4faFrEMWy5ztncsJjEcS1/TDCgb477t8BsDswjTaofJmcTawhOUTWvcDH4mqu
LNNJLeVQqdrtVOxsT8AZKqrYWzEWkA1aVNBWDDLKUYe9j94S0scToK5r19+lDyq9
R4pqEqoIUD3pxJvW3G/0TIrYv0NsYlz2KZW25k3JdK8fPslFmNFiHqJXXosozjgK
GrqGahDA+XvlV3StGLv9egE0JZq7mA==
=UdJ7
-----END PGP SIGNATURE-----

--Sig_/OFyrCD0h=n8UYghmsYJ/Byp--
