Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3E8FE0D2D
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 22:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387769AbfJVURC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Oct 2019 16:17:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46997 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729874AbfJVURC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Oct 2019 16:17:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46yPtK3BlHz9sP6;
        Wed, 23 Oct 2019 07:16:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571775419;
        bh=RTPPTYXUYCzZqeA94/netQI+yOWjh84Mv67mv4e+xig=;
        h=Date:From:To:Cc:Subject:From;
        b=XjaTB92SJ6cr/1QJ4u70J0PqMjIIuOzDHdHSkcWFgwMwynl/o5hrnSFQW57MVf1v2
         NUXPpjf+MbeUxJK70anbLAA5+xAPAi/eJNdkz8/zBuFLn5BH0vp5DUNukvBQMobhmB
         rShVFbYGqUeCkg2khzGJv2xcj8vOqGzmgSDLdNEED2k/+jgMjEPI3cR2tTSubuj28D
         xxyXHxJIpwsn9ktdzGkckPqd4y/UzapCNABii37MD1nzu4NXfV0C+azimFLFFQJXoO
         7cqpDttIC5NzVpP0meagl578gIouBRUpTRfhGA/hD8GPSq6y74TfBM4PmkgQjSeayP
         HjZfxB5xQXHBQ==
Date:   Wed, 23 Oct 2019 07:16:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Hellstrom <thellstrom@vmware.com>
Subject: linux-next: Fixes tags need some work in the tip tree
Message-ID: <20191023071655.10a9cff5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+6MW7=ijh5ct9W0OfKVA8aS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+6MW7=ijh5ct9W0OfKVA8aS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

n commit

  6fee2a0be0ec ("x86/cpu/vmware: Fix platform detection VMWARE_PORT macro")

Fixes tag

  Fixes: b4dd4f6e3648 ("Add a header file for hypercall definitions")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

In commit

  db633a4e0e6e ("x86/cpu/vmware: Use the full form of INL in VMWARE_HYPERCA=
LL, for clang/llvm")

Fixes tag

  Fixes: b4dd4f6e3648 ("Add a header file for hypercall definitions")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/+6MW7=ijh5ct9W0OfKVA8aS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2vY7cACgkQAVBC80lX
0GyBLgf/SzCt3mnVGNmARfCBVmWasdThc8pAwnUFCY/xay+bPvWzzgKG8G6tFcFB
72x5pK+fl66f/8bY2iDwFKEV4ZhylkmIwis7G7vvCnuLG9lUG32guExUGyUiocH+
2TbXJGrwq/vI3lWxywEtq5yED/EWAHNx6RcFtJf9YOmaOHI6AZLwuxjPUUh6pCSk
ZIBOsUetHk+fcuAQkuDpxt91jguq3p7OGxa6JhfV0grh6KQuh5M+1xjC30YI7axP
rGWIoplPAnCKdX0d48x+8Zg/lNsNc1FJpNSvZa/5tSUykz9Qi/gGjchGtMsXHOP7
r1GfxSZWfPRQ7WOfoQlMsjpLvCDS9Q==
=qUfs
-----END PGP SIGNATURE-----

--Sig_/+6MW7=ijh5ct9W0OfKVA8aS--
