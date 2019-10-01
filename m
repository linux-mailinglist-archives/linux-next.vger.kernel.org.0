Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C166C3765
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2019 16:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388965AbfJAOaN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Oct 2019 10:30:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49775 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727132AbfJAOaN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Oct 2019 10:30:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46jM9v03Vbz9sPJ;
        Wed,  2 Oct 2019 00:30:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1569940211;
        bh=NYx6qFxbqfP9Fg7Bx0/KHV2C1GIi1O2QrDm1z6ST+EM=;
        h=Date:From:To:Cc:Subject:From;
        b=lUzMjllLWSCSdOCU3f/8wV6TXmyYU+HlLRnBvlXVS4GEsSs7w3UV8GSVmsxJO/QKc
         aqLSEUHqGJT0G9cDm3Bd5S6Nj9dR1U/ctLA0sp+XPVqaSNEPKdVEQ/+FG8e9c/0sdm
         SRQs3V4RVprjuxFyZ3MIce9GFSaHCk+oZm7YQrkFNmiUCr54RDUWMtdVmcLKr7qeB0
         +54+zBiI8i02U4Ijo90q6AXA58PgJ60E2l215FW949K2r8e9b5N3P8u4lGbUPrEsbn
         zU1R/LCAv1SnyNlizTswdbO9hvYxdmY7Mkq1pg3dg443Ic3ioAjrnLFSydkPZNmu6K
         wJgnCC2ruG/WQ==
Date:   Wed, 2 Oct 2019 00:30:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: linux-next: Fixes tag needs some work in the pinctrl-intel-fixes
 tree
Message-ID: <20191002003004.16e51eec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ku3CvVoVqNIlxpqPmtYyrca";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ku3CvVoVqNIlxpqPmtYyrca
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d21556b6ff04 ("pinctrl: intel: Allocate IRQ chip dynamic")

Fixes tag

  Fixes: ee1a6ca43dba ("Add Intel Broxton pin controller support")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/Ku3CvVoVqNIlxpqPmtYyrca
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2TYuwACgkQAVBC80lX
0Gy3swf+Jc3RppQoOyDB4+bcZz6tsNPXgVVd01uwssDZ/uRZpbFcwXsAGgDaRAxP
cduKdnkgi6z1YdaBKIKMVT9hdWKV1Wj0yql21eKE/2kQjWqLNy55eBKupXwlC5iN
5WvLEyeTKQDWaOMgsMPot1T1uWGfJdgNtGjQak/OVn01UJtRp/5x8HME5CmfOiA4
oYSijjB0Pwz+rOG0WL7xqbNb4mLyerf+C+wtFtQiA1W3zKiZP5rf2ZFjt81fTq4S
vHEOepkTDBkFaZK9aJyMiX5nQlNlaFz3RY0TeWmJwICJiRTR2f7W38enwNFy3IMB
3TQd6DIxSYQcFNxO6rNKodrjOIUhJA==
=Rro5
-----END PGP SIGNATURE-----

--Sig_/Ku3CvVoVqNIlxpqPmtYyrca--
