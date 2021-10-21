Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84AB143663D
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 17:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbhJUPbc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 11:31:32 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:51154 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhJUPbc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 11:31:32 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2C10221992;
        Thu, 21 Oct 2021 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1634830155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UKNEQXcYAg2eQck30xepq9uHSEWinJuOPanl/1y7BRw=;
        b=un8/skc/N96Rl03YRBpJTdVEUlkF6QjFkrAkrAuysIhhAnV3aFWvEqPEH3TMK1OXVJHlei
        Sm+Trr1kn+hv2KJ0sxjQCWoEMmjTtkh+S8YmO/Ehon/wXTvO2QYqhJZRbAW8+gFkizdhcC
        mwMzu5saZHVIUHBmhMD2ejQtgrom964=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1634830155;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UKNEQXcYAg2eQck30xepq9uHSEWinJuOPanl/1y7BRw=;
        b=yKA0TpZbenYgHjQaK9Jc8Nn/ad6Gd6JWRG4eZR16wVKeKiqjV4IHIZb02Upv9c7fH2HCSP
        OmiDM4HKX9K5T9AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18A0813AB0;
        Thu, 21 Oct 2021 15:29:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id JQ7uBEuHcWHpWQAAMHmgww
        (envelope-from <bp@suse.de>); Thu, 21 Oct 2021 15:29:15 +0000
Date:   Thu, 21 Oct 2021 17:29:17 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Joerg Roedel <joro@8bytes.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: linux-next: manual merge of the tip tree with the iommu tree
Message-ID: <YXGHTQN/gdBueRRX@zn.tnic>
References: <20211021123527.29ec17c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021123527.29ec17c5@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 21, 2021 at 12:35:27PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/x86/include/asm/fpu/api.h
> 
> between commit:
> 
>   00ecd5401349 ("iommu/vt-d: Clean up unused PASID updating functions")
> 
> from the iommu tree and commits:
> 
>   a0ff0611c2fb ("x86/fpu: Move KVMs FPU swapping to FPU core")
>   ea4d6938d4c0 ("x86/fpu: Replace KVMs home brewed FPU copy from user")
>   90489f1dee8b ("x86/fpu: Move fpstate functions to api.h")
>   0ae67cc34f76 ("x86/fpu: Remove internal.h dependency from fpu/signal.h")
>   6415bb809263 ("x86/fpu: Mop up the internal.h leftovers")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/x86/include/asm/fpu/api.h
> index ca4d0dee1ecd,9263d708dff9..000000000000
> --- a/arch/x86/include/asm/fpu/api.h
> +++ b/arch/x86/include/asm/fpu/api.h
> @@@ -106,4 -108,34 +108,32 @@@ extern int cpu_has_xfeatures(u64 xfeatu
>    */
>   #define PASID_DISABLED	0
>   
>  -static inline void update_pasid(void) { }
>  -
> + /* Trap handling */
> + extern int  fpu__exception_code(struct fpu *fpu, int trap_nr);
> + extern void fpu_sync_fpstate(struct fpu *fpu);
> + extern void fpu_reset_from_exception_fixup(void);
> + 
> + /* Boot, hotplug and resume */
> + extern void fpu__init_cpu(void);
> + extern void fpu__init_system(struct cpuinfo_x86 *c);
> + extern void fpu__init_check_bugs(void);
> + extern void fpu__resume_cpu(void);
> + 
> + #ifdef CONFIG_MATH_EMULATION
> + extern void fpstate_init_soft(struct swregs_state *soft);
> + #else
> + static inline void fpstate_init_soft(struct swregs_state *soft) {}
> + #endif
> + 
> + /* State tracking */
> + DECLARE_PER_CPU(struct fpu *, fpu_fpregs_owner_ctx);
> + 
> + /* fpstate-related functions which are exported to KVM */
> + extern void fpu_init_fpstate_user(struct fpu *fpu);
> + 
> + /* KVM specific functions */
> + extern void fpu_swap_kvm_fpu(struct fpu *save, struct fpu *rstor, u64 restore_mask);
> + 
> + extern int fpu_copy_kvm_uabi_to_fpstate(struct fpu *fpu, const void *buf, u64 xcr0, u32 *pkru);
> + 
>   #endif /* _ASM_X86_FPU_API_H */

LGTM, thx!

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
