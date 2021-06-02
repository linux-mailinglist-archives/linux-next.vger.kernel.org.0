Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C12399602
	for <lists+linux-next@lfdr.de>; Thu,  3 Jun 2021 00:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhFBWln (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Jun 2021 18:41:43 -0400
Received: from ozlabs.org ([203.11.71.1]:36977 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229583AbhFBWln (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Jun 2021 18:41:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FwP9T6wpsz9s5R;
        Thu,  3 Jun 2021 08:39:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622673598;
        bh=eSmdbww5uAebfQnXWkSodhU6+6V8IRdVNTEcNSlPh78=;
        h=Date:From:To:Cc:Subject:From;
        b=i7t7fcc8nzq2IDlViut7SKYB0Vitz12QcDcOo1VyR9LB1lw8G3cq0sKhYcWxX+5UH
         eD6vi2ySn6Bo6Peblq0At+pVD8ZKEWK13vYiEIDdtzIhqBOCGFx+T1tokQjrLL98qn
         QvaakgjJttlqmKQjDb0BTq95NyZHMtveW7Y4fcohFpo4ZUTvqFAMPtijD9jcr699Xj
         F8Z9vCsgDLCnk5u9bN/ahkIsSQdNzvb6UpLp6xGZHeWiGKoYkgKYWsn9xuowtYVl7u
         i1ELdtNtxITV3OK8AmXaoSq/JepJgfpaz9NdofsHoXqLlGBFsjU2WnR2/ygaTboqLP
         JLRG2ACrNsqLA==
Date:   Thu, 3 Jun 2021 08:39:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20210603083957.2ad2f30d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wu7vjIO3zTBdmIcxdw+NV0h";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wu7vjIO3zTBdmIcxdw+NV0h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  56b019f8eda0 ("drm/amdgpu: Use drm_dbg_kms for reporting failure to get a=
 GEM FB")

Fixes tag

  Fixes: f258907fdd835e "drm/amdgpu: Verify bo size can fit framebuffer

has these problem(s):

  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/wu7vjIO3zTBdmIcxdw+NV0h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC4CL0ACgkQAVBC80lX
0Gwx2Qf/YRSiS+PSGkeqA5E1Tv1urId6MhwVrdCSXOYlnZjhRdJUwJ+XoBxZ5gV0
2vMMU5QvvL7dXtAWQeVomAFdSlvKSjWqEsoXD2jkUaBiSSsHbs7lnhgMc8aOkA2T
wrpfRYB/yNI5llQgpFkYRrV1GVD5PRecfxEF+QvRePcroXsRg9CFrHpCmwhd1Jnb
Pxjd3jaY8OG9W0oZExnYFJ+cI19VV4vWLB8QDy7vb1juL/FSSsGSz4+apT80ZOfV
2klbYeH0fcBrPWJpF1UJFV2fqg0RhaJ/FOPCyEllQAS5ij4r5m20OKbR84QsRgdu
NSp5ECctxJbCTMY+cmyr3v5ekgs3/Q==
=MY2Z
-----END PGP SIGNATURE-----

--Sig_/wu7vjIO3zTBdmIcxdw+NV0h--
