Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C2313FEFF
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2020 00:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731622AbgAPXje (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 18:39:34 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:52962 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389219AbgAPX2J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2020 18:28:09 -0500
Received: by mail-pj1-f68.google.com with SMTP id a6so2303382pjh.2
        for <linux-next@vger.kernel.org>; Thu, 16 Jan 2020 15:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KfaClSXaxrCHJAkctZvOsf/dRXQsvoUaGoZqBzPgF88=;
        b=TlYcEnqhfZgeYBjs2eviKJRmRuGeksObgSsXK6erUBxh2WNdlKAQraGXVY1F7EdTnx
         gjItxCeAzGKJBQNbAfXASGsc3KtJ6dXGFcpWnh8tZUQpbRnMQkjPROpFwwKIxooPB6Yo
         Qn7UQoW9OD2cBmkBtT16+ShihFT5Hvsbrn/RXqCtG6tsmzNcTFUQ5lqMYhXVJgI5v1Ku
         79RjLvLRJE8tNnyBW3lOdg3/B4ELU35W0P/hIfCcBeo4Lk3B/0gH+y0QUY+nGF7PqjUA
         1K5+Jq9pcZqT6lE4Z6y8ktFUV1mkzqgZICmb4EREnWJIY9DYppZGSvxXaNEbRx2us6Vz
         vvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KfaClSXaxrCHJAkctZvOsf/dRXQsvoUaGoZqBzPgF88=;
        b=js57QjTUfSY8ilUEIq4dDQm263QC3ZldhBVpCP7HO9JC2DRtbDXjjLML2l4HTl35ie
         TokshNVQaLoYHYYi5graBw1KEYk3bkFs7LzZNc18mAlDqWpKpDeLJxGEt9fJTbDXpDVb
         cu1Gay2mlwbJLQTodYnsn0tfzMZzuLclzcBEx70+986G8CCE/DQWzvk7JyVhcRQRWV8x
         QaR8F0B8SC4JbEXX/EQp/VxBzVjNKWuqWuyGngYVW4+RLTJIj4qqKxPx/YxuHXUeADHy
         yk+s+g+exedfJAW83F/GBPPXC9A1tXHbTOwkLSiRdHx/SQmY1JpLPMaHtWx5r6B/aXYa
         S69A==
X-Gm-Message-State: APjAAAUyEkQta/ZtvrQiSjpE+Csd9ZQps5/Z841OqzoW8mQq8+lP88aY
        0dSikodLMdszDr8qh4reo1P1uVPOnaMIIXLcBo1YSA==
X-Google-Smtp-Source: APXvYqwgpNCP2WmFVqw3r32SxiAafFLDYrj7zGkZmqerQuJRx2/zxLBjAFAJ2s7jp8Vm6kKHRlrAL+8wXIP+/gVSZmw=
X-Received: by 2002:a17:90a:c390:: with SMTP id h16mr2121532pjt.131.1579217288135;
 Thu, 16 Jan 2020 15:28:08 -0800 (PST)
MIME-Version: 1.0
References: <1579173451-2439-1-git-send-email-alan.maguire@oracle.com>
In-Reply-To: <1579173451-2439-1-git-send-email-alan.maguire@oracle.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 16 Jan 2020 15:27:56 -0800
Message-ID: <CAFd5g47_yrZEHvCHUpc-b-hpMzXzJmaXxevcwpVHhs=2BFR+Bg@mail.gmail.com>
Subject: Re: [PATCH] software node: property entry kunit tests must depend on KUNIT=y
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 16, 2020 at 3:19 AM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> property entry kunit tests are built if CONFIG_KUNIT_DRIVER_PE_TEST
> (a boolean) is 'y'; it in turn depends on CONFIG_KUNIT.  However to
> ensure clean merge with linux-next, where CONFIG_KUNIT is tristate,
> we need to explicitly specify KUNIT=y as a dependency, otherwise
> allmodconfig builds will build kunit as a module and fail to build
> the property entry tests.  Later CONFIG_KUNIT_DRIVER_PE_TEST can
> be converted to tristate.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 27f9d7e984d9 ("software node: introduce CONFIG_KUNIT_DRIVER_PE_TEST")
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
