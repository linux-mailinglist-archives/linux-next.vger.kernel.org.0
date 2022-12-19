Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D93651480
	for <lists+linux-next@lfdr.de>; Mon, 19 Dec 2022 21:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbiLSU5D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Dec 2022 15:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232361AbiLSU4x (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Dec 2022 15:56:53 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009FC6150
        for <linux-next@vger.kernel.org>; Mon, 19 Dec 2022 12:56:52 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso14442916pjt.0
        for <linux-next@vger.kernel.org>; Mon, 19 Dec 2022 12:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AP0DPgy6juzYjbnmoSK4DSIse02YvBVHuic1zb1crI0=;
        b=n2Cb9GinsIjyEaT+YGxcLDI2zefP9STnyh6mk+easKE+YmRAE9neZPO5KKQ0un7hzA
         1WfQoF2Qy0Oo6ffwsDhxOVc59fCZU/OEXw2pDj+gQV0719Bol/qBcaBjr/N/1fCixHbV
         ii3Mixw1qykkBdRq56vPuUoU5eSuiWj0Y/li7hPZ1nkZn0PUrxr1Ssco3G6XWTYk0jUX
         q4f7k/NwuXW5lT7SorZpgTcJN3pVISAhO39PNgwLfXd7DlNY8/GHIY8XYdFgsXUjmFu0
         W9mV9ZnGjHaq6eAnzo7i3kzYthj9wRa40zLu/snuft72nTrG+Y3Azx55N1JgbakviMQY
         s+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP0DPgy6juzYjbnmoSK4DSIse02YvBVHuic1zb1crI0=;
        b=6ggLXCwhVUikwkZT8fjlP64Xo2xMUfQCOLWhyCDeVz4Omec3ZeWRA/Fjx0LtzHAZdC
         B8B/xH93M6ss+iwhQztceru23ABrezVVUgF+nIwtI7P/IrBYqHaQPdfW2iwWdNOtpN+k
         xyFqZ/rpmCZgsqbb+t+Oex802+4t4gim6NArKZ74HEzW1oeK7WoKoJRXyOzkI5kmW21p
         dZcmK+Uve/3x4/rlYGsqyUI/yC0tpYdPCmgOL1b2YJntJQs9ls4rSUlgyGu4d7o+wU+j
         HT1aTWkS7+6zt/uOauUOR+PVZIkCTfy5ApK5QXuJrLLkv5r5vWMA6ZDGFOatBfvfLR8R
         Nnqw==
X-Gm-Message-State: AFqh2kqluquMEhIfja5wrIwSkToCVOiw+ezlUejxQdJ6q9klrFJljzFR
        4HJrk/wAnDmRqdV7bntA1ABFr1+Az9NbWK8G
X-Google-Smtp-Source: AMrXdXuYwK2oZVtQXVR6Uo4lZSOvVHJU5q2NtoAiJA4PqmRch5RIgzCrcaxiZPZosP5g1PcjUUJE1g==
X-Received: by 2002:a17:902:e5cd:b0:189:b910:c6d2 with SMTP id u13-20020a170902e5cd00b00189b910c6d2mr1353085plf.1.1671483412369;
        Mon, 19 Dec 2022 12:56:52 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090311d200b00188f07c9eedsm7601657plh.176.2022.12.19.12.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 12:56:51 -0800 (PST)
Date:   Mon, 19 Dec 2022 20:56:48 +0000
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
Message-ID: <Y6DQEFYmjLTXvw/g@google.com>
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
> 5273     	} else if (vmx->nested.hv_evmcs && vmptr == vmx->nested.hv_evmcs_vmptr) {
> 5274     		nested_release_evmcs(vcpu);
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1527765 ("Error handling issues")
> Fixes: 55d2375e58a6 ("KVM: nVMX: Move nested code to dedicated files")

Nit on the bot, if it's going to provide a Fixes without human verification, then
it should probably try to bisect (which I realize could get quite nasty).  Both
this VMCLEAR issue and the SMM issue report bogus Fixes due to code movement.  If
the blamed commit on this won't hadn't been so obviously wrong I likely would have
copy+pasted without ever verifying.

Maybe just omit the Fixes entirely and rely on the above "touched by commits" to
provide the developer with the hint?
