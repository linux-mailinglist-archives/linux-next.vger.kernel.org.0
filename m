Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C540134D86
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 21:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgAHU2s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 15:28:48 -0500
Received: from ozlabs.org ([203.11.71.1]:41317 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726875AbgAHU2s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 15:28:48 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47tLRs72xPz9sPJ;
        Thu,  9 Jan 2020 07:28:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578515325;
        bh=iXmqXirrsBQRqRiY/M5nTMqr0oBHja7Xprthl2OT4cg=;
        h=Date:From:To:Cc:Subject:From;
        b=glK3IIKQZ2iculhRlejO4Jt0yy1e/dVbGNbRDnvAUfeNBIS2hMhmDX+8rFnBpILMc
         341WGBr5hUIINTNUBmJ4BMzlKlkZjCnZXpwQS8OJ58Qt7P2NliBy3oXxNHdFf9lrDr
         y6KVZlMEYzuxhPdLVBdnDThalt4A1t0Vl5BxLEtO2BFmGh10r8iJcoYVUw9Rrr+fqe
         utWF8Q4BViQlRd1ii53mWqFEJmTkOkait/5Y1wHeSAR4cWXvL+44NRD5nKHvos9AZh
         t1NqKPFCuXBf1I/usyZYyB//VBCxs8TAO/nQJWhT444z2lkJXx8oUMuDPB4ib8bPJd
         4/HKe397EYfvA==
Date:   Thu, 9 Jan 2020 07:28:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Baruch Siach <baruch@tkos.co.il>
Subject: linux-next: Fixes tag needs some work in the mvebu tree
Message-ID: <20200109072840.0a8d1ef6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fB+QLalH_DE.qdPRNRKeajb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fB+QLalH_DE.qdPRNRKeajb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  66f5ff1bf632 ("arm64: dts: marvell: clearfog-gt-8k: fix switch cpu port n=
ode")

Fixes tag

  Fixes: a612083327 ("arm64: dts: add support for SolidRun Clearfog GT 8K")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/fB+QLalH_DE.qdPRNRKeajb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4WO3gACgkQAVBC80lX
0GzlBwf+IkqztACER0k99/iO/1AhWCYZOkD2h+h2E7BX8mxGC8uuswkNz37f0B+V
1dvWtFY+iDtB9NEwwoNPPuiX/nvM7Pf7VLoVR/B72uz8XXlRuBQsshSBzDF1287r
VECxdKw+K2pQkgZXLu4bkHfYhsbRrZgvLUaoIAbhpeihTtbmmboJ9G9wq9RPtKu8
WI9Bb06Fw/cHmJkZF2EankNyn01TClE1UYd7kejZuB21wafFr9zsmaor4exDzoB4
wjuW3l9Xl4gajI3BwmShCUG1nDrDORsK24OHpGREbctFyIFME+AyfdC85x5Slggm
vCuZZO+It2+QgCJzt8grGpScsh7r3A==
=uRcc
-----END PGP SIGNATURE-----

--Sig_/fB+QLalH_DE.qdPRNRKeajb--
