Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D1F40EA38
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 20:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243147AbhIPStn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 14:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241232AbhIPStf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 14:49:35 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A998CC10F0AD;
        Thu, 16 Sep 2021 10:30:15 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id lb1-20020a17090b4a4100b001993f863df2so5280467pjb.5;
        Thu, 16 Sep 2021 10:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ebkOsHOS3BmA29HrPh4F0iuDS711PPxxicUxo8bOCF0=;
        b=Q3Lckh7REMO0mYPsXfnrDd4d3IauqlyD668D+HZloI4P8Pb0p3sNbu+Q9rJQtzLGe7
         hBi77SylodtNTy74FSA8OqahTd5no8zdn0BME/mt41bLbVfSQsyEMikUJAgVxenyNT4a
         hOCGj+q5HIbG3dep00yN5/niPoZHBER5Vf/761JeEWJsYOUMe4fLbn5y7kw/xblSQO3K
         CdsrNzcXEKcVoKArP3CkGXQs7tR0viGKB1OZ1mmA9c0HJiP1+x3XTikpu7oQOjlFGQiv
         hp6izB5z5vGkW5fzFJESmD+/xHdvV8z6N6075MXxHOQ8q/Yn4KekTLQZ6gbaUfCO48JW
         t1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ebkOsHOS3BmA29HrPh4F0iuDS711PPxxicUxo8bOCF0=;
        b=OE1RvJc5tRogepAxp7rifwmIwgDlYrcgSZB1YTlz5qyPdr5IA0ddDfEWb8no6Qi80G
         A6HgzZd7wGdQMtPCxU/F45cW87BkyHaKOAanJMTEc3JyfkJ191pkNEiF5TWdmCJmnU/F
         lWs9VrRRqLax25mvDTTLYJ4Om931IAs4ceTuCcVHvooyX2IXc/2jA46Tqkr8J5j2ZbdE
         0QehofwcbgmGD2bHeU7/DwRx8jp7cXpLygGjHAa1TydxsjDcq/hXSeXTDgMQhiNz40C0
         1/Yj8xkurl3DNWB4MLuH0Tu5WJUfR/ZQFcXqLxcqCxu2f75IabyIzlj22svn7svB/4qH
         rkxg==
X-Gm-Message-State: AOAM530/rvnOHoB3kahOPZtKzrGikM6BgimFWrX9wc4u5md3PkEfgi1n
        zze5LxftveHjiugeMfosuEgHFd/4tzmHBw16zTY=
X-Google-Smtp-Source: ABdhPJzJJGrYThXV1bJ16bIQ8TES6HlXKBAj5USX9HKny21PIXrS6nFe/L33RGAuh05KGXKzLrCTvbVM4ncB8sGD4Mo=
X-Received: by 2002:a17:903:32c6:b0:13b:9cd4:908d with SMTP id
 i6-20020a17090332c600b0013b9cd4908dmr5859504plr.20.1631813415024; Thu, 16 Sep
 2021 10:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210916161111.7f44d2a3@canb.auug.org.au>
In-Reply-To: <20210916161111.7f44d2a3@canb.auug.org.au>
From:   Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date:   Thu, 16 Sep 2021 10:30:04 -0700
Message-ID: <CAADnVQJ+BnWKf61rfDhKsOv05yFRXeRrMs4d443dcSOycaTRcg@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 16
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jiri Olsa <jolsa@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 15, 2021 at 11:11 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Changes since 20210915:
>
> The bpf-next tree still had its build failure so I used the version from
> next-20210913.

Arnaldo,

could you please push Andrii's fix into your tree asap
and then cleanup/follow up with a better fix if necessary?
