Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C64C21A4AEC
	for <lists+linux-next@lfdr.de>; Fri, 10 Apr 2020 22:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgDJUNe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Apr 2020 16:13:34 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43117 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgDJUNe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Apr 2020 16:13:34 -0400
Received: by mail-lj1-f193.google.com with SMTP id h25so3037171lja.10
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2020 13:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9VjQx3sNHjM9Ybj3pkSSt2cbo4c8KdpiMcEUyZvcRTo=;
        b=UOOqKTuXJVB5DXty2pYL9sGwg5sKoaPO1nkz6bubzMgOw3mgqg/9f+d87SHPIUvrn6
         9yxpYYsgN6kaa4psBhtDf7aR34kNFUq8TM8itWny38GWbXMhsFd6wadAZV0acAAS5poB
         j31L3xH37rrb4O1RLNKQQgE68i9bKbaWVBk04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9VjQx3sNHjM9Ybj3pkSSt2cbo4c8KdpiMcEUyZvcRTo=;
        b=gbhek+iRk88Q50K8Edhe3F1bw6ZIu8hzSkixlEfI+qmgGEnv3lfUBvXcZAI+S3ZUrN
         NreEjeNGYhj5YYD92r6GPy+BpHEv/xBiK2xYmn3oDq71bCJnPBwMzS9MnxBjcKBO9WIU
         JfyOdhO0t4HnI/KGrhAIm5FoGNu9mVzTpb00P/0RfGVyFfV0KFHVX8l7w45q/CyoKkPj
         U1mFBsK9p/Fjqgfu2PjBg3G5svbZaNb0vzWRCcpb5ixhy/AzUSDKHRcDSHoPFa7fPT7e
         k3zir6WYGF0efEE6uwr/2Z0QvkJb8Hph0uh/PKUmJQgjqLdbyEJvYcwO8SYCwuUnxl5l
         gp8A==
X-Gm-Message-State: AGi0PuY5CTu2QmU/OIPtsCGFclAhrGx7DmM/lbcMX4fhAVX6OK2JHAdM
        xYkWJvUUoW5jlLYMy0pYZN7pQrXlin0=
X-Google-Smtp-Source: APiQypLMu7p4gmARvK+/uG56owwgDwgEK23pdGdrk3zUUBtwVGcFuW5P+SrPB/ZA/7wgck4V7S9rDg==
X-Received: by 2002:a2e:3812:: with SMTP id f18mr4048010lja.67.1586549610004;
        Fri, 10 Apr 2020 13:13:30 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id d9sm1731027ljg.39.2020.04.10.13.13.28
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 13:13:28 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 142so3049894ljj.7
        for <linux-next@vger.kernel.org>; Fri, 10 Apr 2020 13:13:28 -0700 (PDT)
X-Received: by 2002:a2e:a58e:: with SMTP id m14mr3857281ljp.204.1586549608204;
 Fri, 10 Apr 2020 13:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200410132706.170811b7@canb.auug.org.au> <27c212c4-b522-561d-411c-e74dc0ff0b74@infradead.org>
 <CAHk-=wjhsM-n_NzSh=cSdpThX+62-x3EmyKjhMqGHFYEyG0nPg@mail.gmail.com>
 <2b0f5d2e-3fe5-10c9-2a9a-9a0b341a52d5@infradead.org> <CAHk-=wjXZSPPWzPs=KBDsLZWuq8qO=9qWfiKHw=yV10fFrDv9Q@mail.gmail.com>
 <bfbcaa67-9656-3a80-fc66-c937297c8be0@infradead.org>
In-Reply-To: <bfbcaa67-9656-3a80-fc66-c937297c8be0@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 10 Apr 2020 13:13:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=whpvCqcCYvy=_v_F6NTtBSeQbXZ0iLr_smV2NJLT+XACw@mail.gmail.com>
Message-ID: <CAHk-=whpvCqcCYvy=_v_F6NTtBSeQbXZ0iLr_smV2NJLT+XACw@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 10 (lib/test_printf.ko)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 10, 2020 at 12:41 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 4/10/20 12:05 PM, Linus Torvalds wrote:
> >
> > That may be because of something like a DEBUG_INFO_REDUCED option.
>
> No, that's enabled. (see below)

That's kind of the point. DEBUG_INFO_REDUCED doesn't do the _full_ debug info.

And honestly, that's the right thing for 99% of all people. The full
debug info is _huge_. Enormous. It takes up lots of space, and it
makes for slower builds.

So normal people should use REDUCED.

But the full debug info does give some nicer debug stack traces with
dump_stack.sh, so for things like automated robots etc it's a great
thing.

> This is with FRAME_POINTER, not UNWIND_ORC. Maybe that's the difference?

That might cause the question marks and some additional uncertainty in
the underlying raw stack traces that the kernel reports, but no, it
shouldn't matter for what dump_stack.sh does.

               Linus
