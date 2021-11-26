Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86BB45E708
	for <lists+linux-next@lfdr.de>; Fri, 26 Nov 2021 06:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhKZFMO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Nov 2021 00:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbhKZFKO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Nov 2021 00:10:14 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0BC0C061574;
        Thu, 25 Nov 2021 21:06:59 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0jQj6J2mz4xZ0;
        Fri, 26 Nov 2021 16:06:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637903217;
        bh=XDXo32ilfpNP9MsyByXrlv5irAatsADgZd48jBqXTf8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EpY8l3OtTaH82UR0Ifn3gabVgl9XadekCvC9AOgnau2U2wjw4ZWzkn/RgpHrJD9tS
         aVJuYiN+4JaRWLfdGw7BZor9418oPyAVwvh/KIjhLijQt1PFYqMl5JIYHkb7TcldNs
         XDzIT2f3ORpkYrMKgkqDPbvepryF1YVrgv4uds90sNxY9biU+9yyUSHdDEyqAL3VX0
         ToGpoprQNwxz+EM0SmsYsHs1X2eGz/mHh/sPQD3VUtSOjwLliMDmByH77CNk6KZ+35
         33pNeWbLORE0Q3/n+Zm3+4fzNnj+yseUEMOuAH3bBElYYMeBRVlyOUlJnDMM9cVmfQ
         VmSoCnOWLY/vg==
Date:   Fri, 26 Nov 2021 16:06:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Yongqiang Liu <liuyongqiang13@huawei.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alexander Potapenko <glider@google.com>
Subject: Re: [next] kasan: shadow.c:528:33: error: 'VM_DELAY_KMEMLEAK'
 undeclared
Message-ID: <20211126160651.318875c3@canb.auug.org.au>
In-Reply-To: <4d951721-caa2-f692-293d-ee8b93e62597@huawei.com>
References: <CA+G9fYuLv7491Q2AHcaUAQ2AQeFBQgx8w0DzK95Qf6Fh9gGFfQ@mail.gmail.com>
        <4d951721-caa2-f692-293d-ee8b93e62597@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SRXfIYePoVpjN.GRgC9+DIT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SRXfIYePoVpjN.GRgC9+DIT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 25 Nov 2021 15:34:06 +0800 Kefeng Wang <wangkefeng.wang@huawei.com>=
 wrote:
>
> Sorry for the missing change of VM_DEFER_KMEMLEAK.
>=20
> I will=C2=A0 add Fixes tag and resend v4.

I have applied the following patch to linux-next today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 26 Nov 2021 15:34:11 +1100
Subject: [PATCH] mm: kasan: fix VM_DELAY_KMEMLEAK typo

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/kasan/shadow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 2ade2f484562..94136f84b449 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -525,7 +525,7 @@ int kasan_module_alloc(void *addr, size_t size, gfp_t g=
fp_mask)
 		vm->flags |=3D VM_KASAN;
 		kmemleak_ignore(ret);
=20
-		if (vm->flags & VM_DELAY_KMEMLEAK)
+		if (vm->flags & VM_DEFER_KMEMLEAK)
 			kmemleak_vmalloc(vm, size, gfp_mask);
=20
 		return 0;
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/SRXfIYePoVpjN.GRgC9+DIT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGga2sACgkQAVBC80lX
0GynbQf/ZYlJJA3FqVItDbfu5pbGIECoZjOAcMM3Ga0RrOL2NtD2Wq4W+gqk5SEs
3DHO4DFRwxS55HEQeEZTiuZpmRbsXCOx4Jg9EjuusGhNaN7+3sRf2KPvvDQGO+/h
h07NjhB13pT2If6XaQYpxKhPtCnTVxvKbZgKXqNIYNtS0CZmVK5hQEKksWFJVRwJ
UenXnR9aRDtpf9Ly6gZ/uVosHzCmk0K11ExygGGcWRK5xy9vTnn9Aw6vpxWuhvMY
dIvY8piAFGQS5DtZwSXonR6QXHr+TQh3xWlrFNLwKgMlBi+LBWgV2yZcBeHbZ2fJ
Sr6AtsTABhp+y/XhNjKQXf/etacESg==
=iWb2
-----END PGP SIGNATURE-----

--Sig_/SRXfIYePoVpjN.GRgC9+DIT--
