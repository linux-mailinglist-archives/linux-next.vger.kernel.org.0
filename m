Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2258C2B3A75
	for <lists+linux-next@lfdr.de>; Sun, 15 Nov 2020 23:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbgKOWwn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Nov 2020 17:52:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35577 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727302AbgKOWwn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Nov 2020 17:52:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZ6t11VNCz9s1l;
        Mon, 16 Nov 2020 09:52:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605480761;
        bh=z0gqodq2vYO025Kym10C+FJXUnbXj3P12AagbjbSuI0=;
        h=Date:From:To:Cc:Subject:From;
        b=N51MWmmOBsTxqplD0z3uafrfdgQHfqzSmRYAJPEl5MlQg4ebOtsnQfsNYiANA1GtG
         ItIto0GnWEu33jxq8pdQlCZhODX+ELbyuDvxyh2frI+iXtGVhQB49qW/M1WtUhU7Mc
         vJESGzJxugaCdTezc7WAkORKsQDw1qB5eLzzYrLknUJLCgu2il3mi1LqkCOM4X8HQP
         27XvKO1T9/a5kjrhrOkXg6dseQ/ksCH3rBviKVEVcR+zS/6phBmKmUmXiD2r3PyN91
         tFUuqUS9PWImztRG7n368KWKNMb8xiY+ywZSkWOpIAqwammzRnROEZ3Lk8xYKkuGKD
         t5xUCZSoZSAUw==
Date:   Mon, 16 Nov 2020 09:52:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Moritz Fischer <mdf@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the fpga tree
Message-ID: <20201116095240.52d70d6e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+JKD3i0rH53tiNGfjUdW/FD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+JKD3i0rH53tiNGfjUdW/FD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  aaf8fe39c952 ("Revert "fpga: dfl: fix the definitions of type & feature_i=
d for dfl devices"")
  9922e71f43ac ("Revert "fpga: dfl: move dfl_device_id to mod_devicetable.h=
"")
  3ae706b58b0b ("Revert "fpga: dfl: add dfl bus support to MODULE_DEVICE_TA=
BLE()"")
  dd57ca7ddec5 ("Revert "fpga: dfl: move dfl bus related APIs to include/li=
nux/dfl.h"")

are missing a Signed-off-by from their author and committer.

Reverts are commits, too.  It is also very useful for the commit message
of a revert to contain some reason(s) for the revert as this may help
future developers.

--=20
Cheers,
Stephen Rothwell

--Sig_/+JKD3i0rH53tiNGfjUdW/FD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+xsTgACgkQAVBC80lX
0Gy8jggAh4CnvtpWw8SVjc4pkVkJPrzulcb0XvZ9Eu30toEjjgYA0Wgrnj4Sug+S
j6vLjTQ5qRW4aNe2K4h9GxZ3ct6jVhfUoH+JQiC/7Cn3qo7kuxnlgubElib2PFdJ
Wx0gjiQTNb9pSSC90RDMG0DtmJCQ7rL13Lp7mv1hCpYJAiTuFgZX8ckFWbB2Uh5b
38WUCZdb6qEO3nHUTAaNmfadcIcahiCjgEL0y8+PlHg08BIDY6hlBe86XGqBmRM/
oNtGjpDEMy4HLOg7PnJ865ZPg0HvJ8iI76qy5aCSJdUvOCURTHt5qDwt3RGXal+3
tM10P6MZIxQ5Xjd9cNg4rtKHPyGT3w==
=kvbv
-----END PGP SIGNATURE-----

--Sig_/+JKD3i0rH53tiNGfjUdW/FD--
