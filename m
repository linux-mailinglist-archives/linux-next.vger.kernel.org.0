Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD161DDCBE
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 03:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgEVBh0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 21:37:26 -0400
Received: from condef-03.nifty.com ([202.248.20.68]:26041 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgEVBh0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2020 21:37:26 -0400
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-03.nifty.com with ESMTP id 04M1SfEN018962
        for <linux-next@vger.kernel.org>; Fri, 22 May 2020 10:28:41 +0900
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 04M1SJai011585;
        Fri, 22 May 2020 10:28:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 04M1SJai011585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590110899;
        bh=WO97w+HaBwdmE62qzYedm3R7prD0osfSacFfO3kd6QY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YABKSuDHCESfDul3RO1gyhAv7Em2FcDwW74TJygydahezkeMZWlaS/RN0hqfdZ8XR
         0GkZa5AYIGIpcvwN+SNI20GTyGsNCtvfiwns1d4oesaD0RpoIuy/5Arcb8v6y78zTR
         xGHly314NJSX5ep7HVbZTWS8zSV6C/nxm0klTbzHCyRKlw5UfLUUvn+T6/luP67xTS
         Rn/M0A87YD8o623lVZuXO5RlFjIwKvYU0fTW8zjXG9TlYv7//QmAfuNCl+k8BtlguV
         fDRPiuF+c2/0TDJjuOT7yLSQFQq7wg7mDcBekE0NxRU8avXu4+p0HbVpDoXVeI4rCM
         Pgk/2ZZLxZvRQ==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id e7so5213995vsm.6;
        Thu, 21 May 2020 18:28:19 -0700 (PDT)
X-Gm-Message-State: AOAM533+ZHQXa20WZvqtdOInmGP4tbrnO6yTm0k15PLZe+PknITu97Cf
        PCTQlJVZcvJXF5g/cVXrVVJaf5dvRsw8dAyAt3c=
X-Google-Smtp-Source: ABdhPJwyhZAU6Ap3q5CzUiDCarir2jXr7qhUNz/IzRXLgmA+eeuyS/cezLBc3TiYG6z5VvUd15L9gYfucAwn6uUAu/Y=
X-Received: by 2002:a67:d016:: with SMTP id r22mr8961471vsi.215.1590110898528;
 Thu, 21 May 2020 18:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200522082433.4f536de1@canb.auug.org.au>
In-Reply-To: <20200522082433.4f536de1@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 22 May 2020 10:27:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNATU18vKsSV_pugSRw4e3bQBUAQ670ac34GbO2YNHXgLPw@mail.gmail.com>
Message-ID: <CAK7LNATU18vKsSV_pugSRw4e3bQBUAQ670ac34GbO2YNHXgLPw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc:     ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 22, 2020 at 7:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   82ab9b6705bd ("dt-bindings: arm: Add Akebi96 board support")
>
> is missing a Signed-off-by from its committer.


Sorry, I missed to add it.

Olof, Arnd,
If you want me to resend the pull-request,
please let me know.
(but, probably it is too late, I guess...)


-- 
Best Regards
Masahiro Yamada
