Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3182F2D400A
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 11:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730118AbgLIKep (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 05:34:45 -0500
Received: from ozlabs.org ([203.11.71.1]:53623 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729804AbgLIKeh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 05:34:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrYLV1YdKz9sWK;
        Wed,  9 Dec 2020 21:33:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607510035;
        bh=lDtWS6916nfgO2k9JHjSAC4AyMJW4Ynnt9/fbcCFIIs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qeOf3EUGaDLjcUzBJ5frHJIkfp9HzLZG3ipYtY+xVRMXod7+2agnxAcYZja/jpvVE
         h9Jbb8hgYVUCO0B83C9/j3rYJrYIGA5sOvsfut6/LacMlmGP5juxwUmfUCZp5Zd9as
         QfJP/iSOrniiukmOEzLtaLyAcJsnwfCYZZCHtU0+/E7R+lemQcnx4X+WV2DOLaul93
         DoLiltlXPtUx7AAUYpSM7S+c1V6FRn9fRUYsJHWE/TGDsMspBgps2E+/pnO6C3xeD3
         1rWRAZBa9PUKNgkuNwMyMVmgQkU2N3443ijKS1tCAm/C5A/3sRPAdbK9N96VpcDm8y
         UsdvrUHy32CbA==
Date:   Wed, 9 Dec 2020 21:33:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Mathieu Malaterre <malat@debian.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
Message-ID: <20201209213352.15487d56@canb.auug.org.au>
In-Reply-To: <20201208230157.42c42789@canb.auug.org.au>
References: <20201204210000.660293c6@canb.auug.org.au>
        <20201208230157.42c42789@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bdi+83aaJMmJE5.FFGG7Z2U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bdi+83aaJMmJE5.FFGG7Z2U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Dec 2020 23:01:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> I will try the following patch tomorrow:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 8 Dec 2020 22:58:24 +1100
> Subject: [PATCH] powerpc: Add .data..Lubsan_data*/.data..Lubsan_type* sec=
tions explicitly
>=20
> Similarly to commit
>=20
>   beba24ac5913 ("powerpc/32: Add .data..Lubsan_data*/.data..Lubsan_type* =
sections explicitly")
>=20
> since CONFIG_UBSAN bits can now be enabled for all*config.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/kernel/vmlinux.lds.S | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmli=
nux.lds.S
> index 3b4c26e94328..0318ba436f34 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -296,6 +296,10 @@ SECTIONS
>  #else
>  	.data : AT(ADDR(.data) - LOAD_OFFSET) {
>  		DATA_DATA
> +#ifdef CONFIG_UBSAN
> +		*(.data..Lubsan_data*)
> +		*(.data..Lubsan_type*)
> +#endif
>  		*(.data.rel*)
>  		*(.toc1)
>  		*(.branch_lt)
> --=20
> 2.29.2

This got rid of all the warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/bdi+83aaJMmJE5.FFGG7Z2U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/QqBAACgkQAVBC80lX
0Gz0nQf/RNqrsicIbLqfHos/jyBwGt9KwnDnfb11T7O3k2/CcVfVxmsaXKUcChqK
I3tFKW4L5uHGiz8+TPPqvUnalGzWgcCh4DVHcc0VC3i8ZK/6hFbDJ6aisMkdmi1V
axmEFnMEQ3P4Cu4bE+cndCJ96C3Z+c+9/p/H0pxuB28MKnO8/uib2fKX+p2xOCkk
vMiKfBwBCAuIru1BT3oHsC9w4G8OlpkdlFh6bGDsPwfVXc8XiB4U3rGJJDu2nLXh
nylmt3Ar7azYDwzab79wiRIgC2H2L9oF9pNj8TESW/nu1AioWvwyskJJ01h6emV5
bNvp1k1WZubZjHAiCazBYnRjxYQU8g==
=D7y+
-----END PGP SIGNATURE-----

--Sig_/bdi+83aaJMmJE5.FFGG7Z2U--
