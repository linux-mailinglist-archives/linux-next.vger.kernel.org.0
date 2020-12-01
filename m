Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F2C2C976E
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 07:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgLAGIQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 01:08:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725918AbgLAGIQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 01:08:16 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB3DC0613CF;
        Mon, 30 Nov 2020 22:07:36 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ClWpr6GPmz9sVj;
        Tue,  1 Dec 2020 17:07:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606802853;
        bh=9qls3725HPOQZgTlpKyFjUbgLfJRUxMaKvwR3fYrJYY=;
        h=Date:From:To:Cc:Subject:From;
        b=tNfToY9TUIQCQc4anUwe5Oy6TKs58sS17zNwCzlSJ9VeEbvb2Md8nCsnszhSznSZd
         DUlkERdLcKSMQNwTAV20Qbf2UM5R/fbu38Q/xirjPZkifOvkVk1k2LaQXLGgLt3+w9
         J8szHHV/fOqxWgvijCUeCU+Rls+0b7u5X7SWQjFy9fX9GKkaQ5s4edOeNuiw1AJoIA
         s6dQ6AT2XZw8U6NmkufdYN7Y1nCROdJMU/yhi/MIc78XmNba1KFqpkhD1YLEsydLz3
         dy5q2Y7koXcG9w8XjkSw2imTexIp5sfzlUz9juqtmIvgN8hstA+mREfn5rnpRMkk+k
         sDn/nVBxlylQw==
Date:   Tue, 1 Dec 2020 17:07:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the phy-next tree
Message-ID: <20201201170731.4c93b812@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9.BMl_aTB3mEwofIVfO=Q4=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/9.BMl_aTB3mEwofIVfO=Q4=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the phy-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/phy/ralink/phy-mt7621-pci.c:17:10: fatal error: mt7621.h: No such f=
ile or directory
   17 | #include <mt7621.h>
      |          ^~~~~~~~~~

Caused by commit

  d87da32372a0 ("phy: ralink: Add PHY driver for MT7621 PCIe PHY")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/9.BMl_aTB3mEwofIVfO=Q4=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/F3aMACgkQAVBC80lX
0Gwc2ggAkUpipjZwrDrnhNxhjDolZGt/H92kqjxz7EGQxJw4iIiwQtD4WtGt9N7t
ThJozdqzkW7CBJTQENWgtffF48PgPPULGvOrE50JFTqAgUZAbrZkWJvL7idwxCHO
jrKIitzeTbxgscopv2sNoWLmNdW8YLHsT3CDBB+kgBoKOb7iutzHBMwO+yCwJT0X
8alrjzWTjZbmf+DhJweCWckEFRsvAPB1rkXm4GqM6oKZuytxDoX0/7iuHHSIg76p
yICZmVlTTCj6bONr8tX/c6w3FHJ+2UsyjreeLpglt2Ld8dF8q0v3/ynAD6/4gVut
T/pjm4b2sgkDwisD+6aikh4DXiVd6Q==
=ythC
-----END PGP SIGNATURE-----

--Sig_/9.BMl_aTB3mEwofIVfO=Q4=--
