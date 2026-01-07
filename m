Return-Path: <linux-next+bounces-9569-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF69CFBC6A
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 03:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6637E302C11B
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 02:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4F578F4A;
	Wed,  7 Jan 2026 02:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="O1Nne8QY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FEEAD24;
	Wed,  7 Jan 2026 02:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767754040; cv=none; b=olmm2ppUA2Jmx94VZsOYX9UOcv/bt3K3/WI4xfpdhhVMMJk4ysv2zoFqNQLJ1+yI/6rdrjVsZLIfjoPVn5U+ivc7rk+6Zb1TJKk0QGt2kcCOftK2BkchHd2WM9qp1LWaFOA3sHcjF/w+0hD1309RJewb/4qUUiwScCcMzUIBrv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767754040; c=relaxed/simple;
	bh=z3ZW8nfN4HZK4SmxYHP8p0HcmTMdWczaOA2oimJy2f4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eeVjIdnr8RtmK3xQMDZ0Nz1bwVVaES6rTo9ImnDt+boipLb//nJlY8HaM4xZyIvsMlTiCOz3T7JZeawclfeigYdc48Z5NYgt4uuawzsGGJAQRJ3L6lXWEBF3s5WcHR+JGESxvrPnGr6FYm2v4hqjW3sodbTRxHFviqz6Kykacu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=O1Nne8QY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767754032;
	bh=3upQXDu3Vm/erocgL45St6NH67PWwyYQmylvgTe9IK8=;
	h=Date:From:To:Cc:Subject:From;
	b=O1Nne8QYfn9Z8eLiRRH3X1caPmdFQCJ7lej20Y+HLBWtaoq7Pf/PxuX+ZuwaHT/rm
	 CGy772j5WN2UxHiqgDOOPiqvgCAFH7kGf1c/Yz5HVUdwPo2bftWHHXGMcItWb3vJ1U
	 ajjLCJ/bSTGpdkgOH+i3Bt4POLDlC3qaHTg0wkCeBqf8mH8xSm4CvSyE9EcxY0n/Vn
	 xzxH74zxfcyCjlA+QsSmeRqWomqhVoAC9565VlZHILtgRgch9qe8Sq7nxVgaL8Jp5p
	 +fKWfwLYOo0lXlrmY74yH11QeOfgs+NUfx3FMeXqgpo3eiVYIy8dvLhtLrM/V2Xmx3
	 BjDkXmuJ5ImTA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dmC9q3hJGz4wC8;
	Wed, 07 Jan 2026 13:47:11 +1100 (AEDT)
Date: Wed, 7 Jan 2026 13:47:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20260107134710.15363555@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4rhOwPo/1P=ac=K+/L1a82a";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4rhOwPo/1P=ac=K+/L1a82a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from arch/x86/coco/sev/svsm.c:8:
arch/x86/include/asm/sev.h:393:9: error: unknown type name 'pte_t'
  393 |         pte_t *kpte;
      |         ^~~~~
arch/x86/include/asm/sev.h:404:9: error: unknown type name 'pgprot_t'
  404 |         pgprot_t new_pgprot;
      |         ^~~~~~~~
arch/x86/include/asm/sev.h:464:44: error: unknown type name 'pgd_t'; did yo=
u mean 'pid_t'?
  464 | extern int __init sev_es_efi_map_ghcbs_cas(pgd_t *pgd);
      |                                            ^~~~~
      |                                            pid_t
arch/x86/include/asm/sev.h:521:23: error: unknown type name 'pte_t'
  521 | void set_pte_enc_mask(pte_t *kpte, unsigned long pfn, pgprot_t new_=
prot);
      |                       ^~~~~
arch/x86/include/asm/sev.h:521:55: error: unknown type name 'pgprot_t'
  521 | void set_pte_enc_mask(pte_t *kpte, unsigned long pfn, pgprot_t new_=
prot);
      |                                                       ^~~~~~~~
arch/x86/include/asm/sev.h:655:45: error: 'enum pg_level' declared inside p=
arameter list will not be visible outside of this definition or declaration=
 [-Werror]
  655 | int rmp_make_private(u64 pfn, u64 gpa, enum pg_level level, u32 asi=
d, bool immutable);
      |                                             ^~~~~~~~
