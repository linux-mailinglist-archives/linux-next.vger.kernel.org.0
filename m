Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1480D453EC6
	for <lists+linux-next@lfdr.de>; Wed, 17 Nov 2021 04:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbhKQDIk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Nov 2021 22:08:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbhKQDIk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Nov 2021 22:08:40 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09359C061570
        for <linux-next@vger.kernel.org>; Tue, 16 Nov 2021 19:05:42 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id k37-20020a05600c1ca500b00330cb84834fso3568697wms.2
        for <linux-next@vger.kernel.org>; Tue, 16 Nov 2021 19:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UKZ6GaRD6run3c1PJPskqzhUzQy+wsAa2zgVKl5+4u8=;
        b=IGaA7Fhphxaznr+UYSLE09+pej6AmCx0QFzafA1J3gvETz6n84x/7uHPT1goftadgz
         oH1n8NH12lL+ny/jzQmx1GwD7lR4vo8+Tz6ypBlpSz0jTJbfMBgIif3OllUWjsecLwIn
         Y2V6Ay2vZomXg9PdU6QKQjspKTkKuJGSaXiUtm8df0ILGg9Cniit0xgQtJ4qfwk2rbXp
         CxK7IeP5YkznIOYHdUvbz/wRs04z573RbStv1lHuDsL8M5zdx+g0Ce+ntYHLFj0Qf3J9
         4uwQhWkVo2XpVC5ZdIBUP4A+abKzMAxb1yrUP2npWS+ptewmSl8KoburFWIaVeMbz9BO
         E8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UKZ6GaRD6run3c1PJPskqzhUzQy+wsAa2zgVKl5+4u8=;
        b=CriKrAHVtZ1GkW9tcn/oTnUiVI5QtJ2/3O5vsj1cGgWQtyDQPyMmu0OzYJf8muc9YA
         3/4RVrgrshVsb4Xo/3R+FMxaL2r1cqVrn5SdeSO2FCrWICWH1A7cV3aGoB7+iu0Gf5ud
         ihOoz/4+ChIKQUV29FvhfD+BUIsXVfk+roKYuT4cjj6ytRiDm/5ICAT6bhrM1/gHSfm8
         4Tihgthrq/VLRkU3D0oJRrGTeakWo7ZtTwIho9XEH0TZPqqRiwuhibdeoRqe8VdHWMlK
         uXE3fm643N6XsP0ab+LDMDeoGjXhW1Ff0B3QgrmtUEPSHa4lg+o0/e6H6HSnMh1dsVX3
         r9Yg==
X-Gm-Message-State: AOAM532vp+eK4cgC5diHs7unl0CvvEP/LXoK4fFt25CwvclQ2eRZFX+A
        FqMyz9zL7LGRvw5k8GJiOFLGo5sVMLWHlZ406z41lQ==
X-Google-Smtp-Source: ABdhPJy4vo81ZBn+uQt56I0zEdMolI+WBTQ4qIs/blKZxO0eNUos1D3u/BgeLEce8BEwH2HAjPDjKINMSft8z1bJbG0=
X-Received: by 2002:a05:600c:3ba3:: with SMTP id n35mr14188808wms.88.1637118340213;
 Tue, 16 Nov 2021 19:05:40 -0800 (PST)
MIME-Version: 1.0
References: <20211117135510.0307294e@canb.auug.org.au>
In-Reply-To: <20211117135510.0307294e@canb.auug.org.au>
From:   Eric Dumazet <edumazet@google.com>
Date:   Tue, 16 Nov 2021 19:05:28 -0800
Message-ID: <CANn89iL=gHkZg5YUVYmPMB79xA_d5eDXjQLS_85Ks_NU6q97HA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the net-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 16, 2021 at 6:55 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the net-next tree, today's linux-next build (htmldocs)
> produced this warning:
>
> include/net/sock.h:540: warning: Function parameter or member 'defer_list' not described in 'sock'
>
> Introduced by commit
>
>   f35f821935d8 ("tcp: defer skb freeing after socket lock is released")
>
> --
> Cheers,
> Stephen Rothwell

Thanks for the report, I thought we got rid of these htmldocs for sock already.
