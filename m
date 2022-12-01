Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46F0D63F763
	for <lists+linux-next@lfdr.de>; Thu,  1 Dec 2022 19:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbiLASS6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Dec 2022 13:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbiLASSu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2022 13:18:50 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E639FA430B
        for <linux-next@vger.kernel.org>; Thu,  1 Dec 2022 10:18:49 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so2884238pjd.5
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2022 10:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ttDTTn0msLi3yulrL0NYUUesa3El3fK1mxiDYXquzzA=;
        b=aeFFB3BHCmHkvKimGZvJUbM8qhEI04p1++4qzxmAccBsAT3OnNl1rhHdS042nDjuks
         OLkAFEFdOxYcHzXhiMwbcuo3+csSOk5EuPr7TLh4kuR8VSdIYwznNiDNUFshDJoRLlvy
         EbA0jC+V0s0hblXMcqynk21iTQ3irSRPC9+ds7QwmDSh9j888yaIf66r1hQvXBlX76k1
         bcpCKnuPPe1bOpYib36pwX72AVkSwRyU8eUCD2I+aAiFAzLC5Aeitm6B9Ekckb48ZGux
         2XI1A6T6LdJ4qhNp+3dKSedm5jRj1KtfzncxTykAySmScfSZaDssP1r7JQJ9YHJOEAEP
         Z2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttDTTn0msLi3yulrL0NYUUesa3El3fK1mxiDYXquzzA=;
        b=cqfodnQ3QU2C6F29Hrowd7kzoCVGpFaCxfhZyXv3C2+jW1svEey5JkXP+jfjzhfZ8u
         Iza5wlr1VZhgPyDn9WbNRKRdWIYODWrPskS1J7+kB7DXDpHGMXgb8NkOT2/q+ZAJ3sWP
         6BIGNi6L3Ui6V2KLLvPt7mxI2opAI3Y7j0C21io4sYx8qR4lGe4C6mbX2ngdCEn0IKfJ
         sMTiJBayCdufnx+m6sGXpHQlbfXhwg9ZPrGeVE1gRzOLgNg9YR1HdQBm5geGyiaLS+lD
         NYXImnPGK5UpuJGw588JwemN/EkyrcgCgZ8t/BicDcVo7CbFSx5rfViRSIjujhhPf8w+
         gvLw==
X-Gm-Message-State: ANoB5pm/rZTWImNsSamUVp0uh2/DhMxivwMpMHiUKOcvHVlTfjkiorrf
        u/NmtQWwdHOPbr+VdI0hf1biCw==
X-Google-Smtp-Source: AA0mqf71vriUfgppVEBnIix/98ORtNcdQs3rF+02zBz8gzW0ifovd0y3sZcvN7NTTGzsbw/9U4e1pg==
X-Received: by 2002:a17:90a:4705:b0:219:255:78a6 with SMTP id h5-20020a17090a470500b00219025578a6mr37641747pjg.114.1669918729255;
        Thu, 01 Dec 2022 10:18:49 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id f23-20020a63dc57000000b004639c772878sm2848115pgj.48.2022.12.01.10.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:18:48 -0800 (PST)
Date:   Thu, 1 Dec 2022 18:18:45 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, x86@kernel.org,
        Maxim Levitsky <mlevitsk@redhat.com>,
        linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>, kvm@vger.kernel.org,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: emulator_leave_smm(): Error handling issues
Message-ID: <Y4jwBahPrkwOI3w9@google.com>
References: <202212010825.8589611F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212010825.8589611F@keescook>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 01, 2022, coverity-bot wrote:
> Hello!
> 
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20221201 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
> 
>   Wed Nov 9 12:31:18 2022 -0500
>     1d0da94cdafe ("KVM: x86: do not go through ctxt->ops when emulating rsm")
> 
> Coverity reported the following:
> 
> *** CID 1527763:  Error handling issues  (CHECKED_RETURN)
> arch/x86/kvm/smm.c:631 in emulator_leave_smm()
> 625     		cr4 = kvm_read_cr4(vcpu);
> 626     		if (cr4 & X86_CR4_PAE)
> 627     			kvm_set_cr4(vcpu, cr4 & ~X86_CR4_PAE);
> 628
> 629     		/* And finally go back to 32-bit mode.  */
> 630     		efer = 0;
> vvv     CID 1527763:  Error handling issues  (CHECKED_RETURN)
> vvv     Calling "kvm_set_msr" without checking return value (as is done elsewhere 5 out of 6 times).
> 631     		kvm_set_msr(vcpu, MSR_EFER, efer);
> 632     	}
> 633     #endif
> 634
> 635     	/*
> 636     	 * Give leave_smm() a chance to make ISA-specific changes to the vCPU
> 
> If this is a false positive, please let us know so we can mark it as

It's not a false positive per se, but absent a KVM bug the call can never fail.
Ditto for the kvm_set_cr{0,4}() calls above.  That said, I'm tempted to "fix"
these since we've had bugs related to this code in the past.  This doesn't seem
too ugly...

diff --git a/arch/x86/kvm/smm.c b/arch/x86/kvm/smm.c
index a9c1c2af8d94..621e39689bff 100644
--- a/arch/x86/kvm/smm.c
+++ b/arch/x86/kvm/smm.c
@@ -601,8 +601,9 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 
                /* Zero CR4.PCIDE before CR0.PG.  */
                cr4 = kvm_read_cr4(vcpu);
-               if (cr4 & X86_CR4_PCIDE)
-                       kvm_set_cr4(vcpu, cr4 & ~X86_CR4_PCIDE);
+               if (cr4 & X86_CR4_PCIDE &&
+                   WARN_ON_ONCE(kvm_set_cr4(vcpu, cr4 & ~X86_CR4_PCIDE)))
+                       return X86EMUL_UNHANDLEABLE;
 
                /* A 32-bit code segment is required to clear EFER.LMA.  */
                memset(&cs_desc, 0, sizeof(cs_desc));
@@ -614,8 +615,9 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 
        /* For the 64-bit case, this will clear EFER.LMA.  */
        cr0 = kvm_read_cr0(vcpu);
-       if (cr0 & X86_CR0_PE)
-               kvm_set_cr0(vcpu, cr0 & ~(X86_CR0_PG | X86_CR0_PE));
+       if (cr0 & X86_CR0_PE &&
+           WARN_ON_ONCE(kvm_set_cr0(vcpu, cr0 & ~(X86_CR0_PG | X86_CR0_PE))))
+               return X86EMUL_UNHANDLEABLE;
 
 #ifdef CONFIG_X86_64
        if (guest_cpuid_has(vcpu, X86_FEATURE_LM)) {
@@ -623,12 +625,14 @@ int emulator_leave_smm(struct x86_emulate_ctxt *ctxt)
 
                /* Clear CR4.PAE before clearing EFER.LME. */
                cr4 = kvm_read_cr4(vcpu);
-               if (cr4 & X86_CR4_PAE)
-                       kvm_set_cr4(vcpu, cr4 & ~X86_CR4_PAE);
+               if ((cr4 & X86_CR4_PAE &&
+                   WARN_ON_ONCE(kvm_set_cr4(vcpu, cr4 & ~X86_CR4_PAE)))
+                       return X86EMUL_UNHANDLEABLE;
 
                /* And finally go back to 32-bit mode.  */
                efer = 0;
-               kvm_set_msr(vcpu, MSR_EFER, efer);
+               if (WARN_ON_ONCE(kvm_set_msr(vcpu, MSR_EFER, efer)))
+                       return X86EMUL_UNHANDLEABLE;
        }
 #endif
 

