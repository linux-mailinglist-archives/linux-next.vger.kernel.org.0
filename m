Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6535A282A09
	for <lists+linux-next@lfdr.de>; Sun,  4 Oct 2020 12:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgJDKAe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 4 Oct 2020 06:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDKAe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 4 Oct 2020 06:00:34 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18B1C0613CE;
        Sun,  4 Oct 2020 03:00:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C3zkG465Yz9sSC;
        Sun,  4 Oct 2020 21:00:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601805629;
        bh=51tc8qvY4LvblmjUfqt2w2t9BRmo3z24rZqke5UapfA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CddBGLb5OqZnhg0FVle/4DR9WvLeFvyYukkLwhWEdKYX1+vos8y2OPN4N4DyLMJ4Y
         uyF35fEIwX9ScWH7axi7Ctd4hL44jSAYkvQCX8YaG6hEI4zSQXzLFrup4JGpN0jrWt
         1Alp87KS2cW1J3C4MFQCi29RdD9QUPigkCagEO4d1mgXezu4NhvY7aqgSL7wGzb5ty
         U1uAB27GR28MAuab38GU8f2xmspAJRL/b+5N2FYAXAQ4UqYpWu8SsXLQpUwvpeDtLv
         gBWc0Z4ZEyDlhPp+fvObZ3FcMlYis4jLy8bOZMRSeyQEHnmgP7+tN5SUmFmJj5QdFt
         MuGOavFyOEbtw==
Date:   Sun, 4 Oct 2020 21:00:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20201004210018.5bbc6126@canb.auug.org.au>
In-Reply-To: <202010040125.B5AD5B757@keescook>
References: <20200914132249.40c88461@canb.auug.org.au>
        <202010031451.ABC49D88@keescook>
        <20201004102437.12fb0442@canb.auug.org.au>
        <202010040125.B5AD5B757@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qiLQn1q5O+ZvKogJ9Vf+s4V";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qiLQn1q5O+ZvKogJ9Vf+s4V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Sun, 4 Oct 2020 01:27:01 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> I assume CONFIG_CONSTRUCTORS is enabled for your build (it should be for

yes, indeed.

> allmodconfig). Does this patch fix it? (I'm kind of blindly guessing
> based on my understanding of where this could be coming from...)
>=20
>=20
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmli=
nux.lds.h
> index e1843976754a..22f14956214a 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -701,6 +701,7 @@
>  #ifdef CONFIG_CONSTRUCTORS
>  #define KERNEL_CTORS()	. =3D ALIGN(8);			   \
>  			__ctors_start =3D .;		   \
> +			KEEP(*(SORT(.ctors.*)))		   \
>  			KEEP(*(.ctors))			   \
>  			KEEP(*(SORT(.init_array.*)))	   \
>  			KEEP(*(.init_array))		   \

And that makes the messages go away.

--=20
Cheers,
Stephen Rothwell

--Sig_/qiLQn1q5O+ZvKogJ9Vf+s4V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl95nTIACgkQAVBC80lX
0GyLmggAjOpNy0A3V1lwF/AmXhSdUHW+ZzLXsHAxtWc1OBhTyGAikjqo2NQ2N2hm
QetxomxIFizg1Kq8ns40IuFEgfg9WJ2sfnZ7ngtAgEJhkvNDvSIQvNjyK0mmAALp
JgZY4N9Dlh/8GuvtlZVX4G0LaIly+6wXm908vt1JvXyQ2fna5pWlzyxOPNNwgeiV
LefclyK/VvDdotj4ru8/gFm8Yd4nQKXS/KQ1YXm52Thp0LBKL9Mf9FXP9lXBEUZn
0ObwIJIcuImHYLqza9jccIDIemrkTCG+kOwUZKuGgzhRq+h1FZ5G3+jS+CGuOT+h
evpXiK5+tDTctJgLCm9V0XJUwo6toA==
=OXs2
-----END PGP SIGNATURE-----

--Sig_/qiLQn1q5O+ZvKogJ9Vf+s4V--
