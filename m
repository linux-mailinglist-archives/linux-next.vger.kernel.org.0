Return-Path: <linux-next+bounces-2343-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8868A8C7EFC
	for <lists+linux-next@lfdr.de>; Fri, 17 May 2024 01:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1B88B21D87
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 23:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBE329CE4;
	Thu, 16 May 2024 23:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H8sP+vGh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2CA273FC;
	Thu, 16 May 2024 23:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715902539; cv=none; b=hwbflAhteTXQR42lNRFMEMXS/HYMvi9CViQTCK/iR+X+yjIILh0SRF3hCeSPbRhSuSiV7J9R59Oa793Cop3qte67tx+7pbelSfma0Y+ZYBIv6+dqCS/f5CXKGSlsK5FP52GoDgqRNxuLAtI9t3lcQ70zcT+U/m7Tdd5RpolPKOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715902539; c=relaxed/simple;
	bh=j1SWaBMvTu0L2kibND4NHcBtbdsRTcHCxYXklPzrO/g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kMqSn8XLa80q60YbPT0w1sZnALdm0tBPqKHaQiNZs+daHOaz5ppNWbVgBHa1exurghhGWxAteQd7TicqkIOKxYg+ly40N03g76bMB2XyadIgppU5DCirxWCfqARhRA3g50rh3JmoivK00EiXjhbIGFcyFHxPearB8QsYogjjQHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=H8sP+vGh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715902535;
	bh=6bF9AeLnq02T/LkapzdDY3Cm1n0qYV5VbfFUYaRFQz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H8sP+vGhxjWAUsWuyo4pr7m2mlvY++qKvpPyHgwerXbMaLQALC5hElte8MzgZgzvT
	 OmJEUPkhkcg5WFQSC8k5qiVPGz3pBAp+6gBRTiILpBKZxewBvAo5/hoEduYtEthaaJ
	 lHMA2SOsqHkxI2lXgQ0kfHgA586wOrVQoxcy2xVikjA3IHnzjJMbJgIeeycqgEQEWJ
	 X0PkRdSwucKbYdQY8ZP7R1g8kCAP5GBz2P9iFQaBFhNpjfyS4jdSM8YtYWXxh/aWJW
	 plQl1Cv7Kr5/8SjwoCzSkIwW4XDXWPxKehHs/WDkJEFjwoTXE5lmZX3m6V1MzsLzOk
	 rVtnCYgAYmvqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VgRKf6wdNz4wx5;
	Fri, 17 May 2024 09:35:34 +1000 (AEST)
Date: Fri, 17 May 2024 09:35:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>
Subject: Re: linux-next: manual merge of the modules tree with the mm tree
Message-ID: <20240517093534.4523ced1@canb.auug.org.au>
In-Reply-To: <20240517092347.469578bb@canb.auug.org.au>
References: <20240412120421.27d86c34@canb.auug.org.au>
	<20240517092347.469578bb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+GpPVZ/a26kCsEcdLiUERnx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+GpPVZ/a26kCsEcdLiUERnx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 17 May 2024 09:23:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 12 Apr 2024 12:04:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the modules tree got a conflict in:
