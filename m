Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F15E863F772
	for <lists+linux-next@lfdr.de>; Thu,  1 Dec 2022 19:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbiLAS1F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Dec 2022 13:27:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiLAS1D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2022 13:27:03 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF8FAC6EE
        for <linux-next@vger.kernel.org>; Thu,  1 Dec 2022 10:27:02 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so2918881pjo.3
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2022 10:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sCBLFunv2Vft5/XRro/hAOWRadbTKEK4P7Y2KdcX1BQ=;
        b=OP6By/1AvzitGVoe6OCVKnMfu76bUKILx3gGgbD+h1+QsNvMNawnoycQ8TPmxunfOR
         A08HwZhssjH+Tt2hruL2wUSTeFULUiIqFwsPG5K97RKE/Xh26QOrgk9hNI+mEKvAldzX
         CWVj9A23vfavCfyaR0bL1AaKpAU729e3NeD/lQKEHVj5tjsLG8A4aPBp0ZWuIaYNSn3U
         6KTy+DbDd1g6lD69AiiO4iQ/ny8C9zSVgSzRdaeB54oocOwiN2WVXwjplXCrSQvcPfg7
         LrYUlGaE7B+/m58rKjt7kIF009mKwj8K/rsB1AO9AHE0cxOLq2rajlOIco/jm16sXgMc
         QJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCBLFunv2Vft5/XRro/hAOWRadbTKEK4P7Y2KdcX1BQ=;
        b=D3hBCJ3HV1NUNKYA+2s510ndPw5EOfocfcw+UE1NLQ/XrY8EvhFSq+nYKBxeHvfBwz
         VhM3FuIevYVF4jldPseeOD/K4MW7XN+6u/09N7q6k5hVmJlMAlsy4ufYOsdhDZnqq/Qw
         1DwafWCFILZO/r2NbS/NPNJ91D4PmSfpOJsr1VEMbWNTDYBNBkeq2fRXvni1SoYQX7DG
         V/euEsHtHbPwRb3wKJrPfo3H9RpD/9wuvcS9LliRlaOF4LpSIw5mHYedNik5m58vANcK
         wH6GfaS5BUOXOEIed1pOO3iRI21C5oM9dRifE9EuKqcPLDdiM/OqXfM/f8LsM3xiTNyN
         SgjA==
X-Gm-Message-State: ANoB5pmSi798jbiDJGGb6DqfxGSZY96ikTyzeb1BpRo1C+lvad1hY0vq
        y1ZTWw4LcfUMFH0qtqvter3urw==
X-Google-Smtp-Source: AA0mqf5Kj0VTFrTLLNw4nbHetuhYfq0yeD8jThvqN47Qa724OS1pxVHFDoKY65/KolPkxxqzpYGktg==
X-Received: by 2002:a17:90b:3012:b0:219:63d9:516c with SMTP id hg18-20020a17090b301200b0021963d9516cmr9882790pjb.108.1669919221995;
        Thu, 01 Dec 2022 10:27:01 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id z36-20020a630a64000000b0046ec7beb53esm2864431pgk.8.2022.12.01.10.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:27:01 -0800 (PST)
Date:   Thu, 1 Dec 2022 18:26:57 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        kvm@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: handle_vmclear(): Error handling issues
Message-ID: <Y4jx8UPHg06ylxT6@google.com>
References: <202212010825.C23022D@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212010825.C23022D@keescook>
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
>   Fri Dec 14 17:59:46 2018 +0100
>     55d2375e58a6 ("KVM: nVMX: Move nested code to dedicated files")
> 
> Coverity reported the following:
> 
> *** CID 1527765:  Error handling issues  (CHECKED_RETURN)
> arch/x86/kvm/vmx/nested.c:5269 in handle_vmclear()
> 5263     	 */
> 5264     	if (likely(!guest_cpuid_has_evmcs(vcpu) ||
> 5265     		   !evmptr_is_valid(nested_get_evmptr(vcpu)))) {
> 5266     		if (vmptr == vmx->nested.current_vmptr)
> 5267     			nested_release_vmcs12(vcpu);
> 5268
> vvv     CID 1527765:  Error handling issues  (CHECKED_RETURN)
> vvv     Calling "kvm_vcpu_write_guest" without checking return value (as is done elsewhere 7 out of 8 times).
> 5269     		kvm_vcpu_write_guest(vcpu,
> 5270     				     vmptr + offsetof(struct vmcs12,
> 5271     						      launch_state),
> 5272     				     &zero, sizeof(zero));

Good bot.  Some day we'll hopefully do more than freak out if writing guest memory
fails, so I think we want this:

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index b28be793de29..938900c0c994 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5266,10 +5266,12 @@ static int handle_vmclear(struct kvm_vcpu *vcpu)
                if (vmptr == vmx->nested.current_vmptr)
                        nested_release_vmcs12(vcpu);
 
-               kvm_vcpu_write_guest(vcpu,
-                                    vmptr + offsetof(struct vmcs12,
-                                                     launch_state),
-                                    &zero, sizeof(zero));
+               r = kvm_vcpu_write_guest(vcpu,
+                                        vmptr + offsetof(struct vmcs12,
+                                                         launch_state),
+                                        &zero, sizeof(zero));
+               if (r)
+                       return kvm_handle_memory_failure(vcpu, r, NULL);
        } else if (vmx->nested.hv_evmcs && vmptr == vmx->nested.hv_evmcs_vmptr) {
                nested_release_evmcs(vcpu);
        }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7f850dfb4086..8f720107b77c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13123,6 +13123,9 @@ int kvm_handle_memory_failure(struct kvm_vcpu *vcpu, int r,
                              struct x86_exception *e)
 {
        if (r == X86EMUL_PROPAGATE_FAULT) {
+               if (KVM_BUG_ON(!e, vcpu->kvm))
+                       return -EIO;
+
                kvm_inject_emulated_page_fault(vcpu, e);
                return 1;
        }
