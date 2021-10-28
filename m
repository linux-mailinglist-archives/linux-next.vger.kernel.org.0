Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DA143F16A
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 23:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhJ1VT3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 17:19:29 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49901 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbhJ1VT3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 17:19:29 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgJKQ2sdcz4xZ1;
        Fri, 29 Oct 2021 08:16:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635455820;
        bh=77b6Wqpi5myKp7cmYqHYaq9WuF85O34cJH2RaLKBxUM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uyiUdjfjUiWv6vLY7jPJidnMGI3NSeDl4eLBuV23oGFhYPyvu2bFtGHGd5UjDCyvS
         EPcs0FJpU+zeV3rnXH3I1HRdkP1sa1PH9STvSu4HVtdqDpeaumLWwwRBuztVCLcqsV
         eyCKH3SnBnLFlEXJQKdh55UPr8M/NLZw37ofcK6RjzeRpGG2s9OSGO6s8pYe+gPZ8X
         rn9NfJgV83EAWJ+AfigdvyXIZUkNIbJ//Pf9iM8LgXUxuAldqRI71V4L/h/xqpsdB7
         knZKi/BNR7Qx679v7CqtWxPnHmNpD1/M+V08cW1VCJawFa4xLSI6USj2MDgcunhbO8
         XJs60vWbZwvzw==
Date:   Fri, 29 Oct 2021 08:16:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        <lkft-triage@lists.linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: riscv: delay.c:77:17: error: implicit declaration of function
 'cpu_relax' [-Werror=implicit-function-declaration]
Message-ID: <20211029081656.29a66889@canb.auug.org.au>
In-Reply-To: <3555118a-914f-8c21-d5c9-7f3d969d357e@huawei.com>
References: <CA+G9fYs6X5ce1BhynpivZLU7MvPq+vkrJCM7oSJf8GJBApCqZg@mail.gmail.com>
        <3555118a-914f-8c21-d5c9-7f3d969d357e@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A+1lE0AWxzXcwYX7hLCIbyc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A+1lE0AWxzXcwYX7hLCIbyc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[cc'ing Andy and Andrew]

On Thu, 28 Oct 2021 22:57:02 +0800 Kefeng Wang <wangkefeng.wang@huawei.com>=
 wrote:
>
>  From c83a7b83ff96ba77a7c26090ccdd42aa7722788f Mon Sep 17 00:00:00 2001
> From: Kefeng Wang <wangkefeng.wang@huawei.com>
> Date: Thu, 28 Oct 2021 23:03:13 +0800
> Subject: [PATCH] riscv: Fix implicit declaration of function 'cpu_relax'
>=20
> Including <asm/processor.h> to fix the implicit declaration of function
> 'cpu_relax'.
>=20
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> After  "include/linux/delay.h: replace kernel.h with the necessary inclus=
ions", we need this include.
>=20
>   arch/riscv/lib/delay.c | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
> index f51c9a03bca1..8148dcdee894 100644
> --- a/arch/riscv/lib/delay.c
> +++ b/arch/riscv/lib/delay.c
> @@ -8,6 +8,8 @@
>   #include <linux/timex.h>
>   #include <linux/export.h>
>=20
> +#include <asm/processor.h>
> +
>   /*
>    * This is copies from arch/arm/include/asm/delay.h
>    *
> --=20
> 2.26.2

--=20
Cheers,
Stephen Rothwell

--Sig_/A+1lE0AWxzXcwYX7hLCIbyc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF7E0gACgkQAVBC80lX
0GzREQf/Q4E7qFg/IApEKzU4bhquoI5QuysvDZvnFl9WK9ha8r+sAN0ZBIeODfa4
bmeKbb8JRfhdWbOzIyOIKAgF6lEawqDCxvSnX/muItuBCAsYK2wFe8ZfbKwTTsGt
vxADZEg9unMeiTH5BTlPGEpoCZFzMjha2eImRnLhysGjGa3jM9kUv+La24HizMmg
Hc/9t/qaJ0SmPL90kNbkqen1/546aKjG3wi0tvm+WPRWFPY/FFrJEz9ipf/mR5cx
yo09wZj7Rd5MQkI/VjGpRhsXsVltP4kWp2v4ZMBu+NnLB73ZzRaGuxWZsVNxuytr
N8yX9UabqHI0m57sW2UfWozd5ApNsw==
=ZeJi
-----END PGP SIGNATURE-----

--Sig_/A+1lE0AWxzXcwYX7hLCIbyc--
