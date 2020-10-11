Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4AD128AAC9
	for <lists+linux-next@lfdr.de>; Sun, 11 Oct 2020 23:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbgJKV7u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Oct 2020 17:59:50 -0400
Received: from ozlabs.org ([203.11.71.1]:50185 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729583AbgJKV7t (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Oct 2020 17:59:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8bLx0V5tz9sT6;
        Mon, 12 Oct 2020 08:59:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602453587;
        bh=yUJ1UPoxPiQCpn4SJhMOdDvYU8x5GRsU/XB8ZKtlfy8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aIBwXXKxf1+JDkyhpESPlNJeYe+q7+MoIOK0sDpoTcMChj5JtADpSs9ozL69W1aCL
         Bfnyt74zDXABtufUCkfw3szFsD4SxHuoaXsd3QivB3mnU/H/8fm3U+kFnEFNCTTj2v
         arKKGEVi+Fa40SLZZk7PqzsDaTAYAJvCHAFbch1JHQ595KJCoBOj5nMc82847wICYJ
         Xy8tbpRpIZpQFqkQdu+S/QskrSdtSCQhPzwSrY09rq0U8aeNiZz1RydAp583YbQvrl
         wkXnicW8Okg65L/cJWf9kB2NYULK4+3DNjGBCYjFkzfLQgaLx/9cWhBDIq19GZIw3p
         MsTN8mVJDkwJw==
Date:   Mon, 12 Oct 2020 08:59:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     Vasily Gorbik <gor@linux.ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH RESEND 1/1] perf build: Allow nested externs to enable
 BUILD_BUG() usage
Message-ID: <20201012085936.241cc62d@canb.auug.org.au>
In-Reply-To: <20201009124111.GD656950@krava>
References: <20201009112327.GC656950@krava>
        <cover.thread-251403.your-ad-here.call-01602244460-ext-7088@work.hours>
        <patch-1.thread-251403.git-2514037e9477.your-ad-here.call-01602244460-ext-7088@work.hours>
        <20201009124111.GD656950@krava>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wD4oiLBgMWinHtzhN4j9kbs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wD4oiLBgMWinHtzhN4j9kbs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 9 Oct 2020 14:41:11 +0200 Jiri Olsa <jolsa@redhat.com> wrote:
>
> On Fri, Oct 09, 2020 at 02:25:23PM +0200, Vasily Gorbik wrote:
> > Currently BUILD_BUG() macro is expanded to smth like the following:
> >    do {
> >            extern void __compiletime_assert_0(void)
> >                    __attribute__((error("BUILD_BUG failed")));
> >            if (!(!(1)))
> >                    __compiletime_assert_0();
> >    } while (0);
> >=20
> > If used in a function body this obviously would produce build errors
> > with -Wnested-externs and -Werror.
> >=20
> > To enable BUILD_BUG() usage in tools/arch/x86/lib/insn.c which perf
> > includes in intel-pt-decoder, build perf without -Wnested-externs.
> >=20
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Vasily Gorbik <gor@linux.ibm.com> =20
>=20
> that one applied nicely ;-) thanks
>=20
> Acked-by: Jiri Olsa <jolsa@redhat.com>

I will apply that patch to the merge of the tip tree today (instead of
reverting the series I reverted in Friday) (unless I get an update of
the tip tree containing it, of course).

--=20
Cheers,
Stephen Rothwell

--Sig_/wD4oiLBgMWinHtzhN4j9kbs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+DgEgACgkQAVBC80lX
0GxWIwf+Kvv0XbRu8g+vdFqrbtpm10qIAkuowzDDCYI5wM5h8Mr/r7GHWR5XbsT5
ediOu2d4z1srzHDeOl1+kb+DTrbUZpyu7XljfhIPGfe/45OBHG3jRjR21dFtfBJS
P2R5haT3JfRKPY5lGhMG9p3CsesLQYNMGxmY0en6+GC0jTgAfH0BZ1MvvMhj9VPk
uLIlZTJOE5rCp/Sygscp+bFsAyx/KxoLDZElCeuup+tWT3WgERQR/F19aJO2ijer
FDTIQrFeacOiRJT2Mhspw7ywBwQovtuWA8Q1RqZPFHjA1Bhpch4EEs0RCADKsnjb
RQEsT1iiO9Ey7joj+RVC/9979zfznw==
=hRLL
-----END PGP SIGNATURE-----

--Sig_/wD4oiLBgMWinHtzhN4j9kbs--
