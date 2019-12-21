Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26ADB1286C5
	for <lists+linux-next@lfdr.de>; Sat, 21 Dec 2019 04:29:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfLUD31 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Dec 2019 22:29:27 -0500
Received: from ozlabs.org ([203.11.71.1]:41723 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbfLUD31 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Dec 2019 22:29:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47frh40YKKz9s4Y;
        Sat, 21 Dec 2019 14:29:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576898964;
        bh=Wx8x5+w6QBYCAg75zFYEbX+qfeIs1WDM6MXvjgGXG7A=;
        h=Date:From:To:Cc:Subject:From;
        b=G9zLS5YG9cc/gL1cFyCQdIcIacit/zlTc36eMbVjZuAm3mXJR1zG+G91H8lHw2e1L
         Do0y/4Ioe11i048wxYbn9kw/Hwhg+9K153m+12TjF3qe2s08LGlj7S0FNMY4oA2yuf
         NAZYGPsXPYQmztEAY3/83spRAQ5ZKe5h8Z4mi7rkSzPQhPTqhEKIiebCjgqCxNwmW3
         KOKZd4Fy40QsONRy97wG1uuho3lFinwETRCVmUpE5LBJAESf5/Cit2Vshvr6HhuaJh
         ZQjKFE5ETCKvIlkG/j+BbUcR0X0fCocA1ntei0EiyXKJMCXTpR2EIjsZC98xUmmPng
         Jtjo/tFNuGLdA==
Date:   Sat, 21 Dec 2019 14:29:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Wim Van Sebroeck <wim@iguana.be>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: linux-next: Signed-off-by missing for commit in the watchdog tree
Message-ID: <20191221142859.59b88b2c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e5sRtwGxeArkl88sAVvecLC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/e5sRtwGxeArkl88sAVvecLC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ad5acedd16f8 ("watchdog: w83627hf_wdt: Fix support NCT6116D")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/e5sRtwGxeArkl88sAVvecLC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl39kZMACgkQAVBC80lX
0GwpCggAmOBPZCzkbZl14YwzeIxf2u8MM9gvfUUR9F0HiQKnFUVEXpNh1eO7nAsW
lXwtH3kMJ9dllFOvPf50I00pwkpBSaaEnEBXlLMYO2N1VeOf/D/uwCEorVJzNHSF
D5r7U2/eYYBWkaYpOvlM42OsRpF1aJ6Wp+vABrvND2TFr+71Q3iKp0grvlQ98okx
Rzm+WAKmU/PO8aYjPUx5m7fCvftrgr8BSapr36fpSEAuznr6Hi7GhgOG4z6lHeTt
XTQ3SAA+tCGei2fiM9rCE5vi4DvUS9WooH7SDPywXktIv6LyNsJZvXKFQoDPYxWI
ePW3PUeAvuUM7nCiwZl81MyY088Kbg==
=mFp2
-----END PGP SIGNATURE-----

--Sig_/e5sRtwGxeArkl88sAVvecLC--
