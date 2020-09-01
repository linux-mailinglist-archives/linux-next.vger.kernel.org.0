Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66D625A0C4
	for <lists+linux-next@lfdr.de>; Tue,  1 Sep 2020 23:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgIAVXA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Sep 2020 17:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgIAVW7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Sep 2020 17:22:59 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB011C061244;
        Tue,  1 Sep 2020 14:22:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bh0R26hvBz9sPB;
        Wed,  2 Sep 2020 07:22:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598995375;
        bh=3Esvk0W81xrUht6daRuR6VuF2EFX7pYqSLRxhTBc+UI=;
        h=Date:From:To:Cc:Subject:From;
        b=aHq09IbG0pm8buLuCZyGCMApsK4jafJJh8AGfiOKTzGoJUWShsGLtvltYv+38clJH
         RpvtOsyANVy4ofTfVTsAT0G8CyCCxJEveo5m9zfKTQsm3DX/22zQsRqNgsz3ROnYZ4
         jhZtlGEFMuB2oc+ljnsTvPtU4+pEkpHW0Kava3GjUOJekutwENMzc8tA+/N/Ujauhd
         I4kvw39LnCKklUZx41eUkNqq4GtieTx69GT/5CyLntp/DaaNh11QK1rvTd8+WkptoE
         So6zqwEzO8taVQ+eRuJklFTK3zrtAE08G1I3Ovy1k1fCsiZZcTxmKibUz2JuFhJUYs
         55Ym9JLmLZ8eA==
Date:   Wed, 2 Sep 2020 07:22:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Ogness <john.ogness@linutronix.de>
Subject: linux-next: Fixes tags need some work in the printk tree
Message-ID: <20200902072254.3054db47@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rBhn/T6ojvrr=_d+utx4LNb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rBhn/T6ojvrr=_d+utx4LNb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commits

  e5e4c07d9233 ("docs: vmcoreinfo: add lockless printk ringbuffer vmcoreinf=
o")
  0cfdacd74ad5 ("scripts/gdb: update for lockless printk ringbuffer")

Fixes tag

  Fixes: ("printk: use the lockless ringbuffer")

has these problem(s):

  - No SHA1 recognised

Maybe you meant

Fixes: 254685ef9374 ("scripts/gdb: update for lockless printk ringbuffer")

--=20
Cheers,
Stephen Rothwell

--Sig_/rBhn/T6ojvrr=_d+utx4LNb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9Ou64ACgkQAVBC80lX
0Gzr7Af/fkH9i2kiBWEjQ7QiuHNiHo49tfZZuyGnrBWS/1ct1lIEPi0pr0aVP0JQ
X8koJ5b4e8Sn7+7FOX24BQJYQOqRYCD3vnI4xC3OJZ63GkGrdW+RuL7x/VOkshJ0
EhZ2GBS7ydTGvDdvX2ZGWOB+tk7AxdNEpGtPBhvXvlD9REtYLK2G2LA0PhI9ZDQn
nmvu6ZxU09FfwGbuE41xrHuflw4zMLRH5u8QEd90PfKXMlqDY8qUX/j1gAX0Dlz2
e6us6vVwhs++6nMEuq8zfmzlfiN5yQGRuJ7z4bIqC0DzVOWuBUthgxHI/fW6ISNw
vfXtHoD0kjxkm5sKeZHLXan3GKOcVA==
=t+44
-----END PGP SIGNATURE-----

--Sig_/rBhn/T6ojvrr=_d+utx4LNb--
