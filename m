Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B22A3B2BAE
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 11:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhFXJp1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Jun 2021 05:45:27 -0400
Received: from ozlabs.org ([203.11.71.1]:44267 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232019AbhFXJp1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Jun 2021 05:45:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G9Ztt4WqQz9sTD;
        Thu, 24 Jun 2021 19:43:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624527782;
        bh=yPZLqecUFGHJ+NbTFBmlIZG1g77dm4bQ8ig1z964FC8=;
        h=Date:From:To:Cc:Subject:From;
        b=PHT3xPfiV7iyCpg6wptMT3I7HU9cf7SF1/+b6BS6yjex4OOuSfF6ixVyK5MtmXzLj
         JCoWOXCWhaaA1BonZhvry4xVlnyPPaFyR3jDGILSgMCvSQnM8TZT1NeLig8uUXDXGj
         d3TQZbe/OrX7Fm8Ehemp/GS19ck9bzuspcfoinl3FMpoVXlAYQfSHhU13jmS7DU55o
         uWMRFiiPGmUDAQM3qOTGD1ip39WAzhug9wFHYaofDhJt5UKaFy0tUDXfb5E5QHwb8u
         X04y5CMDgDSP3UpSFBe05Gy/Vrn6Zp1kD8P98ILg+19OY/faaxw9h1TAPW5T2SGpX8
         K+zH7EQPoxJkw==
Date:   Thu, 24 Jun 2021 19:43:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Gavin Shan <gshan@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210624194301.7474ce76@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dd+DKH2tN9D2Qpqh+uivl5A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dd+DKH2tN9D2Qpqh+uivl5A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

mm/page_reporting.c:14:37: error: initializer element is not constant
   14 | unsigned int page_reporting_order =3D pageblock_order;
      |                                     ^~~~~~~~~~~~~~~

Caused by commit

  223f64d9e679 ("mm/page_reporting: export reporting order as module parame=
ter")

pageblock_order is defined to be various things depending on CONFIG_
symbols.

I have reverted that commit (and the following three) for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/dd+DKH2tN9D2Qpqh+uivl5A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDUU6UACgkQAVBC80lX
0GwMGQf8CN6nwK6xFRlplOE2v2Z7CSCelhBLxoywuKKcELDzlR1D8KxDi9LMYXyY
RfOAAwDyiOiphs/X5bdQLiGWDvVIJPKscEijYNlGSsWmISRAy1/ypjsxvTssOn1q
PtYmGKOwA4Tpqgd64CQ6H5QxF3ypOyYKDbwUCbodq2Rynx2Me4dnY7ignIgIq7iw
B9Xn8YLsp5OitKyTVZNCj6YSRJtkqXz37/ChslVlCjZbn4VIbYFEFe5/P9MY7pD7
lVWeS2G1VSH4t72tPsgzqF7moljlF0mNt5d7+rrouC5n2lX8QnKxVHxzoiHs4gOj
iw4LWRJJCKkNTghZwZI53nsOQDAXrw==
=OAfd
-----END PGP SIGNATURE-----

--Sig_/dd+DKH2tN9D2Qpqh+uivl5A--
