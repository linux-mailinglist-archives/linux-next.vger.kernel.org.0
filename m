Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55BB444A0C
	for <lists+linux-next@lfdr.de>; Wed,  3 Nov 2021 22:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhKCVEj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Nov 2021 17:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhKCVEj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Nov 2021 17:04:39 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE6FC061714;
        Wed,  3 Nov 2021 14:02:01 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HkzjF39VRz4xbP;
        Thu,  4 Nov 2021 08:01:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635973316;
        bh=ze51YqyQ24HHSCk1klgzOPlEpIvTFiZ1Sss+0V9Rv8o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pk01sbKOFLlMMOMNZXG4w79sapIU4+nNWL1fiTDjSpDClNkEB9uu7uOaZFpvTrsiu
         0zuVdBgVjUDyhY7iR0hO+/NhM6R4jPH0rBdzTIHjq1WLLuh7/r7kGHopU3Qo0wIuHF
         fwVam5XQi8lI2HXR0FacehScUwml/KckB/+WNq7HxjXxG6rLiqYpDcQ2mijSOFN9SP
         kyEButS5pTuVGweuzyHARvkNB7qEWHAZWLegJThL3FHkYLmRNutwxpvr/h5NV7NU21
         mStF+LOeGBI8mnMOU3D+pSk2qfsQSaR/DcWgSSZxis5Bc98S3Yd6MX/kO/dWECXMWp
         Nwnu2modAbM/A==
Date:   Thu, 4 Nov 2021 08:01:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Andrii Nakryiko <andrii@kernel.org>,
        Antonio Terceiro <antonio.terceiro@linaro.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Daniel Xu <dxu@dxuuu.xyz>,
        Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
        Douglas Su <d0u9.su@outlook.com>, Finn Behrens <me@kloenk.de>,
        Gary Guo <gary@garyguo.net>, Jiri Olsa <jolsa@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: linux-next: manual merge of the rust tree with Linus' tree
Message-ID: <20211104080152.41c38912@canb.auug.org.au>
In-Reply-To: <CANiq72=fuk-eVuCpW5jkDn71Pbs=1L2LhSvadR_bTjxcPvtVUQ@mail.gmail.com>
References: <20211103141919.4feefaf0@canb.auug.org.au>
        <CANiq72=fuk-eVuCpW5jkDn71Pbs=1L2LhSvadR_bTjxcPvtVUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z07oAPJTQhLVaDkPgO=xexn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z07oAPJTQhLVaDkPgO=xexn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Wed, 3 Nov 2021 11:30:35 +0100 Miguel Ojeda <miguel.ojeda.sandonis@gmail=
.com> wrote:
>
> On Wed, Nov 3, 2021 at 4:19 AM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > diff --cc scripts/Makefile.modfinal
> > index 7f39599e9fae,c0842e999a75..000000000000
> > --- a/scripts/Makefile.modfinal
> > +++ b/scripts/Makefile.modfinal
> > @@@ -39,11 -39,12 +39,12 @@@ quiet_cmd_ld_ko_o =3D LD [M]  $
> >
> >   quiet_cmd_btf_ko =3D BTF [M] $@
> >         cmd_btf_ko =3D                                                 =
   \
> > -       if [ -f vmlinux ]; then                                        =
 \
> > -               LLVM_OBJCOPY=3D"$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS=
) --btf_base vmlinux $@; \
> > -               $(RESOLVE_BTFIDS) -b vmlinux $@;                       =
 \
> > -       else                                                           =
 \
> > +       if [ ! -f vmlinux ]; then                                      =
 \
> >                 printf "Skipping BTF generation for %s due to unavailab=
ility of vmlinux\n" $@ 1>&2; \
> > +       elif $(srctree)/scripts/is_rust_module.sh $@; then             =
 \
> > +               printf "Skipping BTF generation for %s because it's a R=
ust module\n" $@ 1>&2; \
> > +       else                                                           =
 \
> >  -              LLVM_OBJCOPY=3D"$(OBJCOPY)" $(PAHOLE) -J --btf_base vml=
inux $@; \
> > ++              LLVM_OBJCOPY=3D"$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS=
) --btf_base vmlinux $@; \
> >         fi; =20
>=20
> It looks like the `$(RESOLVE_BTFIDS)` line is gone with this
> resolution. The rest looks good.

Oops, sorry about that.  I have added it back from today.

BTW, are you intending to submit the rust tree this merge window?

--=20
Cheers,
Stephen Rothwell

--Sig_/z07oAPJTQhLVaDkPgO=xexn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGC+MAACgkQAVBC80lX
0GzUJQgAgsxtY0bhyFXGssUforwGW/GSP2C/ncp3HTqpFWd3pTsj7Q1Orb6BQESE
tnVtNpghsO1HHTsEKtTJNCGqwOwm/8Qp9nrXl1caEQEH/oO79tdujGTN7UtFqYX3
85+4bBsidw7KdLiDWFm+LClfjf2FOQlPhEsORkgASt9KWzsKScFEB9mKT8ASvz4Q
GUIp/jZJTBOmcSMMFFQCzDcdHjapiwRH4DmNlCDnrI1dooT1xwH/a5NueGjwGYdM
rzE/ahdFevFvXfaaQTXOXCpXBPnN7E0t3rjSN3mV1UnNewPdVXrsuBh/gR1fMdpB
Q70JIWf8ZJtkTEEqKtUKn4dQ1jrMWQ==
=gxUZ
-----END PGP SIGNATURE-----

--Sig_/z07oAPJTQhLVaDkPgO=xexn--
