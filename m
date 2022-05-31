Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 632BB539511
	for <lists+linux-next@lfdr.de>; Tue, 31 May 2022 18:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346222AbiEaQqJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 May 2022 12:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346218AbiEaQqI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 May 2022 12:46:08 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D896A994F6
        for <linux-next@vger.kernel.org>; Tue, 31 May 2022 09:46:06 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id jx22so27717295ejb.12
        for <linux-next@vger.kernel.org>; Tue, 31 May 2022 09:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cNojDTLao1Z4XaYj65XKMONnf5xkNz1oGm9Mhmr9dio=;
        b=CdOghQEWfzmHS/gYSBGNd2Zmo1WoX6ZkLgkCYy4aXw3cor8o5NKLh7p51XrC/HhmLq
         nqmBc2kzlyllIM3gXBiyxhqltGuDh6eA6pYyLHt9jrZV8Z3Jc247vcE5OAL7jFLRBqiL
         2+pwqtApnzyaED7q1C+yxi0D5kHjxYNEbpUQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNojDTLao1Z4XaYj65XKMONnf5xkNz1oGm9Mhmr9dio=;
        b=BWNH4n0LjvabovnTE5oaH6dP14B4BRKYVcuRLfbyoDC+9JproWvr/LTZeDtjVRcgwR
         iFvOq+cAjCwZfoAxnNQd38w6oRsHV0oKt/ZaHxb7sgTPg4TLAjRXYbFuZSQmBOsvpFBP
         KkEngY4XA3IUrFx5xeiguJmQlFtR1L5mA3pf3W7LRrmlpHDQ33H7xL5CVDxfVW/PRirZ
         kSyPs2+ZA9F78rq3t10kJf88HLb+DqF7BybPJdCCTbz4UJn/uZOlhBui/s1zzvPnn0JE
         bhryITt0HRc0AmW7XPS4cfMjCR87vu5abE+RjfUVIkPSzR5a7VljCxhrq2q9GdTfz1fU
         U+Zg==
X-Gm-Message-State: AOAM531k5C/pY1jcRMMAsZ2ZEI5rJCEB9GZrFA3G1Zw33ihylny0g+20
        jzsrDmwJ+ow74h03uGm7urB6pWnxbx03asRs
X-Google-Smtp-Source: ABdhPJzBYJ6gB4TEvstzV0THuzpMREOZEZRFtf7/WaFZXeZOyFLN+6ghN0sl6N/KZH6yuyHE44xThw==
X-Received: by 2002:a17:907:3e96:b0:6fe:b339:2e39 with SMTP id hs22-20020a1709073e9600b006feb3392e39mr46687813ejc.271.1654015565141;
        Tue, 31 May 2022 09:46:05 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id l7-20020a1709066b8700b006fec9cf9237sm5147250ejr.130.2022.05.31.09.46.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 09:46:04 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id q7so8522775wrg.5
        for <linux-next@vger.kernel.org>; Tue, 31 May 2022 09:46:03 -0700 (PDT)
X-Received: by 2002:a05:6000:16c4:b0:20f:cd5d:4797 with SMTP id
 h4-20020a05600016c400b0020fcd5d4797mr39830737wrf.193.1654015563235; Tue, 31
 May 2022 09:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220531104424.0a467ba4@canb.auug.org.au> <9353ac77-f473-3f64-7e61-566807cd47e2@I-love.SAKURA.ne.jp>
In-Reply-To: <9353ac77-f473-3f64-7e61-566807cd47e2@I-love.SAKURA.ne.jp>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 31 May 2022 09:45:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi4wyvuXs0SUq-2x=XHxWmJ6jVKRD-WpE0kWgWiqVJNbg@mail.gmail.com>
Message-ID: <CAHk-=wi4wyvuXs0SUq-2x=XHxWmJ6jVKRD-WpE0kWgWiqVJNbg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the tomoyo tree
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 30, 2022 at 9:32 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Yes, currently there are many matches when building all modules.
> But do developers build all modules?

They had better. Every time you change a core header file, you'd
better check it. And the minimum check is "build as much as you can on
your primary architecture", which is usually something like
'allmodconfig'.

> Hmm, an important part which was missing in commit 771c035372a036f8 ("deprecate
> the '__deprecated' attribute warnings entirely and for good") is that Linus
> builds all modules and reads all messages during the build?

Indeed. I do an 'allmodconfig' build between every single pull  I do
(except when traveling - it gets too painful on a laptop), and often
do a couple of other builds too (ie I have my own "machine config"
that I also do).

And yeah, I will complain if that build is not quiet. The standard
kernel build needs to be _clean_, because that's the only way you
notice when new problems happen.

                 Linus
