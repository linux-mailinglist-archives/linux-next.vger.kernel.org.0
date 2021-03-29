Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D6534D401
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 17:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhC2PfO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 11:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbhC2PfH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 11:35:07 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD5DC061574;
        Mon, 29 Mar 2021 08:35:07 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so12656779oto.2;
        Mon, 29 Mar 2021 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V2AociJ6Ilu5nw6N+zB6+Wm7i2Y+P2uDFGkTTiWCSa0=;
        b=dVgsUtpd4t56gxTviJv1oIsfY7LM01ii5MHFYTqMUrO0vAOP9aDSTqWuGWK2Z+LO/0
         PSYgQcJNAmhCk2cNL5vKzcyjq3BITCupHzPqtdHhM61gMaWUsCzPxQijSUmZXKDQkYax
         6EObbHISyjHuwqfVqz+Vg2Ju9eNnI84ChS9VsF90SzhTGf+vpgxD2t2RWPVOZ4WyyVqC
         fPb2LfBbOOllJnoX9QGbpIqEDF1sosDHhVMwK+534mcRWLdNuf1scJ5UgeYG4xfVC8hi
         AerU4rp+9cs3pmbRC5Ko0SI8Oj6vOhz/M2VnhHIfOkK5gqXEo3J1K83cukL7DKjJFVOp
         bmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V2AociJ6Ilu5nw6N+zB6+Wm7i2Y+P2uDFGkTTiWCSa0=;
        b=pyCKK+6SvNGewkE1Y91goXJun24N7NbDxhHsPkgITCSO3QGWerBD9msQ91NuTytLvd
         Y2pCePsIfBfRk7rdjdOUlaQLRgL9EEiBoFx4VGBwANA1w7B5ptrOCVFkvyBIPYwoaih5
         5xtP2oixrZCsKMiRBLGYSE0Om7D+66yTUjVFk5goCfp9X4JqxzAYXSyfeq1t+mJMovfH
         81VqhI1+lVj0B4K31ia4q5WRr6+Qzo6apaxANgwbFne4mOa/QRTlPDDp+RsRaD4PVHX8
         8HqG2mjs6kb5bbkWf3gf6Vraan50WpTOd0Ev686N7onmXGi340ThuA7X83YJVKBwyyHn
         cDtg==
X-Gm-Message-State: AOAM532szOpiKezQCkM6lkMisi7K87s8gCuEASeqkHfKLtT1kemco6a/
        JiUuVxLcPt8x3g0WI8dHxUBJEGlQuCKyMYIIr7k=
X-Google-Smtp-Source: ABdhPJwOV4I+Fcw4FmlOkUPHI0QyL87GoS/IwkE112lTIz4lmzxBUUEet2vcbUrS7iBMEIevCgoBLOtzRWnPZUvl83k=
X-Received: by 2002:a9d:d89:: with SMTP id 9mr23582990ots.23.1617032106995;
 Mon, 29 Mar 2021 08:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210329082416.40b7f449@canb.auug.org.au> <CAC0gqY5+tcmNOoRrjiNMsffWbrQEF_pwjvne-oP+sGbr+84suA@mail.gmail.com>
In-Reply-To: <CAC0gqY5+tcmNOoRrjiNMsffWbrQEF_pwjvne-oP+sGbr+84suA@mail.gmail.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 29 Mar 2021 11:34:56 -0400
Message-ID: <CADnq5_PXCSDmU7YKQVawZSk10RjCBT-XoxPYNGt78x1ShbiXOA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the amdgpu tree
To:     Mark Yacoub <markyacoub@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Mark.  I've fixed this up in my tree.

Alex

On Mon, Mar 29, 2021 at 10:18 AM Mark Yacoub <markyacoub@google.com> wrote:
>
> oh this sucks. I'll look into my config and fix it. Thanks Stephen for
> bringing it to my attention!
>
> On Sun, Mar 28, 2021 at 5:24 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Commit
> >
> >   0ea5088407fa ("drm/amdgpu: Ensure that the modifier requested is supported by plane.")
> >
> > is missing a Signed-off-by from its author.
> >
> > The author is "Mark Yacoub <markyacoub@google.com>", but the SOB is
> > "default avatarMark Yacoub <markyacoub@chromium.org>" :-(
> >
> > --
> > Cheers,
> > Stephen Rothwell
