Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10C429F685
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 21:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgJ2U6z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Oct 2020 16:58:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52357 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgJ2U6z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Oct 2020 16:58:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CMd8X6Y3wz9sRK;
        Fri, 30 Oct 2020 07:58:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604005133;
        bh=nPddChaa2lJM7RIXSQBLB6CZFzPP70OHl2UEM/i+XVk=;
        h=Date:From:To:Cc:Subject:From;
        b=pC3hElVedLixVzZvNCtE8kRb56FFrftEdKU1f62wwwNx+TllWvf+2EqYgHP2rjHxZ
         Kgoeuq6Zv21pfyVYlhxtPwfWkpa8nqq6ObZRRXTRmcj6SO1hhTtsdcvL4DTRgsQ8Tv
         9aFpUXtHOKwu8z1ex8mS3Q0Z1ZHEBEsZ7J34SzUoyjChWhmoM87iZ6O8sD7TrlMlcV
         mnf1V2q5qyXmGJcMOnuLfRgf5p8ckut63jWOQ87N7v+prJ4C3xSMfRHOOdBrrgaZ+u
         7ldcy6LGIDOTGO37I4FxPI9uoDfDeoa8BTbUlgySaIL8X3LWJOpmrwN7911Fk3zApG
         DA355XqYLbv6w==
Date:   Fri, 30 Oct 2020 07:58:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Sandeep Singh <sandeep.singh@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the hid tree
Message-ID: <20201030075852.7f613c1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y26mUAn12DRwe/73SaHddZt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Y26mUAn12DRwe/73SaHddZt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4b393f0f76c8 ("AMD_SFH: Fix for incorrect Sensor index")

Fixes tag

  Fixes: 4f567b9f8141 ("SFH: PCIe driver to add support of AMD sensor fusio=
n hub 4f567b9f8141")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/Y26mUAn12DRwe/73SaHddZt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+bLQwACgkQAVBC80lX
0GxCJwf/cfwKZAvLmwZbTpMX581foqorKK5O4666ap/cK/VOdDLa/ZoK/BcrU1MN
NHVTshW5zpD8Hx4kPvI1gVqOANSWFIi1o99WW+4jzQ6aP65MsHIku69+GDR/ilQi
pYs8MBtEqRrl5ytxZ1caYkHnrkUKWR9pdYVs5r50o1/D6INr8Fs3l9i8FBe4EByR
teT0cZUKVKMIeAONnm+7wJNdRIzTIr730ZL8M0CoOEFXO4WNVjpoj0zWJ1yqkBFc
6kEeVsrHxue6/4g2Iw2JoRjDae9T7ZLWygkfjHJw/XA9V35p/i05n4BiVV0+/sG7
PJvL1WJyEAszkIRyaozCkt2te7SgPw==
=VTxe
-----END PGP SIGNATURE-----

--Sig_/Y26mUAn12DRwe/73SaHddZt--
