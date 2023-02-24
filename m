Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA9F6A1672
	for <lists+linux-next@lfdr.de>; Fri, 24 Feb 2023 07:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjBXGBr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Feb 2023 01:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjBXGBq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Feb 2023 01:01:46 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FF5737571
        for <linux-next@vger.kernel.org>; Thu, 23 Feb 2023 22:01:45 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id da10so51973250edb.3
        for <linux-next@vger.kernel.org>; Thu, 23 Feb 2023 22:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s8trhdyXMwKOxRlrbXpbVcz3CsltizxKWND/hlf/M2I=;
        b=C6C6z6vh6WHPnogSJliX+y8RZ/ohNh4ra7mjmuLYthgkD6do5jegYHQx9fe1zUm5kX
         LzSg22lZhEjDV5AjAmaQXrIfqzi4UIvGnxYjZ2LV4ob1jY5isUMY6OZaNOzDzJY2Eac9
         VU78YkMp35eoh5YuOdaekJkO5qXhticIo0C2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8trhdyXMwKOxRlrbXpbVcz3CsltizxKWND/hlf/M2I=;
        b=O4+vAz6jjtvy/LerMrV1ZN/C31rdmc/3xoiNCHXbq7nKHVAa9ArZVtFGill2rvEpCk
         B2pjWg3XJ27etdwakhJWNn6EF709d1vUNuJBJYpR4S8oWTZcYuW1nMWi//+lfgjtR0GT
         pNHN1bfLajEScaYwLav1n6m6jGF3R4b9X9iCs3NdWWBuJt9l+zdIXW/ehXA20xVe99H5
         NjeyxRLLh+PB1km1Pv+rG1FnzD5e3xIfVSUljxP6Ro1Hnawy+gQodu4/Mhu8DVcmqFSp
         wNJ7ul6KqxgTubSBuyIc6z6SgmHOmDyHvruyN7RzvA3mrzmlvx8m8llogTBsvoDOe290
         g+UA==
X-Gm-Message-State: AO0yUKVYVE9kv9AmxezebeHveABsbdlhE9fymoQIK9RMTcK2Q7rGFVkq
        Hdw7V0Y+MyEH9BEM/SDNa5cliK25a94VdH3kLsywOg==
X-Google-Smtp-Source: AK7set81UtsAkB9P8cbEHzv/SMuDiZ7hCfbXzRNIt1OVVW4UAiQnYYcE96cL5pyOK3RDvq1tnCFIoA==
X-Received: by 2002:a17:906:71c2:b0:88d:2a41:2a4b with SMTP id i2-20020a17090671c200b0088d2a412a4bmr20769444ejk.60.1677218503629;
        Thu, 23 Feb 2023 22:01:43 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id md16-20020a170906ae9000b008cafeec917dsm6770316ejb.101.2023.02.23.22.01.42
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 22:01:42 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id s26so50703113edw.11
        for <linux-next@vger.kernel.org>; Thu, 23 Feb 2023 22:01:42 -0800 (PST)
X-Received: by 2002:a17:906:4f0a:b0:878:561c:6665 with SMTP id
 t10-20020a1709064f0a00b00878561c6665mr10274948eju.0.1677218502530; Thu, 23
 Feb 2023 22:01:42 -0800 (PST)
MIME-Version: 1.0
References: <20230127165912.0e4a7b66@canb.auug.org.au> <20230127131142.yrlel7df3yvp56rx@quack3>
 <20230201084741.0ca1c414@canb.auug.org.au> <20230224154010.17a5b949@canb.auug.org.au>
In-Reply-To: <20230224154010.17a5b949@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 23 Feb 2023 22:01:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiCrVFpwP6h=US7K=T=aYQuHCRc06cy8K8Y5upTQfQsAQ@mail.gmail.com>
Message-ID: <CAHk-=wiCrVFpwP6h=US7K=T=aYQuHCRc06cy8K8Y5upTQfQsAQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Thu, Feb 23, 2023 at 8:40 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I think Linus may have missed the last 2 changes in this merge
> resolution ...

Well, not exactly missed, in that I didn't actually even look at it,
because that one wasn't one I worried about (unlike the cifs one that
I'm very leery of).

And I actually really dislike your particular resolution and wouldn't
prefer it done that way anyway. It mixes folios and pages in ugly
ways.

Either do it all with the page pointer (like I did), or convert it
*all* to be folios, but don't do that odd "use a mixture of both
intertwined".

Of course, I do see _why_ you are mixing 'page' and 'folio' - there's
no memcpy_to_folio() helper (although once it eventually exists it
might be called "memcpy_to_file_folio()" to match the naming of the
"from" version).

But that's exactly why I stopped where I stopped - I think it's
pointless doing the other conversions when you can't easily do that
memcpy_to_page() one.

So I think the UDF folio conversion needs a bit more infrastructure to
really work well.

(There's also the whole kmap issue - we don't kmap whole folios, only
individual pages, so a "real" folio conversion would have to have a
loop).

End result: I explicitly left it in its minimal form, because I think
anything else is a "future endeavor". The udf code only works with
page-sized folios, and pretending anything else (using
"folio_unlock()" etc) would be just that - pretending

               Linus
