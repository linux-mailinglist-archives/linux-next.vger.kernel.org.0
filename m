Return-Path: <linux-next+bounces-9570-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E915CFBE4C
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 04:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45265301B2EC
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 03:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7572D1F44;
	Wed,  7 Jan 2026 03:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZOBJy9ws"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A79B26C3A2;
	Wed,  7 Jan 2026 03:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767757684; cv=none; b=EoxjLOejh/wYQI1yLA+z+twjcaEW6v0+smifwX2+8OkEOa6bEnKeYUauIKF3UsWqTktSqtxaahVAc1q3DVSrp0NVRthIuz5aKl8q9DH1WEG307II/+xs0+R/PjgyxwcD8Fli0pZ8cwjcRrNVw3GlW6XqNCppauwn3LBZFup/Xbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767757684; c=relaxed/simple;
	bh=EG4Lw4KY7jDc5cF3mfuraZbzKkXG35d9BiCkqmDhK+c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DdRX/UW0r/vZR7FZXsnPP8i2NkGZhU2X9HFbhiSpxULqG0KLPzqaYN+8ovYy3Kmeneo6h2v/wJLV37mgbKaRJyha2uSUvZAc/MXrdDGyns+wd0gGgpvUCaLq4Pcy87Sjnzj85Zgu2dnT8oIxO7h+AiPySHRr/PCIr0jHF7n5RS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZOBJy9ws; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767757675;
	bh=Ckbb2F2Y5PmA100/fYbLjASIk9/fwC7AjSxWe1c8dn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZOBJy9ws6k0XT7MBHUXO/L7A/km8lHM/GNRGp0sNMJHo3IT1AHNB2hVypdNq/8/JQ
	 1BBeqXtEmB0xfOWkCRZB8+lAEHh3uy9Xh8OBIwKXnadml9ho8idgBEFzqYVgB0cJbB
	 abEWyFzkL8sKr/vfK7ZT1yKFHEukSGO87X7g+JhuO8zjMS2bJggqO8dNNNIiGfH8ay
	 OWwbMcuacxS6Ggdp0nHH1/KQKKiOYLlJ0Kua+zv7Km4mDuAyfgNVcKqbUGou6N4V8H
	 a2KXKEpKZpwaPN993KeaNhi0yBYiGxXPnz31YkhC4QNPT3TuMo99W85KM5GYK2jmxe
	 oDUbDKPPSQyww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dmDWt1b8Fz4wHX;
	Wed, 07 Jan 2026 14:47:54 +1100 (AEDT)
