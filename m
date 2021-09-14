Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB81340A2A1
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 03:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237014AbhINBjR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Sep 2021 21:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237732AbhINBjO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Sep 2021 21:39:14 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3B6C061760
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 18:37:58 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id p15so20687037ljn.3
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 18:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vaxVMoYr01ooBsRLl+9NrQ8wh4tzlePArs6uZi+Ocvk=;
        b=LWKknnDlMezAs3gUXR3kh/QfVsbTeK+nWV3l/0fmyZ2xNtUAX8M6drYh43BUMBEtMD
         GDa6WkmcV7mH8tsO4kjdyzm6FXGRqNGpF5OqxXxX39QZusB8c+baEHhdSa1tzasPozfR
         H0g67r5PAKacEgCwf/LDT7505JFTZAmmkEQjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vaxVMoYr01ooBsRLl+9NrQ8wh4tzlePArs6uZi+Ocvk=;
        b=tiln+963g9bbkY0nPyfXzFAEED9Noa6CVfhRtumei9fHw83G6uZiswR0+79+xa4jFb
         bYhczcnZ6neRlS7+/rXAbJ5tR1DCovzWADX2BMUA4cbUFKmu8tJ5Gxi0dj7+gIeepivl
         D5YtbVF5mCaSnhyGMLqeQW7zkAIhNWQNjjXcXa0wcsOLg6kkdOF6uIaIdEOHeZhQq4By
         NNzL1SBWEOuKlQqyF/AQh97hqL7v2BLRqPjtCKDHhmQkXiSbh8EzJCBcBRHd1JbNTb4Y
         rWNRlyKbgwPCwV8HMT6Ji/8NsZvXERmJOUGd+1DP2OfF623GhZNiKBOtTbw/wd6mjYza
         fYZg==
X-Gm-Message-State: AOAM533B3TbJ71PNsIuJWzEzxvZj8SuLHPBJifGTr25BS9s2qoUhioKI
        +eOMfAWeTkcmr6wJRbLz9qdtIJqd28Hv3XBZNUs=
X-Google-Smtp-Source: ABdhPJwxNzXfssIQH5CA3WBDf896GiEE7NIq9DmYhLQpusVAoNP6ic//0Hk3OhH8oBG5owULKz0Bjw==
X-Received: by 2002:a05:651c:178c:: with SMTP id bn12mr13070419ljb.516.1631583476017;
        Mon, 13 Sep 2021 18:37:56 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id q189sm1119190ljb.68.2021.09.13.18.37.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 18:37:55 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id h16so25095691lfk.10
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 18:37:55 -0700 (PDT)
X-Received: by 2002:a05:6512:114c:: with SMTP id m12mr11493578lfg.150.1631583475033;
 Mon, 13 Sep 2021 18:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210914100853.3f502bc9@canb.auug.org.au> <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
 <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
 <20210914105359.5c651d55@canb.auug.org.au> <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
In-Reply-To: <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 13 Sep 2021 18:37:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4-=NbwH7-bZQayZa4waw=G8r6inxzBK9NFRQsvUceCg@mail.gmail.com>
Message-ID: <CAHk-=wj4-=NbwH7-bZQayZa4waw=G8r6inxzBK9NFRQsvUceCg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 13, 2021 at 6:29 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Now, do I know *why* that ppc Makefile it does that? No.

Well, that is simple enough to find out..

        git show 77433830ed164

just tells us.

Of course, that also points to scripts/Makefile.lib, which doesn't
have this problem, because it keeps c_flags and a_flags nicely
separated.

Anyway, that just makes me think that something like that patch in my
previous email is the way to go, but I would like to stress (again)
how little testing it had: exactly none.

So please consider that nothing more than a hand-wavy "something like this".

              Linus