> >=20
> >   kernel/module/main.c
> >=20
> > between commit:
> >=20
> >   58782d7a7ccd ("lib: prevent module unloading if memory is not freed")
> >=20
> > from the mm-unstable branch of the mm tree and commit:
> >=20
> >   a4ee8c9b86bd ("module: make module_memory_{alloc,free} more self-cont=
ained")
> >=20
> > from the modules tree.
> >=20
>=20
> This is now a conflict between the mm-stable tree and Linus' tree.

The actual final resolution (due to more patches) is below.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/module/main.c
index 91e185607d4b,2d25eebc549d..d18a94b973e1
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@@ -56,8 -56,8 +56,9 @@@
  #include <linux/dynamic_debug.h>
  #include <linux/audit.h>
  #include <linux/cfi.h>
+ #include <linux/codetag.h>
  #include <linux/debugfs.h>
 +#include <linux/execmem.h>
  #include <uapi/linux/module.h>
  #include "internal.h"
 =20
@@@ -1188,50 -1198,32 +1189,54 @@@ void __weak module_arch_freeing_init(st
  {
  }
 =20
 -static bool mod_mem_use_vmalloc(enum mod_mem_type type)
 +static int module_memory_alloc(struct module *mod, enum mod_mem_type type)
  {
 -	return IS_ENABLED(CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC) &&
 -		mod_mem_type_is_core_data(type);
 -}
 +	unsigned int size =3D PAGE_ALIGN(mod->mem[type].size);
 +	enum execmem_type execmem_type;
 +	void *ptr;
 =20
 -static void *module_memory_alloc(unsigned int size, enum mod_mem_type typ=
e)
 -{
 -	if (mod_mem_use_vmalloc(type))
 -		return vzalloc(size);
 -	return module_alloc(size);
 +	mod->mem[type].size =3D size;
 +
 +	if (mod_mem_type_is_data(type))
 +		execmem_type =3D EXECMEM_MODULE_DATA;
 +	else
 +		execmem_type =3D EXECMEM_MODULE_TEXT;
 +
 +	ptr =3D execmem_alloc(execmem_type, size);
 +	if (!ptr)
 +		return -ENOMEM;
 +
 +	/*
 +	 * The pointer to these blocks of memory are stored on the module
 +	 * structure and we keep that around so long as the module is
 +	 * around. We only free that memory when we unload the module.
 +	 * Just mark them as not being a leak then. The .init* ELF
 +	 * sections *do* get freed after boot so we *could* treat them
 +	 * slightly differently with kmemleak_ignore() and only grey
 +	 * them out as they work as typical memory allocations which
 +	 * *do* eventually get freed, but let's just keep things simple
 +	 * and avoid *any* false positives.
 +	 */
 +	kmemleak_not_leak(ptr);
 +
 +	memset(ptr, 0, size);
 +	mod->mem[type].base =3D ptr;
 +
 +	return 0;
  }
 =20
- static void module_memory_free(struct module *mod, enum mod_mem_type type)
 -static void module_memory_free(void *ptr, enum mod_mem_type type,
++static void module_memory_free(struct module *mod, enum mod_mem_type type,
+ 			       bool unload_codetags)
  {
 +	void *ptr =3D mod->mem[type].base;
 +
+ 	if (!unload_codetags && mod_mem_type_is_core_data(type))
+ 		return;
+=20
 -	if (mod_mem_use_vmalloc(type))
 -		vfree(ptr);
 -	else
 -		module_memfree(ptr);
 +	execmem_free(ptr);
  }
 =20
- static void free_mod_mem(struct module *mod)
+ static void free_mod_mem(struct module *mod, bool unload_codetags)
  {
  	for_each_mod_mem_type(type) {
  		struct module_memory *mod_mem =3D &mod->mem[type];
@@@ -1242,12 -1234,13 +1247,12 @@@
  		/* Free lock-classes; relies on the preceding sync_rcu(). */
  		lockdep_free_key_range(mod_mem->base, mod_mem->size);
  		if (mod_mem->size)
- 			module_memory_free(mod, type);
 -			module_memory_free(mod_mem->base, type,
 -					   unload_codetags);
++			module_memory_free(mod, type, unload_codetags);
  	}
 =20
  	/* MOD_DATA hosts mod, so free it at last */
  	lockdep_free_key_range(mod->mem[MOD_DATA].base, mod->mem[MOD_DATA].size);
- 	module_memory_free(mod, MOD_DATA);
 -	module_memory_free(mod->mem[MOD_DATA].base, MOD_DATA, unload_codetags);
++	module_memory_free(mod, MOD_DATA, unload_codetags);
  }
 =20
  /* Free a module, remove from lists, etc. */
@@@ -2287,7 -2309,7 +2299,7 @@@ static int move_module(struct module *m
  	return 0;
  out_enomem:
  	for (t--; t >=3D 0; t--)
- 		module_memory_free(mod, t);
 -		module_memory_free(mod->mem[t].base, t, true);
++		module_memory_free(mod, t, true);
  	return ret;
  }
 =20

--Sig_/+GpPVZ/a26kCsEcdLiUERnx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZGmEYACgkQAVBC80lX
0GxZnQf/bzCmOLSwZA5hA9NNOyKsZz5wEKQknGEwrasXpBVki6AggR9VSKii2guV
K/AwOtwXLt7k3Lkb4L8sasZnNqzrEr1YsaroZPCBL8KPJEUkd04wj8kF3X67PCrj
Nfl/khZaBvMz9MAQKv759CTztPXe/TMzgER72atY47tg4GEpStcqXGT4N9J0rgGz
kbo3IPRIkCK2UiHjfVZZABiWbys++4X0A9jzas5dXenCYuA7oVBtTQLkJ8IeNLfq
s3aw8/f7J0iWOYGkpGhqERt/JjMH6+XtBRuFTzCWzi+a3OuiqvcV4eBcAIA6plif
KFQnEqc8KrRR9f2j+ZfBZKyE9XXN2g==
=g1oP
-----END PGP SIGNATURE-----

--Sig_/+GpPVZ/a26kCsEcdLiUERnx--

