Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D88735B742
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 00:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbhDKWiQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 18:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235229AbhDKWiP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Apr 2021 18:38:15 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F8AC061574;
        Sun, 11 Apr 2021 15:37:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJRb81yGNz9sVt;
        Mon, 12 Apr 2021 08:37:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618180676;
        bh=RLqGPWar9Vh9nvT0k3bv1vE+ko0eiapvUaj5wueNVAY=;
        h=Date:From:To:Cc:Subject:From;
        b=CXAK5PqkNyurUcKFKYHp8sPHFYhu3bKvihBwndSdN1YOKLQXTmFWTCJ9/a31fC4RV
         I+bwim6fp6TX3kHFZL5N2T+XAomjaIG0tXj4f4s7RLDo0k0xTmPh+mBVKGKAHQaGDm
         MhDaeF1EXqbcujA4mzn9lKWwmBl1kKiXKnCVT/Q3Fgy8BUgBPIy5JL3TtvEH6zkXUM
         T9Prffwx1XBDlG32Ln2iJiVrfCyQGeTDkC+80rPBgDN1XzYoWRvsocGwRAXOCZmhoM
         mLkCxZq+SHg/SJVzSkesYAFgeVoLKVWEWzHf6sn9ZAPslmZcCrUp58Z/6fVJ6SWUoi
         So29xi9js1pOg==
Date:   Mon, 12 Apr 2021 08:37:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Muhammad Usama Anjum <musamaanjum@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the spi tree
Message-ID: <20210412083755.15cf6aed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2WDzsOAVd9HTVj8YgcbXsE_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2WDzsOAVd9HTVj8YgcbXsE_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e980048263ba ("spi: orion: set devdata properly as it is being used later=
")

Fixes tag

  Fixes: 0e6521f13c2 ("spi: orion: Use device_get_match_data() helper")

has these problem(s):

  - SHA1 should be at least 12 digits long

Probably not worth rebasing to fix, but this can be avoided in future
commits by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/2WDzsOAVd9HTVj8YgcbXsE_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBzekMACgkQAVBC80lX
0GzYDgf+KPxdPtlkc3Lm4PZnY4GqP/K2D80k3Qc3SZlVAkywepb0D7T18/TUPgXq
pNEliUIQjBuVKN8F9Stnk8pYYXAC5GCUVvdOqrJuTyyWN6o4ckjGObzVkWoP4y6x
P7+LTEWrxWFXjt2pkFbM6lXg7v34GJRBWO6GoyTF8FxgoP1CiUaj/eIbC/+FBptN
J5yinB6/xJMT/ZBby56iOix/jKEy8LlJ0hg24sbKsW373qN9yPbt8LQjs0b7TL9q
h/QDnI8qG2vVegcLSRKTpHtPnf86YCC/YT9GiY4si8aDPmSBmXg4lRmYBIWKQXdZ
VxpnBhhTjj1Q8Enjjt7AeJqXfm9ICA==
=MjnK
-----END PGP SIGNATURE-----

--Sig_/2WDzsOAVd9HTVj8YgcbXsE_--
