Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960B935D75E
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 07:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244605AbhDMFnu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 01:43:50 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38463 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243542AbhDMFnt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Apr 2021 01:43:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FKDzb2SRVz9sVw;
        Tue, 13 Apr 2021 15:43:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618292604;
        bh=tZ54/3ocfBoA6RPTXMtP3NOOQVJJEGcVSh2zdlv211k=;
        h=Date:From:To:Cc:Subject:From;
        b=f/1b9EERvihAO9fwjPRzur+F9rIKgJVjdZ8p9ozFuqNlzCSQvfv0ZKgzRMIWCGIfX
         /qzYp5aRq4pmbhZHlQO9d9DS+Y95CAu+wmCdTCuIDSP93VNU8+VD982yrrebhJY7J7
         /q4vtx6aREa6UgaKx/oL4ks8Qzns18OwTxeQICFbcCjCAbxzzYrrfaWwBxY2XhmaQ3
         gdICCUcSbjdvZKxgSvjW1BWbUyuUN/yhu/84EGLE6bfmRAO6dGGw+bwB1S3OeI+kU4
         Ro6pKBqc/FwDR8kDKUZ1x7XBxuixQMvKcFMzzwBrqGathOkFn3y22xOB/eWoqq4714
         vnILVX0bj8WNQ==
Date:   Tue, 13 Apr 2021 15:43:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoffer Dall <cdall@cs.columbia.edu>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Quentin Perret <qperret@google.com>
Subject: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20210413154305.49442969@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tvzh469tZ3+W4GMju+tgZ+i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tvzh469tZ3+W4GMju+tgZ+i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  arch/arm64/include/asm/assembler.h

