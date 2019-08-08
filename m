Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCC785788
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 03:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389560AbfHHBUu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 21:20:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50199 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389587AbfHHBUu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 21:20:50 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 463rCy6VVqz9sN4;
        Thu,  8 Aug 2019 11:20:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565227247;
        bh=umznyvpOFtuEr9ptCP9R8EL6gWu/KVzYLzvUfJ4fnic=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eojPfFQryfm4YDArVQTTnE+j0hZ3FrIg3kVabXTD9DlJmAkf4QUT1xDDFfs4fUI6s
         CK0CdaAm5kR4a0BkmC0CrIcYcBWOCAzO0L3JHyGwvsb4l8Mbp5DUBYeyVXB9k5GpPA
         Y/SbU99wU+5wV7sQE4HJVVmSwaul4CmuLJaFHaJf+xrFsXxlb9gS56o1MRfcUhvJgF
         Ezsmo/Veyh50isYeZ3tBPtnnVZlLGoE+OCnPs4wxbCiTI7c8pmeIGMXAyrZKreT/6L
         XR6oPcUfR5nInwiQlMsBakcarm7tIVC/JLYtqx1EP/cmSqyYx4wAIlMHYlriqUAZoT
         aBvZQC0mZyutg==
Date:   Thu, 8 Aug 2019 11:20:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Song Liu <songliubraving@fb.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
Subject: Re: linux-next: Tree for Aug 7 (mm/khugepaged.c)
Message-ID: <20190808112044.4390d46f@canb.auug.org.au>
In-Reply-To: <20190807142755.8211d58d5ecec8082587b073@linux-foundation.org>
References: <20190807183606.372ca1a4@canb.auug.org.au>
        <c18b2828-cdf3-5248-609f-d89a24f558d1@infradead.org>
        <DCC6982B-17EF-4143-8CE8-9D0EC28FA06B@fb.com>
        <20190807131029.f7f191aaeeb88cc435c6306f@linux-foundation.org>
        <BB7412DE-A88E-41A4-9796-5ECEADE31571@fb.com>
        <20190807142755.8211d58d5ecec8082587b073@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j2bKP.0cu/QWzP1Yxga==yl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j2bKP.0cu/QWzP1Yxga==yl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 7 Aug 2019 14:27:55 -0700 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> It's all a bit confusing.  I'll drop=20
>=20
> mm-move-memcmp_pages-and-pages_identical.patch
> uprobe-use-original-page-when-all-uprobes-are-removed.patch
> uprobe-use-original-page-when-all-uprobes-are-removed-v2.patch
> mm-thp-introduce-foll_split_pmd.patch
> mm-thp-introduce-foll_split_pmd-v11.patch
> uprobe-use-foll_split_pmd-instead-of-foll_split.patch
> khugepaged-enable-collapse-pmd-for-pte-mapped-thp.patch
> uprobe-collapse-thp-pmd-after-removing-all-uprobes.patch

I have dropped them all from linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/j2bKP.0cu/QWzP1Yxga==yl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1LeOwACgkQAVBC80lX
0Gx7kgf/SIl4fB7HUsRW/clKuyM12Y+85pl9oCSGfH/yoXqig2drxvBIaFMvqXaL
ANc0d6xdkx6L9WHNlorYU1pi6fDkH1oRhYzcOLVUJIkGSFDZuK5cF3GEwlFFog0p
7LzT7D1c3g4BuzhVokLGDFSRzF0kd8dewwfmLkNFbBc39i2M94gN1qrqzIc5nemZ
RbhAtO8QGH6IZ+2XAaoflITeKONoUDXXClzbx8nEGg11T8A/wXi6Q/9rmfQH0rd3
4Z60pYFpUFqBFal6IDW9yQe3plZ1PfPbnfrzGOepUEnZBgJrQ4FX4YKJa+H14FsD
Gxl7S3dArcn49pHeszLXsc5CTAEuNA==
=pphB
-----END PGP SIGNATURE-----

--Sig_/j2bKP.0cu/QWzP1Yxga==yl--
