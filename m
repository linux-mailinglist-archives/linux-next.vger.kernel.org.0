Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532F53FF7B6
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 01:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347912AbhIBXTQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Sep 2021 19:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbhIBXTQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Sep 2021 19:19:16 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4641FC061757
        for <linux-next@vger.kernel.org>; Thu,  2 Sep 2021 16:18:17 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bq28so7828473lfb.7
        for <linux-next@vger.kernel.org>; Thu, 02 Sep 2021 16:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lRwwSxpq1UQhRHJe2g++efLMW/6jas11c9qi20e9RaA=;
        b=HEDgS0iIyocY0pXYPPxRuZM31kTiCxGuBmZoeWzOrIQdWJItMaAOWh5g3AYJmZFGQ9
         GUU2PEsbrB5aDlLCbXU63/ncoOHPMmT3qqiLbLJtqwM0crfAXznWDKLaT3gMuUiNqyc5
         4KkA+DNF+Rj5li33sR0bVQiwtpg3VPcPrTbBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lRwwSxpq1UQhRHJe2g++efLMW/6jas11c9qi20e9RaA=;
        b=edd3QthZ6Bjxtuafb2Zp5miEOU28MUqEGtruZ1TGRNfxaEKJ9Nt/kD+YUT0Fr+StDO
         y1M2EogmzCHxc+GL6uIPjxsfP7XdiXakilwWRFD+wFl8J/qM+1QxXp0ZMHAJRYzZpsOt
         0+vQHW5DzD81XwxUPr4k+EQyJV7LhuR5K2zAOo+yxkZjxwNq1xNM3GLnSi79HDfSC3HY
         hYYckjGkJG4Jo7AzFRi2xTVaH7AZSb8ke7kfwGjZDHdPDrcOrQX6/3tCiBcXXTtvEkBq
         eRHE+7w29FeXQQzet4ontrp2C0hcu/GwsBG3077q7f+fqaB6KQCKN2CqDTenSyW/eB9P
         NdQQ==
X-Gm-Message-State: AOAM531PgEs+mOUC/6ZEJHNsizPE5f+syC3eKSuIsG5XDqA2z/P6MhRp
        6xvN49EDrLJzkiySdL++w3ZBjXcx+XpXB40ytCY=
X-Google-Smtp-Source: ABdhPJzoVG2DNquf+KiJW26y+7nz6mODFGvLvtVO0RmIHCwPU9mSSUSvTR5Fz5dU6G0fhm+RNxaY6Q==
X-Received: by 2002:ac2:5391:: with SMTP id g17mr411086lfh.371.1630624695255;
        Thu, 02 Sep 2021 16:18:15 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id x4sm389856ljm.98.2021.09.02.16.18.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Sep 2021 16:18:14 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id m4so6574242ljq.8
        for <linux-next@vger.kernel.org>; Thu, 02 Sep 2021 16:18:14 -0700 (PDT)
X-Received: by 2002:a2e:3004:: with SMTP id w4mr537089ljw.465.1630624694481;
 Thu, 02 Sep 2021 16:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210819093910.55f96720@canb.auug.org.au> <20210903090307.48f05d83@canb.auug.org.au>
In-Reply-To: <20210903090307.48f05d83@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 2 Sep 2021 16:17:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjjbA1tquWx_6S-TQqvf2hMbjuOysHk+J84xyx5nJM3tQ@mail.gmail.com>
Message-ID: <CAHk-=wjjbA1tquWx_6S-TQqvf2hMbjuOysHk+J84xyx5nJM3tQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the overlayfs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 2, 2021 at 4:03 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> This merge fix patch is now needed when the ntfs3 tree is merged with
> Linus' tree.

.. but again, DO NOT APPLY THAT MERGE FIX, because before it is merged
into my tree, it would be wrong and wouldn't even compile.

So just point out this semantic conflict in the pull request.

I'll see it myself when I do the test build, and I'd fix it up even
without that, but this is one of those "make sure everybody is on the
same page" things so that it doesn't fall through the cracks and
everybody knows what to expect.

            Linus
