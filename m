Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720D33D1A7C
	for <lists+linux-next@lfdr.de>; Thu, 22 Jul 2021 01:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbhGUW76 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jul 2021 18:59:58 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59279 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231294AbhGUW7z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Jul 2021 18:59:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GVXBh054Sz9sXM;
        Thu, 22 Jul 2021 09:40:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626910829;
        bh=8voZ0TG1nnNi4bIVJDGcQ3cO4ZKp2/HjoEpUn06DgDE=;
        h=Date:From:To:Cc:Subject:From;
        b=QxxHGXdZLG+NYr6S4/biFp9j1+KtvGPO4ie5EniVuktCQ/IHKEPmDZF6S6OM+I2kR
         4z6GQcOCL1rQAmNMRwhGMhp3nTFvVz7OuDS0XYnVIDWmpXSV0xRqNbnstF9V7Ca9hZ
         gtDCSF3BCnP83d7Ow17Ya5hhPzXicQeHFlYnqgwZ+rkC+LPOhTd2zlAJDOgGsEnYHx
         XPghiCTcEH3AF13QB19dw+heIfFNGzcMdr2GHNmVf1tzAvSSIO/kl1FyJAn/ClFWe/
         3fHVmZLz5nBPleTZAib1W5mRBEVVx9+eu+wJHrQz8EfOY/YcrpKXLWFQwNQCLgMQao
         AR3eAYf4LomSQ==
Date:   Thu, 22 Jul 2021 09:40:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the iio tree
Message-ID: <20210722094026.18ed11a2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kjy+uJYrmw5pHOwQPCVXOdS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Kjy+uJYrmw5pHOwQPCVXOdS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ed9fc721133e ("dt-bindings: iio: accel: bma255: Fix interrupt type")

Fixes tag

  Fixes: 6259551 ("iio: accel: bmc150-accel: Add DT bindings")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Kjy+uJYrmw5pHOwQPCVXOdS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD4sGoACgkQAVBC80lX
0GyqRwgAoP0+ynrEe5HCGBuDI1oWDxruVZTtYP3tmaG2uXszvc2Pf+/RrCZGK1w3
k5a84P/P49L78YR2qjRQe54tCAxWLTfonq5qLi5DvS3WemH2vxukhpBnXZY1gbDs
/dMjvDOnxA2nHe0mNyxLXLVBC+Ofh7HTSIcHR1JnTdVvrhk85mBsb1y99O1c/Q3z
AtR1cabop/k8PY9XmMtw/odLJv98APG2PdsudTEgB69u58kOCI/BaZAz+6ixbivx
lMyNmDLTDNTcoKiLHqMKRApzHJ4let/W0bsvrhc5d+fPISP3deawWKOMRDH4LdAl
MRcvbInxAhhuIVt4quPFtId+kNP3JA==
=yMNw
-----END PGP SIGNATURE-----

--Sig_/Kjy+uJYrmw5pHOwQPCVXOdS--
