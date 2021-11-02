Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A70944379D
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 22:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhKBVEw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 17:04:52 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34911 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhKBVEv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 17:04:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HkMm566jKz4xbc;
        Wed,  3 Nov 2021 08:02:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635886934;
        bh=Q3MItTC2Hj0BDEWXamk2NghhAGXgPZIm7Li8LTO0+Z0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F6lGzT3vwB8G86hAlmlfC4CvsQBb5rG9RTLivUuSs8ppQpoSs9HnYmgQwzdpyinRP
         QWJuHwwkpKguHYFzzC4DqF3oM6CWhs4IVOOfUOMnm4W2hEn1+ccbdgy8VAOe21Jkq9
         dBzM99dv/inadGZyf9LLe4gTZ15HqkmL4x+MPf8XXGW6GN2uuTrjdmCYXXIUedhiZT
         SowXoalGbv5x6Hk8q0cqjPiEsRWLVbm9+yUu4Dip2E8KnY+P+ZKzYGA9rDGbOEa+iX
         DcooSP7v3+x2gIH2dHNO51KPJG2xx+h+3tXA+emZHxZkNSr2h3rfEFzQKJRHF6gjwY
         qCkS2L7nITGVA==
Date:   Wed, 3 Nov 2021 08:02:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>, Jiri Olsa <jolsa@redhat.com>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-next@vger.kernel.org
Subject: Re: Upcoming merge conflict between ftrace and s390 trees
Message-ID: <20211103080211.2aa3cf0a@canb.auug.org.au>
In-Reply-To: <YXAqZ/EszRisunQw@osiris>
References: <YXAqZ/EszRisunQw@osiris>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a7ybzGJVun=6MgXPt6.wdI2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a7ybzGJVun=6MgXPt6.wdI2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Wed, 20 Oct 2021 16:40:39 +0200 Heiko Carstens <hca@linux.ibm.com> wrote:
>
> just as heads-up: there will be an upcoming merge conflict between
> ftrace and s390 trees in linux-next which will cause a compile error
> for s390.
>=20
> With the s390 tree this commit is already in linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git/commit/?h=
=3Dfeatures&id=3Dc316eb4460463b6dd1aee6d241cb20323a0030aa
>=20
> And soon this patch will likely be within the ftrace tree:
> https://lore.kernel.org/lkml/20211008091336.33616-9-jolsa@kernel.org/
>=20
> Maybe Steven could reply to this when he applies it.
>=20
> This would be required to fix the conflict:
>=20
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 999907dd7544..d654b95a1e3e 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -190,6 +190,7 @@ config X86
>  	select HAVE_DYNAMIC_FTRACE_WITH_ARGS	if X86_64
>  	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SAMPLE_FTRACE_DIRECT	if X86_64
> +	select HAVE_SAMPLE_FTRACE_MULTI_DIRECT	if X86_64
>  	select HAVE_EBPF_JIT
>  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
>  	select HAVE_EISA
> diff --git a/samples/Kconfig b/samples/Kconfig
> index 0823b97d8546..7561f3e42296 100644
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@ -229,3 +229,6 @@ endif # SAMPLES
> =20
>  config HAVE_SAMPLE_FTRACE_DIRECT
>  	bool
> +
> +config HAVE_SAMPLE_FTRACE_MULTI_DIRECT
> +	bool
> diff --git a/samples/Makefile b/samples/Makefile
> index 291663e56a3c..7a38538b577d 100644
> --- a/samples/Makefile
> +++ b/samples/Makefile
> @@ -21,6 +21,7 @@ subdir-$(CONFIG_SAMPLE_TIMER)		+=3D timers
>  obj-$(CONFIG_SAMPLE_TRACE_EVENTS)	+=3D trace_events/
>  obj-$(CONFIG_SAMPLE_TRACE_PRINTK)	+=3D trace_printk/
>  obj-$(CONFIG_SAMPLE_FTRACE_DIRECT)	+=3D ftrace/
> +obj-$(CONFIG_SAMPLE_FTRACE_MULTI_DIRECT) +=3D ftrace/
>  obj-$(CONFIG_SAMPLE_TRACE_ARRAY)	+=3D ftrace/
>  subdir-$(CONFIG_SAMPLE_UHID)		+=3D uhid
>  obj-$(CONFIG_VIDEO_PCI_SKELETON)	+=3D v4l/
> diff --git a/samples/ftrace/Makefile b/samples/ftrace/Makefile
> index ab1d1c05c288..e8a3f8520a44 100644
> --- a/samples/ftrace/Makefile
> +++ b/samples/ftrace/Makefile
> @@ -3,7 +3,7 @@
>  obj-$(CONFIG_SAMPLE_FTRACE_DIRECT) +=3D ftrace-direct.o
>  obj-$(CONFIG_SAMPLE_FTRACE_DIRECT) +=3D ftrace-direct-too.o
>  obj-$(CONFIG_SAMPLE_FTRACE_DIRECT) +=3D ftrace-direct-modify.o
> -obj-$(CONFIG_SAMPLE_FTRACE_DIRECT) +=3D ftrace-direct-multi.o
> +obj-$(CONFIG_SAMPLE_FTRACE_MULTI_DIRECT) +=3D ftrace-direct-multi.o
> =20
>  CFLAGS_sample-trace-array.o :=3D -I$(src)
>  obj-$(CONFIG_SAMPLE_TRACE_ARRAY) +=3D sample-trace-array.o

I will now apply this to the merge of the s390 tree with Linus' tree
(as the ftrace tree has been merged by Linus).

--=20
Cheers,
Stephen Rothwell

--Sig_/a7ybzGJVun=6MgXPt6.wdI2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGBp1MACgkQAVBC80lX
0Gxx6Af8CKwb+dEySNT43jfTK1/ZyPDb0JnshIqC1vsbXLusbyeH70cwowmAKqXH
M0SSzTqyhVcWqId6QTMd63gNS6AhS/XVMHh5QshbkpO9+Cd9mxkUU+BcPOiDYOhR
ObB/cUwmiO1iHhjHnTIu0k2PEoe03u6woSGZOHqpBPUSXBWRgZzm0IAd7xIMG9gL
7BAkq+JXLuHqnece14pZZVBQouWNSEwm1ZebPIMFpdRO5RQhNKxGjsNeRlWzKKIk
Ve/Sg6NAx4jdOR6aFXNvJU4a25m6cRaBEuAaMjTrHFrsaI5Rd22zGgfwCtjdRW7C
NTYZCTebotdCFnbmNaDlgNY//SDAJQ==
=8D1e
-----END PGP SIGNATURE-----

--Sig_/a7ybzGJVun=6MgXPt6.wdI2--
