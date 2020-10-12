Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD74C28AD80
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 07:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgJLFNo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 01:13:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45055 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725967AbgJLFNo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Oct 2020 01:13:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8mzl4WHpz9sS8;
        Mon, 12 Oct 2020 16:13:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602479621;
        bh=N9dW3z7wNBwEnucfX/iwZh7H+XANweIaXriLKck+wP8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QNXBnStpBYKekdJdJj+sg5fDnugd6iJCajr5gUmAVHfiu0QQ7La5C0zKBwoOmYToY
         3TSuCMFi70BJuJ9SN0tQAT9vptKIq0elnKvUh4ailkv5noO6Nu+XAqe9/K8qXg8hj9
         Jcex7p/lEKYqPr0It6o36Z0EIj+PO+pkpsQSfHexiPeyeocSHCTLXjwwCnhXSwVxqf
         V+QbIu9Uda6ZlkfXahjihw1XBnPIWYbVJuXscbar8qqSLFLKR+1kai6Fm77BFcSgRP
         CPubyCb+3cg+PMv+rEi1eoYivDDL4prUuK57ayODzCVof7qF8yjQK4km7pfySmfGo0
         aoj/iTEitOUOw==
Date:   Mon, 12 Oct 2020 16:13:38 +1100
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
Message-ID: <20201012161338.3c94f6e5@canb.auug.org.au>
In-Reply-To: <20201012085936.241cc62d@canb.auug.org.au>
References: <20201009112327.GC656950@krava>
        <cover.thread-251403.your-ad-here.call-01602244460-ext-7088@work.hours>
        <patch-1.thread-251403.git-2514037e9477.your-ad-here.call-01602244460-ext-7088@work.hours>
        <20201009124111.GD656950@krava>
        <20201012085936.241cc62d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4AgCVPaFVmv3l11czc64wIJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4AgCVPaFVmv3l11czc64wIJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 12 Oct 2020 08:59:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 9 Oct 2020 14:41:11 +0200 Jiri Olsa <jolsa@redhat.com> wrote:
> >
> > On Fri, Oct 09, 2020 at 02:25:23PM +0200, Vasily Gorbik wrote: =20
> > > Currently BUILD_BUG() macro is expanded to smth like the following:
> > >    do {
> > >            extern void __compiletime_assert_0(void)
> > >                    __attribute__((error("BUILD_BUG failed")));
> > >            if (!(!(1)))
> > >                    __compiletime_assert_0();
> > >    } while (0);
> > >=20
> > > If used in a function body this obviously would produce build errors
> > > with -Wnested-externs and -Werror.
> > >=20
> > > To enable BUILD_BUG() usage in tools/arch/x86/lib/insn.c which perf
> > > includes in intel-pt-decoder, build perf without -Wnested-externs.
> > >=20
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>   =20
> >=20
> > that one applied nicely ;-) thanks
> >=20
> > Acked-by: Jiri Olsa <jolsa@redhat.com> =20
>=20
> I will apply that patch to the merge of the tip tree today (instead of
> reverting the series I reverted in Friday) (unless I get an update of
> the tip tree containing it, of course).

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build tested

--=20
Cheers,
Stephen Rothwell

--Sig_/4AgCVPaFVmv3l11czc64wIJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+D5gIACgkQAVBC80lX
0GwaXQf8Df4cAa7F6f6di3mQnyp2/awOB6O9oJWhuDuTveX1GiDUaKteCAHxordW
3Ze8HL6ursvrEj0am7YX6Br9l6M86KMYqdYxqbjBKleQhzjek66EHzg8N0Kjhvyi
yfg6THPe2pseNFwnBMJ11gPeLtLH7Ce3FyYtVQDBWrgsX58zxP1tFZURuch/S940
IEM6Y5CBrm77PajODkvPzCzplgn69HVQRraPFDxjlJ3Kof7m02d5xGcvmoAt3Q04
FVvGY4fgcO709G1GXhHl/WemP1o2rkdJ9pTil7MTZ9MPVCQWJTPKm2LamN5pCmxs
dQmwdmOy+/d3BQr4mRYfXoBCYSNC7A==
=NStr
-----END PGP SIGNATURE-----

--Sig_/4AgCVPaFVmv3l11czc64wIJ--
