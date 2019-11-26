Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86BE410A608
	for <lists+linux-next@lfdr.de>; Tue, 26 Nov 2019 22:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfKZVdV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Nov 2019 16:33:21 -0500
Received: from ozlabs.org ([203.11.71.1]:41963 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726036AbfKZVdV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Nov 2019 16:33:21 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47MxwC6Zydz9sQw;
        Wed, 27 Nov 2019 08:33:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574803997;
        bh=t0uzuTAQhA6+LL9+nruRW36LqIZmAheu+FSS7vi6MSQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eiZ22yXlBmLfnpSBHkBkhSQJZmpWtc9FioOGXyJJzrr8LKzq6XpVZT2H8j7y8Ed+v
         3suGemMB/ejACZyLPT155eZVN4l1C9RMcYhUnTM6+Pl3CnlR+A49kdISVoJUDFktAJ
         5gU6f7CqtqcMsfQrwLnoj9OHA7D/XMAE0lX38cdXtcbYC37cXdL/2quqgUyumQ/+eh
         Xxi/2TVZLWmvcl8/UgTf1yeVK+GvmKlEL05V+qBaOa3Jj4+b7v5FJEo9NTliDGaMZi
         bMimsgJHPuQpPWW/eU5qd1dxeVtEbngHqvTUvzsLLYLLnpML1IVroWdNPz8Ik9Yj1V
         VmvX+VXIE0wFQ==
Date:   Wed, 27 Nov 2019 08:33:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@suse.de>
Subject: Re: linux-next: manual merge of the tip tree with the xtensa tree
Message-ID: <20191127083314.64d31aca@canb.auug.org.au>
In-Reply-To: <20191111143154.13b0a7ac@canb.auug.org.au>
References: <20191111143154.13b0a7ac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SyXN.qyh=Nob+ywO5WK3dY4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/SyXN.qyh=Nob+ywO5WK3dY4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 11 Nov 2019 14:31:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/xtensa/kernel/vmlinux.lds.S
>=20
> between commit:
>=20
>   158b6b99ba7b ("xtensa: merge .fixup with .text")
>=20
> from the xtensa tree and commits:
>=20
>   eaf937075c9a ("vmlinux.lds.h: Move NOTES into RO_DATA")
>   94174c9b71c6 ("xtensa: Move EXCEPTION_TABLE to RO_DATA segment")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/xtensa/kernel/vmlinux.lds.S
> index c64abc15d38f,0043d5858f14..000000000000
> --- a/arch/xtensa/kernel/vmlinux.lds.S
> +++ b/arch/xtensa/kernel/vmlinux.lds.S
> @@@ -124,17 -126,16 +126,15 @@@ SECTION
>  =20
>     . =3D ALIGN(16);
>  =20
> -   RODATA
> +   RO_DATA(4096)
>  =20
> -   EXCEPTION_TABLE(16)
> -   NOTES
>  -  /*  Relocation table */
>  -
>  -  .fixup   : { *(.fixup) }
>  -
>     /* Data section */
>  =20
>  +#ifdef CONFIG_XIP_KERNEL
>  +  INIT_TEXT_SECTION(PAGE_SIZE)
>  +#else
>     _sdata =3D .;
> -   RW_DATA_SECTION(XCHAL_ICACHE_LINESIZE, PAGE_SIZE, THREAD_SIZE)
> +   RW_DATA(XCHAL_ICACHE_LINESIZE, PAGE_SIZE, THREAD_SIZE)
>     _edata =3D .;
>  =20
>     /* Initialization code and data: */

This is now a conflict between the xtensa tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/SyXN.qyh=Nob+ywO5WK3dY4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3dmhoACgkQAVBC80lX
0GzSeAgAmBt+LjfudLhknXDEJDXNeB0P+fTgJS2K745Am58lNfyIuYDDW6WMFeGS
sDzaogiTtKVkiwahCka+JNDuf1XkM8gHKMbT/aQ/P/wQrbEyNkViaBTL8ykzXVOh
+rIURvAthKhpMO/dSfDFhazl6u7SVI29ubEXFLW1evm10ijk+wkU+pLWWsPs4S82
2uDqWR+gtNu0Y8Ntu+kxXzsoVW9Fo0/ce5L+LWX7GBAIk5mtb+NbURHcVtw3ndqH
AHbcwIwnvCKq19t1yZkutOQ2EHdGyF0VbzL+ul2Cw4qSf2onWgpqdrMj+wREhFkP
v8j9SURdywVB7z+Nzg2Rx8l23TvraA==
=NPnv
-----END PGP SIGNATURE-----

--Sig_/SyXN.qyh=Nob+ywO5WK3dY4--