between commits:

  27248fe1abb2 ("arm64: assembler: remove conditional NEON yield macros")
  13150149aa6d ("arm64: fpsimd: run kernel mode NEON with softirqs disabled=
")

from the arm64 tree and commits:

  8f4de66e247b ("arm64: asm: Provide set_sctlr_el2 macro")
  755db23420a1 ("KVM: arm64: Generate final CTR_EL0 value when running in P=
rotected mode")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/include/asm/assembler.h
index ab569b0b45fc,34ddd8a0f3dd..000000000000
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@@ -15,7 -15,7 +15,8 @@@
  #include <asm-generic/export.h>
 =20
  #include <asm/asm-offsets.h>
 +#include <asm/alternative.h>
+ #include <asm/asm-bug.h>
  #include <asm/cpufeature.h>
  #include <asm/cputype.h>
  #include <asm/debug-monitors.h>
@@@ -701,25 -705,95 +714,33 @@@ USER(\label, ic	ivau, \tmp2)			// inval
  	isb
  .endm
 =20
+ .macro set_sctlr_el1, reg
+ 	set_sctlr sctlr_el1, \reg
+ .endm
+=20
+ .macro set_sctlr_el2, reg
+ 	set_sctlr sctlr_el2, \reg
+ .endm
+=20
 -/*
 - * Check whether to yield to another runnable task from kernel mode NEON =
code
 - * (which runs with preemption disabled).
 - *
 - * if_will_cond_yield_neon
 - *        // pre-yield patchup code
 - * do_cond_yield_neon
 - *        // post-yield patchup code
 - * endif_yield_neon    <label>
 - *
 - * where <label> is optional, and marks the point where execution will re=
sume
 - * after a yield has been performed. If omitted, execution resumes right =
after
 - * the endif_yield_neon invocation. Note that the entire sequence, includ=
ing
 - * the provided patchup code, will be omitted from the image if
 - * CONFIG_PREEMPTION is not defined.
 - *
 - * As a convenience, in the case where no patchup code is required, the a=
bove
 - * sequence may be abbreviated to
 - *
 - * cond_yield_neon <label>
 - *
 - * Note that the patchup code does not support assembler directives that =
change
 - * the output section, any use of such directives is undefined.
 - *
 - * The yield itself consists of the following:
 - * - Check whether the preempt count is exactly 1 and a reschedule is also
 - *   needed. If so, calling of preempt_enable() in kernel_neon_end() will
 - *   trigger a reschedule. If it is not the case, yielding is pointless.
 - * - Disable and re-enable kernel mode NEON, and branch to the yield fixup
 - *   code.
 - *
 - * This macro sequence may clobber all CPU state that is not guaranteed b=
y the
 - * AAPCS to be preserved across an ordinary function call.
 - */
 -
 -	.macro		cond_yield_neon, lbl
 -	if_will_cond_yield_neon
 -	do_cond_yield_neon
 -	endif_yield_neon	\lbl
 -	.endm
 -
 -	.macro		if_will_cond_yield_neon
 -#ifdef CONFIG_PREEMPTION
 -	get_current_task	x0
 -	ldr		x0, [x0, #TSK_TI_PREEMPT]
 -	sub		x0, x0, #PREEMPT_DISABLE_OFFSET
 -	cbz		x0, .Lyield_\@
 -	/* fall through to endif_yield_neon */
 -	.subsection	1
 -.Lyield_\@ :
 -#else
 -	.section	".discard.cond_yield_neon", "ax"
 -#endif
 -	.endm
 -
 -	.macro		do_cond_yield_neon
 -	bl		kernel_neon_end
 -	bl		kernel_neon_begin
 -	.endm
 -
 -	.macro		endif_yield_neon, lbl
 -	.ifnb		\lbl
 -	b		\lbl
 -	.else
 -	b		.Lyield_out_\@
 -	.endif
 -	.previous
 -.Lyield_out_\@ :
 -	.endm
 -
  	/*
 -	 * Check whether preempt-disabled code should yield as soon as it
 -	 * is able. This is the case if re-enabling preemption a single
 -	 * time results in a preempt count of zero, and the TIF_NEED_RESCHED
 -	 * flag is set. (Note that the latter is stored negated in the
 -	 * top word of the thread_info::preempt_count field)
 +	 * Check whether preempt/bh-disabled asm code should yield as soon as
 +	 * it is able. This is the case if we are currently running in task
 +	 * context, and either a softirq is pending, or the TIF_NEED_RESCHED
 +	 * flag is set and re-enabling preemption a single time would result in
 +	 * a preempt count of zero. (Note that the TIF_NEED_RESCHED flag is
 +	 * stored negated in the top word of the thread_info::preempt_count
 +	 * field)
  	 */
 -	.macro		cond_yield, lbl:req, tmp:req
 -#ifdef CONFIG_PREEMPTION
 +	.macro		cond_yield, lbl:req, tmp:req, tmp2:req
  	get_current_task \tmp
  	ldr		\tmp, [\tmp, #TSK_TI_PREEMPT]
 +	/*
 +	 * If we are serving a softirq, there is no point in yielding: the
 +	 * softirq will not be preempted no matter what we do, so we should
 +	 * run to completion as quickly as we can.
 +	 */
 +	tbnz		\tmp, #SOFTIRQ_SHIFT, .Lnoyield_\@
 +#ifdef CONFIG_PREEMPTION
  	sub		\tmp, \tmp, #PREEMPT_DISABLE_OFFSET
  	cbz		\tmp, \lbl
  #endif

--Sig_/tvzh469tZ3+W4GMju+tgZ+i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB1L2kACgkQAVBC80lX
0Gwqwwf/VcC5dvJMgVwBZc0E4rcV5kMwuUP+3uRdtbnY0DLeSvbx5mmIK2DKJSSr
EXRv7XoJK73v+QdIKUSXkyBZg+FE6qgeBpPekp6BsWvxGExuvG57GqTnLLtvNFln
Xb0LrCg4MkNpGGDCOrKI51iDdBM4+DpmArA8L7JA5qlQBPFKhfiallPi9uh4+jIs
8lVKgPUJGSUuAkgCqTwPd2gknRDFI1TwoGYl4hLiwsG0JtMttWO4dP92lm9weuMH
R+OhqCWU5/mTX75plsSRo1GG6uTCJCsJxjDuBvNyRhPTs05dOF3VkXw6pnAY9Srp
TjRjQWE7KSEOeIABHDdpzVeYnJjK6Q==
=56TC
-----END PGP SIGNATURE-----

--Sig_/tvzh469tZ3+W4GMju+tgZ+i--
