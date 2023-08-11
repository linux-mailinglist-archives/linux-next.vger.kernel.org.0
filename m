Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C55197791E1
	for <lists+linux-next@lfdr.de>; Fri, 11 Aug 2023 16:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236039AbjHKOa3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Aug 2023 10:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235397AbjHKOa3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Aug 2023 10:30:29 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6076D2D78
        for <linux-next@vger.kernel.org>; Fri, 11 Aug 2023 07:30:28 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d66d85403f5so844031276.2
        for <linux-next@vger.kernel.org>; Fri, 11 Aug 2023 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691764227; x=1692369027;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+GMD8mZlyVfifzv/ndRqn1h4dvoCt7rexnp0s7wl+8=;
        b=hBVWGZz8qhFlB4iGeCj2O9bRCIGDd8+iGa2V9DdR+8YSSuTq44QEMxH4UVb5z3KcGl
         SvGCKaOPbr9W4BtIeqRv4WmD1287D/eAI+SkNlraRS+gpJImllMfuEjyLI2B6FtrEIw6
         uF/7V19VRBhOKn16x5RklcaE2kTLEiuavBEa0CrfFx8kGMhqQR99O35J0JM8sngsUzBx
         N6in0eb6zmIm0QIGytHJ0wg4CRF6TzQJLytnF9XO7OqGRnF4WfL0uI5tiNYPLpN4OLX5
         +VEFVl4I1VL/pu8ijYAu1hUY8QpDz2DQouGaFH4FAqepCDE60kJ//RVJhjVcGY5DuDRp
         UdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691764227; x=1692369027;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d+GMD8mZlyVfifzv/ndRqn1h4dvoCt7rexnp0s7wl+8=;
        b=X33KsEL5sC4quZ3R6c+HFQBpl2UlQbDtrMqtNu2NeMIci4NaGUC6Ko2QwbuELsr2Is
         omJBv/mFQi2tLBPiHqANez/ZoxV8ynPHEEWaAIKVvbTTEDBOfRA/I/ScNRYCOTwyswS8
         zYNgNNgcSB53YMk/Squn8UOPnV6IzWLkW3bcLmWtaF3A9Uer6IHMvFde4V1vZcNeH7Cu
         H0WMZiG4GDGKZ9y6/vJpSYHgwcVKu1Qv3FsaFNEYWhybhTkc/VgYZuiHa0wyKQ2I1rGW
         tl3e1VHCTt+7unyQ5f7uq7k5LRm7ZYirxFZmE4NixbbocI4GOJVZvxXEMj5MI85jBP1/
         MjAQ==
X-Gm-Message-State: AOJu0YxeZuhJgmK4vqHrKq+FKGTSfyjYKOMxEX4gHr9RhyvWWeMIFB0d
        ukmobk4ImqccRq40puE7ZGhTMU8viBM=
X-Google-Smtp-Source: AGHT+IE33lrnYvERPkhF79oAVBOVoEU3v59dJ2RthpMsPnbew0iZgxB0b5RWhHlOBnyqVfyaO4Aw4ONjGOs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:6854:0:b0:d05:7ba4:67f9 with SMTP id
 d81-20020a256854000000b00d057ba467f9mr32202ybc.3.1691764227710; Fri, 11 Aug
 2023 07:30:27 -0700 (PDT)
Date:   Fri, 11 Aug 2023 07:30:25 -0700
In-Reply-To: <fed6f74a-244a-ce07-0018-e6c26f594dd3@amd.com>
Mime-Version: 1.0
References: <de474347-122d-54cd-eabf-9dcc95ab9eae@amd.com> <ZNVopRMWRfBjahB9@google.com>
 <fed6f74a-244a-ce07-0018-e6c26f594dd3@amd.com>
Message-ID: <ZNZGAVMYOEIlBnrv@google.com>
Subject: Re: next-20230809: kvm unittest fail: emulator
From:   Sean Christopherson <seanjc@google.com>
To:     Srikanth Aithal <sraithal@amd.com>
Cc:     kvm@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 11, 2023, Srikanth Aithal wrote:
> On 8/11/2023 4:15 AM, Sean Christopherson wrote:
> > On Thu, Aug 10, 2023, Srikanth Aithal wrote:
> > > Hello,
> > > 
> > > On linux-next 20230809 build kvm emulator unittest failed.
> > > 
> > > ===================
> > > Recreation steps:
> > > ===================
> > > 
> > > 1. git clone https://gitlab.com/kvm-unit-tests/kvm-unit-tests.git
> > > 2. export QEMU=<location of QEMU binary> I used v8.0.2
> > > 3. cd kvm-unit-tests/;./configure;make standalone;tests/emulator
> > 
> > What hardware are you running on?  I've tested on a variety of hardware, Intel
> > and AMD, and haven't observed any problems.
> I am running it on Dell PowerEdge r6515. Same tests were passing till
> next-20230808.

Ah, let me try an actual linux-next build (once I get the darn thing to compile).
I was assuming I broke something in kvm-x86/next and so was testing that.  But I
haven't pushed to kvm-x86/next since 08/03, so presumably the bug came in from
somewhere else.

Ugh, it's probably one of the recent mitigations.  Those things always break stuff
due to getting thrown in without going through the usual channels.

<time passes>

*sigh*  Yep.  Everything is hunky dory until I turn on CONFIG_CPU_SRSO.  I'll dig
into it today.
