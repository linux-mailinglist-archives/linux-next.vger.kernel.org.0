Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F39A390AEC
	for <lists+linux-next@lfdr.de>; Sat, 17 Aug 2019 00:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfHPW0K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 18:26:10 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40004 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727693AbfHPW0K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Aug 2019 18:26:10 -0400
Received: by mail-lf1-f67.google.com with SMTP id b17so5061414lff.7
        for <linux-next@vger.kernel.org>; Fri, 16 Aug 2019 15:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PrIWwCYqt6y1eeO+WlCbe2ljn3Qkrri3qYgYEjIcBUU=;
        b=qFqM+LoXVUtv+l/noiHl2Ppx+2RqdzE0dHyHVHdvhb0yYwPvRjkhXq1I0pkuU6DDu7
         GOFlW8G6LgZv5ELVCNJFvDR11volrbvDq7D0fG6irF48m2fXOvYyZKjzcd73zmLNg0uo
         6trEiVPvkWibXdxu1ZQi4UUbZ/4LiGMrMc9LHJrnSpWj6CeO50miqfe1xeI1CLWEjJw+
         DaA/VcO5bUfANdlShuG86jTwrsJRdXuP+noqLPaMJrnKUn1wd8+yKLINhV61RXCsf/Bj
         FgkVbizPtsrhdhZp/uUbKPaaZVDLsmiemphcadsCwzi7i9x/sGpbzdjnxxlXb6h8ClGx
         vpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrIWwCYqt6y1eeO+WlCbe2ljn3Qkrri3qYgYEjIcBUU=;
        b=Nr5N2/eosp878+be36NRBxSXGVHBn3Z2mXcqItSZGSwkZgy52dNTSqtIes80jgOQ5u
         rsnzF/TZZ3YaX8+BZkRdt4Z1V4i6VNp356O25Jv7hWx3Y13pxBeK8K+SrXjPwudG1h/Q
         jNZVgUa4ypZjeYZk/8envxX4aqbKi/H/llmTg4NZ8Ut3id/3dcRWkCaSERqcciIqVyjV
         k2FUI3+H6wxApWCYGBkIVe69SEXcM9Au3v68Jo5AUNImYEQmi4FKBc1ZZMEzIoGszurB
         gCV3TvX8A14n3jCJW3+LL+19FA4OykVLObREqF8q5TWeVM9VYt0QfT6mp7vAzHogIAfF
         0BNA==
X-Gm-Message-State: APjAAAWFffWa8kTTtFPXuQX+xWu+Lp+Iufq4S5RZp4oYrq1EPxu7FLZa
        ZgL4H9hukgJFNU3IBCzwPLpTdA62cc2smPJPvAUc+w==
X-Google-Smtp-Source: APXvYqzRk4JU/UJJ4c76iwXHUBfgyYIL6EN9ZrEhlw6vzj6X19IKVB1C81FHKMDHsmKWCqHhTR5CtHwUKlzQLEAQxP8=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr5764558lfq.152.1565994368218;
 Fri, 16 Aug 2019 15:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190816213812.40a130db@canb.auug.org.au>
In-Reply-To: <20190816213812.40a130db@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 17 Aug 2019 00:25:56 +0200
Message-ID: <CACRpkdbhdcmzqbr=4nQQ_upAyjrZsxGkMHhz=pZN2fvD7H9sOw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 16, 2019 at 1:38 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the gpio tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:

Oops!

> I have applied the following patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 16 Aug 2019 21:29:30 +1000
> Subject: [PATCH] gpio: stubs in headers should be inline
>
> Fixes: fdd61a013a24 ("gpio: Add support for hierarchical IRQ domains")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

I just nicked that and applied to the GPIO tree to fix this.

Thanks Stephen!

Linus Walleij
