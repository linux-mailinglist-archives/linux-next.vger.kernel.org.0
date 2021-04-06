Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4EE35529C
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 13:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245747AbhDFLo4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 07:44:56 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52051 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245735AbhDFLox (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Apr 2021 07:44:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FF5Kk4Kn0z9sWX;
        Tue,  6 Apr 2021 21:44:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617709484;
        bh=zCyNwwEXYPixKxXs71EHd3JGcYQrAoNkJdv0ouh//4U=;
        h=Date:From:To:Cc:Subject:From;
        b=RdmW7aR7cbwt/QYAq7Qw0tlh2aB9A8KoWk70EKdk6Vo4OP1Rjb2ntv/Tz7Xmcm8ux
         +YTdYxZ41gRsE0BSoWUYgLmfSW9jC6YNBrosHxhH9g26YlGfVecq0HUDVMR/n1G/KZ
         IHsYsz5KAxcuVjGiqDna4Lh7Z6vB1zbxFHVAz3CuKYhScsslJaw8cmkHzOQrRCXXbM
         OSjRXKbfxZJbupISzRfwUJuJ29Q3mdZF4tVzc1Nd4oOMSrC3h9Xi2omfx1bULKJiOV
         iVCJNqLyy1tVsWrIZzdfA4Xto2RlMknJhpoSHjL4Hm/8BMgfXfPSyi8M4bBx15+Pv7
         S0SWWwpEnXXxg==
Date:   Tue, 6 Apr 2021 21:44:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the char-misc tree
Message-ID: <20210406214441.5744648c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yMnI3yuwTkoaoV.0U/VK/kd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yMnI3yuwTkoaoV.0U/VK/kd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/misc-devices/dw-xdata-pcie.rst:20: WARNING: Unexpected indent=
ation.
Documentation/misc-devices/dw-xdata-pcie.rst:24: WARNING: Unexpected indent=
ation.
Documentation/misc-devices/dw-xdata-pcie.rst:25: WARNING: Block quote ends =
without a blank line; unexpected unindent.
Documentation/misc-devices/dw-xdata-pcie.rst:30: WARNING: Unexpected indent=
ation.
Documentation/misc-devices/dw-xdata-pcie.rst:34: WARNING: Unexpected indent=
ation.
Documentation/misc-devices/dw-xdata-pcie.rst:35: WARNING: Block quote ends =
without a blank line; unexpected unindent.
Documentation/misc-devices/dw-xdata-pcie.rst:40: WARNING: Unexpected indent=
ation.

Introduced by commit

  e1181b5bbc3c ("Documentation: misc-devices: Add Documentation for dw-xdat=
a-pcie driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/yMnI3yuwTkoaoV.0U/VK/kd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBsSakACgkQAVBC80lX
0GzdcQgAkDrl72Vlpnw/nKxyE5C4eZUYrIg2COr9DknMQvkr6r5PqcthOC65rWEs
4WY8cJwhcnCrf1iak5VuFQpAeTCs9nwE8JoS9yM63mYFkeVtRE9CCcxxC0xsq4ez
3ZiIw4NfIsBV2eYC4BoUhdMVgZXsiPYGoIoTGhIxeXbcXIcTxlUch24tAboKoXU+
ZS9mXTSu82OMxeiWEoMMYpifIknM1gFuilfTcacRArPGtNP3+IMa74lKeAelDMco
GzvCbblr3C7e901x1szG3ZjQgI8js/xz1CSorYGhHa1T215oLS7mDxzeS/q0TuPb
BrN+KFkpOmRZjS0+3DrXiYKdJp6MDw==
=82RH
-----END PGP SIGNATURE-----

--Sig_/yMnI3yuwTkoaoV.0U/VK/kd--
