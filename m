Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7EA43584A
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 03:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhJUBhs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Oct 2021 21:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhJUBhr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Oct 2021 21:37:47 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD44AC06161C;
        Wed, 20 Oct 2021 18:35:32 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZVRN1Dlrz4xbP;
        Thu, 21 Oct 2021 12:35:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634780131;
        bh=bxA+ZbCxZDlRX+pZUnVki3wGLQR5a67yqCQSR1sjUws=;
        h=Date:From:To:Cc:Subject:From;
        b=JTGlgHMR2T8rnvs0edAPn+gNoQMarq0M2ZDsWR4FdbkLX2uKuR25cJaOL0hvIP9VR
         dmCXedX/EFd1acGVSyh8sWtsB4O/7reukW17BK3VH5399HrtUttrRtXs5raCW1S9Br
         ifleTP/F0kfMNrZ8eRUw34Itnfbqrg3Ss0drCd34xckDFynYuiB+A6uUtDIHdGSdsB
         48LIB7+gwrdYPSqXtle7uTkax/vz8bRx0CV33vUxLewbjMVjXBqw0m4s9HjExtWNY2
         3kp5lh89kH8V4rKCoCJgIRoU0Mqwu2w2X0QTLGugrbMfFdikmqlMpsxhvx3LG3RnDu
         6OfSjW3zDFmAw==
Date:   Thu, 21 Oct 2021 12:35:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Borislav Petkov <bp@suse.de>, Fenghua Yu <fenghua.yu@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: linux-next: manual merge of the tip tree with the iommu tree
Message-ID: <20211021123527.29ec17c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DPwDUGoi_7GrsjQnfQU2hCY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DPwDUGoi_7GrsjQnfQU2hCY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/include/asm/fpu/api.h

between commit:

  00ecd5401349 ("iommu/vt-d: Clean up unused PASID updating functions")

from the iommu tree and commits:

  a0ff0611c2fb ("x86/fpu: Move KVMs FPU swapping to FPU core")
  ea4d6938d4c0 ("x86/fpu: Replace KVMs home brewed FPU copy from user")
  90489f1dee8b ("x86/fpu: Move fpstate functions to api.h")
  0ae67cc34f76 ("x86/fpu: Remove internal.h dependency from fpu/signal.h")
  6415bb809263 ("x86/fpu: Mop up the internal.h leftovers")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/include/asm/fpu/api.h
index ca4d0dee1ecd,9263d708dff9..000000000000
--- a/arch/x86/include/asm/fpu/api.h
+++ b/arch/x86/include/asm/fpu/api.h
@@@ -106,4 -108,34 +108,32 @@@ extern int cpu_has_xfeatures(u64 xfeatu
   */
  #define PASID_DISABLED	0
 =20
 -static inline void update_pasid(void) { }
 -
+ /* Trap handling */
+ extern int  fpu__exception_code(struct fpu *fpu, int trap_nr);
+ extern void fpu_sync_fpstate(struct fpu *fpu);
+ extern void fpu_reset_from_exception_fixup(void);
+=20
+ /* Boot, hotplug and resume */
+ extern void fpu__init_cpu(void);
+ extern void fpu__init_system(struct cpuinfo_x86 *c);
+ extern void fpu__init_check_bugs(void);
+ extern void fpu__resume_cpu(void);
+=20
+ #ifdef CONFIG_MATH_EMULATION
+ extern void fpstate_init_soft(struct swregs_state *soft);
+ #else
+ static inline void fpstate_init_soft(struct swregs_state *soft) {}
+ #endif
+=20
+ /* State tracking */
+ DECLARE_PER_CPU(struct fpu *, fpu_fpregs_owner_ctx);
+=20
+ /* fpstate-related functions which are exported to KVM */
+ extern void fpu_init_fpstate_user(struct fpu *fpu);
+=20
+ /* KVM specific functions */
+ extern void fpu_swap_kvm_fpu(struct fpu *save, struct fpu *rstor, u64 res=
tore_mask);
+=20
+ extern int fpu_copy_kvm_uabi_to_fpstate(struct fpu *fpu, const void *buf,=
 u64 xcr0, u32 *pkru);
+=20
  #endif /* _ASM_X86_FPU_API_H */

--Sig_/DPwDUGoi_7GrsjQnfQU2hCY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFww98ACgkQAVBC80lX
0GyY0gf/TUfcRrwIzKqHEVG20+TotoEwaU+ott8RhjrAIZpGFpBt0sx7yfqejrn9
hlEdEqey5yqyUWN+a4cxkRfQOTPHcVquusmafYKbEXgGmR7zJlR/cV1g4ZZhqjCt
F0imqzYgVbKe1cLiWIL/w4toPqoo61SQ8bfu89czlc3op7qbAj2gjJGseUpY0SVf
oZhPNtb1BZTA1jGEFLh1Rz28YlPxQ/TxLcXsRjxAhFVS0CoOOxhayKYkvjnbPKbF
Juawh1Vto86MmjvEyakVAItSu6XvCPLhZlYZb5CFbjKeEFFLwYdjpL8CDu3CKJAH
3HclltoY4l2rFMULqqVFuUBj5OE9RQ==
=QxwD
-----END PGP SIGNATURE-----

--Sig_/DPwDUGoi_7GrsjQnfQU2hCY--
