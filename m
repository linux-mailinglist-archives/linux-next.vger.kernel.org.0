Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E840C90AF4
	for <lists+linux-next@lfdr.de>; Sat, 17 Aug 2019 00:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727757AbfHPWbE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 18:31:04 -0400
Received: from mail-lf1-f44.google.com ([209.85.167.44]:35034 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727716AbfHPWbD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Aug 2019 18:31:03 -0400
Received: by mail-lf1-f44.google.com with SMTP id p197so5086801lfa.2
        for <linux-next@vger.kernel.org>; Fri, 16 Aug 2019 15:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OOAG1iyO9q8mXH7l98FnBfv0cB9D5+pt1rPlPDDYQ/g=;
        b=x29srUWlOZcwdfQ9uezW6kduYfYb5FEv4zPBFWvTDIvlEb/X6OzuEqQA/UZIElT7RN
         u5v4z9fOajaYrEuSWCsZQW6LZYmH+bmiZEnXaAIdg7Ax3JxbEJyz2VXGjiWOcwU5heSs
         U9Vow1e1lA058BeZuP59CctI9MCF5pSMgfSOyXvz+ey5XCv80Z+DKpOa0M+RaKYxHAHZ
         hN5rYsfzNW1NtTY57nA6fnynIjJNLu8i07poklUuwo3nBXNmrtzZ8vQARJinA8sANdv/
         gXDcYyr0A/jggEP3dgaaMPewyndl6ECzjQQIBYybfqd+28cSFSYsNKsBKD8x7LSJzCvn
         Au7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OOAG1iyO9q8mXH7l98FnBfv0cB9D5+pt1rPlPDDYQ/g=;
        b=U3Cj9a17NmhMuWgX84qfak0dH8rIYNJfD02urZ6V3LRHOtu14HemLlzj7L0i23dkkd
         j/YfqOaPJV+EfeVsvgJEtqVUgZkM0UVibg7zAh9j8GypW/Cfs5D/MIj5uS763tivnLON
         mcvq0XIZ0TJFsa6VIjCzdLiv1VsNXN4gPsMKwd4+E0Hj6n+oNwmjsHReh5s01i9Dlb3F
         EQeGYBNt3HKEB47a2Tf/dVgxgOv5kYiTeeDLFGzkCKkZSi3tdZ56r0ZO40DXboQ+57g3
         sQms2vHUnw/NE9uKlrryH47c5OUMXF/bL0EI04ZO6oem0eNjQbWcWi1CJC8qEI6TDH6z
         p+tA==
X-Gm-Message-State: APjAAAUFwfILQOVKypVDs1JjKy5W1uJ1WG1q5QbUZjqbuFwYWcbiDBqV
        juMROAqAV3GhKWuMB6IuyE+D3TzcyWA+Hkv22dBYbg==
X-Google-Smtp-Source: APXvYqyYgwWlAMLO7wFD0iWcM2FH/jVFhMIZfxK345mH2kQ1QgmNqa/THpHjquE1A49XorOMdZXEQuYYQ14uztx3Azo=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr6561131lfp.61.1565994661896;
 Fri, 16 Aug 2019 15:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190816165607.3b896463@canb.auug.org.au>
In-Reply-To: <20190816165607.3b896463@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 17 Aug 2019 00:30:50 +0200
Message-ID: <CACRpkdbd=YDpXwozA_AUUmY-ut5yh9+ziiPHLj67fT-bs8Pq_A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the gpio tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 16, 2019 at 8:56 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   include/linux/gpio/driver.h
>
> between commit:
>
>   fdd61a013a24 ("gpio: Add support for hierarchical IRQ domains")
>
> from the gpio tree and commit:
>
>   9091373ab7ea ("gpio: remove less important #ifdef around declarations")
>
> from the gpio-brgl tree.

OK Bartosz can you send me a pull request for your tree so we can
sync them up?

Yours,
Linus Walleij
