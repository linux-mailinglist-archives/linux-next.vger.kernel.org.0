Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C59334A3A8
	for <lists+linux-next@lfdr.de>; Fri, 26 Mar 2021 10:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhCZJHU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Mar 2021 05:07:20 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58919 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229848AbhCZJGt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Mar 2021 05:06:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F6GLW2bCVz9sRK;
        Fri, 26 Mar 2021 20:06:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616749603;
        bh=tMzWlXJp79cJYIy7dkBdDzPOFdRLsc9il9+HnMAcioQ=;
        h=Date:From:To:Cc:Subject:From;
        b=taUe+Y1uhs5//LJunwLRPk4IG6qLuzgSFzGKKYBezw8QanHP311OyCBM/bOE0fJso
         x40fX4dwNyLQHoX8pBI+DR2DkIt1vi6vy1bglZxjCDp8s9mCwBp174kCzbKxy4fzF+
         NqPev8TXzn7cxDRsR8l38n6zuk4ZGB5fvsV8uXzYk/KoKbFuQD1Hdh5tRKfJkg/6mr
         jj6Kn0u8BAZmHcZOci1tppGgpXqhhuwPREBeH/Kb7w5E3eixaUtfO5UoJd2wsRKyq9
         /OjPBH16wDFK0uGdKUNSwD2adj4Paf4LbsSU6EaRZ3GMcpSlSmruuYf+JrmP64YkxV
         0azWP42+197vA==
Date:   Fri, 26 Mar 2021 20:06:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20210326200642.5aed1876@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m5W9b7KcM2_F0sU29K4S=Xy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/m5W9b7KcM2_F0sU29K4S=Xy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  5d7d1f5dc626 ("cifs: Adjust key sizes and key generation routines for AES=
256 encryption")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/m5W9b7KcM2_F0sU29K4S=Xy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBdpCIACgkQAVBC80lX
0GxGegf/bIpNZiRhLs+X5lS/DBFJLjaKwki65EQVfK6OjvlApMAc8VlVzWl2DzM1
hjqktVzU9XAvU2ROjy27pUHm6hU3X6sKBxScMq1t0D9bUhKu+xRXAmsXKjBC1hYS
LjhD3mX2J7u3Xf1zRGilCTe699aXMi2fzBwLo1tO+lIIu8KKHJ+vI4OtVc7eBKFZ
QqmueG63Ug51TUiiQ4Nmx/nfNF+0lr7ueDbCA4L3EGJ0umm8S53o0hW9pIg3jyr+
gtCR0LIPIAu1jnWZk9wMgvOqKLlRnFV0RPAnIggOy6iv2S0uipkveA5w0LSnLK+v
5mgGSFrRv6/C1U3MvnQKNOOD+dhn7w==
=Tntx
-----END PGP SIGNATURE-----

--Sig_/m5W9b7KcM2_F0sU29K4S=Xy--
