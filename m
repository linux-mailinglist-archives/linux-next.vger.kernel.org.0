Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4728A5D6C
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 23:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbfIBVRA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 17:17:00 -0400
Received: from ozlabs.org ([203.11.71.1]:58679 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726979AbfIBVQ7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 17:16:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MjZd5CGPz9sBF;
        Tue,  3 Sep 2019 07:16:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567459017;
        bh=LI/Ccw4jAyBMSDMACYJQ4UJwzivHIPT6USfX7vBdITM=;
        h=Date:From:To:Cc:Subject:From;
        b=jZbY3BW1zy4m68So90dqF1LcUyEZ3//OAhDjgNO5o2v9eKS05viA8EfAEoSiswZLh
         DEUH1OLUEvc0ph2g+P/BeFxumN9CE8JRQfKfvAtn4wkLGTHjdmC/AVmdlDrRa6OI3y
         6DE6s2bCCXmfRTJhLEEP2IG/MNM/iBSKRlapZsembp5YtNp74YJ24pPp9hnvsMXFFk
         z1YGvme1AROeiK5C/vBVBsH0HVGNYTQvWBiLVPIOqY6ynzLVnB6jBMDS1GEkHYipQh
         pjaHQQvB2FGs/6tuMyoK0V7UhuPdw2iZn3tkuPfdE/6YMNVJfQF+dwdlkI06Uo6aJJ
         0COMsy7EAAnbA==
Date:   Tue, 3 Sep 2019 07:16:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the kgdb-dt tree
Message-ID: <20190903071657.2caa0c46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gybZqUVR=MvMJJDn42XrIvL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gybZqUVR=MvMJJDn42XrIvL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  f12dc871e3ec ("kgdb: fix comment regarding static function")
  c60d67aad7b7 ("kdb: Replace strncmp with str_has_prefix")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/gybZqUVR=MvMJJDn42XrIvL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1thskACgkQAVBC80lX
0GyiEwf/VqWYXy0ot99fxq1GE6AGrm9uO1V1D6MdI8FY1q19NLuPOmytkmTSc2x5
0hvW4p0QYimMkMKCmq/0JTUpeBbz5MWzYbw2OBaQ4+mjAWMdxr+AUHA+uBVNHTwR
/sTFPZscWRUVCaCoyiXWeMDp9BdjuBH5unTu/KUOm0yA7Ec2DpqCvlSMsTKQ4CTs
RDKYLnqv6h/hSQU1m4JoL1tumAPsxtpdHiVURTt9GHjECfxZlZF/lEAWZCObHDM6
/LqKZ1CVrY4/tX7L/EkAFiWBS3IEyJEijDH14a47PKTlrv0twYRKV/E2Z1qd5zXX
Tlr33gJe6Pfb5WSzLCv+Z1W06P1n8w==
=zdQY
-----END PGP SIGNATURE-----

--Sig_/gybZqUVR=MvMJJDn42XrIvL--
