Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B76A37A7E2
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 15:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbhEKNmE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 09:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbhEKNmE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2021 09:42:04 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BB3C061574;
        Tue, 11 May 2021 06:40:58 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id l6so19075714oii.1;
        Tue, 11 May 2021 06:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u0zqoJY9+XLKCnvlRfIASVv7tiUTgIrBxHTEpVSQbhA=;
        b=uu4t+R6kaUZp8RlXk/Xxbth15iW6zgLgnVeCKLaiqYemeoCLWpfI7qDqSjYS585XjB
         ZyzbivfhYYSSM4zuLtNH6EakbchJDrrJ4VEB5gzkJo0ycFjmGxXLDRCulc/OdbY7MVrZ
         s8BFi9rrooCQ6bgOq17r7yamg/AWwBSnlw6clIA7DOq1OPQ/Kx2QzugQAfOzJzuZiqc8
         r/XYE2o5grxono6hU3+RFLtSreKjsJy0M6ST1JU1gkUuVf0mKEVcjH+6ulgB/lfNn9rR
         ta4yipc43eKF6A0MDlYNBj+/wS1zOvcSSLwUKf5s+3oHw33NujLpruTV/615pkE1ekna
         JmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u0zqoJY9+XLKCnvlRfIASVv7tiUTgIrBxHTEpVSQbhA=;
        b=W87r5oxRS52xsOcWAsQpWo/lwgv8eVjFzrVg0HfHR75BkId8NNPNnoOf+WqfVu93Oy
         4vdHLwG5IGo/fJx8fzbKSn1yrjjBJ7ZzycReLIocQFD/DLt1YsH/mYezokerwite4W+M
         DSmYiSZYURsLcWkYzWbZImRgEw4/aPv5klmTpumZPbVrMBAuUx6kJEZd3FMMYHYQiSEw
         bBoxzhN49Me2ahtPAGnbzN+UD7sFzN84Dn8jANN7uK3LykwEwVQ/fmAJRjmWkBXkLuvz
         o3SFNuz0im0nQhdSsf0rvw98cdHXBT9U5mKRUKI/Hwqyd216p/2Q4Ksj5bYyhbv3XSrk
         /KWg==
X-Gm-Message-State: AOAM531LT9vn87mmdgLPasqLTTKyHP+yIDuDiMu4iq+eUqku8fP5zjnd
        h4Twv5x1PdSFlotgU1zDVGyLI4wAHpFU49KSWP1NTBLb
X-Google-Smtp-Source: ABdhPJzAdt/19SmncD8g04TLdvUfe9O2hOGTMNT9cOTcdXWWFA1/EOROhg+JJ6pUIlEjUzG22F7c15q9pJ7wUcsGW7s=
X-Received: by 2002:a05:6808:206:: with SMTP id l6mr1326604oie.5.1620740457614;
 Tue, 11 May 2021 06:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210511084206.3de50d5b@canb.auug.org.au> <f2fd1c01-d559-b8ac-b342-897c74ae852b@gatech.edu>
In-Reply-To: <f2fd1c01-d559-b8ac-b342-897c74ae852b@gatech.edu>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 11 May 2021 09:40:46 -0400
Message-ID: <CADnq5_NNaOEe22WoyKmrXbe5rZMx-t7KoOZay-uSYa6s2eAv8A@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the amdgpu tree
To:     David Ward <david.ward@gatech.edu>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

I'll fix it up.

Alex

On Mon, May 10, 2021 at 7:08 PM David Ward <david.ward@gatech.edu> wrote:
>
> On 5/10/21 6:42 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > In commit
> >
> >    0b62b6ed6959 ("drm/amd/display: Initialize attribute for hdcp_srm sysfs file")
> >
> > Fixes tag
> >
> >    Fixes: a193ed2094ba ("drm/amd/display: Add sysfs interface for set/get srm")
> >
> > has these problem(s):
> >
> >    - Subject does not match target commit subject
> >      Just use
> >       git log -1 --format='Fixes: %h ("%s")'
> >
> > Maybe you meant
> >
> > Fixes: 9037246bb2da ("drm/amd/display: Add sysfs interface for set/get srm")
> >
> My apologies. The correct hash is in fact 9037246bb2da. (Commit
> a193ed2094ba introduced HDCP handling in amdgpu_pm, but did not include
> the sysfs file.) It seems I inadvertently copied the wrong hash when
> preparing the commit message.
>
> Please let me know if I need to resubmit this patch.
>
> Thank you,
>
> David
>
>
