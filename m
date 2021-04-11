Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E3135B74D
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 01:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbhDKXAv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 19:00:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39061 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235005AbhDKXAv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Apr 2021 19:00:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJS566YYZz9sSC;
        Mon, 12 Apr 2021 09:00:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618182027;
        bh=frTL5mRDy+mTpTcBSxcK3M63GdBnFlsHY+QdOced+4o=;
        h=Date:From:To:Cc:Subject:From;
        b=ncBwPVhgZmoZpEwGuS3qQM2jm3Jr3t3MylRl8TPq1M4jaFAlAo7k4Uysu4BJGCE9t
         kYf8/wWUMYgTxF/Yd1g+CRUXHqwITLw8oqwJE/w1p6KvblVEbSt+t4DlfWBTHjn5La
         a9GlV+mW2ZyohKVGu3PTeq1eEc/KN6XO+l5LsItrbRbyBi+C1bp0m9KDEXTK/jmJsv
         k/l8VHXAYuJDlj5ntrx3wrmtvn2i7xUvytWIMLZo0KK9FaixD1Wlog1gKoijiGWI8r
         gIY6C1Ihp3JoU2nfy+HBDF4ZNoLrcwsMdFXVxsK1eEIByNQaSwN2CR/1l10jcLg66n
         ytjHvYywOGsYg==
Date:   Mon, 12 Apr 2021 09:00:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tudor Ambarus <tudor.ambarus@microchip.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pinctrl tree
Message-ID: <20210412090026.3af852f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BaHMQfq=8cziaEVNKYOgTBa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BaHMQfq=8cziaEVNKYOgTBa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2cfebcb2a22f ("pinctrl: at91-pio4: Fix slew rate disablement")

Fixes tag

  Fixes: 440b144978ba ("pinctrl: at91-pio4: add support for slew-rate")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: c709135e576b ("pinctrl: at91-pio4: add support for slew-rate")

--=20
Cheers,
Stephen Rothwell

--Sig_/BaHMQfq=8cziaEVNKYOgTBa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBzf4oACgkQAVBC80lX
0GyaoAf9ErhArpU9LxfMdU6Mx1Mdsh+njGyOpZlvUza0vwOu7icH5yFGUj+lCaX9
IuIRNFeOVE7YgP1t0Yv0ufvO5Qc6pzg03saoKCm4TUcY0LUIb/JWtCZpiDg2+qfG
dR7KV/+Kz+qCRjXlE26XKNDh8i5MSvAWr6W3lREli6zpjTAPBKNktglagIf++n38
hWvIQY3XRZ/dx8SSvtvUoGADzHK7Hxgn0BaB96TMatLd6s4ca7emfbNE6RNCqxo6
TbXHdLkwaxrxwmYQcyfyXbPu15osGE4xbKTUqyVmsoVeaPUEnesIMhWoIeh4ydv9
WrO+oZrTjmGDBNWufV6WMd0mRViTJg==
=1QWc
-----END PGP SIGNATURE-----

--Sig_/BaHMQfq=8cziaEVNKYOgTBa--
