Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1639022579A
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 08:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgGTG3e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 02:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgGTG3c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2020 02:29:32 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566CAC0619D2;
        Sun, 19 Jul 2020 23:29:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B9Bf04Br6z9sRN;
        Mon, 20 Jul 2020 16:29:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595226569;
        bh=IQm4VCVJJxzuueje8oABD90T4M0Kps5whbuKkqdbdWM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZCWRWlXZkbAShrzQbHsGOxSKQHoiUoY1Zz6y9cOfjtNpTkg3pJgL/f85wvjM9dGZm
         vzoaAwONULs9QY5Y9r96qyqBL3SOrn36pJXbJBLBw8SDqL7WkqiG+cennhBj0ujO9h
         ZHIcZKrnG7peNmkUun7ZJVYbjkRrU5I0d5EFZMotPI8dbjDHBO+swnXV2ZAYlSZKiK
         aaCqIb4JE9eC/EzLaRTWHaEE5YZo51ysQUJYR9GDZZW5em+ZJPCRmFZ56cxz1OW600
         COyCoCB3i9OQRgbK1IqK8NTwmXhVpjsU8iTbuoteWC5ml8uMvz+v5ddmBBmlJHIA8K
         SbQjMgrC2B6RQ==
Date:   Mon, 20 Jul 2020 16:29:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Uros Bizjak <ubizjak@gmail.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Sasha Levin <sashal@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <20200720162927.4aedff0f@canb.auug.org.au>
In-Reply-To: <CAFULd4YGFGSVqmHuor89e_hk9wT5pso3jcRiBkHP4ppx+W-D7g@mail.gmail.com>
References: <20200717144656.4bdbf81f@canb.auug.org.au>
        <CAFULd4Ye2d-8BY7aY+_2tYwcXsfSCe3O6aJ4LF0KhvWTjVt0rA@mail.gmail.com>
        <20200717064401.GB2504@gondor.apana.org.au>
        <CAFULd4b9O+KJKwjQTB1PTuxMEDSDMov0rQaE85+9pfRrd02dKw@mail.gmail.com>
        <20200720140346.109a3006@canb.auug.org.au>
        <CAFULd4YGFGSVqmHuor89e_hk9wT5pso3jcRiBkHP4ppx+W-D7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u9r8LB0V3ZHSwZH+WSKkuri";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/u9r8LB0V3ZHSwZH+WSKkuri
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Uros,

On Mon, 20 Jul 2020 08:13:51 +0200 Uros Bizjak <ubizjak@gmail.com> wrote:
>
> On Mon, Jul 20, 2020 at 6:03 AM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> > > Please find attached the incremental patch that puts back integer
> > > parts of inst.h. This resolves the conflict with the tip tree. =20
> >
> > The tip tree change needs the XMM parts kept as well, sorry. =20
>=20
> Strange, because I did test my patch with the tip tree from
> 'origin/master' at commit a282cddefe90c4b21ef2c22a76a7c3ebd3ec6b86 and
> the compilation produced the same lonely rdpid %eax in
> .altinstr_replacement section. AFAICS, the header is included only for
> RDPID macro, where XMM registers are unused.
>=20
> > So I ended up just removing the actual now unused crypto instruction
> > macros. =20
>=20
> To avoid any further troubles, this is also OK with me.

Sorry, I see what happened now.  Since your patch was not in the crypto
tree yet, I did a fixup to the tip tree merge based on your patch, but
did it by hand and didn't remove the XMM bits from the REG_TYPE
macro ...

So your original patch is probably all good (especially since you
actually tested it :-))

--=20
Cheers,
Stephen Rothwell

--Sig_/u9r8LB0V3ZHSwZH+WSKkuri
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8VOccACgkQAVBC80lX
0GxaeQf/bdfrfIOUWIKd3Ve63BGwZfzhgtieghs4RfP61VpEsNZvT/QZj5UFYrdx
JjrCzL6K7YJGEEmKXPywb//LtAt9lyZBKsSTQmC1ygRK752EdoXuN6IRheSLM97q
mCIvnI9VQyVzSF/Aip+Odb7pMv46aa5rlhqvuy76PSJyPCZZ6QszKActm1JWVIE4
XB9F50aM0GObqpvN63bJxeikl4nxI5Do59LMpM+lB8pDF2CQTBYl+MeIvoT3ecs5
TjuAjjgVariB2hhwijwmu0Avi3cQYbCSFx0bEejeWPo7x7PuVohUTbLxHDD30I0E
sbs4hCxNGgtwafOKnMneOuMSKDARiQ==
=r0/d
-----END PGP SIGNATURE-----

--Sig_/u9r8LB0V3ZHSwZH+WSKkuri--
