Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0B71CA5AF
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 10:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgEHIFc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 04:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbgEHIFc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2020 04:05:32 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32406C05BD43;
        Fri,  8 May 2020 01:05:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JNDS22fNz9sSk;
        Fri,  8 May 2020 18:05:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588925129;
        bh=F4X1gYE+pfegdxl3zi0f5sR1u9ohhPj7XClYVF3+g4g=;
        h=Date:From:To:Cc:Subject:From;
        b=khSI8fbOg/1K0zEKgkk2SFu4f7euOnwAfnRRaha0Y7Ch5PBCm6j7+tmUw9dfpayJi
         gihETPB1+VrK7rAC3FRHPV0oLFiwAXb3Y0MLc3U0YS9Vkir/4wOPyA7VM9i7JhY8oq
         sGiPEZsqvV2fmeEXFBe9y0902nzdsbI7z5LsoScOgPJhbR4jtF1S4tlBx5NZ5KkauU
         xgVarxbzoppGoK66FMVQtlIvVRqh+L0cSRjIY8U2F79fq9AvsFZ8XF1IdzshKgSLQz
         Y6zqjH7ikEvVRyI+C9Hg6a20sXPJsFtw4EHsOzDV6z8IrDTE6jCA4itzf7SbCqWvn8
         efILDNGDnziWA==
Date:   Fri, 8 May 2020 18:05:24 +1000
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
Subject: linux-next: manual merge of the livepatching tree with the modules
 tree
Message-ID: <20200508180524.6995b07e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zQSwp35U6Oy695F0wOUlMTo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zQSwp35U6Oy695F0wOUlMTo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the livepatching tree got a conflict in:

  kernel/module.c

between commits:

  db991af02f11 ("module: break nested ARCH_HAS_STRICT_MODULE_RWX and STRICT=
_MODULE_RWX #ifdefs")
  5c3a7db0c7ec ("module: Harden STRICT_MODULE_RWX")

from the modules tree and commit:

  e6eff4376e28 ("module: Make module_enable_ro() static again")

from the livepatching tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/module.c
index c69291362676,a26343ea4d50..000000000000
--- a/kernel/module.c
+++ b/kernel/module.c
@@@ -2055,29 -2023,20 +2042,30 @@@ static void module_enable_nx(const stru
  	frob_writable_data(&mod->init_layout, set_memory_nx);
  }
 =20
 +static int module_enforce_rwx_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 +				       char *secstrings, struct module *mod)
 +{
 +	const unsigned long shf_wx =3D SHF_WRITE|SHF_EXECINSTR;
 +	int i;
 +
 +	for (i =3D 0; i < hdr->e_shnum; i++) {
 +		if ((sechdrs[i].sh_flags & shf_wx) =3D=3D shf_wx)
 +			return -ENOEXEC;
 +	}
 +
 +	return 0;
 +}
 +
  #else /* !CONFIG_STRICT_MODULE_RWX */
 +/* module_{enable,disable}_ro() stubs are in module.h */
  static void module_enable_nx(const struct module *mod) { }
+ static void module_enable_ro(const struct module *mod, bool after_init) {}
 -#endif /*  CONFIG_STRICT_MODULE_RWX */
 -static void module_enable_x(const struct module *mod)
 +static int module_enforce_rwx_sections(Elf_Ehdr *hdr, Elf_Shdr *sechdrs,
 +				       char *secstrings, struct module *mod)
  {
 -	frob_text(&mod->core_layout, set_memory_x);
 -	frob_text(&mod->init_layout, set_memory_x);
 +	return 0;
  }
 -#else /* !CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
 -static void module_enable_nx(const struct module *mod) { }
 -static void module_enable_x(const struct module *mod) { }
 -#endif /* CONFIG_ARCH_HAS_STRICT_MODULE_RWX */
 -
 +#endif /*  CONFIG_STRICT_MODULE_RWX */
 =20
  #ifdef CONFIG_LIVEPATCH
  /*

--Sig_/zQSwp35U6Oy695F0wOUlMTo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl61EsUACgkQAVBC80lX
0Gy+Nwf/QwPmeO+0MwhkZtGBK96zqtJ8AtW7o6pMslU2qtP0RqQmaS/wFfQo/7bk
wliasNDFacduHLf/I82FGoG0r1TIiVWCPuiNAPdTqfb7rldqrFnb07NDfzLhwSFQ
+IJyKoZAByvDTKtlV6Q6HC9Ki8ecKMwT37EG1lUQgCyX23mET7sf3vUQgDqMM8Wo
TtneBKwOGSkRzELMAEcJwwgh4Gnrt0SgW1bG4q0OvdhVOMvjaVb+h0G7HdPHFyVD
sz0yCzFU58+2Qqxdfi3W8AfRUNDoOcMTE06txH0GehjfJBCQouu6IPcrJz0gO/92
eSPq9C+1Bu/qShR4rBxsIfi15RKmfw==
=QMwq
-----END PGP SIGNATURE-----

--Sig_/zQSwp35U6Oy695F0wOUlMTo--
