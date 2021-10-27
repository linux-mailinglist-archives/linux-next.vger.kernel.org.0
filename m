Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4197143C0B3
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 05:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhJ0DTK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 23:19:10 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:58297 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235112AbhJ0DTK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 23:19:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfDPS1Mz6z4xbW;
        Wed, 27 Oct 2021 14:16:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635304604;
        bh=05bcNuJ4Wl4PUgWD9xHg+dVJU6pfjSBBUdKHYx/JoJ4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=r2BvL2PQnlJhZVvjYPl9ibJ7GKHAsIMttxV5j6n2zT8kEgUeWDk/0TuBvfqnF49VW
         lUe7Lx3ZXOTbf3eASC2ihQGbgR0AMt18SBjARN6ZbLd+XP6njIo1AS10Z3xzMoj4jX
         9BlMR+1aQhz52PbpwgXl/PJDnwbNzuZzEssdd+b2nvCsiw5S67hUlJgBbo1KkrXiBU
         NL2VesmeCZgPuZTZ6+Ps3n5BMdCx8N0ArP7ya2cgMTAe52mBR05jtv6t99v/06SZc5
         +syIQLiCt/UW9q8hRAEYFojRejvTzO/HF+3/mxZKuF3KcI+2CmLF2iUbWGbbWcmAjc
         exyW3w9L9qiqw==
Date:   Wed, 27 Oct 2021 14:16:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>, Jiri Olsa <jolsa@redhat.com>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-next@vger.kernel.org
Subject: Re: Upcoming merge conflict between ftrace and s390 trees
Message-ID: <20211027141642.047382df@canb.auug.org.au>
In-Reply-To: <YXAqZ/EszRisunQw@osiris>
References: <YXAqZ/EszRisunQw@osiris>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x/wmD6yRRj1dGyR+WdWGk6S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/x/wmD6yRRj1dGyR+WdWGk6S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

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

I have applied that as a merge fixup in linux-next today.  I assume
that it would apply directly to the ftrace tree so a proper patch
should be sent to Steve (as he asked).  It is clearly needed as
ftrace-direct-multi.c contains an x86 asm statement :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/x/wmD6yRRj1dGyR+WdWGk6S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF4xJoACgkQAVBC80lX
0Gw9xwf+I7AkjuHOzAiEiveC7VJPKH5y7HVYPSIlQwg75W9iX2WojMW3XU14LQl4
izAsG7gS0bF8DDhj8n6MEcQViMuBPozMxCjjy37cc9MWBYgAr+FsuhN5DLoSlpbW
IMjEh6obONESDlfUocGP+49J8bdTkfnxttR3W773KrmPnQVZ+sx/gBL6LiC6PbnQ
QlkR/oW7r2JNVjR2i/PDZXDWh7rJSnu+TR/KW9RVlhcYwiClJcnKdSeU83AAwy8f
Fr9dOngJZyR10vsdmd4lOdHmU4TwbgqNlDLGI5IPk8jD+20QXJ2oEBxcONj9ajWf
sTDTD2UjeuLGXLMxnoC3vXcobS8BEA==
=I0fN
-----END PGP SIGNATURE-----

--Sig_/x/wmD6yRRj1dGyR+WdWGk6S--
