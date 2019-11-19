Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F34BB102DC1
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 21:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbfKSUrp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 15:47:45 -0500
Received: from ozlabs.org ([203.11.71.1]:59503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726948AbfKSUrp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Nov 2019 15:47:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47HdDv0yNjz9sPK;
        Wed, 20 Nov 2019 07:47:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574196463;
        bh=Ke5WXaPKNAtXqFKGduS6+4QQd2mg4E2I+wN2Yf+4lO4=;
        h=Date:From:To:Cc:Subject:From;
        b=TwQ2CbjFq8B5PuQP+PdwysK7/NhhUvm+JUbpzS7VzRpiWpNpWoPEDzmEz0KHDnJua
         JLc7DO/QE6V0eJ9TfLEcWH9685h4q3PY3pNSFYWoyOwQWS9BEfbjmeby/l9I6+7LnS
         RilCuj0s1ERCyHNdqOhpA4k5YrwgAs9kU+KbmwzhgHbdMx83szrmCKB9gmKfIoeHMM
         pWLiHdXYhczBLbBd4WtYA0Wv5jUnPQooFK4rYaUftl3XBWayLSh5gfbimwZ89Iefcw
         itJVQShLz7yDGhRkIsaKzan13/UIjKvYmyD3ync4hewKTZNk5pDctlu/NlmZQtOwjC
         njlYz09EdEAEw==
Date:   Wed, 20 Nov 2019 07:47:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Trond Myklebust <trondmy@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chuck Lever <chuck.lever@oracle.com>
Subject: linux-next: Fixes tag needs some work in the nfs tree
Message-ID: <20191120074724.2df85f4a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/upZn3dqREk.f+Aq/IYEFQok";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/upZn3dqREk.f+Aq/IYEFQok
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e8d70b321ecc ("SUNRPC: Fix another issue with MIC buffer space")

Fixes tag

  Fixes: 5f1bc39979d ("SUNRPC: Fix buffer handling of GSS MIC ... ")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/upZn3dqREk.f+Aq/IYEFQok
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3UVOcACgkQAVBC80lX
0Gzs/QgAncDIUim/UbMG4DcTHDknxif5zPHTxRAf4okAv35IQrY1xP9c8ES2StrL
ijE5tTeF5H3PDnraNK+C/IH4vW0fJZsdAc9RNY/IhYnjJuzINR0x+ojbikFAPeOr
7vtJtOhI2/OY83UHLyzOm3KAPbR/UH9csQlLHKwKe9efDGNvIHvt9bGK5pWlg0/T
Y7di9Yx96WXqlTIRpMdMHqyd8TyxARo/8wOit04PN7DF7tQKDhGRx6WetzsLJlaF
BjlrzRtok6BlJjeV63vhY9KOd/Iz3ZxESGowDJtMKpnK01rAeiO1MO8pmjbOjH6z
HYOSMbncMKlRgYOol6nRau3l611I8w==
=0n8X
-----END PGP SIGNATURE-----

--Sig_/upZn3dqREk.f+Aq/IYEFQok--
