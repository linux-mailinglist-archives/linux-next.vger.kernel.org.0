Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6391942B722
	for <lists+linux-next@lfdr.de>; Wed, 13 Oct 2021 08:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237916AbhJMGaw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Oct 2021 02:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbhJMGaw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Oct 2021 02:30:52 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1EAC061570;
        Tue, 12 Oct 2021 23:28:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HTjKW6r92z4xbX;
        Wed, 13 Oct 2021 17:28:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634106528;
        bh=w8PF9bP8rPv6Aqy5AkyNtTTvt2SM3fvgmtYQ0JWxWvw=;
        h=Date:From:To:Cc:Subject:From;
        b=QkCkeRIZft3EUHqQvg1JCuyTqWKnHKDaiJNYdjRVaM88LxW0rAHa11h3d7S/03QWK
         YSClNg7jgWGXDjyxM5eQHli1uQNWjapb4zP62QiGMWKI0tnxqjxfdx94zvSxjPVBfd
         3IAAfPK6jX/IY6B9Dp6aranpj9k9/9VrjmCDajgs5NBhkcx2r+PeMUAOv8LJoLyc3s
         RGSsTSqG8sBkiX3vTNrVWjUfuF/t2PlsETeh0MwP13c1SBOpUf5ujMIQBEvgk0tWtG
         QkCsz9uAspGozhOvwehuXB00z3LWW+wUsX1N2zpUcw7U4So+i/wvYUpbwlRkRHtF4p
         BIdcTltu/PkiQ==
Date:   Wed, 13 Oct 2021 17:28:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pm tree
Message-ID: <20211013172846.55fb665a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vjKg7qpKcOuenmaedRJbrMd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vjKg7qpKcOuenmaedRJbrMd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/ABI/testing/sysfs-class-thermal:201: WARNING: Bullet list end=
s without a blank line; unexpected unindent.

Introduced by commit

  80da1b508f29 ("thermal: Move ABI documentation to Documentation/ABI")

--=20
Cheers,
Stephen Rothwell

--Sig_/vjKg7qpKcOuenmaedRJbrMd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFmfJ4ACgkQAVBC80lX
0Gziagf/VULKinytmi2I6h1CMaucMVKy+rkGDBIDPfdNopEvdCLE4Xn1s3QSguSs
1JntNnWsgv7Xjftgo0KVY22+IXSIJL+ibidT0ST30q7NEPw3W5LdRoR1EiqliRuN
bivSxK+ixQN2wiGG0ycS1qzB2hBaFEbrq1ueAinPIDP+JGK9gJgyO4DBqWY7KZK+
IQ+GLiAKzmr5NliLiKvsvYTBG2z6FzYNI2qAYZvV1kX3/Jn363677b248jbUXThC
oHhxQebwgxPgQFMP9SlYqsg3QcxuHzAjOIuCvHWQawXW2iWMw6iPIyZodUl0wo5I
V0yNf1hIcBHtVV38h7/5VXccMaxk7Q==
=rlRS
-----END PGP SIGNATURE-----

--Sig_/vjKg7qpKcOuenmaedRJbrMd--
