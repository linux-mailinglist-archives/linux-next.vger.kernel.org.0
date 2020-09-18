Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE6E26F69C
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 09:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgIRHVK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 03:21:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56985 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgIRHVJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Sep 2020 03:21:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bt4xv4JS2z9sRf;
        Fri, 18 Sep 2020 17:21:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600413667;
        bh=gi6u38G5YgYLXYGtaoFJEoJM2dsxFtFnfHsm0rdLlGg=;
        h=Date:From:To:Cc:Subject:From;
        b=JeDcRDXz07MRSYZENGsDg6Y6AcRLtSA5PMDsIRvjTPdyIUtnPYtGxRikQ0rdTec3a
         5If9+8qrPfWXiUUNvHxoR+Qcsa/NcQejad73o1nWrdFs1DfaVS0yoBogIY5zK0EWk3
         PYttMayoUe80A0Z4HQgMhkBXXSvpR4wDAV5w6jQts8mJT02CFHYsIo+dx/5OcwY445
         6UvR2nyWNBR7RgDzovr1QjPIqXGv9wDU5lKYA7uugohsmCQTNUoDlvd62q01LxUPO3
         O7wKj5p7KpDVpIYNCkNzXnV1bvdF5+wcRGDVKG0/1fK/6Nxr+Awc5/DwD9qo9QPqFV
         jzqJ3QLaBezRg==
Date:   Fri, 18 Sep 2020 17:21:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the v4l-dvb-fixes tree
Message-ID: <20200918172106.4a924556@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CqEpRlxtCOPr8LKAlGAUaVm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CqEpRlxtCOPr8LKAlGAUaVm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb-fixes tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/userspace-api/media/v4l/buffer.rst:692: WARNING: The "flat-ta=
ble" directive is empty; content required.

.. flat-table::
    :header-rows:  0
    :stub-columns: 0
    :widths:       3 1 4

Introduced by commit

  129134e5415d ("media: media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT =
flag")

--=20
Cheers,
Stephen Rothwell

--Sig_/CqEpRlxtCOPr8LKAlGAUaVm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9kX+IACgkQAVBC80lX
0Gz1gQf+O/aqtUsMgzv/tqbFyvKUGigZAZaLWttbRPvN73w66HMU8pQH7o2FEB59
U1WuflUUoHg1x5aPN21hmP+Q1fxsX8Q9IFyGIAKSm5ZMQWBsmvfgpXGsMaaVupns
EHRbtqcjeJURcR4T6Ci16+xNbAF3Q3+puoN6QA0wvpjs2OVII8brHyQlo1rZwaiw
Gr7w6R8TOGykgniahes3ZENLLkP2QjK80cyfiH8+o+UtWoMzIrUmwACIkin4OC2G
wmKGP/qTKtPpC3HRUcU8UQS7oj6ysVa/DQibwGoJGKIIrBVIX/lzgYVwIb2CvXXD
nuiOBqPQ9d+EZ53e3YjCMakcwEfUQg==
=5Dhw
-----END PGP SIGNATURE-----

--Sig_/CqEpRlxtCOPr8LKAlGAUaVm--
