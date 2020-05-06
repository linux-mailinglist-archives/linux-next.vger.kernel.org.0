Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21551C7D9C
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 00:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbgEFWuS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 May 2020 18:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729243AbgEFWuR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2020 18:50:17 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D8AC061A0F;
        Wed,  6 May 2020 15:50:17 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49HWyF6PY9z9sRY;
        Thu,  7 May 2020 08:50:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588805414;
        bh=g97rsObDOdVNCdYZjFLmqmZ5KdiMffj3fP/AYJOZNFw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pOQPtpaJKGWPoRez2o4PZaJ/DC3B9OOICs+p7+dcAwpjyY8dy8U3p/XVhNwQmAper
         sz8SgBDOLQwbGvhmEuRuzwLuY+HUA1VOlwiHVYZOo7fpKfnbAwVL4d+9VRZDL+4Cfv
         wX4Y+S/ct+YSkhnsyTRLniuosV38XDFJeL2ToMPUrP2Y632VHt3G1dTnbUODPkFCKB
         WtDx1qz4Qct7NNDtA+lpk8eePusDe70kuOJFJAL7qig6QBFLwSo7fNxq3BNjmZjtNi
         Su+BpZtQ8IRsNCJIbTbcmPr0c/6pc8srhId6bcpP3kM73Vv9gB0ETaVAcA8QQTHtab
         sQ2iLS/MtCV/Q==
Date:   Thu, 7 May 2020 08:50:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Apr 14 (objtool crazy)
Message-ID: <20200507085011.6d2edf32@canb.auug.org.au>
In-Reply-To: <20200414221914.hbvp4dvh47at4nlg@treble>
References: <20200414123900.4f97a83f@canb.auug.org.au>
        <e01557a7-746a-6af0-d890-707e9dd86b86@infradead.org>
        <20200414221914.hbvp4dvh47at4nlg@treble>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wi_KE6gtug08SdJ3btf248c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wi_KE6gtug08SdJ3btf248c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Apr 2020 17:19:14 -0500 Josh Poimboeuf <jpoimboe@redhat.com> wro=
te:
>
> On Tue, Apr 14, 2020 at 06:50:15AM -0700, Randy Dunlap wrote:
> > On 4/13/20 7:39 PM, Stephen Rothwell wrote: =20
> > > Hi all,
> > >=20
> > > Changes since 20200413:
> > >  =20
> >=20
> >=20
> > I killed objtool after 49 minutes of CPU time:
> >=20
> >   PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ CO=
MMAND   =20
> >  6159 rdunlap   30  10   42756   8028      0 R 100.0 0.099  49:19.02 ob=
jtool=20
> >=20
> >=20
> > /bin/sh: line 1:  6159 Terminated              ./tools/objtool/objtool =
orc generate --no-fp --no-unreachable --uaccess drivers/i2c/busses/i2c-parp=
ort.o =20
>=20
> I took an initial look at this one.  I can dig more tomorrow unless
> Peter beats me to it.
>=20
> (gdb) bt
> #0  0x000000000040df55 in sec_offset_hash (sec=3D0xc30930, offset=3D43345=
61216) at elf.h:104
> #1  0x000000000040e907 in find_rela_by_dest_range (elf=3D0x7ffff64a4010, =
sec=3D0xc30930, offset=3D18446744073709551608, len=3D1) at elf.c:227
> #2  0x000000000040ea67 in find_rela_by_dest (elf=3D0x7ffff64a4010, sec=3D=
0xc30710, offset=3D18446744073709551608) at elf.c:246
> #3  0x0000000000408038 in find_jump_table (file=3D0x427620 <file>, func=
=3D0xc32bf0, insn=3D0xc4f840) at check.c:1118
> #4  0x0000000000408242 in mark_func_jump_tables (file=3D0x427620 <file>, =
func=3D0xc32bf0) at check.c:1170
> #5  0x00000000004083b6 in add_jump_table_alts (file=3D0x427620 <file>) at=
 check.c:1215
> #6  0x0000000000408b95 in decode_sections (file=3D0x427620 <file>) at che=
ck.c:1413
> #7  0x000000000040bf44 in check (_objname=3D0x7fffffffceff "drivers/i2c/b=
usses/i2c-parport.o", orc=3Dtrue) at check.c:2508
> #8  0x0000000000405580 in cmd_orc (argc=3D1, argv=3D0x7fffffffc9d8) at bu=
iltin-orc.c:41
> #9  0x0000000000411297 in handle_internal_command (argc=3D6, argv=3D0x7ff=
fffffc9d0) at objtool.c:96
> #10 0x0000000000411349 in main (argc=3D6, argv=3D0x7fffffffc9d0) at objto=
ol.c:119
>=20
> It's an infinite loop in find_rela_by_dest_range() because offset is -8.
> That comes from find_jump_table():
>=20
>   table_offset =3D text_rela->addend;
>   table_sec =3D text_rela->sym->sec;
>   ...
>   table_rela =3D find_rela_by_dest(file->elf, table_sec, table_offset);
>=20
> which comes from this gem:
>=20
> 00000000000001fd <line_set>:
>  1fd:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
>  204:	00 00 00=20
> 			1ff: R_X86_64_64	.rodata-0x8
>=20
> So objtool is getting confused by that -0x8 rela addend.

Did this get fixed?

--=20
Cheers,
Stephen Rothwell

--Sig_/wi_KE6gtug08SdJ3btf248c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6zPyMACgkQAVBC80lX
0Gy5gwf+Pazdk3Qgggc83+OjxWz5ncw4lgx81/U8kJ9RWI4VDBA59dtImqHX2+XE
wMdWZaPsW8dWV7MKu0fqQKDv1q1S0OKduv2lkd9woI6bob1O09V5wFw3pxIurlQ/
pMdCh+IQjRpdaOSl/KKodSMHdTpCQpHzQJv60vWou2v1sjTToS/wf3dXqvnIYNpw
4hoj8AdwM6FGwq/ZimMlXQgGzlPpY5cgE2yso8Bl0UbJvzO/G+9Yvx3+frl9Rsjn
BPu3y/FNnOs3cnoTbSfbgtQLpDxME85ppregM6EKpvLoHsMlomLZ/tyFtGb3ZbjE
XD+UExC0Nq3hYfyCRUit3ReZe2VdfQ==
=6Vtc
-----END PGP SIGNATURE-----

--Sig_/wi_KE6gtug08SdJ3btf248c--
