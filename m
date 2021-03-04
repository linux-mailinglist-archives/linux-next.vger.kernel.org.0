Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B33032CE41
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 09:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236525AbhCDIRd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 03:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234045AbhCDIRL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Mar 2021 03:17:11 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE87C061574
        for <linux-next@vger.kernel.org>; Thu,  4 Mar 2021 00:16:29 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id n16so24796356lfb.4
        for <linux-next@vger.kernel.org>; Thu, 04 Mar 2021 00:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0tm90W5tmDw4/6G7qt0Qhtx6Q6Ant+6e0Me7cLLAVyE=;
        b=qGlPrUb0AE6wpyTcL9tMR9r82ld2SvU5w0GtghzpCTTYDAnBDTe8cvdKNDCrY0RhSo
         3iCfD+DjA8ei3a1A6NkZsEIxSE0EeugZyDD+6U/cqchnCacj9pb7K6SXVTFhgFIG2pgV
         MtBWwCSXur23NOdTDQeQ5AAFU/eJOQbaG65nXEBvyW9RG7LLI/2fphP55Qlmlk3r6J6w
         NTJd1+/thnOqsfjY3Pnu84f6o3t5dqMRLv2IisgCU0cvWkyNkkcxwlVDvBJiQ/rUvHkN
         +HBGSxBf5fsl8r0nyVZz7n9yBMiwKsama3YtihJrlI9BHJRYzjxyl46FEqMpalrNE0Nb
         VmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0tm90W5tmDw4/6G7qt0Qhtx6Q6Ant+6e0Me7cLLAVyE=;
        b=a72RDMvBccQKBM1NhkVwCiwU5RqOTg3pM3eU21nR8CAxhFmz9Nx4C5cT82V8ueEhCq
         oN4wVQd8n30PU8MweAKFZLSYD6vpZGuIQDwtukg6pmADnHVThlbKmaMvXQDfXMX27dyL
         omUkKsT2h/4TUVhACsFt7ra+yZKN3GHKkv01p7ODGjlI0JwkUwV8ZQrFns30QI6XvLny
         PdBvN1Iwc7ioIMdHr4oflVJQjJeQfC4vOzfVkW+reozOepkBzxdMkAXfe3ckJQKt08xF
         SBiyaDQO63x0GnlfDdABs+W1KMxLT4WOOVLzU5wqXyTfHmw7Hxojh5mrrgsb/29CTrSl
         IiOw==
X-Gm-Message-State: AOAM533wkB33EGQqe7JYZ6PrbeP3S2LqFQ63IMpe3uj9ydgeJwmg8+Zs
        xMUS9GNmURrk4al/78VmLq5BDpIgi6goIVz30KUP68z/QjtGow==
X-Google-Smtp-Source: ABdhPJxFiXn2I24dVe2xfH3JinA/JCqvPr+H5zEtuaCnX6PdGOjWz8YLqIQpWf5NJIejN9fBt/vQPo58HMlmHPtDn7k=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr1577880lfa.157.1614845788062;
 Thu, 04 Mar 2021 00:16:28 -0800 (PST)
MIME-Version: 1.0
References: <20210304121206.3a7ed310@canb.auug.org.au>
In-Reply-To: <20210304121206.3a7ed310@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Mar 2021 09:16:17 +0100
Message-ID: <CACRpkdai3LnvJgaKKtP+Y+zgxyQ2Rir1k-CbX-6cbJPnYuvOaw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 4, 2021 at 2:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig ) failed like this:
>
>
> Presumably caused by commit
>
>   c9e84d46cc03 ("pinctrl: rockchip: make driver be tristate module")
>
> I have used the pinctrl tree from next-20210303 for today.

Thanks Stephen, I'm taking the patch out again.

Yours,
Linus Walleij
