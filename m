Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE74438D53
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 03:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbhJYB5N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 21:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhJYB5N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 21:57:13 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FEA2C061745;
        Sun, 24 Oct 2021 18:54:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hcygr0TVKz4xYy;
        Mon, 25 Oct 2021 12:54:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635126888;
        bh=I7SPuy5XF/qpL0LgpEtDISFmHslKggpBDDuSsDoZwmM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W6JqfN86a9jt8aA05PH2BOvOl3oVnEp2RowPRE1yirk/Yj1zdsdhkMpncCLruKu0J
         St3eM0gU9o8qRTraiGl1sv+8rLLDX9XnM/53rqnSacFmDcWFGypKLKU+l7POCk48k5
         MOcfiEeHTkQ51jGJSw1ka+5oVbDOMZtmBg71X8PWy4xqbBdNeI/tLqw+FnXihme1b+
         Ltfzz3q4K33ploAbKRD+HKDPsPVrQQdeQ7TNUkJTRnztNz2hz5GbwVEIZ5r3IatUEW
         Ij7rwDfKHw0RDQTpFTRjD2c+DRl6wsAfEMJiIhnd7flCs+cblcJ04ryzFUKLc40CXM
         AhXPBANp8D74w==
Date:   Mon, 25 Oct 2021 12:54:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211025125446.51bed661@canb.auug.org.au>
In-Reply-To: <20211018181559.5d3bcf7e@canb.auug.org.au>
References: <20211018181559.5d3bcf7e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wp=UcRq8Y=zrEOErt6dWmZt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Wp=UcRq8Y=zrEOErt6dWmZt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Oct 2021 18:15:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the kspp-gustavo tree, today's linux-next build (powerpc
> pseries_le_defconfig) failed like this:
>=20
> In file included from include/linux/perf_event.h:49,
>                  from arch/powerpc/perf/callchain.c:9:
> include/linux/ftrace.h:49:41: error: 'struct ftrace_regs' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on [-Werror]
>    49 |           struct ftrace_ops *op, struct ftrace_regs *fregs);
>       |                                         ^~~~~~~~~~~
> cc1: all warnings being treated as errors
>=20
> (many of these)
>=20
> Caused by commit
>=20
>   c45ede6c2781 ("ftrace: Fix -Wmissing-prototypes errors")
>=20
> I have added the following fixup for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 18 Oct 2021 17:56:30 +1100
> Subject: [PATCH] fixup for "ftrace: Fix -Wmissing-prototypes errors"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/ftrace.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 871b51bec170..ada656c6824d 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -45,6 +45,7 @@ struct ftrace_ops;
>  void arch_ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip=
);
>  #else
>  # define FTRACE_FORCE_LIST_FUNC 0
> +struct ftrace_regs;
>  void arch_ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
>  			       struct ftrace_ops *op, struct ftrace_regs *fregs);
>  #endif
> --=20
> 2.33.0

I am still applying this fix ...

--=20
Cheers,
Stephen Rothwell

--Sig_/Wp=UcRq8Y=zrEOErt6dWmZt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF2DmYACgkQAVBC80lX
0Gy0IAf+JRG6AIZzCRvxq0+qM5CIU5aJJfb6Ew4RuLkP5yPBlU6tBIivzHKHrWdQ
ftqZAF4uok8MVU7sFioXMdHSbOjw4f2oVuc3QY7U2KP2YL82Me+2fjiupkulvZCg
IyK1Ygktqbjb8Zw0DKDfDoctKSqVuW8yNGt6S9aCp9kFLZ+ntc6qFGU+0FTMkLi5
LzCuaAucLHm9GyEcjMYA1sOIPwnefQZiDLv6Fbsfprahz17GTpxjSk4qJ4UgSH3O
rJqYxJPqItzygjfBmrXywT/NrwQfnYfm+S0Tkly5h9+PhpaJGu0xBdk/Wbq+jc4F
sCNzNFRLmBMnHdnK7HdpdAhaC0+xig==
=4p++
-----END PGP SIGNATURE-----

--Sig_/Wp=UcRq8Y=zrEOErt6dWmZt--
