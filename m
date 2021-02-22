Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27310322112
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 22:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhBVVBz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 16:01:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbhBVVBt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 16:01:49 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232CEC061786;
        Mon, 22 Feb 2021 13:01:09 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DkvjX75PPz9sCD;
        Tue, 23 Feb 2021 08:01:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614027665;
        bh=olblnrf8WPC1vkEBiXMm8ZsEQRImeamp/bkmIhSBoNw=;
        h=Date:From:To:Cc:Subject:From;
        b=tLOwji7rOpEdcpG8tytkOIbyAwmZ2j/0Qu5smqGjrpk2MjlSSObycX6NlKdopcXSW
         8vuara9k2Mp2DksWAvq980mVJxdz3rdbvmO0XoB8P6JZCZf6qfenbwbFubcsxI/yj6
         tj8MwFe2URFMg1/QE7ikPMNNc84HU/RYqmCCUCfvK0teOZWdhC55UWUK95kCGeHtyF
         MztDTskgORqtwPzLIZ9yJWKOEOwL8hukKQ97tLNcFvf/vRLYVxbUvDEqiPyKILSMf3
         ckwI9+mHeSNGbM/6gJH7Os7BHC7xlLkjvbzNOjLoEDqoOGTpuMr17yLEC/3KD5moEF
         4gjqA0LWW9nLw==
Date:   Tue, 23 Feb 2021 08:01:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20210223080104.5d2cd629@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HCRg1PKZ6ovKTNmvFOGM6X9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HCRg1PKZ6ovKTNmvFOGM6X9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  179d16007236 ("block: remove superfluous param in blk_fill_rwbs()")

Fixes tag

  Fixes: 1b9a9ab78b0 ("blktrace: use op accessors")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/HCRg1PKZ6ovKTNmvFOGM6X9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA0G5AACgkQAVBC80lX
0GwGvgf/bRQfsQW3mUKvuNs7vUvYbhH3LOxHtC5pbxSj86RR9wjgCEw3PgKZbxv+
wPlafEvbBj8cL0mvo4S7NbNT/88mfJEO0i/gigncr2/rS9MqvJmEBh26a57a4jOX
hZ7PYKbWuQJsjFkn27wjpoP6QwMnvw9xSWudCkOq/6K9n6y82VmdiCCjdZxw8kpn
m5khZ365inAiunE11Cjwlo8Y5NaxVRIPYfMf9Wt9pQCWuhE/9kR1qF5cap8g9yoi
YVYr2exv1UCO0YTUQ58dCuSZrPKp22qzmwhzSH5Ns1YnGjkLZHqBv3+sG857wtjn
U4Sf/Bl9d7b/xY5E+IQhE7SMNrZNUg==
=hhwU
-----END PGP SIGNATURE-----

--Sig_/HCRg1PKZ6ovKTNmvFOGM6X9--
