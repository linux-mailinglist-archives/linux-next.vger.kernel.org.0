Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933D52FF6CC
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 22:09:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbhAUVH5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 16:07:57 -0500
Received: from ozlabs.org ([203.11.71.1]:44605 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727473AbhAUU6u (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Jan 2021 15:58:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DMF8X3v6Cz9s1l;
        Fri, 22 Jan 2021 07:57:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611262668;
        bh=e4hR1kPAHbwnex+QqprC9WLpJ5biZMKwufiDGhGGoiQ=;
        h=Date:From:To:Cc:Subject:From;
        b=COr8aJ2/DqjAmeRFhRZNhnTmeQ7wUiVHTuIYtpJpgYLUTldtBCC5GCZVn/rWobtrt
         5D7CI3rDrPyPY9718R/i9nGT36LmDSgi0L023nPgDY/woXjiCdz7/L1VZNTCPwnYqN
         qA7hjLkqT4uvHC4eLHhlA38Bm46RM6AxxFa99rb+rAP3KAkiIiHZn6Z3WBwEr+YLrn
         INYEdR0mg0KvHdc7RZM89B4JBCArDpISV5zFTSmJW3Mi0p+ur8clt3ulKsbtlE3JvC
         cG1cfin0yypBjPp8UyO8MyCWJzdjXrqwRPFg+TaHwNY/EKhSNAzuTlHCGAQE90+050
         fuEeuxU87IR3Q==
Date:   Fri, 22 Jan 2021 07:57:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kir Kolyshkin <kolyshkin@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the jc_docs tree
Message-ID: <20210122075747.3622cd8e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RD_ah6h49n0YX1J3I=fksSp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RD_ah6h49n0YX1J3I=fksSp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cf9cadf16b19 ("docs/admin-guide: cgroup-v2: typos and spaces")

Fixes tag

  Fixes: 5f9a4f4a70960

has these problem(s):

  - missing subject

Maybe you meant

Fixes: 5f9a4f4a7096 ("mm: memcontrol: add the missing numa_stat interface f=
or cgroup v2")

--=20
Cheers,
Stephen Rothwell

--Sig_/RD_ah6h49n0YX1J3I=fksSp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAJ6ssACgkQAVBC80lX
0GxUwQf/d86s1Rxw+HRyYejUVAnecM4HHUk5jR5CZ5n0ugtfiKZxndqanuEz6LXa
92nIXbb0qHj0lHRY4UcUXjVUFatlXWYR36T6TEzmDYGREQXn2mqZ9E+IWigPcgpz
QbrNSzkzra7EnVfCxov2IRx4ZHhbAqnedjPBtP0Unna0lxEBSHk6Kh79A0VvPWxo
FPXAAnce607+6wxguhG1aw8t2YzyC+CpaoaRKpRyzEexlDE8cumwJOvwvpVOw2tp
pZuDTSMhrKOCKuxcLHrBtJP0SsTQ9BCkpseRqO/Yb5WG2fEmGSoXwwurKhyjwj0W
n5lldv+pRPBuyIdcrHYiq31hsMo+7w==
=qI88
-----END PGP SIGNATURE-----

--Sig_/RD_ah6h49n0YX1J3I=fksSp--
