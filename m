Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5723CCB3D
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 00:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232582AbhGRWGb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Jul 2021 18:06:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47717 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231222AbhGRWGa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Jul 2021 18:06:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GSfB974vpz9sS8;
        Mon, 19 Jul 2021 08:03:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626645810;
        bh=ow3oISgUt8gifN5Zaxk0WqEyzqNptMA9sqM3H8EVCiw=;
        h=Date:From:To:Cc:Subject:From;
        b=XokvfytQiRoJRltV/yS/lGyVfzmlXYoo8riVAkTKhS+KxAtGbf9xLBh+JjrpWQqe+
         qrPBHVZgw5U2BKoedrjBTs0cJxOIQZAPPVuEIN+ZDeD+BLOfOR7cVhZt9wIiLftZ8L
         yuKBvAy5ZPpNSYM2gPEKUL0k0qjSyHQCJvvFi1s2AktOYRTF3SS3aOsZLo+E7WTvQI
         UITWnYBFve3cAFw7OqYf9D4qWTC9ZxScztCFtceHa4sY5kWxqGky/yWzsKw2xLligf
         JKHOn0cVUJ4PvtaLoT03+sRMVrvhA+l4LqK5aagPliI+MXktufUO1tvO9SWdF5Gqi8
         ThmJWS1bEAswA==
Date:   Mon, 19 Jul 2021 08:03:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the aspeed tree
Message-ID: <20210719080327.161df5fe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a..qukmKcs=fisP=BNwjp2t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a..qukmKcs=fisP=BNwjp2t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  3d5e36b84467 ("ARM: dts: aspeed-g6: Fix HVI3C function-group in pinctrl d=
tsi")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/a..qukmKcs=fisP=BNwjp2t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD0pS8ACgkQAVBC80lX
0Gw+Ggf7BWBuGEfxruQ8syi9SNpDodjdrkrbLEBFVUxXDrl3WjC7moo0QErgw2qU
r8FfeFHuNnurLA0nyAlVtF+cmvJVJ4qt8BxlLGocYUFy1uieGDSeWbI/XVEI45Z1
SGsS6us8uH9qzV1KUYTQGi9y5o+9HsviQaQ/yVk01D7bqbN6UAaX4UphtzWjcOIK
OX3Jpoawk3LPXPN1KVcbt8yLi6+rMRXpPR/iSjWwA0v5fDK27jzWYPMOKDLu4Fv9
lbMQNd3xQrFfyVcj3FSimuPHFYeehtaZQVodM63lQPM3crJGgBefzjIpJ3jSZ2xL
MnSgeD67esI3JZJZM68v/c1MS2oPnA==
=OlMz
-----END PGP SIGNATURE-----

--Sig_/a..qukmKcs=fisP=BNwjp2t--
