Return-Path: <linux-next+bounces-78-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 681307F97FC
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 04:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B51E1C20826
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 03:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACC146A3;
	Mon, 27 Nov 2023 03:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o2iEkiFp"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11C2122;
	Sun, 26 Nov 2023 19:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701056661;
	bh=W6wPi/O+8MM/qw5hdejRqnpZ8FpJQUB6x4BDudn9Emo=;
	h=Date:From:To:Cc:Subject:From;
	b=o2iEkiFpqZp9ED6zRKmy0/zOe4H5byuQsJhCvLvTaC7GKnbIpfaD19EVCCEBaJMU9
	 N39wtysnIQ1irdb0v2FOtyEveIhnTsTt2iMjEz1AwXg9WB31XO5XUOB4FttReSWeCB
	 zOaMiXb2V1mlHUvojeenVRavMmly+PtWerhRQAsV6HOYWfpTzEkRT9lsLcAj1Arwos
	 riiKYbnxlcGdMPxkw0V0vHTufFG7VgO7CaK68WYkkJd9WDKvf2fJo+LTWWYDWBc43C
	 8FrnnbdHHzg/9vsZd9n6MP6jwd7qbtA7B/pKjFsjV4OnFGXyf9L7zuT0eWac35Omk4
	 BluzjANKLss6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sds0448RBz4wd1;
	Mon, 27 Nov 2023 14:44:20 +1100 (AEDT)
Date: Mon, 27 Nov 2023 14:44:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20231127144418.54daad5d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MM5jk5QheGWqV9dqAb6GT+P";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MM5jk5QheGWqV9dqAb6GT+P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (sparc64 defconfig)
failed like this:

arch/sparc/vdso/vclock_gettime.c:254:1: warning: no previous prototype for =
'__vdso_clock_gettime' [-Wmissing-prototypes]
  254 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec =
*ts)
      | ^~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vclock_gettime.c:282:1: warning: no previous prototype for =
'__vdso_clock_gettime_stick' [-Wmissing-prototypes]
  282 | __vdso_clock_gettime_stick(clockid_t clock, struct __kernel_old_tim=
espec *ts)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vclock_gettime.c:307:1: warning: no previous prototype for =
'__vdso_gettimeofday' [-Wmissing-prototypes]
  307 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezon=
e *tz)
      | ^~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vclock_gettime.c:343:1: warning: no previous prototype for =
'__vdso_gettimeofday_stick' [-Wmissing-prototypes]
  343 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv, struct t=
imezone *tz)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vma.c:246:12: warning: no previous prototype for 'init_vdso=
_image' [-Wmissing-prototypes]
  246 | int __init init_vdso_image(const struct vdso_image *image,
      |            ^~~~~~~~~~~~~~~
arch/sparc/prom/p1275.c:52:6: warning: no previous prototype for 'prom_cif_=
init' [-Wmissing-prototypes]
   52 | void prom_cif_init(void *cif_handler, void *cif_stack)
      |      ^~~~~~~~~~~~~
In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
arch/sparc/vdso/vdso32/../vclock_gettime.c:254:1: warning: no previous prot=
otype for '__vdso_clock_gettime' [-Wmissing-prototypes]
  254 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec =
*ts)
      | ^~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vdso32/../vclock_gettime.c:282:1: warning: no previous prot=
otype for '__vdso_clock_gettime_stick' [-Wmissing-prototypes]
  282 | __vdso_clock_gettime_stick(clockid_t clock, struct __kernel_old_tim=
espec *ts)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vdso32/../vclock_gettime.c:307:1: warning: no previous prot=
otype for '__vdso_gettimeofday' [-Wmissing-prototypes]
  307 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezon=
e *tz)
      | ^~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vdso32/../vclock_gettime.c:343:1: warning: no previous prot=
otype for '__vdso_gettimeofday_stick' [-Wmissing-prototypes]
  343 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv, struct t=
imezone *tz)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~
arch/sparc/prom/misc_64.c:165:5: warning: no previous prototype for 'prom_g=
et_mmu_ihandle' [-Wmissing-prototypes]
  165 | int prom_get_mmu_ihandle(void)
      |     ^~~~~~~~~~~~~~~~~~~~
arch/sparc/kernel/traps_64.c:253:6: error: no previous prototype for 'is_no=
_fault_exception' [-Werror=3Dmissing-prototypes]
  253 | bool is_no_fault_exception(struct pt_regs *regs)
      |      ^~~~~~~~~~~~~~~~~~~~~
arch/sparc/kernel/traps_64.c:2035:6: error: no previous prototype for 'do_m=
cd_err' [-Werror=3Dmissing-prototypes]
 2035 | void do_mcd_err(struct pt_regs *regs, struct sun4v_error_entry ent)
      |      ^~~~~~~~~~
