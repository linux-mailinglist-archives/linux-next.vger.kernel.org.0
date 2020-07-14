Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB93B21E688
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 05:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgGNDuR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 23:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbgGNDuR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jul 2020 23:50:17 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EDBC061755;
        Mon, 13 Jul 2020 20:50:17 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5RP063kjz9sRK;
        Tue, 14 Jul 2020 13:50:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594698613;
        bh=BUgT/3b0JRK7+j8QnjhD2/MoY3BUHt7B8rzQiVq/mxk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Tb+8hA/XtjHiKnHF7cAfvZ1rniwl7GheGWMPJZsuDjuOMP4AASnMnIYRo6iIk6J8n
         vxzUMNsV6JzXe2vX2WbxCOfv1/FJjrYS2fnYWpemDVr7qO+jkLV0uy1zdj60aAyVRR
         cybpbEZGbsjAnf3Xb1J6nj2cSAcqMbuwu4hKxDqTlklwQtSn2w2HhGmC3r8SPtFPbM
         /2XWHAF69AYBueZr+AbteqGVDPWZI0gZ1XpEJiIEXX8EeN1pKnDlxv3NT28NfD2cqh
         SNmFN58k1gt+HCJ0beqsIWfKN5Mu4sb8g2YDrgYPqZwmnszXmjwgy4IuXZ4GXK4Uvl
         H8si6Ez6SggOQ==
Date:   Tue, 14 Jul 2020 13:50:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200714135012.447d185c@canb.auug.org.au>
In-Reply-To: <20200707123301.79ca8a94@canb.auug.org.au>
References: <20200622113700.3dd74527@canb.auug.org.au>
        <20200630125459.0ca67c38@canb.auug.org.au>
        <20200707123301.79ca8a94@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n8naVaqUJ6scjJTLUV9rb4D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n8naVaqUJ6scjJTLUV9rb4D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 7 Jul 2020 12:33:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 30 Jun 2020 12:54:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Mon, 22 Jun 2020 11:37:00 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > After merging the tip tree, today's linux-next build (x86_64 allmodco=
nfig)
> > > failed like this:
> > >=20
> > > ERROR: modpost: "sched_setscheduler" [kernel/trace/ring_buffer_benchm=
ark.ko] undefined!
> > >=20
> > > Caused by commit
> > >=20
> > >   616d91b68cd5 ("sched: Remove sched_setscheduler*() EXPORTs")
> > >=20
> > > Missed one :-)
> > >=20
> > > I have reverted that commit for today.   =20
> >=20
> > I am still reverting that commit. =20
>=20
> Ditto ...

Ping?
--=20
Cheers,
Stephen Rothwell

--Sig_/n8naVaqUJ6scjJTLUV9rb4D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8NK3QACgkQAVBC80lX
0GyozQf9GdvxQZx/M0eIEScU8ejFUCGRGLL79PiBqiGRoRifp/qa0Q5u0X609JrY
XeTo/9QaU7e6VIKJvZ/kDRNZZCE4s70g+VgujRBgm3sCVRr78F+ibFMW20W2/78K
sfE7LGRa2EnG7Py347+3GpSs8ofiHTJ7Smc2jMJyYzojhLMzVKdzHFb6R+IgABfe
6hvVeKWuXLCz0rDpjFwPHWOZi0GzD4/Z0s8lyo7YOSiDgOfFtHtZ9EZLM+Ir7ZAI
5Or9SGKXHTSHbpS5r4iAIxm4zEXAgL0zZtSXFqcJAdaN/eRnzGXJeWHcvJfWK9Mk
kMvXRfORFlrTC9sai46FmF6I28Goyw==
=1Y8R
-----END PGP SIGNATURE-----

--Sig_/n8naVaqUJ6scjJTLUV9rb4D--
