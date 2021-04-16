Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD30361FEE
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 14:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235664AbhDPMc1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 08:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235252AbhDPMc0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Apr 2021 08:32:26 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7BAC061574;
        Fri, 16 Apr 2021 05:32:02 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id v3so27552169ybi.1;
        Fri, 16 Apr 2021 05:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ofl4dMhmmxXq6zqRgTTqVyR9fjZoU9IM4NotJ4Me/O8=;
        b=XZlgi/aU2fRma/aWVDJ4xIuVaYL28Gd53gpfSm1ZcwIoNiPWfkhAaurJMAe6qySz17
         AnqE+dks7DdJBtl9TrXVuWEqsHGlnze4rZ9S787ucrRE48rxxCTGAcJ6PFH2mjt2Swd3
         0fMeYeBLdJ7+5tiPFLQsmfUs3kCmdxahukbB7XjrXYAKDzruQBguwg2w0P0CpXsy/0dt
         x46zH3soZX2XUOcmLa0JXr9yFCcoKKw2wISx4xQ6CDYHYztqAFRwQKxykh2nWnxABfQM
         ANgsoQwslyxnMJlkBJqRq+dPqz340Kk2koQm+bQfeYVUAbpxtQS4kGAxxIyP9MVRyAf2
         su5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ofl4dMhmmxXq6zqRgTTqVyR9fjZoU9IM4NotJ4Me/O8=;
        b=XGcEOEslkwXtKV8ndzvFjxfM+p1JQlyUEvNsR2NrvZE/8gzJb7ZVPBPTmqT6Rkq8dM
         qN98sUViUh6fLkRpcLzKVkpyABgmceIwIatA8M7HtvUqMuNjF6Sm2xf0dB4Rn6nxwAdi
         8TA8GWA8wan6MEvVEz/uxOtE3wewvS++iOQwHIE9pUra1XqLHzQ4zehBuFBpwRu4QY+7
         wS9LthOKqAP7OzJNa4F6+MgWFq5+YbhZnM14YqDFdcMRl5I/CTXh/RMicdy3rg/RX5Jh
         Ci1AQWzz8zE/rzYL830+CDrqatTuffwXtHJ9i2V7oyPY2vy6We/iH5NK8V2IcVGb9vYA
         TPpQ==
X-Gm-Message-State: AOAM5300fz8RCxZ5csHsrX3b2w9pQPWvGSqy+8hkVv5oT78x1ZxdnUpc
        hGQnROFxRysdwrtqsje1iujqvN0mtudWmUPhcs5Grs9x/cb1gg==
X-Google-Smtp-Source: ABdhPJyDXt9X7cDpGJY/tH0hACPnocQHccmsJrgoU5oWXNk/jKoTiLAx0dJKkBE4SI0SjkVCB0uWMEoTjYIS0x+x2WU=
X-Received: by 2002:a25:c444:: with SMTP id u65mr11796242ybf.93.1618576321562;
 Fri, 16 Apr 2021 05:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210416175806.2acd314b@canb.auug.org.au>
In-Reply-To: <20210416175806.2acd314b@canb.auug.org.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 14:31:50 +0200
Message-ID: <CANiq72mGZnWRS4Yu6iUY2jE2zaNHEz5a5gjmqZtBFEVTfNxRiA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the char-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hang Lu <hangl@codeaurora.org>, Li Li <dualli@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Marco Ballesio <balejs@google.com>,
        Miguel Ojeda <ojeda@kernel.org>, Todd Kjos <tkjos@google.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Fri, Apr 16, 2021 at 9:58 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> from the char-misc tree and commit:
>
>   1fed5dee5fbb ("Android: Binder IPC in Rust (WIP)")
>
> from the rust tree.

If you prefer, I can take out the binder bits from rust-next since
they will be submitted separately anyhow (i.e. they would eventually
go through the char-misc/Android tree after/if Rust support lands).

Cheers,
Miguel
