Return-Path: <linux-next+bounces-2341-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FE88C7EF3
	for <lists+linux-next@lfdr.de>; Fri, 17 May 2024 01:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C61528395B
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 23:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2BE2AF0F;
	Thu, 16 May 2024 23:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KxE5JjLg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40202273FC;
	Thu, 16 May 2024 23:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715901897; cv=none; b=W8J2VK+L/PcWW1VGWwXUCQd/gT3vD1qs8FIGWVQ2dbApQvyiQpUC2zYq40cvvi1ut88mHWpgKMlHoUzYZRfmKiv6D2ccAk6Bb9wnZcC95d043BEV/5tKKg3VIVXvnxeLmJZ+AXMuFAo3YCuDxfUZxLsUzt9pCyuGI9cDTlLvKo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715901897; c=relaxed/simple;
	bh=8UfRvXPJInoBARYhKyGq7WtuC0wWRvDVOrc+9rsSkOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HdCiMLHnxbFX8d0Bc+39z2Z+RWgr6vyUBagg6isZXBWYerZBK+avoQBi8yi+DFRl9nIzDYiPtybmorom+GB8HeYFCCO1nNrrAxgXNTxFTnn6MoswlvHp/++itLsNmaESUXQwgI+cmigZTAiaF5oqTqAXAOvidIpCu7HuOBWf7BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KxE5JjLg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715901890;
	bh=uiq30w+Wytv4IQVw78pBDutmxF0gf8kmW4JYleMO+hw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KxE5JjLgzYwJPq2/jkyvesOWG78iLpVGhPoTya/uG+F592fvoa2Fycio+v8sq0yaV
	 GRc1HrY1I+QUJvRA8uDbfCg1sxALkHKf3/0FKIarREPwCTjpJmS9X8JWrI+HzEGDp8
	 TqaxZV8VVTpKj1scqap43OM6099NkJ8lRMK0vv9ww31JhNaekT3vdxTSgDJFNidoDs
	 R9Z3XoeF/I68Ps7e1gkFRwCSsTB6+9ZyTnmIEVpdNAMOeDtv+Xk6CK/JCneI+YDJWQ
	 b21q4sUXWspo8QSELrg0Z19sNwoaUsaKn1wUImOxba90AL+niuphwI/eCuBLOWvZR/
	 pFCLW9oRh7v+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VgR5F4SfQz4wbr;
	Fri, 17 May 2024 09:24:49 +1000 (AEST)
