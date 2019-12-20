Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF66C127398
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 03:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfLTCpn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 21:45:43 -0500
Received: from ozlabs.org ([203.11.71.1]:35815 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbfLTCpn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Dec 2019 21:45:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47fCm46mdBz9sRX;
        Fri, 20 Dec 2019 13:45:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576809941;
        bh=S+Vd4CiK/V7OBYDe81f0w3P2BE6PmGpdcqG5olDC60g=;
        h=Date:From:To:Cc:Subject:From;
        b=eYb1W3+TxXCYAMdlVFCxzXuKiJNmCAubwdqOGmlQqiRXklbf0AcYDscC+acDETvwp
         PUnT3dNbkcsvAT9gUBHGiPEIdQj0YUGaER3IwLD7NHoMEioTrmQi1rMIgRo7vMJC5i
         bFFqp0aLrausu6wAz9twY1cz/n3oCLiv1yKvrtyyrxavQxGkfthte7njFbdplxQyFl
         Bri7VMprHED/oWP9l7Tnbtfjljorz1Vk9JwsAvzvo0NQJ109wYZ4azv1P7tvaYOHw0
         a8ND0uNADmvyWGKfKzbs16yHeEIYRrTCNqjn2B7zUcd2cCyvAvwbAZIL48c5a5OIRA
         EbYY/aw2S2/WA==
Date:   Fri, 20 Dec 2019 13:45:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the driver-core tree with the keys tree
Message-ID: <20191220134539.38872256@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UccbYI=04d4e_ODkYncx9Bm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UccbYI=04d4e_ODkYncx9Bm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  include/linux/device.h

between commit:

  3a92c6e49c47 ("Add a general, global device notification watch list")

from the (20191211 version of the) keys tree and commit:

  af628aae8640 ("device.h: move dev_printk()-like functions to dev_printk.h=
")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/UccbYI=04d4e_ODkYncx9Bm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl38NdMACgkQAVBC80lX
0Gx6TQgAlEhYTL2VvX27CZwaHsGJVKAye0F77x1fyrlDPMMloaiEZlQLaIS7ZsQP
UIBCvxcW0dYErtoF2LZyeThN8/+Di8WP5JjQ3mn1G0HNK9XZus1ZGQTR+1VDECIP
qhITA2wcJV/ppPF8SsiGZ6xddjx8nlCaJDCAwbMNyUkAIRtBGUgoIpUe88i7RI9q
kntLtwQ2mN8T7SnC6JpDZRhIjRYv9/E/qQJHh69vjSA9qwpSIEm6QpvH/gSU1Gy5
VaTYby7dsEYR4kbto7e1xajKYV6+M0VfeWd4gMvo/s17SZURAunR7jEdq3j5FbL5
Z5CLoZ4WfhDUqGlQ/xISMzy3dxB3Fw==
=py+0
-----END PGP SIGNATURE-----

--Sig_/UccbYI=04d4e_ODkYncx9Bm--
