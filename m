Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 408E9EEA7E
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 21:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbfKDUx0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 15:53:26 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42009 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728332AbfKDUx0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Nov 2019 15:53:26 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476Q4M1c3Lz9s7T;
        Tue,  5 Nov 2019 07:53:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572900803;
        bh=dY1xdRPsmnUNZBW8bAmEVGzILMhBAV6eTFdfpa2ma94=;
        h=Date:From:To:Cc:Subject:From;
        b=sYmX25C80YhXaYnuj2dd+Ux1zapprdxa5G1T683Bp80RPZKtQJjupZgPdzrFoubM5
         VLUjYv1b2tXsPMf6CiuyM/0tylERi7ZnN/PD6ffcGh2B7bjvWEqLcrOIMrM/V2nTDc
         ky0MMzvq5Nn3L6vdVsIl4irGHoDW2blI2Fl29qJYrx1uQCM6gS2S6N0v1Kc+OHy1Tm
         0tyH7knXnv1fQR2zcT+f/5CwOHqnZWBIHLGjdLrs7tCZJnb0tfZCHtJjYkARphj41E
         JJQ/U6OVhNJY7LxYnGTcSVDU5AbEYx23hJd7N3YYOkFIxAJNKgzYBEg42N1Ef4yhdB
         XMwDfVq/+f1cg==
Date:   Tue, 5 Nov 2019 07:53:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Paul Burton <paulburton@kernel.org>
Subject: linux-next: Fixes tag needs some work in the mips tree
Message-ID: <20191105075310.42394748@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iNoe=CQ9/ugZXR1goi0LOuU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iNoe=CQ9/ugZXR1goi0LOuU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  474435a05830 ("mips/cavium-octeon: Fix typo *must* in comment")

Fixes tag

  Fixes: 5b3b16880f ("MIPS: Add Cavium OCTEON processor support files to ar=
ch/mips/cavium-octeon.")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/iNoe=CQ9/ugZXR1goi0LOuU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3Aj7cACgkQAVBC80lX
0GxTHAf8Doy6sXRS8paQwozTLg2UfpB4qReBzMsZdrOh8Zaa0SF+REAPFHFyhSmj
g45xf+8ncsWgMstsQy02vcnbRp/kZPN8rQeQqwd2vkDJkbeDEBkN0FtcGekPylTm
xriON1fwMMWHBUl5u8sO8H2et+AZmZVgSn7peFShidgV3BYxJ0SPWsfyxKylR+tV
lpCMXfoeCUfckO66Sh6aLXz6RXn1OIdOz5juAySh68YykKfdU7uedFVtjhzvsRsr
ku8oEUf0jUERiU+MZcqFoqKLZIxqrzK+nHwMHHPR51syFCebrPLq9CQD5osyF39L
lYSbP2W0fQgTjqPSk+swceAuLYCOgQ==
=VDq/
-----END PGP SIGNATURE-----

--Sig_/iNoe=CQ9/ugZXR1goi0LOuU--
