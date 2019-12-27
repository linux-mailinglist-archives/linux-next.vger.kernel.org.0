Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B99712BACD
	for <lists+linux-next@lfdr.de>; Fri, 27 Dec 2019 20:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfL0Tz6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Dec 2019 14:55:58 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41741 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbfL0Tz6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Dec 2019 14:55:58 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47kyHZ6XT3z9sPK;
        Sat, 28 Dec 2019 06:55:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1577476555;
        bh=j0HmGkYmZP1ENxV3TmAvjzJ+eKBsVqFFPKwareblGA4=;
        h=Date:From:To:Cc:Subject:From;
        b=WQYBrDKjUyk2dM8jHkdLrNYzprfJeCqHmAsqGbET3XBBrwP5cLYhRhdF+FaLyXr0A
         KAG5jPzR6IgET4pO2f9dnbKkuoxBwTGn1TY5H70+aIVe1HhkfaczEFbAou4tNb69fR
         4+7NiQpM5qOKKH7NxFEslKDbLHBhJjsy//1457p/zlml7bft9ymaeWFMs7erZWYfT6
         v52KSHOtR8M8Vu8jZiUtO//i6VwV3zUpBJl3iAlOtA9o0yVANTe6UFexZ1XBcsWcgm
         8MDJxZfcrX4By8TdjcVdvU3WdUPZ2kxlQkiAXDJFtRR989bXgQZTzPPrydn5OSJFTG
         Mw86USBkYla6g==
Date:   Sat, 28 Dec 2019 06:55:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jaedon Shin <jaedon.shin@gmail.com>
Subject: linux-next: Fixes tags need some work in the block tree
Message-ID: <20191228065553.6ba5d28f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Gmsk4d7kegXJZ8HM.5w8al/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Gmsk4d7kegXJZ8HM.5w8al/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1a3d78cb6e20 ("ata: ahci_brcm: BCM7425 AHCI requires AHCI_HFLAG_DELAY_ENG=
INE")

Fixes tags

  Fixes: 9586114cf1e9 ("ata: ahci_brcmstb: add support MIPS-based platforms=
")
  Fixes: 423be77daabe ("ata: ahci_brcmstb: add quirk for broken ncq")

have this problem:

  - Target SHA1s do not exist

Perhaps you meant

Fixes: 1980eb9bd7d7 ("ata: ahci_brcmstb: add support for MIPS-based platfor=
ms")
Fixes: 7de3244530bf ("ata: ahci_brcmstb: disable NCQ for MIPS-based platfor=
ms")

or

Fixes: b46f79bc78e0 ("ata: ahci_brcmstb: add a quirk for MIPS-based platfor=
ms")

--=20
Cheers,
Stephen Rothwell

--Sig_/Gmsk4d7kegXJZ8HM.5w8al/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4GYckACgkQAVBC80lX
0GzO/Qf/ft8XyT8foIeUyNA7gvfJesQ0T0QnB3eXewAc2k8WyzVspHnv0p+WmWVb
eJI9/Y9fVdWDA6Kc65z8k3s1VUA036nsHfl3Q0+6/BSggZtLv+lwyFjInuz32hia
ZDOWG0KeYAXVhstJ3FqW3OaO02sJiFpoXu6/PduVzyp9iLU1iciCZ/+sI8qXMeWX
Trh23oliJCuhhDRi7hyAqsVQrjMiI/lj5MLpGg5g4iDAt3sF2svra/sqF5SH5/H+
WcqRKEsGQPUcfdvKjuQNINezsJsa9/GBMn9Ts2a83a0t9I5j7TXv8wRnn+gI8K2q
M/28fFfmozVFaHWtsZQVlS3DZiQKxQ==
=dxgw
-----END PGP SIGNATURE-----

--Sig_/Gmsk4d7kegXJZ8HM.5w8al/--
