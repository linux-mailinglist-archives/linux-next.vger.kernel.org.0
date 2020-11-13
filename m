Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1D42B15B8
	for <lists+linux-next@lfdr.de>; Fri, 13 Nov 2020 07:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgKMGBH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Nov 2020 01:01:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgKMGBG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Nov 2020 01:01:06 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFFFC0613D1;
        Thu, 12 Nov 2020 22:01:06 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CXSWd69M8z9sTL;
        Fri, 13 Nov 2020 17:01:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605247262;
        bh=Ez3/en+xi0NuSHe2dT3+pQF2QJwkm97AYzESCMDEC18=;
        h=Date:From:To:Cc:Subject:From;
        b=UbxpTtNfjFh+GObtdg62CO5w4IwQTKhwBP/VSrZPVQBRHgUysog5MqNviXTEDgUNy
         rcXFbaCA9t2G9fL8iiHtrfMMMl2AeSwFCCSFRA7aK+WKkndIwiFyC+WuOIQIs/7Hlw
         D5pR/B5as+dbHC+CyRTP5N6w745NBY7FhuDz3rzHZrDaH73aeNaENpm/lSaKTFJ+iD
         642bZY7VDJUmrvkzDH2MJ1nQCNgHBDGgtjneNlvpqLffjF5lejyscinl4eBPp00Kf5
         Is0shfu6vuxHP2beyJgX0xbj0q1+efHFFIz5ha5XOBq9XvIjWgTuC078XPbw6tg7RZ
         TeJ6tN5sif8aQ==
Date:   Fri, 13 Nov 2020 17:01:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20201113170101.00ad0712@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mgWdkXw0LAhI6Uwz4lODXAD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mgWdkXw0LAhI6Uwz4lODXAD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in lib/cmdline_kunit.o

Introduced by commit

  f1a15df76475 ("lib/cmdline_kunit: add a new test suite for cmdline API")

--=20
Cheers,
Stephen Rothwell

--Sig_/mgWdkXw0LAhI6Uwz4lODXAD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+uIR0ACgkQAVBC80lX
0GxhGAf+OlZLHzerd7o/7N/BqZ6Jx9kIp9GL9hVCjsoQmNHjhaAZp+Jei3kuOYe7
BaOdXtBneKrAoILue1dZ58Dn23yFXL27qyybKFpAeWIp/kAsJcZLuxDZZXojdM00
sz+VBbZU2l7+uHF3X/DzHo+EItE9WOcwXuJKvc7jU8UVOUmJ985LSayreRaabX4L
mBiYWCGdBoE1ohLeFcwYiQzp0amL0EkfoF0PYcanOe9sFo1MLo8a4NuFJuZwKsMD
BpO0RtmjxgRhrjgT1tfP8vF3elzqRSv/xHejclosjG2TzkoEB4eQbjmLKwopDdsi
xmO0EvlWdhtDS4cwMTxzXLcCJMTFgA==
=VEHK
-----END PGP SIGNATURE-----

--Sig_/mgWdkXw0LAhI6Uwz4lODXAD--
