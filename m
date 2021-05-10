Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9163379985
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 00:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbhEJWB0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 May 2021 18:01:26 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233111AbhEJWBZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 May 2021 18:01:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfFNK5xVcz9sWl;
        Tue, 11 May 2021 08:00:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620684018;
        bh=Z8z72DKbslAEqxg4TkLx7lCYcIB0xK3V9odaq/CiWv4=;
        h=Date:From:To:Cc:Subject:From;
        b=BJVvjdqFy+9NgxI2dJDC5g+unLYQQwXUega/FXLC9KdLI8QsQEY1CE8xWNeAXoPTx
         XS0UxDBuf86/oqqKqQvCc8Kw29xbdouOGCMiWLD5N2qy3eK0u9199Sm7+jx6cI0W91
         HSF0/fPHMOFkO9bH2hEjVzkRWmEzR6BejC5006dgNfUXv4Jwrwja/n/sbflig98t51
         NWbjJ2nn8Okrv0NxbLZmKKNyhcqBYGWKQtDu+G3FhwGezO97FxDtKerTHA6NAWrmyM
         2N5iU5EaIKCdbKg5kkEqypVWZ3bSOy7JIQxyrxXQY1LdEDwYd6MYdAudCkCfJ6UcSh
         B0/KBPU9EYLuA==
Date:   Tue, 11 May 2021 08:00:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mtd-fixes tree
Message-ID: <20210511080015.30e3aafa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0oaf0_.6MOME2Gt=c_0quVg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0oaf0_.6MOME2Gt=c_0quVg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  562b4e91d3b2 ("mtd: parsers: ofpart: fix parsing subpartitions")

Fixes tag

  Fixes: 2d751203aacf ("mtd: parsers: ofpart: limit parsing of deprecated D=
T syntax

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/0oaf0_.6MOME2Gt=c_0quVg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCZrO8ACgkQAVBC80lX
0GyRFwf9EALwfXhPCWGfTMsLYOjJlUykpnORzJshEvNDcjKk7Ur12QQjqhy+BODW
qJN+dPDThSnIlg+mttqw8aftXvGaoE+Ew8GgEKaCj5zgsCwwYowj3v234As2W1Me
UeWj6msiwqy+Uw6a++lwmXZRiG6e7sP4sxZuEeoVvkb4Y8ypX5J3sWgplTmLOpzw
1LHdKOIyuOiJs/GImwsGjwO6NCm33iKyUrQvF9LwtkV1+MAumluIzl+F9Mi8PcDq
L63nJcCOXb28iE8XjQ/IDoj5+Y3Nx1XJ5Kt0bPDYVgMC54xzFtEyG7BCs+09glYV
h7tLrbBrteqUoRJhFU61xBDmsGsZow==
=8zsQ
-----END PGP SIGNATURE-----

--Sig_/0oaf0_.6MOME2Gt=c_0quVg--