Date: Wed, 7 Jan 2026 14:47:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260107144753.7071f5f2@canb.auug.org.au>
In-Reply-To: <20260107134710.15363555@canb.auug.org.au>
References: <20260107134710.15363555@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X/1LFmFUteCCjnPyupPFUtJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/X/1LFmFUteCCjnPyupPFUtJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 7 Jan 2026 13:47:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> In file included from arch/x86/coco/sev/svsm.c:8:
> arch/x86/include/asm/sev.h:393:9: error: unknown type name 'pte_t'
>   393 |         pte_t *kpte;
>       |         ^~~~~
> arch/x86/include/asm/sev.h:404:9: error: unknown type name 'pgprot_t'
>   404 |         pgprot_t new_pgprot;
>       |         ^~~~~~~~
> arch/x86/include/asm/sev.h:464:44: error: unknown type name 'pgd_t'; did =
you mean 'pid_t'?
>   464 | extern int __init sev_es_efi_map_ghcbs_cas(pgd_t *pgd);
>       |                                            ^~~~~
>       |                                            pid_t
> arch/x86/include/asm/sev.h:521:23: error: unknown type name 'pte_t'
>   521 | void set_pte_enc_mask(pte_t *kpte, unsigned long pfn, pgprot_t ne=
w_prot);
>       |                       ^~~~~
> arch/x86/include/asm/sev.h:521:55: error: unknown type name 'pgprot_t'
>   521 | void set_pte_enc_mask(pte_t *kpte, unsigned long pfn, pgprot_t ne=
w_prot);
>       |                                                       ^~~~~~~~
> arch/x86/include/asm/sev.h:655:45: error: 'enum pg_level' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on [-Werror]
>   655 | int rmp_make_private(u64 pfn, u64 gpa, enum pg_level level, u32 a=
sid, bool immutable);
>       |                                             ^~~~~~~~
> arch/x86/include/asm/sev.h:656:35: error: 'enum pg_level' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on [-Werror]
>   656 | int rmp_make_shared(u64 pfn, enum pg_level level);
>       |                                   ^~~~~~~~
> In file included from arch/x86/coco/sev/svsm.c:10:
> arch/x86/coco/sev/internal.h:56:46: error: unknown type name 'runtime_dat=
a'
>    56 | DECLARE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
>       |                                              ^~~~~~~~~~~~
> arch/x86/coco/sev/internal.h:57:44: error: unknown type name 'sev_vmsa'
>    57 | DECLARE_PER_CPU(struct sev_es_save_area *, sev_vmsa);
>       |                                            ^~~~~~~~
> arch/x86/coco/sev/internal.h:62:35: error: unknown type name 'svsm_caa'
>    62 | DECLARE_PER_CPU(struct svsm_ca *, svsm_caa);
>       |                                   ^~~~~~~~
> arch/x86/coco/sev/internal.h:63:22: error: unknown type name 'svsm_caa_pa'
>    63 | DECLARE_PER_CPU(u64, svsm_caa_pa);
>       |                      ^~~~~~~~~~~
> arch/x86/coco/sev/internal.h: In function 'sev_es_rd_ghcb_msr':
> arch/x86/coco/sev/internal.h:75:16: error: implicit declaration of functi=
on 'native_rdmsrq' [-Wimplicit-function-declaration]
>    75 |         return native_rdmsrq(MSR_AMD64_SEV_ES_GHCB);
>       |                ^~~~~~~~~~~~~
> arch/x86/coco/sev/internal.h:75:30: error: 'MSR_AMD64_SEV_ES_GHCB' undecl=
ared (first use in this function)
>    75 |         return native_rdmsrq(MSR_AMD64_SEV_ES_GHCB);
>       |                              ^~~~~~~~~~~~~~~~~~~~~
> arch/x86/coco/sev/internal.h:75:30: note: each undeclared identifier is r=
eported only once for each function it appears in
> arch/x86/coco/sev/internal.h: In function 'sev_es_wr_ghcb_msr':
> arch/x86/coco/sev/internal.h:85:9: error: implicit declaration of functio=
n 'native_wrmsr' [-Wimplicit-function-declaration]
>    85 |         native_wrmsr(MSR_AMD64_SEV_ES_GHCB, low, high);
>       |         ^~~~~~~~~~~~
> arch/x86/coco/sev/internal.h:85:22: error: 'MSR_AMD64_SEV_ES_GHCB' undecl=
ared (first use in this function)
>    85 |         native_wrmsr(MSR_AMD64_SEV_ES_GHCB, low, high);
>       |                      ^~~~~~~~~~~~~~~~~~~~~
> arch/x86/coco/sev/internal.h: In function 'svsm_get_caa':
> arch/x86/coco/sev/internal.h:97:24: error: implicit declaration of functi=
on 'this_cpu_read' [-Wimplicit-function-declaration]
>    97 |                 return this_cpu_read(svsm_caa);
>       |                        ^~~~~~~~~~~~~
> arch/x86/coco/sev/internal.h:97:38: error: 'svsm_caa' undeclared (first u=
se in this function); did you mean 'svsm_ca'?
>    97 |                 return this_cpu_read(svsm_caa);
>       |                                      ^~~~~~~~
>       |                                      svsm_ca
> arch/x86/coco/sev/internal.h: In function 'svsm_get_caa_pa':
> arch/x86/coco/sev/internal.h:105:38: error: 'svsm_caa_pa' undeclared (fir=
st use in this function); did you mean 'svsm_get_caa_pa'?
>   105 |                 return this_cpu_read(svsm_caa_pa);
>       |                                      ^~~~~~~~~~~
>       |                                      svsm_get_caa_pa
> arch/x86/coco/sev/svsm.c: At top level:
> arch/x86/coco/sev/svsm.c:24:22: error: expected '=3D', ',', ';', 'asm' or=
 '__attribute__' before '__ro_after_init'
