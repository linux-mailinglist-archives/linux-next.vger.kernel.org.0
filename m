Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6701CEF93
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 10:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729284AbgELIyK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 04:54:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57929 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729281AbgELIyJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 04:54:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Ls6l5JQLz9sRf;
        Tue, 12 May 2020 18:54:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589273647;
        bh=RuA63jA3VaXDJ5ibO1oOo+VHs+JqcJrlEg8P5O5rQfQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LRQGdBBVpG38hA8kjBZ7aeVl0BdcXPa17JngRDF2Gv687YjAROpmIVzIIRxbGbdWx
         Ns1thA9DiOJzeOPvbfZJ7827r3jsF43/EEXqgtjYNkRy+y7ysnoD5pF0MQPztll+no
         P9MaAlokwxPG/EocVee/z0WkMRfvhYzfQReIXquA/c6u4+ClsRH6lk9mQCCAdTUuCT
         1n7nLDwN0rLEspnLoa1jTg4ZnQBSt7HapyUHeD9X7svisx80SF6Ae80qH9oHKwvjkI
         KPXpWzuymQupQJ7CV6Y5R5FY6+wxBzO4CsIuhfoqEr5lwn2UIxHrlSuxgn6rxmQltR
         0P4P3UFyvwhjQ==
Date:   Tue, 12 May 2020 18:54:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the notifications
 (was keys) tree
Message-ID: <20200512185403.15297945@canb.auug.org.au>
In-Reply-To: <20200504134750.2278a82d@canb.auug.org.au>
References: <20200504134750.2278a82d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eSzriVy6M3Ng1NR63dfXzbk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eSzriVy6M3Ng1NR63dfXzbk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 4 May 2020 13:47:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the keys tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
>=20
> scripts/Makefile.lib:8: 'always' is deprecated. Please use 'always-y' ins=
tead
> scripts/Makefile.lib:12: 'hostprogs-y' and 'hostprogs-m' are deprecated. =
Please use 'hostprogs' instead
>=20
> Introduced by commit
>=20
>   631ec151fd96 ("Add sample notification program")
>=20
> interacting with commit
>=20
>   ee066c3ddf7b ("kbuild: warn if always, hostprogs-y, or hostprogs-m is u=
sed")
>=20
> from the kbuild tree.

This is now Introduced by commit

  b8c9527a31b0 ("Add sample notification program")

from the notifications tree interacting with commit

  a2db26b0ba3b ("kbuild: warn if always, hostprogs-y, or hostprogs-m is use=
d")

from the kbuild tree.

It only produces these warnings now:

scripts/Makefile.lib:8: 'always' is deprecated. Please use 'always-y' inste=
ad
scripts/Makefile.lib:12: 'hostprogs-y' is deprecated. Please use 'hostprogs=
' instead

--=20
Cheers,
Stephen Rothwell

--Sig_/eSzriVy6M3Ng1NR63dfXzbk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66ZCsACgkQAVBC80lX
0GwXDgf9FqgUumXeif9vC8RLdCpFUo7DwDSj5RPH/jJqf3tx9qEOxOk472E7Z463
S9zw8HgVlrUa7VnGsXreWtOGlOehKaian4AWRlZ4y2hRryyAZtt6tgal+W9t3wU3
O4qKDMpViDUoBeo1ioHPQ1agK8n9pTHa7RI9WUFHQMnDwSpyjTDcrXIc5NVTjOaw
CYccEPxEBWrISBpR5l+tdR2Y6G0VH/olMx+ejGFtjhgvfr6GWcO9p3u1LIeYD9iv
6uE3QTPotJ+vRPW4mtYaGxtrHRGq4IpdeDAd3PPIvfNZoQV0xgH1Vs8cu/w4Oa+k
BraXoR3uj3MzLO9DO5+l0ScGTFQUYg==
=t1rf
-----END PGP SIGNATURE-----

--Sig_/eSzriVy6M3Ng1NR63dfXzbk--
