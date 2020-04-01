Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA9AE19A32E
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 03:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731660AbgDABOi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Mar 2020 21:14:38 -0400
Received: from ozlabs.org ([203.11.71.1]:48885 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731470AbgDABOi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Mar 2020 21:14:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48sSsQ2Yjjz9sSb;
        Wed,  1 Apr 2020 12:14:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585703675;
        bh=ajyckYv+u7ahqzGEdiJfo/3/p/3PVm0LAcAr/PX9ZgA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vGMde35pzFK0JcmCYgfOMT/Qr2pBgM+m712lfi3O1tkjHmXSuxUtq8rcwoR6nZSVt
         A8I3vTJ65Q2d5T9JY8ivr5erU85spmzWCAuN5Pz/SUmb+fs7iz57lV6khRsRHICVUQ
         xirzDoQx+RNswpSBABzoXH1Cvs9n/FZF9v58vBvM/Q+GT8af3+XS4jax5MtnJCUW7e
         Ioi8Uh0EBbR7mZdUzhyk+hPtd2rOyoTcp8mdUl6AvqsOZ+2kZTxoiAOzQXNi4qUprA
         oEllEx+iJPSPZFSzaytGDIZm3gepUD7nNS2U8T3ByiWLC07sDvwExz+QUpgnwVUM3V
         Kr4WqQCBz1f6g==
Date:   Wed, 1 Apr 2020 12:14:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200401121431.6a996244@canb.auug.org.au>
In-Reply-To: <20200326135258.2764f0de@canb.auug.org.au>
References: <20200326135258.2764f0de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EE0Ofmjpu3aeRePYz//AchO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EE0Ofmjpu3aeRePYz//AchO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 26 Mar 2020 13:52:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> drivers/power/reset/sc27xx-poweroff.c: In function 'sc27xx_poweroff_shutd=
own':
> drivers/power/reset/sc27xx-poweroff.c:38:4: error: implicit declaration o=
f function 'cpu_down' [-Werror=3Dimplicit-function-declaration]
>    38 |    cpu_down(cpu);
>       |    ^~~~~~~~
>=20
> Caused by commit
>=20
>   33c3736ec888 ("cpu/hotplug: Hide cpu_up/down()")
>=20
> interacting with commit
>=20
>   274afbc3ad33 ("power: reset: sc27xx: Change to use cpu_down()")
>=20
> from the battery tree.
>=20
> I have added the following merge fix patch:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 26 Mar 2020 13:42:00 +1100
> Subject: [PATCH] power: reset: sc27xx: use remove_cpu instead of cpu_down
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/power/reset/sc27xx-poweroff.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/reset/sc27xx-poweroff.c b/drivers/power/reset/=
sc27xx-poweroff.c
> index 69863074daf6..90287c31992c 100644
> --- a/drivers/power/reset/sc27xx-poweroff.c
> +++ b/drivers/power/reset/sc27xx-poweroff.c
> @@ -35,7 +35,7 @@ static void sc27xx_poweroff_shutdown(void)
> =20
>  	for_each_online_cpu(cpu) {
>  		if (cpu !=3D smp_processor_id())
> -			cpu_down(cpu);
> +			remove_cpu(cpu);
>  	}
>  #endif
>  }
> --=20
> 2.25.0

This fixup is now needed when the battery tree is merged into Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EE0Ofmjpu3aeRePYz//AchO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6D6vcACgkQAVBC80lX
0GzB5Af/b4130sQwkHhETtaNc69+wdGBdLK1AHOynid/N8HyByA3EaRuS/gPGyE5
CnljVYDOabEHf2jzCAbzXUodcgOdTnakGXug8gcT3nstlNtHkx5bs0teQAEJgMlR
azVB45vxInpGLR3wGpm3Lh/17XqFE+CivQX4sRnFIwZirXOyYfShMTNdzdB2vNkM
Pnu8WU+DpbNDjOuh4bzIlwm1yMBXocZA6Y+vL8SHdlJr29zrOcpUfEh7+JKqmRaJ
3j8PMsGD3QbG1hcXn5lfNfmIJvPy02VcDTfINW2IRdUsDM4G7audeLUpl6brojwl
AC7gXd7gK3yvdo0rODKqVpEjNGxZ6A==
=k642
-----END PGP SIGNATURE-----

--Sig_/EE0Ofmjpu3aeRePYz//AchO--
