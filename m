Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E91423B1B
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 11:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237931AbhJFJ45 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 05:56:57 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60071 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238020AbhJFJ4l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 05:56:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPVDP6WYzz4xbC;
        Wed,  6 Oct 2021 20:54:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633514087;
        bh=B3Pf85bSPRGhEPXqUInjc3AxG2GKRX0U9FpffRCpdxQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PaBtL6RNjNxObkhXMTPfCon/2NwYfjbu7O0Tgoa3kJmmsAizEaldOlOuF8LKFqzlo
         COYVzQCvoFXpNjdFWKtOwAW7mSvZj1QDs74GegaNl/bRZ36mPwlR+qm3SMt2b6snij
         lPkv+MTz8Ycr5JutJKdhryeDgH4CNO4RMY78J68CE5ojMRiQI4bKJZhUeqMTXU2J5Y
         NRd0pwblZ+Ih7FJZe7VWKqxA4vg929n/ZmwKJoEebfHCSTCpUtEGIZIFYtD+UL8CF+
         1x8AtcqukV1VFvq/kQSaxYROT1flZWmimX3VxVd7CWbF8xklRzCLFiVVQl38zi2JiO
         hcLZ3nhFFDBnA==
Date:   Wed, 6 Oct 2021 20:54:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Borislav Petkov <bp@suse.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20211006205444.52e088a9@canb.auug.org.au>
In-Reply-To: <YV1s1GJ+e/qASPy7@zn.tnic>
References: <20211006135826.3e1783f1@canb.auug.org.au>
        <YV1s1GJ+e/qASPy7@zn.tnic>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.q35oSktLfCfGBpC6q+.OCi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.q35oSktLfCfGBpC6q+.OCi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

On Wed, 6 Oct 2021 11:31:00 +0200 Borislav Petkov <bp@suse.de> wrote:
>
> + acme.
>=20
> On Wed, Oct 06, 2021 at 01:58:26PM +1100, Stephen Rothwell wrote:
> > After merging the tip tree, today's linux-next build (native perf)
> > failed like this:
> >
> > In file included from util/intel-pt-decoder/../../../arch/x86/lib/insn.=
c:16,
> >                  from util/intel-pt-decoder/intel-pt-insn-decoder.c:15:
> > util/intel-pt-decoder/../../../arch/x86/lib/insn.c: In function '__insn=
_get_emulate_prefix':
> > tools/include/../include/asm-generic/unaligned.h:10:15: error: packed a=
ttribute is unnecessary [-Werror=3Dpacked]
> >    10 |  const struct { type x; } __packed *__pptr =3D (typeof(__pptr))=
(ptr); \ =20
>=20
> Thanks for the report - luckily, the patch is the topmost one on the
> branch so I can simply edit it.
>=20
> Here's the new version, you can simply apply the last hunk on your tree
> only to verify that it fixes it but it should as the hw arch should not
> matter - it explodes because perf tool builds with -Werror and I can
> trigger it too.
>=20
> I'll redo tip/master once you confirm.

Works for me, thanks.

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # ppc64le compile

--=20
Cheers,
Stephen Rothwell

--Sig_/.q35oSktLfCfGBpC6q+.OCi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFdcmQACgkQAVBC80lX
0GwImQf/Yea0ty2AtTxhGOHCW9BBPANH8RvLKItpMqe2rG2ZJzj6tLgvCe1sGFoN
0paOPy7R9NT94aPAwILPvZKYYjqWk5Y+v5SPePGjmfN6eGPYD231iW0tjjnDJrFB
IfyAr5AYwxQxVubKcNGtjB7Hssk9NV7XS1yl+sXQ5pfgaAkPhS0+G23rr+rDFOdH
hN5d0179Tq+gm8fGASk81P6jrOYasdO5xBHoZjRO564UjF/2o4jGQcz+1/0YgCYx
55R1Hjxrq8fUhbjwyAVU6+R886Myh9dzczoJ7fkdsr9DFpMssYKLMeR16Ir4ljCe
P6V2CdM2DCr2FqXy0QTsLqP0AqAXMQ==
=4JdA
-----END PGP SIGNATURE-----

--Sig_/.q35oSktLfCfGBpC6q+.OCi--