arch/x86/include/asm/sev.h:656:35: error: 'enum pg_level' declared inside p=
arameter list will not be visible outside of this definition or declaration=
 [-Werror]
  656 | int rmp_make_shared(u64 pfn, enum pg_level level);
      |                                   ^~~~~~~~
In file included from arch/x86/coco/sev/svsm.c:10:
arch/x86/coco/sev/internal.h:56:46: error: unknown type name 'runtime_data'
   56 | DECLARE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
      |                                              ^~~~~~~~~~~~
arch/x86/coco/sev/internal.h:57:44: error: unknown type name 'sev_vmsa'
   57 | DECLARE_PER_CPU(struct sev_es_save_area *, sev_vmsa);
      |                                            ^~~~~~~~
arch/x86/coco/sev/internal.h:62:35: error: unknown type name 'svsm_caa'
   62 | DECLARE_PER_CPU(struct svsm_ca *, svsm_caa);
      |                                   ^~~~~~~~
arch/x86/coco/sev/internal.h:63:22: error: unknown type name 'svsm_caa_pa'
   63 | DECLARE_PER_CPU(u64, svsm_caa_pa);
      |                      ^~~~~~~~~~~
arch/x86/coco/sev/internal.h: In function 'sev_es_rd_ghcb_msr':
arch/x86/coco/sev/internal.h:75:16: error: implicit declaration of function=
 'native_rdmsrq' [-Wimplicit-function-declaration]
   75 |         return native_rdmsrq(MSR_AMD64_SEV_ES_GHCB);
      |                ^~~~~~~~~~~~~
arch/x86/coco/sev/internal.h:75:30: error: 'MSR_AMD64_SEV_ES_GHCB' undeclar=
ed (first use in this function)
   75 |         return native_rdmsrq(MSR_AMD64_SEV_ES_GHCB);
      |                              ^~~~~~~~~~~~~~~~~~~~~
arch/x86/coco/sev/internal.h:75:30: note: each undeclared identifier is rep=
orted only once for each function it appears in
arch/x86/coco/sev/internal.h: In function 'sev_es_wr_ghcb_msr':
arch/x86/coco/sev/internal.h:85:9: error: implicit declaration of function =
'native_wrmsr' [-Wimplicit-function-declaration]
   85 |         native_wrmsr(MSR_AMD64_SEV_ES_GHCB, low, high);
      |         ^~~~~~~~~~~~
arch/x86/coco/sev/internal.h:85:22: error: 'MSR_AMD64_SEV_ES_GHCB' undeclar=
ed (first use in this function)
   85 |         native_wrmsr(MSR_AMD64_SEV_ES_GHCB, low, high);
      |                      ^~~~~~~~~~~~~~~~~~~~~
arch/x86/coco/sev/internal.h: In function 'svsm_get_caa':
arch/x86/coco/sev/internal.h:97:24: error: implicit declaration of function=
 'this_cpu_read' [-Wimplicit-function-declaration]
   97 |                 return this_cpu_read(svsm_caa);
      |                        ^~~~~~~~~~~~~
arch/x86/coco/sev/internal.h:97:38: error: 'svsm_caa' undeclared (first use=
 in this function); did you mean 'svsm_ca'?
   97 |                 return this_cpu_read(svsm_caa);
      |                                      ^~~~~~~~
      |                                      svsm_ca
arch/x86/coco/sev/internal.h: In function 'svsm_get_caa_pa':
arch/x86/coco/sev/internal.h:105:38: error: 'svsm_caa_pa' undeclared (first=
 use in this function); did you mean 'svsm_get_caa_pa'?
  105 |                 return this_cpu_read(svsm_caa_pa);
      |                                      ^~~~~~~~~~~
      |                                      svsm_get_caa_pa
arch/x86/coco/sev/svsm.c: At top level:
arch/x86/coco/sev/svsm.c:24:22: error: expected '=3D', ',', ';', 'asm' or '=
__attribute__' before '__ro_after_init'
   24 | u64 boot_svsm_caa_pa __ro_after_init;
      |                      ^~~~~~~~~~~~~~~
arch/x86/coco/sev/svsm.c:27:34: error: unknown type name 'svsm_caa'
   27 | DEFINE_PER_CPU(struct svsm_ca *, svsm_caa);
      |                                  ^~~~~~~~
arch/x86/coco/sev/svsm.c:28:21: error: unknown type name 'svsm_caa_pa'
   28 | DEFINE_PER_CPU(u64, svsm_caa_pa);
      |                     ^~~~~~~~~~~