Date: Fri, 17 May 2024 09:23:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>
Subject: Re: linux-next: manual merge of the modules tree with the mm tree
Message-ID: <20240517092347.469578bb@canb.auug.org.au>
In-Reply-To: <20240412120421.27d86c34@canb.auug.org.au>
References: <20240412120421.27d86c34@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L=X4De.cj.n6k2pLnEOss1T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L=X4De.cj.n6k2pLnEOss1T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 12 Apr 2024 12:04:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the modules tree got a conflict in:
>=20
>   kernel/module/main.c
>=20
> between commit:
>=20
>   58782d7a7ccd ("lib: prevent module unloading if memory is not freed")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   a4ee8c9b86bd ("module: make module_memory_{alloc,free} more self-contai=
ned")
>=20
> from the modules tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc kernel/module/main.c
> index 2d25eebc549d,d56b7df0cbb6..000000000000
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@@ -56,8 -56,8 +56,9 @@@
>   #include <linux/dynamic_debug.h>
>   #include <linux/audit.h>
>   #include <linux/cfi.h>
>  +#include <linux/codetag.h>
>   #include <linux/debugfs.h>
> + #include <linux/execmem.h>
>   #include <uapi/linux/module.h>
>   #include "internal.h"
>  =20
> @@@ -1204,26 -1194,51 +1195,55 @@@ static bool mod_mem_use_vmalloc(enum mo
>   		mod_mem_type_is_core_data(type);
>   }
>  =20
> - static void *module_memory_alloc(unsigned int size, enum mod_mem_type t=
ype)
> + static int module_memory_alloc(struct module *mod, enum mod_mem_type ty=
pe)
>   {
> + 	unsigned int size =3D PAGE_ALIGN(mod->mem[type].size);
> + 	void *ptr;
> +=20
> + 	mod->mem[type].size =3D size;
> +=20
>   	if (mod_mem_use_vmalloc(type))
> - 		return vzalloc(size);
> - 	return module_alloc(size);
> + 		ptr =3D vmalloc(size);
> + 	else
> + 		ptr =3D execmem_alloc(EXECMEM_MODULE_TEXT, size);
> +=20
> + 	if (!ptr)
> + 		return -ENOMEM;
> +=20
> + 	/*
> + 	 * The pointer to these blocks of memory are stored on the module
> + 	 * structure and we keep that around so long as the module is
> + 	 * around. We only free that memory when we unload the module.
> + 	 * Just mark them as not being a leak then. The .init* ELF
> + 	 * sections *do* get freed after boot so we *could* treat them
> + 	 * slightly differently with kmemleak_ignore() and only grey
> + 	 * them out as they work as typical memory allocations which
> + 	 * *do* eventually get freed, but let's just keep things simple
> + 	 * and avoid *any* false positives.
> + 	 */
> + 	kmemleak_not_leak(ptr);
> +=20
> + 	memset(ptr, 0, size);
> + 	mod->mem[type].base =3D ptr;
> +=20
> + 	return 0;
>   }
>  =20
> - static void module_memory_free(void *ptr, enum mod_mem_type type,
>  -static void module_memory_free(struct module *mod, enum mod_mem_type ty=
pe)
> ++static void module_memory_free(struct module *mod, enum mod_mem_type ty=
pe,
>  +			       bool unload_codetags)
>   {
> + 	void *ptr =3D mod->mem[type].base;
> +=20
>  +	if (!unload_codetags && mod_mem_type_is_core_data(type))
>  +		return;
>  +
>   	if (mod_mem_use_vmalloc(type))
>   		vfree(ptr);
>   	else
> - 		module_memfree(ptr);
> + 		execmem_free(ptr);
>   }
>  =20
>  -static void free_mod_mem(struct module *mod)
>  +static void free_mod_mem(struct module *mod, bool unload_codetags)
>   {
>   	for_each_mod_mem_type(type) {
>   		struct module_memory *mod_mem =3D &mod->mem[type];
> @@@ -1234,13 -1249,12 +1254,13 @@@
>   		/* Free lock-classes; relies on the preceding sync_rcu(). */
>   		lockdep_free_key_range(mod_mem->base, mod_mem->size);
>   		if (mod_mem->size)
> - 			module_memory_free(mod_mem->base, type,
>  -			module_memory_free(mod, type);
> ++			module_memory_free(mod, type,
>  +					   unload_codetags);
>   	}
>  =20
>   	/* MOD_DATA hosts mod, so free it at last */
>   	lockdep_free_key_range(mod->mem[MOD_DATA].base, mod->mem[MOD_DATA].siz=
e);
> - 	module_memory_free(mod->mem[MOD_DATA].base, MOD_DATA, unload_codetags);
>  -	module_memory_free(mod, MOD_DATA);
> ++	module_memory_free(mod, MOD_DATA, unload_codetags);
>   }
>  =20
>   /* Free a module, remove from lists, etc. */
> @@@ -2309,7 -2301,7 +2314,7 @@@ static int move_module(struct module *m
>   	return 0;
>   out_enomem:
>   	for (t--; t >=3D 0; t--)
> - 		module_memory_free(mod->mem[t].base, t, true);
>  -		module_memory_free(mod, t);
> ++		module_memory_free(mod, t, true);
>   	return ret;
>   }
>  =20

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/L=X4De.cj.n6k2pLnEOss1T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZGlYMACgkQAVBC80lX
0GxAtQf+LxK16YKpbKCQqAcEbb28PvCQKB1eSPu0ceEZxTEmuBoYtQ9IiVl1LJOq
wnhueFdBKdcXtTQNwqKMNaTPfGTBHVBpNZQTix8gcRgrpW0ZH0ly+y78b9s5B1A3
vSsV1nsQHm3ZiJq7qsatt3Ti72t/yupdYmPhp/ZoeFJPc4/K3ixH7SPpW615RnIY
Oyd+wGtjp/6gcBD+jY8iIiVdfvzXNgfoqq+xMPW2A4TqUob/2n0K4LTmsWa6fRZs
5oEFnYrYhJKNLX+CKUGhsj9QnQU+ASm8TYyR+I1WZQGfOo2Lfw5BEU8mfArL6Av5
A9+vsBAVEYGqL1k+VEyVMr+4JTBgew==
=//Ql
-----END PGP SIGNATURE-----

--Sig_/L=X4De.cj.n6k2pLnEOss1T--

