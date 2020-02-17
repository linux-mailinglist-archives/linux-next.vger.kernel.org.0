Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9B4161C5F
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 21:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbgBQUi5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Feb 2020 15:38:57 -0500
Received: from ozlabs.org ([203.11.71.1]:47431 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726704AbgBQUi5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 17 Feb 2020 15:38:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48LwnB1r0Pz9sPK;
        Tue, 18 Feb 2020 07:38:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581971934;
        bh=pA92iNdyZcIOkbVA2MqEQvd2it+isei9K8/w5PhBupA=;
        h=Date:From:To:Cc:Subject:From;
        b=F37deIHiABLzwsu5jkZ8FobLfNfxyoRC/FdwEa3WY7KYDSh6F9QVORpi6WvGWLEsN
         1Y2xAnnqbZUMpy/iP/Cb1gqykkyv/TmgqbDw1GJLhTFc2jWiWPpsciADezVFtdhKeN
         iwYABa4AobFgriV9a7XeSzYBJ4bpg9atOJ8s6b3T5BZokiHLkOk3zZ7bfcG1pYqSze
         UAbpFyP1aNO8RHm02nk6NWRm0I1dMYmlB4P+nCcNmQ4FoAm9vWjjAHh9J1HmUKhF0A
         ZPMZzOVlpZM9np5ll1eIacMT7KmhQnX9+JNrYHNiDxPm069qAbHuQGkaAUhV5y8jkx
         HUTXT1S3eCIpQ==
Date:   Tue, 18 Feb 2020 07:38:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the modules tree
Message-ID: <20200218073843.26b45f1b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vTKsiv/yARRd_il/ac0PeX9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vTKsiv/yARRd_il/ac0PeX9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b99931f169fe ("kernel: module: Replace zero-length array with flexible-ar=
ray member")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/vTKsiv/yARRd_il/ac0PeX9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5K+dMACgkQAVBC80lX
0GxZhQf/eNibpISjVhO6uq2zadaKvXrTAs7ze0Jv7KRm+g7y/xWgLjgF8ed1D4A9
EfiQSKNsYpK3n3eFAkRyQyO6Z0L9Y6ZzoxlohruG8BZr9D4NzBCEn5/yEzjxbcLr
pay2vUg2CDxsp5mzFlOLBVSLapSgT7V23Bp93VAaI9rqwE3YUaCYo+lEO+3swDH5
XX3YfmzAsn2p4FX95bvy0tz5Fn/b+VtdmtoZcTBhseoGX88wLnSFc1PB4bCEeJSo
Pw+vNhLtcTbzP+4ktsmIGHA1JgQbJgN1hJfG4nwk2wrspNwnH6moD2v7T2pTYeH0
dFlDFhwksZ0kQtNPqZFX9XRE5PSXeQ==
=RIWE
-----END PGP SIGNATURE-----

--Sig_/vTKsiv/yARRd_il/ac0PeX9--
