Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595B43BF3E8
	for <lists+linux-next@lfdr.de>; Thu,  8 Jul 2021 04:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhGHCXf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Jul 2021 22:23:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:47419 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230160AbhGHCXd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Jul 2021 22:23:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GL0QB4ctpz9sWl;
        Thu,  8 Jul 2021 12:20:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625710851;
        bh=O6fSgqYKbW8xFa28F+ufSGqF0ogOYHuxSa3iqkJu4qc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FbrKlRwfhv8LR7WKLm3RODqwaLKfYl5s0dFhb4QdARGD0RCrjW9sXxXz8COb80SJG
         jkwGJ120v3RqxJixwwQREXEIj/7BxOQmJBUw5BwJgvQNJx+NyE50byIoS42M9nV3yr
         Y0yMHZCmJznIK4wfYha6+duMiLxU00SniJlVVN0+GAPaPdFB4u4sRzbCMTDoxeqnol
         L0l6FrK/sixHDOoIE60QH99tprhyWJxhyqWE+E9oBGj3YNSjFr1oBwSYPI+KuyF7UN
         SQLP64h8YbzAytdHT0va70iSAP34bE1Cv6/QaA84JkG6lln4NRubg/PO5xH/TnyGnf
         HXLpb/irGXKjg==
Date:   Thu, 8 Jul 2021 12:20:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Matthew Auld <matthew.auld@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20210708122048.534c1c4d@canb.auug.org.au>
In-Reply-To: <20210603193242.1ce99344@canb.auug.org.au>
References: <20210603193242.1ce99344@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/89K8vhLQ9m1S=V0Qbv_HZcq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/89K8vhLQ9m1S=V0Qbv_HZcq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 3 Jun 2021 19:32:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm tree, today's linux-next build (htmldocs) produced
> these warnings:
>=20
> Documentation/gpu/driver-uapi.rst:2412: WARNING: Duplicate C declaration,=
 also defined at gpu/rfc/i915_gem_lmem:1393.
> Declaration is '.. c:enum:: drm_i915_gem_memory_class'.
> Documentation/gpu/driver-uapi.rst:2484: WARNING: Duplicate C declaration,=
 also defined at gpu/rfc/i915_gem_lmem:2484.
> Declaration is '.. c:struct:: drm_i915_gem_memory_class_instance'.
> Documentation/gpu/driver-uapi.rst:7: WARNING: Duplicate C declaration, al=
so defined at gpu/rfc/i915_gem_lmem:7.
> Declaration is '.. c:struct:: drm_i915_memory_region_info'.
> Documentation/gpu/driver-uapi.rst:2531: WARNING: Duplicate C declaration,=
 also defined at gpu/rfc/i915_gem_lmem:2531.
> Declaration is '.. c:struct:: drm_i915_query_memory_regions'.
> Documentation/gpu/driver-uapi.rst:2595: WARNING: Duplicate C declaration,=
 also defined at gpu/rfc/i915_gem_lmem:1393.
> Declaration is '.. c:struct:: drm_i915_gem_create_ext'.
> Documentation/gpu/driver-uapi.rst:2615: WARNING: Duplicate C declaration,=
 also defined at gpu/rfc/i915_gem_lmem:1393.
> Declaration is '.. c:struct:: drm_i915_gem_create_ext_memory_regions'.
>=20
> Introduced by (one or more of) commits
>=20
>   0c1a77cbdafb ("drm/doc: add section for driver uAPI")
>   2bc9c04ea702 ("drm/doc/rfc: i915 DG1 uAPI")
>   727ecd99a4c9 ("drm/doc/rfc: drop the i915_gem_lmem.h header")

I am still getting these warning.
--=20
Cheers,
Stephen Rothwell

--Sig_/89K8vhLQ9m1S=V0Qbv_HZcq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDmYQAACgkQAVBC80lX
0GwVCwf/SUFcXwnAMwIuELT5qczrwssV13CsynuE9hgWz/ibEnwL7oOasOt/kBwQ
5LgJ7avoBCjclp7xL8oJhoCcuVIRMaQYL2kDkOQ5XNs0uVxIP/hOrb4cKtzLbEUP
1BF0rfI7hPzmyJ2PLWnV28Ko+9O5yclcz/T+nJeGrVItOh0R3ZVsy/5i22APh5j3
SpcY530SEouZWfV+kABJcb3ixLVfqLm+R2ArzzVrCVBuFdIsbaaUt1CVQyOC6s2v
C7H7auUkcDpZFJDQFbz/XU/sPRdRDgn5Yjx71CbC2NnzPUdvvBTy7FXtouOs4q5m
e9aRHQz35QEV6lOjbdvTxV0XqfGisw==
=LJNj
-----END PGP SIGNATURE-----

--Sig_/89K8vhLQ9m1S=V0Qbv_HZcq--
