Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EBA3E4EB3
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 23:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233707AbhHIVq3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 17:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbhHIVq1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 17:46:27 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95653C0613D3
        for <linux-next@vger.kernel.org>; Mon,  9 Aug 2021 14:46:06 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d1so18142438pll.1
        for <linux-next@vger.kernel.org>; Mon, 09 Aug 2021 14:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zGW8AK3cSSlo8RoEaUz/Ru79mfjJirEiShCzSUYbZDc=;
        b=IYn4wY/cc10AdW5DkSXpKUyci6JFskg0/plcbC6LMEC23bfo03QYBYZkcW3heSRYnT
         sbMu87nJhtTXIwXVLVQCbNB/2Kj5sTxIriSZpcJhwHB/pqX9QZLsyaw/cPlH2UyaU121
         2I7Fe+u6U6o3xdQtZvPzProj6C6RX/mYYlKrU1nRmETiIr5nYM6+eNQpKDFfJM7LL3nE
         RfsdHVj6H7HYd2xxPZeUF5RdogHURz0XGCyrXFfVfIIqik3AO8qWf20x5EtMK8F58JBc
         RiI5Z8SCJfQ+ACHEvvuJj1DE/FQRkvJDBqYjLD0Njdw10rltJXyzxwkinG7zyx5RCpsr
         z7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zGW8AK3cSSlo8RoEaUz/Ru79mfjJirEiShCzSUYbZDc=;
        b=SRSOhKLFrBqc8wM1xrRc+xvLlHGEevVPxBrCe6kKB7zK4NFrInOTYTqoTZwV2A0sT3
         SLCNsMzEcq/t5nKXFa9mxrxc0YrAs8/SOM2DdRmVyBQqxi4Q3klyGwEPRM16Df8irJS4
         s8ZJ4qHCoBRBaH7pHpwt5fr3SXU7NiKxDYPARKQTU+wzeuIi061luSEdb3GfI/su9rRl
         JnS1pjpJFevCkpU4Ipu+519jUK1NzEc5mJyTgmQ7W5Em9KmSPxfOGRfur2tsEg5B2xJE
         N2hG9wvGQscHJ3n1F6lrlII2xrxZZBGf4y4fotuE7hBB+KUrliUA9QchU62sRrBLV2ZK
         Vdrw==
X-Gm-Message-State: AOAM532/R24B3YgddmVjt5ftJKSYnktwMYNAYfmfFnrLr9Pz3myPAHUK
        8zUW2DcvoDp7b8I7kLKD0r01N+a9MVNauDrJ1jhWUA==
X-Google-Smtp-Source: ABdhPJwA1iCEPVv6xMPuIgTpyMXDCiaEK1oOBUUdRZ0jC5qaLQMdY99BUh7Lz/ffhkeFBkT99YrevNK4NyvINN6wtxI=
X-Received: by 2002:a17:90a:1b2e:: with SMTP id q43mr3935613pjq.217.1628545566041;
 Mon, 09 Aug 2021 14:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210802233339.25285-1-broonie@kernel.org> <CAA=Fs0k95E3FN-9rwzSQcK4JmejHDKBbvk-yhRynJBTbqBNVxQ@mail.gmail.com>
 <CAK8P3a0HWO1tPwCkhasRE1iXt+-rC72nAzsUuO6jb4XasGAAPg@mail.gmail.com>
 <20210809175502.226ce4cd@elm.ozlabs.ibm.com> <CAA=Fs0nF31NdEoPLM-a2RCupQPtHgHMzxejK67UuLh0wu32EVA@mail.gmail.com>
 <CAK8P3a0WRMNmBmBDerZ0nWPdFZKALnxrj-uUFBkTP-MOtv48vg@mail.gmail.com>
In-Reply-To: <CAK8P3a0WRMNmBmBDerZ0nWPdFZKALnxrj-uUFBkTP-MOtv48vg@mail.gmail.com>
From:   Phillip Potter <phil@philpotter.co.uk>
Date:   Mon, 9 Aug 2021 22:45:55 +0100
Message-ID: <CAA=Fs0nJDKheZA99+c-BWjpZCFrC=U4_-O2Hgxv2cg9hRGgDxA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the net-next tree
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Mark Brown <broonie@kernel.org>, Greg KH <greg@kroah.com>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 9 Aug 2021 at 21:00, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Aug 9, 2021 at 2:48 PM Phillip Potter <phil@philpotter.co.uk> wrote:
> > On Mon, 9 Aug 2021 at 08:55, Stephen Rothwell <sfr@rothwell.id.au> wrote:
> > > On Tue, 3 Aug 2021 11:23:29 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > So, can that be done in the staging tree as it is, or does Greg need to
> > > merge (part of) the net-next tree?  Or will someone just supply me with
> > > a reasonable merge resolution patch?  Or does Greg reset the staging
> > > tree to 5c872e1d2595 and try again next time?  Or similar for Dave
> > > (revert Arnd's work)?
> > >
> > > Currently it is a mess in linux-next and probably will not work even
> > > though it does build.
> > >
> >
> > Happy to try and provide a merge resolution patch if that is easier?
> > Will be this evening UK time though.
>
> Most likely there is no user space that actually wants this function at all,
> so I think the easiest way would be to remove all of rtw_ioctl in the
> staging tree version of this driver.
>
>         Arnd

Sounds good. I will put something together to take out rtw_ioctl in
that case, and submit through Greg/linux-staging. Many thanks.

Regards,
Phil
