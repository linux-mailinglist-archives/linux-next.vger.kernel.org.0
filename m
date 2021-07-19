Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1793CCBAB
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 02:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbhGSASi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Jul 2021 20:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233738AbhGSASh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 18 Jul 2021 20:18:37 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5345EC061762;
        Sun, 18 Jul 2021 17:15:38 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id m13so4287511qvh.8;
        Sun, 18 Jul 2021 17:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FAaddWpYrInFFno4A8ALowrXM8vpnnyjPuQV+kmFE1E=;
        b=mDQ5ecvjIRgad2AmBvKN3oPlsIruHmyls0vMlZSYo0quHKPCzxo7i+/zF5ZPnJh4zd
         af3qe49xTbBPRcW7TSE0LcVCtA71mtb0NoN+XEAEQBStsDUxKWsncQdTkqIXOVyd65gL
         95+Ta/qIaP09kcnpT3grAbzoxzIr9r871HXDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FAaddWpYrInFFno4A8ALowrXM8vpnnyjPuQV+kmFE1E=;
        b=c3YaBeIYhITI4E99im9q2NF93FRseMczRQZzDzrVq1J2nwkzJLhAbDNGLhzS9Vlk1I
         n3TFMdmcieQ5yyB6gpTlDtgmKirAI9kfPTTJ4UVFZ1BjonPXMRsArkKSgwnEWvWvvZs3
         VVFW8cE+zLabUCXh0nhvC2QSqDMGsvr3UBhvcY6XmJY5uE39Vk/4NjzdpnFRl5zqdWXq
         OUeUTicou4/isDLhU3k56vdB97MEzhtgjAyWy35xdDSt2i3e9OEIzmsIMcGMm1T2zuMA
         aUWOvd3Sa+5CGD4yrXBgMhcf+k90STUJ8xKGTQVO3uOpR5p/Yje8eHSMjyLPz5BkRAiG
         FTDA==
X-Gm-Message-State: AOAM5335fEOQURTvAqRs6EWx73dnYC0bkR7pMauOa2ppHZjbsQz1eSPL
        LoFvzbxMOSxgUxzWc/lDsFRAqz6rkGbOLD4yXxYNGCMr
X-Google-Smtp-Source: ABdhPJyoQARF6fZitcHiSnSEbVzsd0ZFXDGtDSpEDOEVD8ImjxY0C0lCBpgAior9HiQqp1HdpGi4W1c4XvS1DHxnvCk=
X-Received: by 2002:ad4:55ef:: with SMTP id bu15mr21762425qvb.43.1626653737518;
 Sun, 18 Jul 2021 17:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210719095150.75af9e42@canb.auug.org.au>
In-Reply-To: <20210719095150.75af9e42@canb.auug.org.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 19 Jul 2021 00:15:25 +0000
Message-ID: <CACPK8XfQ9nAr=tsCsce6Bf4HAtWZ+bAVAhx4tBkwYahurpi0Eg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the aspeed tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, 18 Jul 2021 at 23:52, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the aspeed tree got a conflict in:
>
>   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
>
> between commit:
>
>   faffd1b2bde3 ("ARM: dts: everest: Add phase corrections for eMMC")
>
> from Linus' tree and commit:
>
>   315cc563d047 ("ARM: dts: everest: Add phase corrections for eMMC")
>
> from the aspeed tree.

Thanks, I've rebased the newer patch on the older one and pushed it
out, so we should be good to go tomorrow.

Cheers,

Joel
