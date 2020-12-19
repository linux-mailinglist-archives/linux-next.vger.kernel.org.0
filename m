Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA2A2DECDA
	for <lists+linux-next@lfdr.de>; Sat, 19 Dec 2020 04:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgLSD0x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Dec 2020 22:26:53 -0500
Received: from ozlabs.org ([203.11.71.1]:46301 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbgLSD0x (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Dec 2020 22:26:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CyWNL3YtHz9sSC;
        Sat, 19 Dec 2020 14:26:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608348370;
        bh=GyJuMVDzXkHWWsDpbMYYE2/u9WTa2jevChKAYpPiEFk=;
        h=Date:From:To:Cc:Subject:From;
        b=oUWsGlPR/GT7d1g2hIc5tWi20S3dfQtMnJOH/RIz88dTBI5Wlnl5H3dD/ZH7V25XZ
         JywzSV9dE+DpltNMN3ow+e+OOOi1TFueuXRvRPcL6e6r6sS+GSdYlbByd2Qk0via78
         0k11x5xGkTnoW3OhGO+UQnCGkCeo5YuwF5kwJKmKW6jFJEFvtepy5C7XbojgwTyMEN
         Cp5elCiQYNdkAkQvlI8kL8NcGoxnhrAhf9baMXGnaDiGSZ2GmDPIft+kwEoFmozED8
         IyjzWS4bIVz7KSXxleUX3Cfu8c8sAo50m1lJNsAnqgyqOtUa0O4sHFddL2W/I66dnd
         lcktHCqXKg86w==
Date:   Sat, 19 Dec 2020 14:26:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steffen Klassert <steffen.klassert@secunet.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ipsec tree
Message-ID: <20201219142609.091b5eb1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EFaS1nXhPGSh+96heIJJY8K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EFaS1nXhPGSh+96heIJJY8K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  06148d3b3f2e ("xfrm: Fix oops in xfrm_replay_advance_bmp")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/EFaS1nXhPGSh+96heIJJY8K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/dctEACgkQAVBC80lX
0GwajwgAiMrGbv5MhEWQ0XVeRqq8Uvqf6zN1lPhwsaeBrKWEY97dkVQ/3qpUps9O
5TujNRIe+eTq6wYHKuaWjinPR3+04xxo1EEuCqeoLMEYfDS659HcUk6gPRkN/XFo
BojPLRQDVubVnFQBRtyUnxuGsqL99VcgSXCAqZkOqj7h1aShwhXA41dfMs13b6Tm
VO+rdoWaTHCM7Fd94No5a0rWO0+t8unsWdl3WZT7iZYI5joIpI9NqUTgfYvbrZbH
1nA5lC547I3cgUhC5FQHuw9QLZrFgnHsA4SHkKxnu3leF0e+z+8WgBbw0hEk8LOL
dF/YstNlwvg9hj7KKZ5TQnRSqjV+mA==
=e8x/
-----END PGP SIGNATURE-----

--Sig_/EFaS1nXhPGSh+96heIJJY8K--
