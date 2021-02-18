Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51EE731F112
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 21:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhBRUdb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Feb 2021 15:33:31 -0500
Received: from ozlabs.org ([203.11.71.1]:53681 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230033AbhBRUck (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Feb 2021 15:32:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DhRFc2P3Hz9sBJ;
        Fri, 19 Feb 2021 07:31:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613680309;
        bh=T7NkwprmT9RkSXY9BhJPx5gnQ8fIAkwLW7VbvdNNmmA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BT0oUzaN2r8Yj0e49LDCpG6EcpLktyqFC54wiM/aOPBihxmLTgU9VgLtMC+Z6H10+
         RlWOVfBVc6g+kR2W1MJHyY9jvPYE/hrJtiwIDWUTeOOMeJ9tFWMgoNbxyxu/sW+sZI
         /LewTN6KD05w0leCLiw51BneD3JvXcvZuCGU6ElyVVhJmlsLrCGoYwdPRgIo35N1KP
         aJH6zPs53NYmXAuxfQwis3Q4LEvgmmyYFomp3kZnSFr0g0/qGHdv1Ib0HuqeqxMiz6
         JzVcVGHbxz9JxBRiplITV0D1vrGMtD902R4UTgIPC4oALK6rSM8q7h63uxfimleZnC
         urX+xyvd3O8xQ==
Date:   Fri, 19 Feb 2021 07:31:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 powerpc tree
Message-ID: <20210219073147.478c3dda@canb.auug.org.au>
In-Reply-To: <CAL_JsqJ9Ske4hkWn3uo8-nef29MQ1DkNdtE=gxbqj8CKrtQorg@mail.gmail.com>
References: <20210218144815.5673ae6f@canb.auug.org.au>
        <874ki9vene.fsf@mpe.ellerman.id.au>
        <20210218223427.77109d83@canb.auug.org.au>
        <CAL_JsqJ9Ske4hkWn3uo8-nef29MQ1DkNdtE=gxbqj8CKrtQorg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VL/IDpRzhxGm.r6/d2BAaVo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VL/IDpRzhxGm.r6/d2BAaVo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 18 Feb 2021 07:52:52 -0600 Rob Herring <robherring2@gmail.com> wrot=
e:
>
> On Thu, Feb 18, 2021 at 5:34 AM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > On Thu, 18 Feb 2021 21:44:37 +1100 Michael Ellerman <mpe@ellerman.id.au=
> wrote: =20
> > >
> > > I think it just needs this?
> > >
> > > diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> > > index 87e34611f93d..0492ca6003f3 100644
> > > --- a/arch/powerpc/kexec/elf_64.c
> > > +++ b/arch/powerpc/kexec/elf_64.c
> > > @@ -104,7 +104,7 @@ static void *elf64_load(struct kimage *image, cha=
r *kernel_buf,
> > >
> > >       fdt =3D of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
> > >                                          initrd_len, cmdline,
> > > -                                        fdt_totalsize(initial_boot_p=
arams));
> > > +                                        kexec_fdt_totalsize_ppc64(im=
age));
> > >       if (!fdt) {
> > >               pr_err("Error setting up the new device tree.\n");
> > >               ret =3D -EINVAL;
> > > =20
> >
> > I thought about that, but the last argument to
> > of_kexec_alloc_and_setup_fdt() is extra_fdt_size and the allocation
> > done is for this:
> >
> > fdt_size =3D fdt_totalsize(initial_boot_params) +
> >                    (cmdline ? strlen(cmdline) : 0) +
> >                    FDT_EXTRA_SPACE +
> >                    extra_fdt_size;
> >
> > and kexec_fdt_totalsize_ppc64() also includes
> > fdt_totalsize(initial_boot_params) so I was not sure.  Maybe
> > kexec_fdt_totalsize_ppc64() needs modification as well? =20
>=20
> You're both right. Michael's fix is sufficient for the merge. The only
> risk with a larger size is failing to allocate it, but we're talking
> only 10s of KB. Historically until the commit causing the conflict,
> PPC was just used 2x fdt_totalsize(initial_boot_params). You could
> drop 'fdt_size =3D fdt_totalsize(initial_boot_params) + (2 *
> COMMAND_LINE_SIZE);' from kexec_fdt_totalsize_ppc64() as well, but
> then the function name is misleading.
>=20
> Lakshmi can send a follow-up patch to fine tune the size and rename
> kexec_fdt_totalsize_ppc64.

OK, I have mode Michael's suggested change to my resolution from today.

--=20
Cheers,
Stephen Rothwell

--Sig_/VL/IDpRzhxGm.r6/d2BAaVo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAuzrMACgkQAVBC80lX
0Gz/sQf2Oa4cPoAqWhSG0uktD7yrbzN7VOp5Au+0oPJY/sO/e33kIOdNrY+6VoRT
QlPVZRxA0R8HaFBTND8hnBSyorOuvzATF5W6NQQ1v8x9i1iojZ1wil+F8SJS7b5g
ODlcpHsqeqk1wygkRAyZJENGeh3tClpYdZlGushVYfDO4gUD8BFsr0aILVk7HPH1
xN2NKv0/aH8JjqlLSElJWQwozmHiEKlgizR3whi9jGHe52dFhPVt/4JKzwvTpT/U
dnydBS5ao8FGtCXAegqHcXzEJd27bX229zUdwmOcA5miLURBcrYIfP93QnMjy4TN
EXoFPaY8KweEJhquoypTwAbkCl6B
=/1tk
-----END PGP SIGNATURE-----

--Sig_/VL/IDpRzhxGm.r6/d2BAaVo--
