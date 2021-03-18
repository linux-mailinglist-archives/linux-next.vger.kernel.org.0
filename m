Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75DD33FF8F
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 07:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhCRG3d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 02:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhCRG3d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 02:29:33 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0862C06174A;
        Wed, 17 Mar 2021 23:29:32 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id u3so1413521ybk.6;
        Wed, 17 Mar 2021 23:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2uwP2LpXczqkI3G36Q9JPtO9f28JmioS6FvHs/xd+hQ=;
        b=PCCxQaarwcKL5z7NX62Dlyl1z+yNwfnTyFV8lrFS4Jb2rcJITVRMzCtoDSQfbKF2lF
         euboIokJF7MvqMJcpY3/oCX3d+4WBttgOkSDEDKezaCThmyWGeJVbDs+7Bt2+Sp1wV0e
         yX/gujM0TDUyGsXy8zIcfoyW0O6Q+RXenck7lE2RuJAY/JzsfRJbmEM1nW9GVLADPMaF
         dVd6gDb0Ss3IDJnuqhZwF7/GR4rKhoGJW2d0cCjAr9+bJp6PneaiuTZ6HJYZId37Jbqh
         dGavLLyOzPFbhdQ6UUteeFnudNESyUWmMFjN0cmRdGdF1lwQFBLQ0a5ZvAnL3AYG4z6u
         L5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2uwP2LpXczqkI3G36Q9JPtO9f28JmioS6FvHs/xd+hQ=;
        b=RTH565JrNiZMH/fZ1b1RzWa7S1I4jeEFn6+ULjJyHmOp0C/ifsI/oVC6ZuOZxpKhM7
         wDANH0g0/PszUgzPh0evVez2ZG7UPUL/AP/aFWt587U4LvbBsN2U9x+FggUxBHYY5DJd
         +8KyHWhBQx/t6UPkMZGp0RLlHMiDG7SAaiMoAMc7DLw9PH8z1ydp7vGkXjBYIRfD5KWI
         4gSCEKprYKyKSPzjZRClrkFduRj1PoAzEbW1UG+yAb+jfLi8yPyCId+AYGNtEL4ZWj+b
         HJwoprH0eKcLQ6i/Qhuo0angsefTBK7VgfDtIItvmlXzsLeNItM1a1WJms+xEMtbo/k0
         Uw3A==
X-Gm-Message-State: AOAM533CZIOZUreyW/1LTFnu8v+1bpgmdWQ04rm6fqlh3nuwvL3CpHwQ
        nviGqxVyx8ggLFyRvOfwdl/HiYeRHBKIKCS7p+s=
X-Google-Smtp-Source: ABdhPJyVALbfldPOnYz0KVq7NrLvdOxiDY+AcOXlcUv3dyUw4H0om1RRJWly2lawkaZxH1t3x9U2urRRXixF5NY77Gw=
X-Received: by 2002:a5b:449:: with SMTP id s9mr9468080ybp.115.1616048972014;
 Wed, 17 Mar 2021 23:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210318172418.1438800c@canb.auug.org.au>
In-Reply-To: <20210318172418.1438800c@canb.auug.org.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 18 Mar 2021 07:29:21 +0100
Message-ID: <CANiq72mbFhRLA8+azMoGLetFqXCAajhN6mrH4Nea8oxEDSm80w@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the rust tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 18, 2021 at 7:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the rust tree, today's linux-next build (htmldocs) produced
> this warning:
>
> Documentation/rust/coding.rst:24: WARNING: Unexpected indentation.

Ah, so docs are built in -next too? That is very nice. I'll fix it, thanks!

Cheers,
Miguel
