Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFD02AE8A2
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 07:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgKKGK3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 01:10:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKKGK1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2020 01:10:27 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C38FC0613D1;
        Tue, 10 Nov 2020 22:10:27 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CWDqJ0lPHz9sRK;
        Wed, 11 Nov 2020 17:10:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605075024;
        bh=yKV3u/MqYNaME4dLCEtSbbFjVIZ++iGA2iYh5KcMQlA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NZeRFYOvmu/e4bx+uB83TqamgV2EJNMS7oBtocp2O74zLnyrEz5I3xVr/0FqMKnel
         IaOs0uafbgMP9CJvYLmdPpZsIuys9lO/aAoewdDrMBMa6Nyp3DINhlE1uF1r8r+wla
         A3omPPz4KKGd833Ihq1wrOst5tSUtsqLLxIjayrnniOZ7EcUu1Gc2HC9M1zyMuJjjg
         b8nVSyZMABtrQXIwwg1HR7Xxsv7Jmlruxqzc1Q87Xa9M8FgnvknYWL8r5vP0Kcxy0k
         M+ZZxS3j7LXWdwLpS33tC6dVk54qezTEPCWBqRNaQEqcRW+7bpAo1pi3JWhdcha5N1
         H5kgryLSqe0wA==
Date:   Wed, 11 Nov 2020 17:10:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Joerg Roedel <jroedel@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201111171015.631ffd0e@canb.auug.org.au>
In-Reply-To: <20201102051822-mutt-send-email-mst@kernel.org>
References: <20201102124327.2f82b2a7@canb.auug.org.au>
        <20201102051822-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I+N15pMdX+kqDfWV159qK9v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/I+N15pMdX+kqDfWV159qK9v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Mon, 2 Nov 2020 05:19:06 -0500 "Michael S. Tsirkin" <mst@redhat.com> wro=
te:
>
> On Mon, Nov 02, 2020 at 12:43:27PM +1100, Stephen Rothwell wrote:
> >=20
> > After merging the drm-misc tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > In file included from drivers/gpu/drm/nouveau/nouveau_ttm.c:26:
> > include/linux/swiotlb.h: In function 'swiotlb_max_mapping_size':
> > include/linux/swiotlb.h:99:9: error: 'SIZE_MAX' undeclared (first use i=
n this function)
> >    99 |  return SIZE_MAX;
> >       |         ^~~~~~~~
> > include/linux/swiotlb.h:7:1: note: 'SIZE_MAX' is defined in header '<st=
dint.h>'; did you forget to '#include <stdint.h>'?
> >     6 | #include <linux/init.h>
> >   +++ |+#include <stdint.h>
> >     7 | #include <linux/types.h>
> > include/linux/swiotlb.h:99:9: note: each undeclared identifier is repor=
ted only once for each function it appears in
> >    99 |  return SIZE_MAX;
> >       |         ^~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> >=20
> > but only exposed by commit
> >=20
> >   4dbafbd30aef ("drm/nouveu: fix swiotlb include")
> >=20
> > I applied the following fix for today:
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 2 Nov 2020 12:34:57 +1100
> > Subject: [PATCH] swiotlb: using SIZE_MAX needs limits.h included
> >=20
> > Fixes: abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au> =20
>=20
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>=20
> I guess it makes sense to pick this up for this release directly.
> I'll merge this unless there are any objections.

Christoph is right that the include should not be conditional.  But I
have not tested that that does not introduce some other problems.

--=20
Cheers,
Stephen Rothwell

--Sig_/I+N15pMdX+kqDfWV159qK9v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+rgEcACgkQAVBC80lX
0GwJ+wf/Upt8VmibWkOP6DcrxQ6kKq81c4GyROE6dRtbHPfgTWkGq9whjE3uc6rZ
yyDStMrlbOIMvru7hbqkkhulZy0BUTznzvtaB3+WmlnLlIpbpVhcktqXzB+Tn1Bx
POgIPnGKa1wvWAjo9qXiXrcVwZbyUaDkLgYSBz4WUJkStZLI3mjiq5qp+nk3tEYP
SJE0IuV/+TR4nSYr6TQRkZwEwBPEJCibChEOQQb7Ra1NGPCvvcefet11I1oJKX4S
JHZCHGcaEiiVfm6BQbozc4sdSnO6hfhsJ85a2Z1zaJO/u1S1REORWdGW6+T/wzPz
Qi661bDkIgKvyD7/DXeQu78KbfdTtQ==
=IgWG
-----END PGP SIGNATURE-----

--Sig_/I+N15pMdX+kqDfWV159qK9v--
