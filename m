Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359E028E8B7
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 00:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgJNWZe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 18:25:34 -0400
Received: from ozlabs.org ([203.11.71.1]:38811 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726747AbgJNWZe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 18:25:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBRnM3Qkrz9sRK;
        Thu, 15 Oct 2020 09:25:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602714332;
        bh=IZfOX4HbTsKNcP13QtnWJrM1gn6I60HV0glE9YkH3yY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YbtxcLBawIz+z7hv+R0UWOPeUNiSkVF3A6HxcRBL49058PD9GcYpUVcwf2eo4JE5P
         72R0UqwYomLV8rZUypDVcemF/e3DP2g/KCSe7ctT45IQPkSDRN4lU4UEVVcDrI0xor
         eQiWJ+XaKawwkf7KM4KpXe2XP2UhbRloMiM+91Io5nIjItD98djbzQ2AfA7WEv+lW9
         SpTZkIXKdDNXAx59TsaDB8rm9en/+BXKieOXFSu5Lzyb5ROLNqXKuBcbCI9EJTeCZV
         iIFkobVSLFf4JaG6YiBnihjL+w3gJYLCb+c7QCfgzi7GDpb0NhdUqvAVF2v7hOUqDT
         IlJu11ylMlSYw==
Date:   Thu, 15 Oct 2020 09:25:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20201015092526.144df583@canb.auug.org.au>
In-Reply-To: <202010041944.7FEE22407B@keescook>
References: <20200914132249.40c88461@canb.auug.org.au>
        <202010031451.ABC49D88@keescook>
        <20201004102437.12fb0442@canb.auug.org.au>
        <202010040125.B5AD5B757@keescook>
        <20201004210018.5bbc6126@canb.auug.org.au>
        <202010041944.7FEE22407B@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Spg77AVGQdzo4pQCslY_V72";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Spg77AVGQdzo4pQCslY_V72
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Sun, 4 Oct 2020 19:44:52 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> On Sun, Oct 04, 2020 at 09:00:18PM +1100, Stephen Rothwell wrote:
> > Hi Kees,
> >=20
> > On Sun, 4 Oct 2020 01:27:01 -0700 Kees Cook <keescook@chromium.org> wro=
te: =20
> > >
> > > I assume CONFIG_CONSTRUCTORS is enabled for your build (it should be =
for =20
> >=20
> > yes, indeed.
> >  =20
> > > allmodconfig). Does this patch fix it? (I'm kind of blindly guessing
> > > based on my understanding of where this could be coming from...)
> > >=20
> > >=20
> > > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/=
vmlinux.lds.h
> > > index e1843976754a..22f14956214a 100644
> > > --- a/include/asm-generic/vmlinux.lds.h
> > > +++ b/include/asm-generic/vmlinux.lds.h
> > > @@ -701,6 +701,7 @@
> > >  #ifdef CONFIG_CONSTRUCTORS
> > >  #define KERNEL_CTORS()	. =3D ALIGN(8);			   \
> > >  			__ctors_start =3D .;		   \
> > > +			KEEP(*(SORT(.ctors.*)))		   \
> > >  			KEEP(*(.ctors))			   \
> > >  			KEEP(*(SORT(.init_array.*)))	   \
> > >  			KEEP(*(.init_array))		   \ =20
> >=20
> > And that makes the messages go away. =20
>=20
> Okay then! Thanks for testing. :) I'm not sure why the ppc-hosted
> compiler generates those. Regardless, I'll send a proper patch...

I get these warnings from Linus' tree now ...
--=20
Cheers,
Stephen Rothwell

--Sig_/Spg77AVGQdzo4pQCslY_V72
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+HetYACgkQAVBC80lX
0GyEDAf8DJDGuTmfXAv2YOEXrG0aiH8Z3ykgnMnsW5xHQvyaoxHpi+QzF8HKbeu/
r/5q9fNee9mSxz6VooPHx19UjLDkIkCwsCx/ItLsiouOZJcwikPERTciLefES875
mpTrvB1/aF0sWBoPyKkiHPtCnX8lsqhxRFiyfAoXoqrYSWvYn4djYz2rKEkUJ1Mz
DYRZlEqsegdRk/3VgiosAjVgAk3XgtxmSeK/ETZfKU4ShtZGP/NwStZJ2zrzZZup
twslBpOxBEngKQXsD6fsOJwkMTeCVT3pbC3UpPiqJlJmBb2eSH9QI2AzjU0L85po
ZoWqsWdLjmt522Wsb4s79MBHTedXTQ==
=E8N0
-----END PGP SIGNATURE-----

--Sig_/Spg77AVGQdzo4pQCslY_V72--
