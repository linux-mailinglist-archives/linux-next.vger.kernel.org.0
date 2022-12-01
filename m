Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F30E63F539
	for <lists+linux-next@lfdr.de>; Thu,  1 Dec 2022 17:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbiLAQZz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Dec 2022 11:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbiLAQZx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2022 11:25:53 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F20A47EF
        for <linux-next@vger.kernel.org>; Thu,  1 Dec 2022 08:25:52 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id v3-20020a17090ac90300b00218441ac0f6so4509993pjt.0
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2022 08:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Hs75c2RhI6TXhTdmq3LNKwlHtjDutkhRkFYCtYKKrI=;
        b=Qpi4DGe/ljQZkxVzxzmv+mwMi5BwzACkFN6l31jQTjSBelVBkQ+PVUo3Xz03lrAst2
         zwJpCgGZQhZClhELY3Vy19Ae+NDtrzl+1S/d+CWrtVEgEwZ1vc5pLer3Pn5yNB2w7pA/
         eLesWhq2wJwal07BE5Ij1HetfU6apauIQlfJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Hs75c2RhI6TXhTdmq3LNKwlHtjDutkhRkFYCtYKKrI=;
        b=1MIO0/hx7N6/NKUobWMUDnPVcpmRWYR/MRbIHQA3Ca5DTs7yoH17BNdJWIbgOqDaJm
         Gh7H6NfRNruBxaxRZ8L0krlDA2L5XH4nS9aSdQOXjOZWhU0av9fDZiHI0KOk1HoxroCn
         e72ohYpuu9GTvfx+da5Z59BpUShHAD4YdK0650+Uhk90dv35oVNkZHflUndKbyzqacVW
         MJYrXKvyOP8Mt2OseHFVeX9oTwzzZ5gcJn3O3KU0/4yL7VM5JcU6PRSMsyrr79uIIbgF
         Ofny31YcBUJGbxCA28Ef14p66UDn5SggahbiMYY4P3lx2H/Pa5nVrM9r9b+mGdi9y3Pv
         wEWA==
X-Gm-Message-State: ANoB5pl2kN6Nsdh7uked5TgWE3DEPbZ6PaG/9zXDe8YaHyFNFpdFUJ0U
        FNMxSXC7I/NSVVTAb321S06Fag==
X-Google-Smtp-Source: AA0mqf5Yoi5gUr2+jfODvzG0lhgp9wysmv7TqcWatFoaSj460wZp7jPXjwuGpbg91q0r7SYRxRSPbg==
X-Received: by 2002:a17:90a:4594:b0:218:f745:76fe with SMTP id v20-20020a17090a459400b00218f74576femr39246937pjg.245.1669911952042;
        Thu, 01 Dec 2022 08:25:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q15-20020a17090311cf00b00176b63535adsm3861906plh.260.2022.12.01.08.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 08:25:51 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Thu, 1 Dec 2022 08:25:50 -0800
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Sean Christopherson <seanjc@google.com>, x86@kernel.org,
        Maxim Levitsky <mlevitsk@redhat.com>,
        linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>, kvm@vger.kernel.org,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: emulator_leave_smm(): Error handling issues
Message-ID: <202212010825.8589611F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221201 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Nov 9 12:31:18 2022 -0500
    1d0da94cdafe ("KVM: x86: do not go through ctxt->ops when emulating rsm")

Coverity reported the following:

*** CID 1527763:  Error handling issues  (CHECKED_RETURN)
arch/x86/kvm/smm.c:631 in emulator_leave_smm()
625     		cr4 = kvm_read_cr4(vcpu);
626     		if (cr4 & X86_CR4_PAE)
627     			kvm_set_cr4(vcpu, cr4 & ~X86_CR4_PAE);
628
629     		/* And finally go back to 32-bit mode.  */
630     		efer = 0;
vvv     CID 1527763:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "kvm_set_msr" without checking return value (as is done elsewhere 5 out of 6 times).
631     		kvm_set_msr(vcpu, MSR_EFER, efer);
632     	}
633     #endif
634
635     	/*
636     	 * Give leave_smm() a chance to make ISA-specific changes to the vCPU

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527763 ("Error handling issues")
Fixes: 1d0da94cdafe ("KVM: x86: do not go through ctxt->ops when emulating rsm")

Thanks for your attention!

-- 
Coverity-bot
