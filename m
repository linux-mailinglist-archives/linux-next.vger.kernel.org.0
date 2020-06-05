Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855B11EF0A5
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 06:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgFEEqC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 00:46:02 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37955 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbgFEEqC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 5 Jun 2020 00:46:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49dVTL4BySz9sRW;
        Fri,  5 Jun 2020 14:45:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591332359;
        bh=ZcM7AWpNFJA6wNBV0a6RdISgWbNaFlam6gFvQJ4z4cA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oCFcBZY2JWLAKbvoqOO3eRFZjJAyje5yMs/pPJswvyGOGmfHm1OLU5QKD+M6ZP6pE
         NV6DArGNEZGbjosl7Xq0+iTzDjwjOtNK8c8zsPADTnFGLdzR+9Y3NZqPjE684WWjP0
         sKcsH19WqIq2jKfGhhAHNdQ7sL3yqBRmru0gjkSz6yVtsZsWI/JAZMLJLK2GOWWA0c
         fHdsBxTrZqRSFyJtw7JfaynOXf2CEAcoMWQNvantjrQ/NFEVqc20JemCT9CdvZi/Jg
         mpyDzFpixUcWKpxc4ULKgXDV++RX6VB2XG86MO+6c3uJbaWqpSqH3yVVsvkBtSitlm
         uPfOUNp2+oljw==
Date:   Fri, 5 Jun 2020 14:45:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Jessica Yu <jeyu@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the livepatching tree with the
 modules tree
Message-ID: <20200605144557.4f8e2a42@canb.auug.org.au>
In-Reply-To: <20200508180524.6995b07e@canb.auug.org.au>
References: <20200508180524.6995b07e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ki+HJigfDf3FQu7CJlPQYR_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ki+HJigfDf3FQu7CJlPQYR_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 8 May 2020 18:05:24 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the livepatching tree got a conflict in:
>=20
>   kernel/module.c
>=20
> between commits:
>=20
>   db991af02f11 ("module: break nested ARCH_HAS_STRICT_MODULE_RWX and STRI=
CT_MODULE_RWX #ifdefs")
>   5c3a7db0c7ec ("module: Harden STRICT_MODULE_RWX")
>=20
> from the modules tree and commit:
>=20
>   e6eff4376e28 ("module: Make module_enable_ro() static again")
>=20
> from the livepatching tree.
>=20
> diff --cc kernel/module.c
> index c69291362676,a26343ea4d50..000000000000
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@@ -2055,29 -2023,20 +2042,30 @@@ static void module_enable_nx(const stru
>   	frob_writable_data(&mod->init_layout, set_memory_nx);
>   }
>  =20
>  +static int module_enforce_rwx_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  +				       char *secstrings, struct module *mod)
>  +{
>  +	const unsigned long shf_wx =3D SHF_WRITE|SHF_EXECINSTR;
>  +	int i;
>  +
>  +	for (i =3D 0; i < hdr->e_shnum; i++) {
>  +		if ((sechdrs[i].sh_flags & shf_wx) =3D=3D shf_wx)
>  +			return -ENOEXEC;
>  +	}
>  +
>  +	return 0;
>  +}
>  +
>   #else /* !CONFIG_STRICT_MODULE_RWX */
>  +/* module_{enable,disable}_ro() stubs are in module.h */
>   static void module_enable_nx(const struct module *mod) { }
> + static void module_enable_ro(const struct module *mod, bool after_init)=
 {}
>  -#endif /*  CONFIG_STRICT_MODULE_RWX */
>  -static void module_enable_x(const struct module *mod)
>  +static int module_enforce_rwx_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
>  +				       char *secstrings, struct module *mod)
>   {
>  -	frob_text(&mod->core_layout, set_memory_x);
>  -	frob_text(&mod->init_layout, set_memory_x);
>  +	return 0;
>   }
>  -#else /* !CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
>  -static void module_enable_nx(const struct module *mod) { }
>  -static void module_enable_x(const struct module *mod) { }
>  -#endif /* CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
>  -
>  +#endif /*  CONFIG_STRICT_MODULE_RWX */
>  =20
>   #ifdef CONFIG_LIVEPATCH
>   /*

This is now a conflict between the modules tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ki+HJigfDf3FQu7CJlPQYR_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ZzgUACgkQAVBC80lX
0GwcqAf/QIlttDKRob8ZnDsXQS280EQk0rIsvqevrOASTJD6kxlyNTUDXpH4hFx0
ahupmyHP5OmAhz15X6qBGyi5zzQQpwk1on2aACpfz5XkR4Hyi2K++D+NDkcWQsdA
sMuYgi55tq6+/RV/oGq0zdAR2J2SJ2XQRhYnIKzJtwJ6dIiUt55Bj5QwT/GFGfF4
kabUXo7Pkys5S1kEI1PtopwGiCoeYH4h6ffV7honwbANhsFdZiagmezPP/+itce9
uAjDEuHWL/zsDWlGBujkMgoySKAq7jFnFrtj1Fb9quQubKKGmtcebte79VkdwihN
6DR+spBIi+HZh2iGV+b0m/Y+cd1xgA==
=Mlxo
-----END PGP SIGNATURE-----

--Sig_/Ki+HJigfDf3FQu7CJlPQYR_--
