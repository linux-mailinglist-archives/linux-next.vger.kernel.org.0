Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D1C3DE90C
	for <lists+linux-next@lfdr.de>; Tue,  3 Aug 2021 10:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbhHCI6M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Aug 2021 04:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234725AbhHCI6M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Aug 2021 04:58:12 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD23C06175F
        for <linux-next@vger.kernel.org>; Tue,  3 Aug 2021 01:58:01 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id nh14so17068547pjb.2
        for <linux-next@vger.kernel.org>; Tue, 03 Aug 2021 01:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=We/acfPRwhLDIriskY+WhTs3fSv02ptiPnn+28cRj7A=;
        b=AON2BLn5KWQ1f81r9+ETwq2QTbnE0R0SXzm344y6YYW1JiGmfnsVLU40ZtO11Uwnl7
         vjbjWghraNrMVX5KyD8bGpk/0JQapsek6XIAT7PmsKylAMf8HFg8Unq2X/uww4YNrVx6
         l3PpQaUZ+paSQfTbRNOWYgUhB+wc54aKmerIFNtZR5rQJf+03zXem/rWuK6MGvFKHOtO
         SX17H1h8JeL2bHO2yUx6k7mmBz4xFVct3gvhmG2bSdo9HxJJf9OW4nYJEDTG98UJkUOU
         a7FbJwVhTybxcU91hWRlU/M8uG82KH1sR/pB+5o87WZI+aXetU3ZbEQXQVBe0FVCuoAg
         u2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=We/acfPRwhLDIriskY+WhTs3fSv02ptiPnn+28cRj7A=;
        b=VAGjszXgd6TQyXPBqqkdq+erG3/TxyHOXe7AUo/rLi3Md7t4oqTc9SYDgEZyScbzca
         /QNtQKKpx+cSL7ZKJ1XoVQAPmbfbs6J27orOxbO7Zp4LxrfD8XGZU43RKw5HFdwn4JpJ
         XHapshO2BkbJDdw1Q5gLhiR8Hf5oYxjlqQkuGUizqaiRfOAtLJ8W3RHaUJbuTuiJa5lV
         0c4aW/yfXa9RH/V4XMsSfJKY0mu/c9qHHHXA3vZ+NB4dzU8HGL99YXLLzLoSjqceulFR
         Rtn70pHg0/fp+1EO+eYxAJb4G+LhnrPIEn6FkQHE4WJKQNNcyRZjH8AIAmTv8rbi46mY
         GD4w==
X-Gm-Message-State: AOAM532pLl8h2IC6Ke74pMHanO6OJ6u8X1DQoYzi5FPqnC0okmq9iaam
        vcU4/LLrGeBZMTVH4OUdr+S8ZKXfTEGfcelyR+rivHETWQ7wqw==
X-Google-Smtp-Source: ABdhPJy4+zhCiecjkitlZnXmMY+QF2JUQXqeTtvV0bDg2mPfFE4UEZt1+Sa27wjHyuHyYTkH3MypYSqH3s9CCd0MU7k=
X-Received: by 2002:a63:f961:: with SMTP id q33mr590820pgk.82.1627981081075;
 Tue, 03 Aug 2021 01:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210802233339.25285-1-broonie@kernel.org>
In-Reply-To: <20210802233339.25285-1-broonie@kernel.org>
From:   Phillip Potter <phil@philpotter.co.uk>
Date:   Tue, 3 Aug 2021 09:57:50 +0100
Message-ID: <CAA=Fs0k95E3FN-9rwzSQcK4JmejHDKBbvk-yhRynJBTbqBNVxQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the net-next tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Greg KH <greg@kroah.com>, "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 3 Aug 2021 at 00:33, Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's linux-next merge of the staging tree got conflicts in:
>
>   drivers/staging/r8188eu/include/rtw_android.h
>   drivers/staging/r8188eu/os_dep/rtw_android.c
>
> between commit:
>
>   89939e890605 ("staging: rtlwifi: use siocdevprivate")
>
> from the net-next tree and commit:
>
>   2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
>
> from the staging tree.
>
> I fixed it up using the net-next version and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Dear Mark,

Thank you for your e-mail - not sure what is going on here as the
r8188eu files are totally new - the net-next commit is touching files
from a different directory (rtl8188eu) so perhaps it is getting
confused and considering it a rename or similar? Regardless, all
commits for r8188eu subdirectory should come from staging, as it is a
different driver.

Regards,
Phil