arch/sparc/kernel/traps_64.c:2153:6: error: no previous prototype for 'sun4=
v_nonresum_error_user_handled' [-Werror=3Dmissing-prototypes]
 2153 | bool sun4v_nonresum_error_user_handled(struct pt_regs *regs,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
arch/sparc/mm/init_64.c:2644:6: error: no previous prototype for 'vmemmap_f=
ree' [-Werror=3Dmissing-prototypes]
 2644 | void vmemmap_free(unsigned long start, unsigned long end,
      |      ^~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  c6345dfa6e3e ("Makefile.extrawarn: turn on missing-prototypes globally")

I applied the following hack for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 27 Nov 2023 14:18:45 +1100
Subject: [PATCH] sparc: turn off Werror for now

---
 arch/sparc/kernel/Makefile | 2 +-
 arch/sparc/mm/Makefile     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index 0984bb6f0f17..1ce4d5028c86 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -5,7 +5,7 @@
 #
=20
 asflags-y :=3D -ansi
-ccflags-y :=3D -Werror
+#ccflags-y :=3D -Werror
=20
 # Undefine sparc when processing vmlinux.lds - it is used
 # And teach CPP we are doing $(BITS) builds (for this case)
diff --git a/arch/sparc/mm/Makefile b/arch/sparc/mm/Makefile
index 871354aa3c00..a199484e131f 100644
--- a/arch/sparc/mm/Makefile
+++ b/arch/sparc/mm/Makefile
@@ -3,7 +3,7 @@
 #
=20
 asflags-y :=3D -ansi
-ccflags-y :=3D -Werror
+#ccflags-y :=3D -Werror
=20
 obj-$(CONFIG_SPARC64)   +=3D ultra.o tlb.o tsb.o
 obj-y                   +=3D fault_$(BITS).o
--=20
2.40.1

After which I got these as well:

arch/sparc/kernel/adi_64.c:124:21: warning: no previous prototype for 'find=
_tag_store' [-Wmissing-prototypes]
  124 | tag_storage_desc_t *find_tag_store(struct mm_struct *mm,
      |                     ^~~~~~~~~~~~~~
arch/sparc/kernel/adi_64.c:156:21: warning: no previous prototype for 'allo=
c_tag_store' [-Wmissing-prototypes]
  156 | tag_storage_desc_t *alloc_tag_store(struct mm_struct *mm,
      |                     ^~~~~~~~~~~~~~~
arch/sparc/kernel/adi_64.c:299:6: warning: no previous prototype for 'del_t=
ag_store' [-Wmissing-prototypes]
  299 | void del_tag_store(tag_storage_desc_t *tag_desc, struct mm_struct *=
mm)
      |      ^~~~~~~~~~~~~
arch/sparc/kernel/uprobes.c:237:17: warning: no previous prototype for 'upr=
obe_trap' [-Wmissing-prototypes]
  237 | asmlinkage void uprobe_trap(struct pt_regs *regs,
      |                 ^~~~~~~~~~~
arch/sparc/kernel/time_64.c:880:20: warning: no previous prototype for 'sch=
ed_clock' [-Wmissing-prototypes]
  880 | unsigned long long sched_clock(void)
      |                    ^~~~~~~~~~~
arch/sparc/kernel/pci_sun4v.c:259:15: warning: no previous prototype for 'd=
ma_4v_iotsb_bind' [-Wmissing-prototypes]
  259 | unsigned long dma_4v_iotsb_bind(unsigned long devhandle,
      |               ^~~~~~~~~~~~~~~~~
arch/sparc/kernel/setup_64.c:602:13: warning: no previous prototype for 'al=
loc_irqstack_bootmem' [-Wmissing-prototypes]
  602 | void __init alloc_irqstack_bootmem(void)
      |             ^~~~~~~~~~~~~~~~~~~~~~

And these from the sparc (32) defconfig build:

arch/sparc/lib/cmpdi2.c:6:11: error: no previous prototype for '__cmpdi2' [=
-Werror=3Dmissing-prototypes]
    6 | word_type __cmpdi2(long long a, long long b)
      |           ^~~~~~~~
cc1: all warnings being treated as errors
kernel/dma.c:70:5: warning: no previous prototype for 'request_dma' [-Wmiss=
ing-prototypes]
   70 | int request_dma(unsigned int dmanr, const char * device_id)
      |     ^~~~~~~~~~~
kernel/dma.c:88:6: warning: no previous prototype for 'free_dma' [-Wmissing=
-prototypes]
   88 | void free_dma(unsigned int dmanr)
      |      ^~~~~~~~

So I turned off -Werrror in the lib directory as well which added this:

arch/sparc/lib/ucmpdi2.c:5:11: warning: no previous prototype for '__ucmpdi=
2' [-Wmissing-prototypes]
    5 | word_type __ucmpdi2(unsigned long long a, unsigned long long b)
      |           ^~~~~~~~~

--=20
Cheers,
Stephen Rothwell

--Sig_/MM5jk5QheGWqV9dqAb6GT+P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVkEJIACgkQAVBC80lX
0GxDFAf/ZnIJkLictTCPLZ1hei3lyPwT+hx97uVFxHV4Db03880T7jqJJf1F+zXG
BQHi1WhOxTmMpFWCzu+qCZ/KBpGjTwQINkLKAFRg6y+5dCl+Q3nQUfLCxwdz/hHk
orRDn0OUaTAsTd4oKgpI1BhySiEW2OAi6sffF5u3IXKlJqbFSAv7WHyGTesJQAWa
WGRdnmFdtBPdol3WUxe+TfzH6fWy8QkEC8pU4iCUovYq2LGum+euPfSmfcN/msgB
8iwRG/jPz7CS+UMXap1aA7LkWWlcjW3VmeBiXAr9DUNH0ILWkrlhqtl7ZFf/3vX3
N7KAdvcKNXvtbN5C55eLyQo1sTssFg==
=egQu
-----END PGP SIGNATURE-----

--Sig_/MM5jk5QheGWqV9dqAb6GT+P--

