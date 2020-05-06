Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E47F1C7D2B
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 00:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729967AbgEFWTc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 May 2020 18:19:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53497 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729114AbgEFWTb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 May 2020 18:19:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49HWGk1kvcz9sP7;
        Thu,  7 May 2020 08:19:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588803569;
        bh=cvnMZTLI2KRIxxSUz/K4Hmuh15cwPhFtGK6dZGCUSU8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hnOw9cEZq94+CAbYxDvqRzI/w57/afztYTZ+FX1zfjWIdL6dcEIc1v78Vm34ivBLS
         JCFWI93rNJHn24szr9SSUp3UNkq6w8XXqkyidtzj7h0o8RrehTeEiIxoJoWmbMAXku
         grM/NSreaRTmeb//r4TKY6fz7iTN2+Zhhl27wTy/O8slmuvEq7jyjJaTq0md6RohG6
         /mFbWUjqznMutDBADLNpYHrQCI4yHhfPjcaIuwigPnhS+fxSvYQeJftMSWgUeofgFR
         /90VYp7Lf39sc+vHVezRctIR8LOPIbRN09A3D34xQuXn0qzt4bSyTs4xQ+5kOGe1dd
         dv127hcYpVniw==
Date:   Thu, 7 May 2020 08:19:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: ARM: futex: Address build warning
Message-ID: <20200507081924.7c77bfc9@canb.auug.org.au>
In-Reply-To: <87pncao2ph.fsf@nanos.tec.linutronix.de>
References: <20200330134746.627dcd93@canb.auug.org.au>
        <20200401085753.617c1636@canb.auug.org.au>
        <877dyzv6y2.fsf@nanos.tec.linutronix.de>
        <20200402090051.741905cd@canb.auug.org.au>
        <874ku2q18k.fsf@nanos.tec.linutronix.de>
        <20200413100112.2e114e24@canb.auug.org.au>
        <87pncao2ph.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ScnmteIMj_Vg.3wJi0L3LjA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ScnmteIMj_Vg.3wJi0L3LjA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Apr 2020 11:07:22 +0200 Thomas Gleixner <tglx@linutronix.de> wro=
te:
>
> Stephen reported the following build warning on a ARM multi_v7_defconfig
> build with GCC 9.2.1:
>=20
> kernel/futex.c: In function 'do_futex':
> kernel/futex.c:1676:17: warning: 'oldval' may be used uninitialized in th=
is function [-Wmaybe-uninitialized]
>  1676 |   return oldval =3D=3D cmparg;
>       |          ~~~~~~~^~~~~~~~~
> kernel/futex.c:1652:6: note: 'oldval' was declared here
>  1652 |  int oldval, ret;
>       |      ^~~~~~
>=20
> introduced by commit a08971e9488d ("futex: arch_futex_atomic_op_inuser()
> calling conventions change").
>=20
> While that change should not make any difference it confuses GCC which
> fails to work out that oldval is not referenced when the return value is
> not zero.
>=20
> GCC fails to properly analyze arch_futex_atomic_op_inuser(). It's not the
> early return, the issue is with the assembly macros. GCC fails to detect
> that those either set 'ret' to 0 and set oldval or set 'ret' to -EFAULT
> which makes oldval uninteresting. The store to the callsite supplied oldv=
al
> pointer is conditional on ret =3D=3D 0.
>=20
> The straight forward way to solve this is to make the store unconditional.
>=20
> Aside of addressing the build warning this makes sense anyway because it
> removes the conditional from the fastpath. In the error case the stored
> value is uninteresting and the extra store does not matter at all.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Link: https://lore.kernel.org/r/874ku2q18k.fsf@nanos.tec.linutronix.de
> ---
>  arch/arm/include/asm/futex.h |    9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> --- a/arch/arm/include/asm/futex.h
> +++ b/arch/arm/include/asm/futex.h
> @@ -165,8 +165,13 @@ arch_futex_atomic_op_inuser(int op, int
>  	preempt_enable();
>  #endif
> =20
> -	if (!ret)
> -		*oval =3D oldval;
> +	/*
> +	 * Store unconditionally. If ret !=3D 0 the extra store is the least
> +	 * of the worries but GCC cannot figure out that __futex_atomic_op()
> +	 * is either setting ret to -EFAULT or storing the old value in
> +	 * oldval which results in a uninitialized warning at the call site.
> +	 */
> +	*oval =3D oldval;
> =20
>  	return ret;
>  }

Any response to this?  I am still getting the warning ...

The warning was introduced by commit

  a08971e9488d ("futex: arch_futex_atomic_op_inuser() calling conventions c=
hange")

Which has been in Linus' tree since before v5.7-rc1.  Should this go in
via the tip tree, the arm tree, or will I just send ti to Linus myself?

--=20
Cheers,
Stephen Rothwell

--Sig_/ScnmteIMj_Vg.3wJi0L3LjA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6zN+wACgkQAVBC80lX
0GwZmwf/aePLWiH5arcTzhuOXIsMsYUaw6sCxEllNlLA36DHq3f4kC0k8c6NeDIY
hD91S189DeTo9UBXSebPNQ0s3YnypjcURfRAEfY3tWzxjAJDV9f2WR4z56y6j4ML
HF26mQ1OvX0So+blF7IUlfkP/f5aAWuyWRMEhXGV0Iios0w219NwLW30hbHbU5F/
GBeSE31PDPL4P+hxypPhubB6E8pH/H8LkgdFeezbDx4qLIBgQhKR8kGczi6Jbxmn
1F6HMqPkVLMoeMBy7tTUV2uxLPRLgDHo4jhHurQLQ4LrGvIMdzEgFau25xwStNOL
4dL7EHIuSvFiYPtAGpjeRFY/HKrpuQ==
=qjow
-----END PGP SIGNATURE-----

--Sig_/ScnmteIMj_Vg.3wJi0L3LjA--