arch/x86/coco/sev/svsm.c: In function 'svsm_perform_call_protocol':
arch/x86/coco/sev/svsm.c:75:17: error: implicit declaration of function 'na=
tive_local_irq_save' [-Wimplicit-function-declaration]
   75 |         flags =3D native_local_irq_save();
      |                 ^~~~~~~~~~~~~~~~~~~~~
arch/x86/coco/sev/svsm.c:92:9: error: implicit declaration of function 'nat=
ive_local_irq_restore' [-Wimplicit-function-declaration]
   92 |         native_local_irq_restore(flags);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/coco/sev/svsm.c: In function 'snp_issue_svsm_attest_req':
arch/x86/coco/sev/svsm.c:280:9: error: implicit declaration of function 'lo=
cal_irq_save' [-Wimplicit-function-declaration]
  280 |         local_irq_save(flags);
      |         ^~~~~~~~~~~~~~
arch/x86/coco/sev/svsm.c:300:9: error: implicit declaration of function 'lo=
cal_irq_restore' [-Wimplicit-function-declaration]
  300 |         local_irq_restore(flags);
      |         ^~~~~~~~~~~~~~~~~
In file included from <command-line>:
arch/x86/coco/sev/svsm.c: At top level:
arch/x86/include/asm/linkage.h:151:60: error: '__pi_boot_svsm_caa_pa' alias=
ed to undefined symbol 'boot_svsm_caa_pa'
  151 | #define SYM_PIC_ALIAS(sym)      extern typeof(sym) __PASTE(__pi_, s=
ym) __alias(sym)
      |                                                            ^~~~~
include/linux/compiler_types.h:15:24: note: in definition of macro '___PAST=
E'
   15 | #define ___PASTE(a, b) a##b
      |                        ^
arch/x86/include/asm/linkage.h:151:52: note: in expansion of macro '__PASTE'
  151 | #define SYM_PIC_ALIAS(sym)      extern typeof(sym) __PASTE(__pi_, s=
ym) __alias(sym)
      |                                                    ^~~~~~~
arch/x86/coco/sev/svsm.c:25:1: note: in expansion of macro 'SYM_PIC_ALIAS'
   25 | SYM_PIC_ALIAS(boot_svsm_caa_pa);
      | ^~~~~~~~~~~~~
arch/x86/coco/sev/internal.h: In function 'svsm_get_caa':
arch/x86/coco/sev/internal.h:100:1: error: control reaches end of non-void =
function [-Werror=3Dreturn-type]
  100 | }
      | ^
arch/x86/coco/sev/internal.h: In function 'svsm_get_caa_pa':
arch/x86/coco/sev/internal.h:108:1: error: control reaches end of non-void =
function [-Werror=3Dreturn-type]
  108 | }
      | ^
cc1: all warnings being treated as errors

Caused by commit

  e21279b73ef6 ("x86/sev: Carve out the SVSM code into a separate compilati=
on unit")

Clearly, arch/x86/include/asm/sev.h and arch/x86/coco/sev/internal.h
assume some header files are included before them that are now missing
from arch/x86/coco/sev/svsm.c but should probably be explicitly
included in these headers files.  I realise that these dependencies may
have been exposed by other changes in linux-next.

I have used the tip tree from next-20260106 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/4rhOwPo/1P=ac=K+/L1a82a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmldyS4ACgkQAVBC80lX
0GyK3gf8DAWDHxNWbwwVzft0AtL1XHaBVETeecdGvgxIXn1ynQzXz3Mge74JIUbU
AtCBNzqbhg1hawy8qBH5kmOhWS/f+zXmS+a/8pOFOY3H+D/0dAidfyHZwyjOa0xf
xGtfcNuc7C6VI/HMZAFHctu6kpKmiFOc/e7RYAeZ4Vvmv1+7dCe8ami6bNSpOGxF
2uvHRgGFKdz62GR3RfRY2BXtLsAGkPQAWorUDDc1pgFSVfvbqofQpK2C4+D9Ov4H
lfw/7UyMumkx54F/pW0hWXHMtQfqeqEXSslxhtwgO5pkS+ulhmr4cjFXPcALPrSj
brQDawogC/1ZVu4NdTRgSNVnnr34vw==
=wXxX
-----END PGP SIGNATURE-----

--Sig_/4rhOwPo/1P=ac=K+/L1a82a--

