Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F7C6A24D5
	for <lists+linux-next@lfdr.de>; Sat, 25 Feb 2023 00:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjBXXBh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Feb 2023 18:01:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjBXXBg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Feb 2023 18:01:36 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BF266951
        for <linux-next@vger.kernel.org>; Fri, 24 Feb 2023 15:01:35 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id i34so3327426eda.7
        for <linux-next@vger.kernel.org>; Fri, 24 Feb 2023 15:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg3E9MD03sMZ5EAXXDkRbOWuc4O2GoPxS+AaaBN2r9o=;
        b=SS2lXO49JnG1/vM1ng6i05vmXKtRlYWwABgq0Qu/efvdwaym+x/YMOImEryB+YmS1Q
         DKDbVw+CGs27Dcz/kl6vXHzN2BA3DRUvswyZN6u8kZmb5PgmZ/R6yV+XH3ioHh83B+RO
         3wOcg4VreRoYI4T86GyzREuqp/ND+S012VaAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wg3E9MD03sMZ5EAXXDkRbOWuc4O2GoPxS+AaaBN2r9o=;
        b=dAArwwm2GE51M0ChB06kn6xfsTJvTNfzpvZ/taIKn/+rMy5Vi3Snp4JuZF0YAXf7eQ
         2zFhdRVsX8VYYdUdnnt8qo3b7TPvn9Tn1hIB6EpKTW+vkBIqJb0xzoXiHYgjXg7AleTf
         +YZrBFzWrLb9AyI/zmJ/EgUtrWW/EiZXQkfUJW+GJwOR4ujGBDMIsVuoahEkWgkv33c+
         w8u5b6qoao0nrccmiYNtBPy4FPLEkwQZm+15b6P3JB0S7+CihJdCOVwLmjka6cD0COtV
         LAsGjYLKm6AjXHUnuN2X8uCL96D0JNLmyDeDRL35tSgtVSZL6Zfb0uZxzefDxPBbjbLS
         nLnA==
X-Gm-Message-State: AO0yUKXuCiAlRjrjtd+n6Yeoz6VkgwhrYeCyVBFFSF6lVC8IYmbqNC+m
        CE2BwT3fjeKiAg8H43UayKaTR5tJUAetGa9hdhYgtQ==
X-Google-Smtp-Source: AK7set9VKUUdnkyGTfdBtYTqCJ7VcONs2DyfD3Dly4BosvPOJExhiPZyDw06cxkBRn/kdfjBXts2yQ==
X-Received: by 2002:a17:906:c309:b0:8aa:bea6:ce8b with SMTP id s9-20020a170906c30900b008aabea6ce8bmr23192370ejz.53.1677279693725;
        Fri, 24 Feb 2023 15:01:33 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a16-20020a170906469000b008de729c8a03sm106614ejr.38.2023.02.24.15.01.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 15:01:33 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id f13so3335206edz.6
        for <linux-next@vger.kernel.org>; Fri, 24 Feb 2023 15:01:32 -0800 (PST)
X-Received: by 2002:a17:906:40cc:b0:877:747d:4a82 with SMTP id
 a12-20020a17090640cc00b00877747d4a82mr12083350ejk.0.1677279691776; Fri, 24
 Feb 2023 15:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20230220152938.45f62d5a@canb.auug.org.au> <Y/ODNJ3MfoD6dUru@casper.infradead.org>
 <20230221175436.599166f9@canb.auug.org.au> <20230223144722.635ab483@canb.auug.org.au>
 <5f228150-0e29-6d58-3dcf-776bc2a630b7@gmail.com> <20230224161128.0949d8ae@canb.auug.org.au>
 <CAHk-=whssVtOq-6r-n6+=gVLC=zXCsr5TBq6Ke+JaGeQW3d8Cw@mail.gmail.com> <Y/k4Jvph15ugcY54@mit.edu>
In-Reply-To: <Y/k4Jvph15ugcY54@mit.edu>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 24 Feb 2023 15:01:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjnL81j5WvDr_R3Rg9k9fw94RxRM0xJsQgiWUjPZimF5w@mail.gmail.com>
Message-ID: <CAHk-=wjnL81j5WvDr_R3Rg9k9fw94RxRM0xJsQgiWUjPZimF5w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm-stable tree with the ext4 tree
To:     "Theodore Ts'o" <tytso@mit.edu>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 24, 2023 at 2:20 PM Theodore Ts'o <tytso@mit.edu> wrote:
>
> 3)  I'll then send the ext4 dev branch (minus the data=writepage
> cleanups) as a pull request to Linus.  Next week, after Jan has a
> chance to review my patch conflict resolutions, I'll send a second
> pull request with the data=writepage cleanups.  (As usual, I'll do my
> full set of test runs before sending the pull request.)
>
> Linus, are you OK with this plan?

Yeah. I think the whole "do two completely different things to the
same area in parallel" was horrible, and we should strive to avoid
that kind of thing in filesystems in general.

So let's just serialize them instead of doing them at the same time
and try to merge them together.

Even if the merge is then successful, it just seems unnecessarily
risky from a "what if somebody reports a problem, and it bisects to
the merge, and then we have something subtle going on".

              Linus
