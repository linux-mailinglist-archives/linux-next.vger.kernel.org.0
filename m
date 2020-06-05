Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5321EEF3E
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 03:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgFEBwR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 21:52:17 -0400
Received: from ozlabs.org ([203.11.71.1]:47951 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725934AbgFEBwR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Jun 2020 21:52:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dQct3sgkz9sRW;
        Fri,  5 Jun 2020 11:52:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591321934;
        bh=IoC3hVM6HoUPGF4Rp/Ruoth3bwkN8kK+7Z0gVeZ9BBs=;
        h=Date:From:To:Cc:Subject:From;
        b=CC3GDhpWSSvgPcWpzs6FCb+lATZ2XB0y1OcnZSUM7MQZtUNDcZF+HJkJOr223Sxwo
         IXJzvKaM9BgBDPfiEqgw+7V1g53F1LO3/7wF18aGxMOCkwNgasXXYHU5lX/uJZrLaE
         1hYr3iMAyyhTceryCzCMeC+fUdrq1pW8Roma8N7LdN0QPOLvEmNvd1CYjizTo7Jn7C
         SZEXteFt0bU06Vnjxn7K0ZrC3Os8QY5nzX8asyQAEH3l70zkhb0NZ8QCawAmcjt5Jw
         L05JTweSunNmSVbBlHaZSuXTGSeDRANvBHNe+l9NwEw4sEFu3f6HBzXy05O8ZmholJ
         FKOs29jKRa+eg==
Date:   Fri, 5 Jun 2020 11:52:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Ingo Molnar <mingo@kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>, linux-next@vger.kernel.org
Subject: Fw: next/pending-fixes build: 162 builds: 2 failed, 160 passed, 2
 errors, 109 warnings (v5.7-8671-g086779e58c68)
Message-ID: <20200605115213.2836fccf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Yj.1370tiAIRga282WuqIWE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Yj.1370tiAIRga282WuqIWE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Commit

  a148866489fb ("sched: Replace rq::wake_list")

added

BUILD_BUG_ON(offsetof(struct task_struct, wake_entry_type) - offsetof(struc=
t task_struct, wake_entry) !=3D
		     offsetof(struct __call_single_data, flags) - offsetof(struct __call_=
single_data, llist));

in kernel/smp.c.  This seems to be failing - at least for gcc-8 (I
haven't seen any failures in my linux-next testing).

The pending-fixes branch in linux-next isjust Linus' tree plus the
branches of fixes for Linus' tree.

Begin forwarded message:

Date: Thu, 04 Jun 2020 18:15:15 -0700 (PDT)
From: "kernelci.org bot" <bot@kernelci.org>
To: linux-next@vger.kernel.org
Subject: next/pending-fixes build: 162 builds: 2 failed, 160 passed, 2 erro=
rs, 109 warnings (v5.7-8671-g086779e58c68)


next/pending-fixes build: 162 builds: 2 failed, 160 passed, 2 errors, 109 w=
arnings (v5.7-8671-g086779e58c68)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-8671-g086779e58c68/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-8671-g086779e58c68
Git Commit: 086779e58c6867c3f8488d6729e267094a0cd826
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (gcc-8) FAIL

x86_64:
    allmodconfig: (gcc-8) FAIL

Errors summary:

    1    include/linux/compiler.h:403:38: error: call to =E2=80=98__compile=
time_assert_399=E2=80=99 declared with attribute error: BUILD_BUG_ON failed=
: offsetof(struct task_struct, wake_entry_type) - offsetof(struct task_stru=
ct, wake_entry) !=3D offsetof(struct __call_single_data, flags) - offsetof(=
struct __call_single_data, llist)
    1    include/linux/compiler.h:403:38: error: call to =E2=80=98__compile=
time_assert_134=E2=80=99 declared with attribute error: BUILD_BUG_ON failed=
: offsetof(struct task_struct, wake_entry_type) - offsetof(struct task_stru=
ct, wake_entry) !=3D offsetof(struct __call_single_data, flags) - offsetof(=
struct __call_single_data, llist)

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    include/linux/compiler.h:403:38: error: call to =E2=80=98__compiletime_=
assert_134=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: off=
setof(struct task_struct, wake_entry_type) - offsetof(struct task_struct, w=
ake_entry) !=3D offsetof(struct __call_single_data, flags) - offsetof(struc=
t __call_single_data, llist)

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    include/linux/compiler.h:403:38: error: call to =E2=80=98__compiletime_=
assert_399=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: off=
setof(struct task_struct, wake_entry_type) - offsetof(struct task_struct, w=
ake_entry) !=3D offsetof(struct __call_single_data, flags) - offsetof(struc=
t __call_single_data, llist)

--=20
Cheers,
Stephen Rothwell

--Sig_/Yj.1370tiAIRga282WuqIWE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ZpU0ACgkQAVBC80lX
0Gzrdgf9G8nqebECgkYP0tWiBM00N9nAI1e2DkTzUHGvRrshxwbvoRu5/rBBn60e
+LJXISmuFHTlvX2AbqkZbSBwJtR4+jF6QnoOmb7UslULMHu4r7XBk4UMW6kb/cma
ZWnSqVVCpVGkToBcJhOSw8AnFjj/GCJlYaiD1POjYydd+xFJS9LMugPtelcTxKH1
HJpJQoxnnAA8b9vTg4MHG2MNELlKXxxGy4KEoB9cimrFW/CRf/LPtSyaJDXYpOas
KtjtxN2ekEUIwxfEVnfALbIsb4hhZmrIkO4m6JmXTNdqO7LiXsCDNdmuHV1uS0Hl
cvvZGQjldSsN5IeXvf65RrvViUnijw==
=hBAK
-----END PGP SIGNATURE-----

--Sig_/Yj.1370tiAIRga282WuqIWE--
