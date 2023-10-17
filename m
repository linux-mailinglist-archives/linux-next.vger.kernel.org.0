Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7E857CC8ED
	for <lists+linux-next@lfdr.de>; Tue, 17 Oct 2023 18:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbjJQQe6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Oct 2023 12:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjJQQe5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Oct 2023 12:34:57 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E18B0
        for <linux-next@vger.kernel.org>; Tue, 17 Oct 2023 09:34:56 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d9c6ab06242so520229276.2
        for <linux-next@vger.kernel.org>; Tue, 17 Oct 2023 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697560495; x=1698165295; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X65WPlmp9XykajrOx6/RehyTPY3jNtCsLQ1gt6i0dzs=;
        b=zeJz3jUDwhsTeGH+zuOibF52A0NPNTUGvVxQfzWNKPvWKlRRHyBTb47f1+XLi2UkN+
         XAkn4FSzXHunCO35rW5e0L2+AvKsdDAgksB/cz2lxhktQ+D17MtfOuMV0P+454dLSjj/
         TntH0PfzK+Jmpdp6BYskxDgbhpeURgiZSI/n8NwKv3RkHzLYo7lntrnuMnwqT7MSuzVP
         /+iSsD3maEpM0jrEsTODv/oJtQJWN885S2fK1u+XJ+cnaWxKNXBvInGwcp99cz08Ltl1
         7OOI7Wfq3ewSUD7o+KD4WB1bNPIuPJnU3dcmRNx8PI6OiYuxAKFAFXFPWQPmE+Ddl1xu
         MkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697560495; x=1698165295;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X65WPlmp9XykajrOx6/RehyTPY3jNtCsLQ1gt6i0dzs=;
        b=tffrzXKRfJYHyJncSwXEbrLNK/rR6a3lx6qX1AHOV6KmdUPLbgod4Xv8WWn/cY2m5K
         otxoEsbsnxetzE+KAuSFQ/i0rCXOV+L+UTAOq9G53If891V8Ze4/qFlQ8n3F6n4YmVAv
         WneNRSvc04QFdsbqQmCFKsEz2U5Ef8nPIcL+9LWYNM31gvo7sjnBhUcTJEjdk6HsdqkD
         YovfOq3xSNO7CdM4I75+RMMDrot+I3qh2kAjOXWC5hZFEFJNTopv8O96Lbfj8/l8x9Ha
         fYkh5RUsJCKf0H9JpfX9bCmWtqvznye2On8YFPmCTa7K3xXt+BN6p1OXJ8h/Pe0Ev+1O
         7kgQ==
X-Gm-Message-State: AOJu0Yw7uNTTra26IGLpitKMeB1le0KDzKaUZVKSJamDcI1gxcfUvIyF
        uox32ibsl4Y8CXLLLpf2GVLWEq45hJo=
X-Google-Smtp-Source: AGHT+IG9bnJ8aAQGfBRjflHfkUGVJgjpILlHjw0aiyldd8mafHmOXmaXct547LoZZbX7mr8iLLb2LYSR7jg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:987:b0:d9a:c680:893a with SMTP id
 bv7-20020a056902098700b00d9ac680893amr48280ybb.4.1697560495462; Tue, 17 Oct
 2023 09:34:55 -0700 (PDT)
Date:   Tue, 17 Oct 2023 09:34:53 -0700
In-Reply-To: <20231017153719.28884723@canb.auug.org.au>
Mime-Version: 1.0
References: <20231017153719.28884723@canb.auug.org.au>
Message-ID: <ZS63rfnjflvdKGHv@google.com>
Subject: Re: linux-next: duplicate patches in the kvm-x86 tree
From:   Sean Christopherson <seanjc@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 17, 2023, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   afb2c7e27a7f ("KVM: selftests: Force load all supported XSAVE state in state test")
>   d7b8762ec4a3 ("KVM: selftests: Load XSAVE state into untouched vCPU during state test")
>   ff0654c71fb6 ("KVM: selftests: Touch relevant XSAVE state in guest for state test")
>   27526efb5cff ("KVM: x86: Constrain guest-supported xfeatures only at KVM_GET_XSAVE{2}")
>   2d287ec65e79 ("x86/fpu: Allow caller to constrain xfeatures when copying to uabi buffer")

Should be resolved, dropped my kvm-x86/fpu branch.
