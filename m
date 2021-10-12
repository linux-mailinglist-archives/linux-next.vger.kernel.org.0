Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF0742A5B7
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 15:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236730AbhJLNej (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Oct 2021 09:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236727AbhJLNei (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Oct 2021 09:34:38 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593EAC061570;
        Tue, 12 Oct 2021 06:32:37 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so8571608otq.12;
        Tue, 12 Oct 2021 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lZ7Vrmf9d2xbm+q8X0yumIO1w+C3Yq5fjSeU+n7YeJ4=;
        b=Y4of+zcZTT2qRSlpOr8737KUph+/+qqIM5/WFjhwDT3+WNagKLQQkJZF4MRZ53DpbU
         V/rWaBp3ilHUeuRZNad8NCl4ilQexGvjtZ4FF/9q1GxeN0SiJYqBC8nAebCXQaKAM0ys
         AkpqtLaaibrwhiJt/uNm8XQmmK0lO9uv8A5LuaAgZ7xwf1gWsHvSF41goCfC1I9f+K38
         R2rwtKK+3VYMCeWvabpao1vd88Ujp0W4QIYUGNDxaVF0ttRpyYfn1w9CBFuAqUA152Cv
         8zxzvqCagrJuEIVLlREDzOChs+ejmVmFKMbXBVcBG3IZ2et4hQhAUEwcpyA4Nq2bTtHB
         OcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lZ7Vrmf9d2xbm+q8X0yumIO1w+C3Yq5fjSeU+n7YeJ4=;
        b=Lk156Sf/LOYHd1nKc3UANf4ol7GKo35JFtEYBS++9ro1Y5u84KqSmrhZLi7X3KZvpR
         uv2sFHkhHIgvMx68tAADBqGR5n+snE3CfCXLN63lScvi/K+zZfVluUlKUnWvpiXZIFOA
         VZbrcEYWnA+/6fpTCqz/kBwPae0A/WqPE92rQ8T5ROGF7HuEcfIRuKScoGrmYu4PgiG7
         nM8YAV5hJKSt+o2wjZWlyhh/tMy9QVwLglWgiY9tLklM1SUBSJwoHlUNRap3xmn5q5ov
         PMXFpJ5EKZx4XrhJ6D8fDfBrNRnLd2IUe0CI1BXZg7W/jnsH4/2A0kjBzbeXBmuMOukj
         Qc7A==
X-Gm-Message-State: AOAM5335qEsSv9ejlqxbk07eU9JAUb1fbVqvLFegRxOBaUOBoUvYHxmc
        /vV4rI7DB+FB2BW8CXTzJ0kAUA7P1Z25ZTlZZDGAD0YFVsQ=
X-Google-Smtp-Source: ABdhPJzur/SiBvRHhaGs0GFst1Y5rPRxox6pQZUPDy+DQ7q4Is4o4cm0jKQ3f4QXAxV4xaDb9/UIpQshf2NUyseq3Vc=
X-Received: by 2002:a05:6830:23ac:: with SMTP id m12mr4492411ots.357.1634045556644;
 Tue, 12 Oct 2021 06:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211008113116.4bdd7b6c@canb.auug.org.au> <20211012132526.237d8f6e@canb.auug.org.au>
In-Reply-To: <20211012132526.237d8f6e@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 12 Oct 2021 09:32:25 -0400
Message-ID: <CADnq5_M+xwzsf5=nZk_B_XsBeTMx5O1ViaByh0jpVzswvoOt_g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Simon Ser <contact@emersion.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 11, 2021 at 10:25 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Stephen,
>
> On Fri, 8 Oct 2021 11:31:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the amdgpu tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > ERROR: modpost: "get_mm_exe_file" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> >
> > Caused by commit
> >
> >   f4f80155e6e8 ("amd/display: only require overlay plane to cover whole CRTC on ChromeOS")
> >
> > I have used the amdgpu tree from next-20211007 for today.
>
> This failure has returned today ...

Whoops, pushed the wrong branch.  Fixed.

Alex

> --
> Cheers,
> Stephen Rothwell
