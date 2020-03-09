Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0267F17D82B
	for <lists+linux-next@lfdr.de>; Mon,  9 Mar 2020 03:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgCICgb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Mar 2020 22:36:31 -0400
Received: from ozlabs.org ([203.11.71.1]:33231 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbgCICga (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 8 Mar 2020 22:36:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48bMmX40LRz9sPR;
        Mon,  9 Mar 2020 13:36:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583721388;
        bh=QQw9WbytSDhYA/BkG7VxeYruBYQ7kB5jABrAmHvvyOc=;
        h=Date:From:To:Cc:Subject:From;
        b=DD9AreUtY0jads3rBTBAWhWm+9+DXPAgx0ysecfqe+ZlSiWsgPe/Ba2wS33iYpotA
         yTDGbh39J7/YeDwBh+mmRsAmmYbzLUiJWKp0P/pnLlM3NLq3G35QnKCY6DEVAwUuYj
         1PKrvnSiLOtPFQdKevQIHl5coK194xcLbpoj4w3DkaBFXPWtbbgrpVJG8C6E30b+KH
         ClxVC1pAQ2iTdmlcLuJFgXLDB3KZIoFwD9W4sGMPX6SDS+DgVLzB528XoY1zYNJRTl
         N7GykcHhpqEoSXr/2eV9cZhnI/ximcohA7fw8K77rAP9DSY3cTRqneXeEUFI3nn62q
         TEu6YHr1rYFCQ==
Date:   Mon, 9 Mar 2020 13:35:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release today
Message-ID: <20200309133559.29174498@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7P3pAaUQY7VBQW4i.6uh=Zd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7P3pAaUQY7VBQW4i.6uh=Zd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next release today (20200309).  Normal service
will recommence tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/7P3pAaUQY7VBQW4i.6uh=Zd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5lq5AACgkQAVBC80lX
0Gy9Xgf/T4ewe2EZ03T8RVgxwtab7ODwDeGvYFLSivOepZUAdbTIUdT3m8mawgrh
KWPrWI1WefwHOfzELx4dcdIF/LqkcjZT88EsuLujxTxkaFiF8HzbOobR/91GbpeB
q9zLRBBA9uen0+fJ/CWMpbZwFjGMz+XQ57qSrBtuF22Joc4tzORL2y2cInDGP+NE
V+kjhA7Cj+SatByXuhHipcEMANnjKN24ScoJtj8tn7qHpKjJBlV9TDVosZ+rh4yJ
WFLY+FlMKz6pjs8Z1SKUcFkwpCvAYYl6PnKPzxUetO3c5ppLXi9oGFAmLSpdjfSG
N9n2mwlDDrcug9qVL6C/fioeKtETmA==
=Rumr
-----END PGP SIGNATURE-----

--Sig_/7P3pAaUQY7VBQW4i.6uh=Zd--
