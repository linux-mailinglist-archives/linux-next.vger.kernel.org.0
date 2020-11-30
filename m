Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDED72C9215
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 00:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730988AbgK3XIg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 18:08:36 -0500
Received: from ozlabs.org ([203.11.71.1]:34037 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730973AbgK3XIf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 18:08:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ClLVc1JwJz9sT6;
        Tue,  1 Dec 2020 10:07:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606777673;
        bh=yQFCB9BPFsIa3MVG9iVs2Aj3kROzOYhZYYxzt4KRiN8=;
        h=Date:From:To:Cc:Subject:From;
        b=D7g8/xYV9QMerdsu8D1V/PcTaPhCPbNz4Dh1pDLVR4UJ6e4J9qzbHsVHJIq2bA/Ui
         z9pn2RyTIR9rpUHAyJXINXelQr874ego2GQaabq0e3UaMCniXtshKG3bARQ08T2AJu
         lhVP/QvHGKxzfAkDG39EZ/rLHM+sPvZP0MMnMH4+PeCpvx5coS+8k7UA0RjBH8YcUJ
         HUHhCDNll22Iv64G46G0AeLu/KB3qUP2N71ChN64JK08/L8wF7sPpSvrh/G4UXx7GK
         Ez/h1BV97GqT3VcKLhS3SWT7AooC1HM+w1fZ/Wx6mFzBfGfD9+AgA3dGZYgK6i+aWI
         uGcSNzz1c9zLw==
Date:   Tue, 1 Dec 2020 10:07:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>
Cc:     Yu Kuai <yukuai3@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amlogic tree
Message-ID: <20201201100751.6cdf5ec8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I9TWDm7iOrO46zvg47VsgB0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/I9TWDm7iOrO46zvg47VsgB0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9d822ed94237 ("soc: amlogic: canvas: add missing put_device() call in mes=
on_canvas_get()")

Fixes tag

  Fixes: commit 382f8be04551 ("soc: amlogic: canvas: Fix meson_canvas_get w=
hen probe failed")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/I9TWDm7iOrO46zvg47VsgB0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Fe0cACgkQAVBC80lX
0Gz9EQf/Th/rcPFbCd6s9yC8K4OlmDIDbeO9sT766AAYnPLCxmUF804Hmog2wFBi
h8rTi9XalNHS6Nje7B+slnKy0mFxbAEXBpj8jVusft8SB8krHnIpa0YukEis4Yao
6wWbz9I7RzFrif2dYMwU/rX6+mzZkscHAPbObv6FZQOh1pvwjxj03pqSYmqRAWYC
I/bcv3mFk9ghIr06j6F4rb8OPawWs7PeqAjwMIyn6hYvTOsCInbhO4V5O7NDErKr
ZVu1SIY250lXcdJXk/09ns6iFnffbF5+79OnPJl8Q1mL80Ci5WdAjYrItan8Lvan
s6y99bkV3XWByB5c+Lh9hL7T9WeM+Q==
=SXbM
-----END PGP SIGNATURE-----

--Sig_/I9TWDm7iOrO46zvg47VsgB0--
