Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE1641A612B
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 02:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgDMABX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Apr 2020 20:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgDMABX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Apr 2020 20:01:23 -0400
X-Greylist: delayed 4239 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Apr 2020 17:01:23 PDT
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C421C0A3BE0;
        Sun, 12 Apr 2020 17:01:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 490pgK5bVRz9sQt;
        Mon, 13 Apr 2020 10:01:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586736080;
        bh=IcZEq/yyh49ITpPIHFp6PhuhvWDTsoLe/4/zgqF40gU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VBRZ27lagN0Pfnbjx3Nxi3nYl2TlTAjlztjQAlNk4laejEdm4xZRcRyQWOS902I38
         Eb4bBGLlE1gbboSsO49D/Mvk2c4qgNl+YQycUvhDc73M7ixoqFOWS/Wm/bPlBg3oWK
         1TRATRMSZ2g+eWoHPnE8RCdn24K5JRTKHttNsFOrEWldHkhsMaFzs6cer/kfCKd0uv
         c0AO0/Zj6NVtxLdMzyqGyAX+cTl37CsivjFJKECdJyxn19dt+wwIbyVl+o22Qgg+Ur
         Y7pjabDJksDvBTolZk5kTLUUUXXbWSQqcUV0nUUM+ZTQR5C5e6JcF8y3zYq0PfVwoN
         nJPG2Ud6KBmRw==
Date:   Mon, 13 Apr 2020 10:01:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20200413100112.2e114e24@canb.auug.org.au>
In-Reply-To: <874ku2q18k.fsf@nanos.tec.linutronix.de>
References: <20200330134746.627dcd93@canb.auug.org.au>
        <20200401085753.617c1636@canb.auug.org.au>
        <877dyzv6y2.fsf@nanos.tec.linutronix.de>
        <20200402090051.741905cd@canb.auug.org.au>
        <874ku2q18k.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pk_O4snDeaSGZI2P2=FNYNB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Pk_O4snDeaSGZI2P2=FNYNB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Thu, 02 Apr 2020 00:39:55 +0200 Thomas Gleixner <tglx@linutronix.de> wro=
te:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > On Wed, 01 Apr 2020 12:25:25 +0200 Thomas Gleixner <tglx@linutronix.de>=
 wrote: =20
> >> Me neither. Which compiler version? =20
> >
> > arm-linux-gnueabi-gcc (Debian 9.2.1-21) 9.2.1 20191130
> > =20
> >> I'm using arm-linux-gnueabi-gcc (Debian 8.3.0-2) 8.3.0 which does not
> >> show that oddity. =20
> >
> > I assume it is because of the change to arch_futex_atomic_op_inuser()
> > for arm and the compiler is not clever enough to work out that the early
> > return from arch_futex_atomic_op_inuser() means that oldval is not
> > referenced in its caller. =20
>=20
> Actually no. It's the ASM part which causes this. With the following
> hack applied it compiles:
>=20
> diff --git a/arch/arm/include/asm/futex.h b/arch/arm/include/asm/futex.h
> index e133da303a98..2c6b40f71009 100644
> --- a/arch/arm/include/asm/futex.h
> +++ b/arch/arm/include/asm/futex.h
> @@ -132,7 +132,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *=
uaddr,
>  static inline int
>  arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *ua=
ddr)
>  {
> -	int oldval =3D 0, ret, tmp;
> +	int oldval =3D 0, ret;
> =20
>  	if (!access_ok(uaddr, sizeof(u32)))
>  		return -EFAULT;
> @@ -142,6 +142,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *o=
val, u32 __user *uaddr)
>  #endif
> =20
>  	switch (op) {
> +#if 0
>  	case FUTEX_OP_SET:
>  		__futex_atomic_op("mov	%0, %4", ret, oldval, tmp, uaddr, oparg);
>  		break;
> @@ -157,6 +158,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *o=
val, u32 __user *uaddr)
>  	case FUTEX_OP_XOR:
>  		__futex_atomic_op("eor	%0, %1, %4", ret, oldval, tmp, uaddr, oparg);
>  		break;
> +#endif
>  	default:
>  		ret =3D -ENOSYS;
>  	}
>=20
> but with this is emits the warning:
>=20
> diff --git a/arch/arm/include/asm/futex.h b/arch/arm/include/asm/futex.h
> index e133da303a98..5191d7b61b83 100644
> --- a/arch/arm/include/asm/futex.h
> +++ b/arch/arm/include/asm/futex.h
> @@ -145,6 +145,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *o=
val, u32 __user *uaddr)
>  	case FUTEX_OP_SET:
>  		__futex_atomic_op("mov	%0, %4", ret, oldval, tmp, uaddr, oparg);
>  		break;
> +#if 0
>  	case FUTEX_OP_ADD:
>  		__futex_atomic_op("add	%0, %1, %4", ret, oldval, tmp, uaddr, oparg);
>  		break;
> @@ -157,6 +158,7 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *o=
val, u32 __user *uaddr)
>  	case FUTEX_OP_XOR:
>  		__futex_atomic_op("eor	%0, %1, %4", ret, oldval, tmp, uaddr, oparg);
>  		break;
> +#endif
>  	default:
>  		ret =3D -ENOSYS;
>  	}
>=20
> and the below proves it:
>=20
> diff --git a/arch/arm/include/asm/futex.h b/arch/arm/include/asm/futex.h
> index e133da303a98..a9151884bc85 100644
> --- a/arch/arm/include/asm/futex.h
> +++ b/arch/arm/include/asm/futex.h
> @@ -165,8 +165,13 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *=
oval, u32 __user *uaddr)
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
>=20
> I think that's the right thing to do anyway. The conditional is pointless.

Thanks for the analysis.

I am still getting this warning, now from Linus' tree builds.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pk_O4snDeaSGZI2P2=FNYNB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Tq8gACgkQAVBC80lX
0Gwu7wf8DeBTLRfLkW+SrKzC9O9D+FG7c++XTn+nBinRgIUHP28oKTKsTT6yGwdF
vrDWP3KFxl14sxN3D/DU78nYo2VM532+0rhfL2uOzVDRbyFuoJeBLsOsECj+HKNa
k8ZJpb6dh/oQI2zsEQ1FqiFv5UTJ1JTnVGXGx7jxzkCQb1C28QA1kUYWZwUewyvo
n3cCKqMmYR6T7KKb2BRyhEzzbD5A8nWNxVgx+9JZoeIhV+vrA6JGfZTF8MTYCM6z
3Wpp1A0qKqLPwAgUNEEVXcMTFHxMYLy1wfEX8p8wVTSrYaC5SbpOL/0Zm7597w1Q
t2ZK9cOB3weOJQwKuT1JZpocNlyyBg==
=0b/o
-----END PGP SIGNATURE-----

--Sig_/Pk_O4snDeaSGZI2P2=FNYNB--
