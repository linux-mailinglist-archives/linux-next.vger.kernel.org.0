Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2783D36A450
	for <lists+linux-next@lfdr.de>; Sun, 25 Apr 2021 05:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhDYDHt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 24 Apr 2021 23:07:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60289 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229514AbhDYDHs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 24 Apr 2021 23:07:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FSXxm42qCz9sT6;
        Sun, 25 Apr 2021 13:07:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619320028;
        bh=7+n2ozWzxtHKt7RZVVkv4hlmVgyqlWKiYIFk3+N5Tlg=;
        h=Date:From:To:Cc:Subject:From;
        b=c53E/bc0yZKkCnH+oZcxMk7KZFqYz8PwpN+QJX4H7G/g5CrmQ1j65o9trj6DY0rpH
         RzmspE+KrS2idHVI7nO96DO82G8RrqlwXRDTuK2ap/SOrf/0/5Yo5OU4M5swq35UqL
         IVrUxEZ/8w4wZSI/Jh9D/gJ6To8Cge0yVPSjoLWd+FqAgEg3CxS0cdQkaSMcZLkTBh
         sCALePs9fxgwv9avyWn2sbveiKammK3woS1OFMCwQScDyoRPJPQiwjg9wMfaR/eiV/
         alo2lD4YHCuzyrYngiyBVJ4kh318RU30vO+FohsXebKfB2vrzi1OZDOhexpnAnva+8
         ZxqIim93WnwkA==
Date:   Sun, 25 Apr 2021 13:07:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc:     Claire Chang <tientzu@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the swiotlb tree
Message-ID: <20210425130707.77c231de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Lr_i4D5BgHQo5q6xPkPbb5n";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Lr_i4D5BgHQo5q6xPkPbb5n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8d4df6f4f09c ("swiotlb: Fix the type of index")

Fixes tag

  Fixes: 0774983bc923 ("swiotlb: refactor swiotlb_tbl_map_single")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 26a7e094783d ("swiotlb: refactor swiotlb_tbl_map_single")

--=20
Cheers,
Stephen Rothwell

--Sig_/Lr_i4D5BgHQo5q6xPkPbb5n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCE3NsACgkQAVBC80lX
0GwmVwf7Blxh1qvRf0XKZDKwaQ6Jc8ry00AKPT1F9g6Vl4T1FmgbNuwoTBg6Js30
bNmkcSb6N0LzX4a3+pPh6+ndXcjkGgiMNTxZQnbCJYcgXs4Vr1WVxLyIJR0ewkaK
xzb61Eos4hPsABg8b08S1T8HO0BzwGPFGflv/PdxXuhrURiSQrPFSND2CP/1HBC3
/ARhOATE03Kh0a4IJ27tezl3ws/XJo3KtRALrAUFDw2tNNPIu05dniycrjTKOnJ1
oItDCfrnFKI2HJFceNWsZrauJzcqj5+H9bmx5eWGLxkgP/Zv+FlikV8letK+GIfB
tbJ9HgcJfKlYvVD8xpt8YJJWkD979Q==
=esn4
-----END PGP SIGNATURE-----

--Sig_/Lr_i4D5BgHQo5q6xPkPbb5n--
