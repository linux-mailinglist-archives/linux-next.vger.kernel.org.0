Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E1B28446A
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 05:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgJFD6L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 23:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgJFD6K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2020 23:58:10 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372FEC0613A7
        for <linux-next@vger.kernel.org>; Mon,  5 Oct 2020 20:58:09 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g29so7248156pgl.2
        for <linux-next@vger.kernel.org>; Mon, 05 Oct 2020 20:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rnIqJFtWSAyZ19daKyHf1KC1lAEPfa765t2Rk+is77o=;
        b=Gk510JYVA1XNNjuaIk1hZk72EbY9oWolshIm8DiF535rPbK3cqCfIFAChz4TNWeuHy
         jsjd4i5oA8fhzJBxHtQmaTjtEZW3LXhSgklS8npTKJGLhSTM1LMwmQKokqhklQ1+DHl/
         HpSS0EpQ+uMFilKRJb7/7Dxy2rhEmN3E042qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rnIqJFtWSAyZ19daKyHf1KC1lAEPfa765t2Rk+is77o=;
        b=LXuTrNzoUq/eMChqPQ1NToFB4us0ccWnHSNbpoRnbGSS6oUcLFy7yOV990yBsTeKqf
         ISNrBH3phlpqFeHnCCE7dW2fqCSoSyvbe0sr9Kfo4+KvAof+SJx/TPwXb6nN5x35PQRi
         80ELAUmO4edYxd7tpY+LXCUHZvzv9bxf+qnQ/+fHSFiSySHlcV3QJfaFdwm3BIi5sc5C
         iRsR3q6ACBPodLyVkgfYrn0dZ3iSXnFXb/fauyxIRkeaiTgbHcHwxE7NJZRS2b7a6oGv
         wSIFbFpdSxwYwT8Qd+AduBo8LhrViji0RPZjhM6GmaT7S4vE0H7phjIe9NbyNQhlWrsx
         wP1Q==
X-Gm-Message-State: AOAM531BOyK3KbFDn9iV12NKRdAP2I/wxVnYLNKh3Q2dEm+cNJYx6Ag1
        nyUKpdrQZYCpgHJ7EqbnMSh+9HIZ0GLKrnlEl/QpmQ==
X-Google-Smtp-Source: ABdhPJw8U2DsmZ1SvcwiAoupqxOL2Z0ez8LCiyz+B8ChVfA7yfo6FNRqB4UyUH+zJYnUh68yeTEx8oml1jziH2NDkGA=
X-Received: by 2002:a63:e354:: with SMTP id o20mr2434905pgj.317.1601956688403;
 Mon, 05 Oct 2020 20:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201005225004.0d3b59a1@canb.auug.org.au>
In-Reply-To: <20201005225004.0d3b59a1@canb.auug.org.au>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Tue, 6 Oct 2020 11:57:57 +0800
Message-ID: <CAATdQgB6aN8-BXwTG7=u8c+Q7mPmU+A9=O=_7u_wbPkuVNhjvA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the battery tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 5, 2020 at 7:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   f9d293364b45 ("power: supply: sbs-battery: keep error code when get_property() fails")
>
> Fixes tag
>
>   Fixes: c4f382930145 (power: supply: sbs-battery: don't assume i2c errors as battery disconnect)
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: 395a7251dc2b ("power: supply: sbs-battery: don't assume i2c errors as battery disconnect")
>

Yes, you're right. I guess I made a mistake here.
I'll send a v2 patch.

Thank you!

> --
> Cheers,
> Stephen Rothwell
