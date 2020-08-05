Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E0923C2DB
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 03:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgHEBDN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 21:03:13 -0400
Received: from ozlabs.org ([203.11.71.1]:55287 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727032AbgHEBDM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Aug 2020 21:03:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLtf31rXGz9sPB;
        Wed,  5 Aug 2020 11:03:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596589389;
        bh=94VQAPciLQAfl1zeYhFAE4TKPCd/11jXI0MZrbSUPhs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PvUqlAvvMVi3if2OPvkDoDXEIe+PF/9Zyu977rpf50dgJGnMbv3IY8TJnEfvESkT1
         /aHPbEuyb9f3CCTIiFyRqsqlXwcm4JeBKr5sXK12M0tUmYgZIytTgPu70LWH9Qc0oG
         WYMxDk/Z6U+7N5u30owbuZXMsOx5UA4kQFwEc7FZrcCM7vn/afZ5mrPBcyF9LjEfI9
         67yTRra8r+Bfx2XCZn7VzCMV0UNV1UvA6dI2Ez+W+2lEHaPWsYRxfPYEwLW4ToX4tO
         dYNcb0h+EFE6T5OBKGYakBQqKBaQ06/86sgIAGCh+4tWP+fDsCyFj1Pie770Qc0NLI
         iOxxdLSOJwBTw==
Date:   Wed, 5 Aug 2020 11:03:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kan Liang <kan.liang@linux.intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the vfs tree
Message-ID: <20200805110306.752b4176@canb.auug.org.au>
In-Reply-To: <20200727153510.0996a35c@canb.auug.org.au>
References: <20200727153510.0996a35c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j0u21+z/9.U6Ugb.nps7NFo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j0u21+z/9.U6Ugb.nps7NFo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 27 Jul 2020 15:35:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/x86/include/asm/fpu/xstate.h
>=20
> between commit:
>=20
>   c196049cc732 ("x86: switch to ->regset_get()")
>=20
> from the vfs tree and commit:
>=20
>   ce711ea3cab9 ("perf/x86/intel/lbr: Support XSAVES/XRSTORS for LBR conte=
xt switch")
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
> diff --cc arch/x86/include/asm/fpu/xstate.h
> index f691ea1bc086,1559554af931..000000000000
> --- a/arch/x86/include/asm/fpu/xstate.h
> +++ b/arch/x86/include/asm/fpu/xstate.h
> @@@ -71,8 -103,9 +103,9 @@@ extern void __init update_regset_xstate
>   void *get_xsave_addr(struct xregs_state *xsave, int xfeature_nr);
>   const void *get_xsave_field_ptr(int xfeature_nr);
>   int using_compacted_format(void);
> + int xfeature_size(int xfeature_nr);
>  -int copy_xstate_to_kernel(void *kbuf, struct xregs_state *xsave, unsign=
ed int offset, unsigned int size);
>  -int copy_xstate_to_user(void __user *ubuf, struct xregs_state *xsave, u=
nsigned int offset, unsigned int size);
>  +struct membuf;
>  +void copy_xstate_to_kernel(struct membuf to, struct xregs_state *xsave);
>   int copy_kernel_to_xstate(struct xregs_state *xsave, const void *kbuf);
>   int copy_user_to_xstate(struct xregs_state *xsave, const void __user *u=
buf);
>   void copy_supervisor_to_kernel(struct xregs_state *xsave);

This is now a conflict between the vfs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/j0u21+z/9.U6Ugb.nps7NFo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8qBUoACgkQAVBC80lX
0GzycAgAjw5Wd6932cXC26peffItFoR/HInFLpD5H4ulbg9i11GaB96R9gZ3Ug9f
uL6iK5aNW1YH9mLxYxDIAt2H1vTJOras5W0U9MEc6UGE/m4w8PlEdOv0Pi7Q/Zm2
yqs7+s95zTF1vadOi1BLPjrohEWywGVDNTtc0u/ARifxTPlrX3PJaoeh6anZ1kHk
StH21nNfyjV7kzeRr2F4U6YH4/AI/j7bm+AW7LeOC85BLAnwzHRafZbqFiu3u3tX
n394BWD1erymqZd6KwBKZ1qvDUbdkhRGMkCTROUk/bB3XhGeSUqYE/3PCNcBw8L4
GHIxLvIWvxun8bDJ1ZisX7pxuH/5EA==
=klzH
-----END PGP SIGNATURE-----

--Sig_/j0u21+z/9.U6Ugb.nps7NFo--
