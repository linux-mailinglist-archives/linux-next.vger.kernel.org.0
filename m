Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90E936197B
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 07:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238731AbhDPFwR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 01:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238696AbhDPFwR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Apr 2021 01:52:17 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E9FC061574;
        Thu, 15 Apr 2021 22:51:53 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so24771629otb.7;
        Thu, 15 Apr 2021 22:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3hcIkF+tAiP0z/EL4I+0INehcSrk07GP/5uAGffs9O8=;
        b=W/kjEG4nAp5HYr1Sm3/nKgUJ/8HL74Bh+546y0nsC9yoRbVpYDGCXkTJAiS66E9F8l
         eZHraNDqenRKL0Fo9x7nJUOw4Cxy325m849ZJzxbRkyxZeAriJGF6+s5l7FgbiGfwY9Q
         ag78xZIpKUJmS+c5ITZxZjcfI9VhqI3lki6ArDc/7QxeS9tL7HkOQZRkcA3l/4yxvBe3
         h1sIxnmarCH8Dir+c6UtAiRX5z8b1YtAgo1ptMxKO7COpDVu1dnE/ElUGTuPgO42dlBM
         ShzCHFh1ZM9KBW7YwWFb4RVmBqR90ydkVO0c31timgHK2KMXH1mH0zoUczRvoW1OKVvU
         syTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3hcIkF+tAiP0z/EL4I+0INehcSrk07GP/5uAGffs9O8=;
        b=b9RCn9Zf+HVPnNMGEM2TimBXfPG9ftNhLiZzYBCJSGrE1tsu0qqmxZcwifUqFQs+0D
         QhYtucZb5TXCYLSVjMGHUCU55aHjFoqWJ6bMpM9wRN+oRZZBCtM5CTCQDN6hIWCV+63P
         nqcrmsgAFR1tLDyq3Wc4KmC887dXD3kPfQMQIeyVzwS3BCxZgN1Q3Xj7UIlCNgJaDsFV
         FIetTZNKoUkCjkZQnaRvTVG20rb88ZCc0hO1lp9h6LjH8by7YxDKsOknPYnQblbwsofZ
         pCpVhv+H0kmysANDFULtPJlzLBb7jMHVObo5kHK1Mfo6ByFI+C5jhXOA5t9tvIK2gLjf
         ykXQ==
X-Gm-Message-State: AOAM532i5bs45jZKUQnUsMTl4koSPw/sAko4zChUr+49k5vQg1NOhXj5
        /6K53ZsBNPddQC+Q3pi8Ut4rbViLGvA+IacvzHlPbOFk98mAEQ==
X-Google-Smtp-Source: ABdhPJx7KZY6F4A2srf5QKK4ioWp39aVm/KPEsl4DtYrW15/mlgLbQqp6E87XBtIxKt9tIZAt8PJ7+MpJdYPK4WvmaQ=
X-Received: by 2002:a05:6830:17cf:: with SMTP id p15mr2406665ota.23.1618552312502;
 Thu, 15 Apr 2021 22:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210416124044.53d4beee@canb.auug.org.au> <BYAPR12MB323890BEC6212E401D10545EFB4C9@BYAPR12MB3238.namprd12.prod.outlook.com>
 <20210416140848.6f458345@canb.auug.org.au> <BYAPR12MB3238224BD17317FCC2975CFBFB4C9@BYAPR12MB3238.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB3238224BD17317FCC2975CFBFB4C9@BYAPR12MB3238.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 16 Apr 2021 01:51:41 -0400
Message-ID: <CADnq5_Nr-NT9ku2J6gZ2YWgUQi+X-UAi-3QrEm5F2a30MRd11A@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To:     "Liang, Prike" <Prike.Liang@amd.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 16, 2021 at 1:47 AM Liang, Prike <Prike.Liang@amd.com> wrote:
>
> [AMD Public Use]
>
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Sent: Friday, April 16, 2021 12:09 PM
> > To: Liang, Prike <Prike.Liang@amd.com>
> > Cc: Alex Deucher <alexdeucher@gmail.com>; S-k, Shyam-sundar <Shyam-
> > sundar.S-k@amd.com>; Linux Kernel Mailing List <linux-
> > kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>
> > Subject: Re: linux-next: build warning after merge of the amdgpu tree
> >
> > Hi,
> >
> > On Fri, 16 Apr 2021 03:12:12 +0000 "Liang, Prike" <Prike.Liang@amd.com>
> > wrote:
> > >
> > > Hi, Rothwell
> >
> > (Stephen, actually :-))
> >
> > > This fix solution hasn't locked down and still being discussed and roll-
> > updated in the NVMe mail group.
> > > Will update the patch once it refined done.
> >
> > In which case, this patch should not be in linux-next (or any branch that is
> > included by linux-next).
> >
> How about revert the patch temporally ? Once lock down the solution and will land in the final latest patch.

I'll drop it for now.  I just have it in there temporarily while it
makes its way upstream because a lot of people use this branch and it
fixes an important bug.

Alex
