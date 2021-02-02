Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5977630CD1B
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 21:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbhBBUbX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 15:31:23 -0500
Received: from ozlabs.org ([203.11.71.1]:34115 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232292AbhBBUaY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Feb 2021 15:30:24 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVbyX1kT8z9tlG;
        Wed,  3 Feb 2021 07:29:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612297781;
        bh=c7crrQEODf2qbx/knCVkXS1+eHCfuTc2GtRcGMFLPa8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QlbartB2Z29fbdFcfsFkde64ZHvi8MDRLScImSH8Swif6sXJL0Mdw1D2K3Xkql5qb
         fGMO6ZsB9auQBMlATX+o5LJ0F3lQ0BbEZrVc7SfdWs3ZhVp7G/V44rhKttEP8Sc9YN
         /f1FxTdQkSt13gVto/TJhtwHnlVTe4aRgTqi5jcIRIs/yHrCvmc+fpN7Z2DrLtOD8N
         3rQ9MdZK6kpnLwJ6CDOIDdScCZ6B+xttpOJdL9Y64Q6jafzRvWcLq9Cy7dZqxz1156
         1EQhIUiWhJ6Bw0LneFU1e9u1CC5Gz0zFd5f+Dkj0yfd5VbqtuhgxSptqUamLxnVI4l
         cBTiLQPEmhsVA==
Date:   Wed, 3 Feb 2021 07:29:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: arch/arm64/kernel/mte.c:121:15: error: 'mte_enable_kernel_sync'
 undeclared here (not in a function); did you mean 'mte_enable_kernel'?
Message-ID: <20210203072938.62be70f5@canb.auug.org.au>
In-Reply-To: <CAAeHK+yUm_LAe54mBwFrjVwcSpLrxYHZFzDorUvFvRNsP7fjaA@mail.gmail.com>
References: <CADYN=9Ljjx6GRPk45jkY1N7dVDOFFjMB8yy5QRzVE-1tzEnUjw@mail.gmail.com>
        <CAAeHK+yUm_LAe54mBwFrjVwcSpLrxYHZFzDorUvFvRNsP7fjaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zxCl9viMoN_X5j/RVEP/jkr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zxCl9viMoN_X5j/RVEP/jkr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 2 Feb 2021 14:46:24 +0100 Andrey Konovalov <andreyknvl@google.com> =
wrote:
>
> On Tue, Feb 2, 2021 at 11:09 AM Anders Roxell <anders.roxell@linaro.org> =
wrote:
> >
> > I've seen this failure on tag next-20210202:
> > arch/arm64/kernel/mte.c:121:15: error: 'mte_enable_kernel_sync'
> > undeclared here (not in a function); did you mean 'mte_enable_kernel'?
> >
> > I think it may be a merge conflict that didn't get resolved correctly? =
=20
>=20
> Yes, that patch was supposed to go on top of another one (which
> actually renames mte_enable_kernel to mte_enable_kernel_sync), but the
> latter wasn't picked up into mm.
>=20
> > The below change fixed the issue:
> >
> > diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> > index 275b5d0f38b8..8f5bd1293496 100644
> > --- a/arch/arm64/kernel/mte.c
> > +++ b/arch/arm64/kernel/mte.c
> > @@ -118,7 +118,7 @@ void mte_set_report_once(bool state)
> >  {
> >   WRITE_ONCE(report_fault_once, state);
> >  }
> > -EXPORT_SYMBOL(mte_enable_kernel_sync);
> > +EXPORT_SYMBOL(mte_enable_kernel);
> >  EXPORT_SYMBOL(mte_set_report_once);
> >
> >  bool mte_report_once(void) =20
>=20
> The changed export also needs to be moved next to mte_enable_kernel().
>=20
> Thanks!

I have applied the following to linux-next today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Feb 2021 07:22:35 +1100
Subject: [PATCH] arm64-kasan-export-mte-symbols-for-kasan-tests-fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm64/kernel/mte.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 275b5d0f38b8..8c7e32054172 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -113,12 +113,12 @@ void mte_enable_kernel(void)
 	sysreg_clear_set(sctlr_el1, SCTLR_ELx_TCF_MASK, SCTLR_ELx_TCF_SYNC);
 	isb();
 }
+EXPORT_SYMBOL(mte_enable_kernel);
=20
 void mte_set_report_once(bool state)
 {
 	WRITE_ONCE(report_fault_once, state);
 }
-EXPORT_SYMBOL(mte_enable_kernel_sync);
 EXPORT_SYMBOL(mte_set_report_once);
=20
 bool mte_report_once(void)
--=20
2.30.0

--=20
Cheers,
Stephen Rothwell

--Sig_/zxCl9viMoN_X5j/RVEP/jkr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAZtjIACgkQAVBC80lX
0Gxj9ggAko0IF9Ur0pUQN+pZWvqEnnJh583lS9rGICT3O3GtavRhSN+GShlKJ+3P
3nVZ/pE88hRTehjcjGDGvwUupPeDQ6m2GX+zYefOeW7RmbKJqvVOuAqvAkuy13vw
K38pOjaEraT/fK/GyK2Y1a4gF9Sgxzb/Cpoj8pXYaPlithIUSh3ZC2VWDrF5tyCq
c36gVhLoFtWYhGboiatclIhR+jGkSlbZtMvA2P8qWjBjcZQK1DMYWNBmI9hkV1jk
jVBXn+uVfs4g0FttugD6kzP7ztxjiFiAJ94EfMFwGYmYqhbJJCJrxMfT10D74S51
FkU5MGhn4vJzPrdNBXLPXMEzFW3Y/A==
=n402
-----END PGP SIGNATURE-----

--Sig_/zxCl9viMoN_X5j/RVEP/jkr--
