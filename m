Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC89120BD03
	for <lists+linux-next@lfdr.de>; Sat, 27 Jun 2020 01:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgFZXHo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 19:07:44 -0400
Received: from ozlabs.org ([203.11.71.1]:47805 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725883AbgFZXHn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Jun 2020 19:07:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49tswt0Fnlz9sRW;
        Sat, 27 Jun 2020 09:07:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593212862;
        bh=cpjjOMOd8KBgiqhDhlyJ7knXV9OKbfmDjoimMqeM6cI=;
        h=Date:From:To:Cc:Subject:From;
        b=LuMrdzbgeKsQrzG6OK4qQiLRXvNnyM+SG9fiHtOMXwydf+VrOkWX6AyN8I5QvgfGO
         bxuweY/kR8ymtn6LqCgtV5lNZCr20ZbwCLUhngztkxxSuW790NcqO7dqFCYYwUzkO5
         cY8l1Wu8fW9mXKhvyDDlLILDS7ucZ6Ly1Js3IyKC15urOfcT4bNPeivahnP8nRsKQo
         21h67Dpehg2ReA7gywp4JaEh+a2hfc1oay01+0Nxzj2FHg7sSyBOj3s2c9FtTQydAT
         d7bjCQwBhIbFdIh9YwLCj4+KSKf+oVarTKjZ83S2okjsYDgPC+V4+iCkiPdHOtteYi
         /ccKxaCEXwR0g==
Date:   Sat, 27 Jun 2020 09:07:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20200627090740.683308fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NFsPZ==rK0E/2cJuZ.UUrRE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NFsPZ==rK0E/2cJuZ.UUrRE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cd664b0e35cb ("io_uring: fix hanging iopoll in case of -EAGAIN")

Fixes tag

  Fixes: bbde017a32b3 ("io_uring: add memory barrier to synchronize

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/NFsPZ==rK0E/2cJuZ.UUrRE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl72f7wACgkQAVBC80lX
0Gzsegf5Ac/qCMJaDQtFLzzsT5UOSOCZ7eMvgbgGCRjOIuSe6elSS+u4ULWj7XBQ
gKTKdwZSJZJ6HrAJ/jsG/cI2dgwwxni+c2su7mJOCOUSDL0e1mmTijVUxo7BXpnl
M2U89hm+WJkU5rw8GLVjWBfrDje0c5G9EvLZ57CNya5wgms2dTBCcwbgnAzcZIyk
XMbHNoapNAlgLsmIoAOoAUWUKZf+zavnR7O9lj8KTkcnZ8VMTdDk+ESgKxYca8tw
oZg4dHQfCkqGDR9ERIJQOdrStX88EGA0rTUsNRJ1KPn+kq72xBvULu1/04i8LB9Y
h9n6Q773FjOeol69Sk6p5t3ZfaOPgQ==
=SD8a
-----END PGP SIGNATURE-----

--Sig_/NFsPZ==rK0E/2cJuZ.UUrRE--
