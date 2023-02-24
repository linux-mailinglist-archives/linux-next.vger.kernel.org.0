Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 022CC6A1679
	for <lists+linux-next@lfdr.de>; Fri, 24 Feb 2023 07:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjBXGI4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Feb 2023 01:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBXGIz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Feb 2023 01:08:55 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1148118163
        for <linux-next@vger.kernel.org>; Thu, 23 Feb 2023 22:08:53 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id ck15so52048293edb.0
        for <linux-next@vger.kernel.org>; Thu, 23 Feb 2023 22:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zrybPs7yLRk8zOYqc+oE+/CYZQA36UPQGXFFeAPS/7w=;
        b=QfhZpRvlVx3krzfCNC8WXyiqSsvOpl1LmLG3bJYd6bSCs+xfxNYITIiaH9RIkXiPkh
         VyLGMTU33AedEFRm9CyNStWfOR+7eujRFJPlpymys/t1pCym+rSYnFlx7GJ3es4S9Ahr
         F3pR65rJsiZYAxd++GIPJbZxdNWUJcvZEruRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrybPs7yLRk8zOYqc+oE+/CYZQA36UPQGXFFeAPS/7w=;
        b=NsoVtbJ/rtMV/1gkt/aeKnLFT19HGj9lhAwrU1UjuF6dquhoTZMhgn9B1/pC13su/X
         Tah8NZis7+kE+YI4F+6dasifesNq6kpYzdNNigrd3sovYOp60xPCufNzQqi+DgAh0Ko1
         4KJnQvxwkk2UWL1T3QoN9/o8QDHbYrJDPT4JTMC+qZylrKKNIxEtZchqnKOhAwKykSKv
         T08pWp3KfEvNY+EpblYTgSq/T+nBKz51DjkUMRTtDTUswjHHQ0Pv2bE5hc1BL8SaQ80k
         JvRtA1mxq5mG9Yyt3FF3xbPk0NgTTarpc8t//ebbiBpT4sMRBXZWhDAskKv6yuUV2JJ6
         N3YA==
X-Gm-Message-State: AO0yUKXvTY1W60Hf5ybLQ8rCoO3Q9wdcU4BhxF7DCvGvHiZbIwZmZ+t5
        nKFNPX1z7H0u3iqlCN+PHZ2ccAijfeL62iyOIVj5iA==
X-Google-Smtp-Source: AK7set/mHgFIeHycpQsEHJ6Vkt9eUoSnTM1OYBS7xB4Nvfw+vQAXaJpTw+7DRiJ3kaROtIBPcXmKBw==
X-Received: by 2002:a17:907:c706:b0:87f:5d0a:c610 with SMTP id ty6-20020a170907c70600b0087f5d0ac610mr26104181ejc.32.1677218931157;
        Thu, 23 Feb 2023 22:08:51 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id e19-20020a1709067e1300b008e7916f0bdesm2705357ejr.138.2023.02.23.22.08.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 22:08:50 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id cy6so45304197edb.5
        for <linux-next@vger.kernel.org>; Thu, 23 Feb 2023 22:08:50 -0800 (PST)
X-Received: by 2002:a17:906:8508:b0:8d0:2c55:1aa with SMTP id
 i8-20020a170906850800b008d02c5501aamr7814289ejx.0.1677218929973; Thu, 23 Feb
 2023 22:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20230220152938.45f62d5a@canb.auug.org.au> <Y/ODNJ3MfoD6dUru@casper.infradead.org>
 <20230221175436.599166f9@canb.auug.org.au> <20230223144722.635ab483@canb.auug.org.au>
 <5f228150-0e29-6d58-3dcf-776bc2a630b7@gmail.com> <20230224161128.0949d8ae@canb.auug.org.au>
In-Reply-To: <20230224161128.0949d8ae@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 23 Feb 2023 22:08:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=whssVtOq-6r-n6+=gVLC=zXCsr5TBq6Ke+JaGeQW3d8Cw@mail.gmail.com>
Message-ID: <CAHk-=whssVtOq-6r-n6+=gVLC=zXCsr5TBq6Ke+JaGeQW3d8Cw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm-stable tree with the ext4 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
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

On Thu, Feb 23, 2023 at 9:11 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> In which case we will have an ext4 filesystem in Linus' kernel that has
> no testing ... and if someone has done the testing, then they can at
> least supply the merge resolution that they tested.

Well, the good news is that it will have more testing than the cifs
resolution I did - if only because I actually have ext4 filesystems
that I'd test with.

I'm not claiming that's great either, of course. I think this whole
"convert from find_get_pages_range_tag() to filemap_get_folios_tag()
with very different semantics at the same time as all the writepages
work is done" was an absolutely *horrible* idea.

I actually considered doing the cifs merge by just keeping the old
format, and making a wrapper around "filemap_get_folios_tag()" that
would work one page at a time, just to avoid the whole "do two changes
at once" issue.

But then I - probably from some excessive hubris - decided I could
just rewrite the whole thing without testing, and just get it right on
the first try.

I did have DavidH's suggestion to look at, but decided that was buggy,
so mine is actually fairly different.

Yes. I do think "excessive hubris" is probably the right word choice.
But "insanity" probably also comes close ;)

           Linus
