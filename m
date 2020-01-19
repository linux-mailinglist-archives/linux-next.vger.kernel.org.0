Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBD50142023
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2020 22:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgASVY7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jan 2020 16:24:59 -0500
Received: from ozlabs.org ([203.11.71.1]:33675 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728721AbgASVY7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Jan 2020 16:24:59 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48179h3tkpz9sR0;
        Mon, 20 Jan 2020 08:24:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579469097;
        bh=nqlaWvh5b+NWgWgZl+bhun4u6NHotqWpvp6ekKPTjtM=;
        h=Date:From:To:Cc:Subject:From;
        b=QnDrSHSbomqCvM85pT4Y1JDlmq89sD7aMwdcopQme0hcmSMvXXsDRW8Rd3urXCTX3
         sFRgon+zEbWA8EphGlyVzlbZ6CPtQHeDCmbutrXhviaNXOaHXQ1xSh+bikxkGRC4Ru
         HoVvC1sj4nYZtb+xuAHy/ExY+vw+MnVN+eKHFsVSNKLGxc3Tc0szGSnV84+zOW0tht
         Q6F+WzQGmF/dr3skj6Re8OHXL46vksAgEjc5yXNDDuQ613iUPkVKyT7ZxrZENn6jPV
         0Hudh0zrOkXRh/IgI0+GV2ApIm+ApYrYBfLGADwT0y2/h1osLDpg4GlM4Z1tzJr8C3
         lN/yAxybf0waA==
Date:   Mon, 20 Jan 2020 08:24:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Russell King <linux@armlinux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: linux-next: build failure after merge of the arm tree
Message-ID: <20200120082447.7fea4d55@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Te3W/K1h7xILXq2zk1HOyI6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Te3W/K1h7xILXq2zk1HOyI6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:


Caused by commit

  e3a0e1427dcb ("ARM: 8953/1: decompressor: simplify libfdt builds")

My arm builds are ppc64le hosted cross compiles using Debian's cross
gcc package.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/Te3W/K1h7xILXq2zk1HOyI6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4kyR8ACgkQAVBC80lX
0GxHiggApNHufQkFzoA1esLGsppHxYD3l8jaDCxK3Vm4Y/ZiqwBHlgH/RTZZE7JV
tPZxxiCpl5PoXPR83yyxQo++e1/EqEZENNk6dU1pVVVLXuK9M5ZlZxhlGyeZxtwv
J5NdbJJEGWwXmOnlvzM9aCKYj1ofs3z1Nccc1DSLdIz0c2NA6fcDuIOfaN7bmAnk
7UyS/PqbQPYJn01w/mD00M73Oyij1kbl0+i1GgQXuaxsycKKxznIqNkGBsUnlWxg
k7cESMlJPDeffkquqLMdYTogjLUKmCNZihT8Zi6StFDPXRJDMpLf2q6HlCOwWVRD
aESspfJL6ZY8mc80Vj+ljSO8H2D1jA==
=ghdb
-----END PGP SIGNATURE-----

--Sig_/Te3W/K1h7xILXq2zk1HOyI6--
