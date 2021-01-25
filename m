Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2180F3047B9
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 20:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbhAZF5r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 00:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbhAYJlA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 04:41:00 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668D6C061786;
        Mon, 25 Jan 2021 01:40:39 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPPxH09yxz9sS8;
        Mon, 25 Jan 2021 20:40:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611567635;
        bh=ge4SmQb4K2zs0btMKLF7UReuWcVZuYJs0LDdqDoJ7tA=;
        h=Date:From:To:Cc:Subject:From;
        b=JPHxJURiXmXc1ZVWpRFni0AxAZ8wYPx8J/jo6zJYWu/R8g587xIEhd4BBCTtAiRHK
         isIFiUybQaCESn1tFmPhhLdWh2r6fR+0JM6lQb8Y7L8eF6XPvMloTYHmYiBCEzzNC1
         /ljnvTtlBOiwj3po9ejtyyCuqxEySH/LlmT8lE9BZuMEtk6PPUh6lIXqKal+gMguTL
         yDrk4UXVg7Y7YHeUomIKju7qW5SjWeCsY2TpzeVzrUYe1MrxNQwj7MALSTAbbdSYU+
         w+lEaB0PxVzXUcib7//sO/ZXbZ6R3NWbXDzAOxDieo4tGv/rHpGl6oFXiTNiNQKZul
         j8ADnAnoemp1A==
Date:   Mon, 25 Jan 2021 20:40:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Jia Cheng Hu <jia.jiachenghu@gmail.com>, Jan Kara <jack@suse.cz>,
        Paolo Valente <paolo.valente@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20210125204032.6b6a604b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h+Xs=lQHzOsDI_rshM+7ied";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h+Xs=lQHzOsDI_rshM+7ied
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d4fc3640ff36 ("block, bfq: set next_rq to waker_bfqq->next_rq in waker in=
jection")

Fixes tag

  Fixes: c5089591c3ba ("block, bfq: detect wakers and unconditionally injec=
t their I/O")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 13a857a4c4e8 ("block, bfq: detect wakers and unconditionally inject =
their I/O")

--=20
Cheers,
Stephen Rothwell

--Sig_/h+Xs=lQHzOsDI_rshM+7ied
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOkhAACgkQAVBC80lX
0Gy4nQf/cTZfw8NAieJmtXfeALjOhJGJR4y7OkoPlyuS/IGYZwG90OYhZLERWhxL
zAlT8q2RWA2ll3kk6bXuRM2n92clzBEZFyjJvKb/12+Nh4b1p3Z1o0LNMhuWVv4A
hyyo4/iFbKNsQ7j7DB+v4HcjBZvNp0X9GUNJGv/OmMPptBuG12OG/CQ7aMnqkcYi
El6pANLR8K6+Lo+g6tOMKyMZqUomnkIHFr1jtLkl1jPTlhMr7p2L6l8mNBgc3Y6g
JHmLce1zlYIftj0EHdMf0geh4VUTAu4BEdlrr+1hgZ1d0XFgmHhSVMCANCBc6dwg
F0K5x9+i7jKR73FdDDEvwTMlBmtWvw==
=Hv7O
-----END PGP SIGNATURE-----

--Sig_/h+Xs=lQHzOsDI_rshM+7ied--