>    24 | u64 boot_svsm_caa_pa __ro_after_init;
>       |                      ^~~~~~~~~~~~~~~
> arch/x86/coco/sev/svsm.c:27:34: error: unknown type name 'svsm_caa'
>    27 | DEFINE_PER_CPU(struct svsm_ca *, svsm_caa);
>       |                                  ^~~~~~~~
> arch/x86/coco/sev/svsm.c:28:21: error: unknown type name 'svsm_caa_pa'
>    28 | DEFINE_PER_CPU(u64, svsm_caa_pa);
>       |                     ^~~~~~~~~~~
> arch/x86/coco/sev/svsm.c: In function 'svsm_perform_call_protocol':
> arch/x86/coco/sev/svsm.c:75:17: error: implicit declaration of function '=
native_local_irq_save' [-Wimplicit-function-declaration]
>    75 |         flags =3D native_local_irq_save();
>       |                 ^~~~~~~~~~~~~~~~~~~~~
> arch/x86/coco/sev/svsm.c:92:9: error: implicit declaration of function 'n=
ative_local_irq_restore' [-Wimplicit-function-declaration]
>    92 |         native_local_irq_restore(flags);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
> arch/x86/coco/sev/svsm.c: In function 'snp_issue_svsm_attest_req':
> arch/x86/coco/sev/svsm.c:280:9: error: implicit declaration of function '=
local_irq_save' [-Wimplicit-function-declaration]
>   280 |         local_irq_save(flags);
>       |         ^~~~~~~~~~~~~~
> arch/x86/coco/sev/svsm.c:300:9: error: implicit declaration of function '=
local_irq_restore' [-Wimplicit-function-declaration]
>   300 |         local_irq_restore(flags);
>       |         ^~~~~~~~~~~~~~~~~
> In file included from <command-line>:
> arch/x86/coco/sev/svsm.c: At top level:
> arch/x86/include/asm/linkage.h:151:60: error: '__pi_boot_svsm_caa_pa' ali=
ased to undefined symbol 'boot_svsm_caa_pa'
>   151 | #define SYM_PIC_ALIAS(sym)      extern typeof(sym) __PASTE(__pi_,=
 sym) __alias(sym)
>       |                                                            ^~~~~
> include/linux/compiler_types.h:15:24: note: in definition of macro '___PA=
STE'
>    15 | #define ___PASTE(a, b) a##b
>       |                        ^
> arch/x86/include/asm/linkage.h:151:52: note: in expansion of macro '__PAS=
TE'
>   151 | #define SYM_PIC_ALIAS(sym)      extern typeof(sym) __PASTE(__pi_,=
 sym) __alias(sym)
>       |                                                    ^~~~~~~
> arch/x86/coco/sev/svsm.c:25:1: note: in expansion of macro 'SYM_PIC_ALIAS'
>    25 | SYM_PIC_ALIAS(boot_svsm_caa_pa);
>       | ^~~~~~~~~~~~~
> arch/x86/coco/sev/internal.h: In function 'svsm_get_caa':
> arch/x86/coco/sev/internal.h:100:1: error: control reaches end of non-voi=
d function [-Werror=3Dreturn-type]
>   100 | }
>       | ^
> arch/x86/coco/sev/internal.h: In function 'svsm_get_caa_pa':
> arch/x86/coco/sev/internal.h:108:1: error: control reaches end of non-voi=
d function [-Werror=3Dreturn-type]
>   108 | }
>       | ^
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   e21279b73ef6 ("x86/sev: Carve out the SVSM code into a separate compila=
tion unit")
>=20
> Clearly, arch/x86/include/asm/sev.h and arch/x86/coco/sev/internal.h
> assume some header files are included before them that are now missing
> from arch/x86/coco/sev/svsm.c but should probably be explicitly
> included in these headers files.  I realise that these dependencies may
> have been exposed by other changes in linux-next.
>=20
> I have used the tip tree from next-20260106 for today.

So this still failed with yesterday's tip tree, so clearly there is
some other change in today's linux-next that has exposed this.  Instead
of using the old version of the tip tree, I have just reverted this
commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/X/1LFmFUteCCjnPyupPFUtJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmld12kACgkQAVBC80lX
0GyC9Qf/duryOQoCVSkFKAdSgzsVjcGZi8KvxOcQPpLMCejFUBxlLQuB+x2JsUKn
06Wpl6NVdWpp6TyVrQviwQ3d9f3zb47AfXuy+phP/5AUyo09HJO6XmnVN9oGBy9m
BqDVXYGRV/k8hVJBspS1sPKQ9sjkDqc3OPJ2Gfwb6wMcEfm07fXwuCDlYI62cg1g
xPtyG4uN4imzGxZDMzZ1OMTmICFKLIGcAAM/7yeH0Jda+LDv3/Jxeu0iafziqLRI
fcikMLcOgM4L0MaT12e6HUX5hY9+8G1ijU1n68Kj5jz6MsEsgFrc5xBeC0wq6/5b
0dEsRJ+LOX0eENlv6zHqHrOhibT9hA==
=wwrd
-----END PGP SIGNATURE-----

--Sig_/X/1LFmFUteCCjnPyupPFUtJ--

