Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1084563FBE2
	for <lists+linux-next@lfdr.de>; Fri,  2 Dec 2022 00:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbiLAXWv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Dec 2022 18:22:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbiLAXWu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2022 18:22:50 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65CAA2252C
        for <linux-next@vger.kernel.org>; Thu,  1 Dec 2022 15:22:48 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id 124so3382144pfy.0
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2022 15:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S55j1GM26l88fCy8Cwvgg1U+53HZFDkiSHsMw4aLUOg=;
        b=B5JEM5AvjXgpEVamzuf8eGSnPsd/ZyjSbjDL/1h1I+QGbLhYvNWxN/GvwJsZ9Hnk6U
         fSsUUB2XCABsd5N8c/kuaZlFUimXjDi2XcML/IxiXvPtraObdRIrG6FvQxVzMso3Ai2m
         V31M/9uhRF5yvwhbaIr317ihQfnl71bRfUpOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S55j1GM26l88fCy8Cwvgg1U+53HZFDkiSHsMw4aLUOg=;
        b=CKAsg5XLkzKsCIM7FtwOh9mdXd66LGIreYHHPdhTZaZ7elpPbviS/Btlf1dI/1FIsd
         4ra0kmWJWPMq3fOFl57D3zwW7WtauKvE7j6H+3ehyCr2XXfZvq4NBa3jkMZ4v+6cnO7i
         HYE9Owzvh8S4GW0RwWsu/G4Kg1yRijFUbi9leC2Iai+NiFf0hbz4eIymeLPEAne5HHpk
         lxvLKFJDfNfyuFusn9Dq6B+W/kPu+gClQ11m84vrSdFrsVX73ZuS2Dm+XxTzjS1WjpZG
         mJsAD99INOhlhovBmA76ibqaSUjHPBife1SD6RVSGUYPpKwzELG0lbX67AQwbGCyb690
         uzvQ==
X-Gm-Message-State: ANoB5pnSkbdEbU5R98lI3ewaXtZqyUXhhVgXWaYZAm8XNZDv0poDwD+U
        L1xe/v7ySGmMrnHIFrxQQXvIyg==
X-Google-Smtp-Source: AA0mqf7fZxs4hLpJQQbUuA0FCBTxjIxpVNLkOGaREDWVex2GFWW/6G0JzwsrZ3tOTgk3YMpayim+/w==
X-Received: by 2002:a63:495e:0:b0:43c:a5cb:5d1b with SMTP id y30-20020a63495e000000b0043ca5cb5d1bmr43861545pgk.134.1669936967871;
        Thu, 01 Dec 2022 15:22:47 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i17-20020a170902c95100b001870dc3b4c0sm4263317pla.74.2022.12.01.15.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:22:47 -0800 (PST)
Date:   Thu, 1 Dec 2022 15:22:46 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Sean Christopherson <seanjc@google.com>
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
Message-ID: <202212011522.0A318649@keescook>
References: <202212010825.8589611F@keescook>
 <Y4jwBahPrkwOI3w9@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4jwBahPrkwOI3w9@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 01, 2022 at 06:18:45PM +0000, Sean Christopherson wrote:
> On Thu, Dec 01, 2022, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental semi-automated report about issues detected by
> > Coverity from a scan of next-20221201 as part of the linux-next scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by commits:
> > 
> >   Wed Nov 9 12:31:18 2022 -0500
> >     1d0da94cdafe ("KVM: x86: do not go through ctxt->ops when emulating rsm")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1527763:  Error handling issues  (CHECKED_RETURN)
> > arch/x86/kvm/smm.c:631 in emulator_leave_smm()
> > 625     		cr4 = kvm_read_cr4(vcpu);
> > 626     		if (cr4 & X86_CR4_PAE)
> > 627     			kvm_set_cr4(vcpu, cr4 & ~X86_CR4_PAE);
> > 628
> > 629     		/* And finally go back to 32-bit mode.  */
> > 630     		efer = 0;
> > vvv     CID 1527763:  Error handling issues  (CHECKED_RETURN)
> > vvv     Calling "kvm_set_msr" without checking return value (as is done elsewhere 5 out of 6 times).
> > 631     		kvm_set_msr(vcpu, MSR_EFER, efer);
> > 632     	}
> > 633     #endif
> > 634
> > 635     	/*
> > 636     	 * Give leave_smm() a chance to make ISA-specific changes to the vCPU
> > 
> > If this is a false positive, please let us know so we can mark it as
> 
> It's not a false positive per se, but absent a KVM bug the call can never fail.
> Ditto for the kvm_set_cr{0,4}() calls above.  That said, I'm tempted to "fix"
> these since we've had bugs related to this code in the past.  This doesn't seem
> too ugly...

Yeah, that's what I've done with similar cases. "This should be
impossible" get a WARN_ONCE and fail gracefully.

-Kees

-- 
Kees Cook
