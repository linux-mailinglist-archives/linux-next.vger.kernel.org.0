Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0FE2A7714
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 06:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgKEFhV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 00:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKEFhU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2020 00:37:20 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D36C0613CF
        for <linux-next@vger.kernel.org>; Wed,  4 Nov 2020 21:37:20 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id dk16so777132ejb.12
        for <linux-next@vger.kernel.org>; Wed, 04 Nov 2020 21:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EfJjL1akExmM7MryZh1gsP+atrfYQFsCn4uSXTzdFys=;
        b=IAL9rcqKhpT6r323u029j5TlagQx0L3D0AAGR1yoYNnvILrTVe9xtX8YXqpJxTL9fO
         +sEz56pVfIzLZxT9ZhROLYQue/XaR0gP4/xX1LhE1RlQOjrhUV/4BTBU1zGRm1FF4c77
         IvH/KFb2Z8JjIEUSMX2TfC7qnISIgV6lNfHYuH4A8EPDYFcJAYpFFaRIrDMzIm4z1U7q
         buy60rFZlSl2X0PjrJMBOGmdsOxNqHsYTMkU/5MdnulLCwiMg/uo3jvoNAZ6Kx8OxgvK
         xIOlgu/g5hH59GfrnucDLCcPZvFraHDHYUYhLiDE7gtZ5/dHIPTdi8H7tlHhHF7ldmUd
         OmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EfJjL1akExmM7MryZh1gsP+atrfYQFsCn4uSXTzdFys=;
        b=kc8L5tY8LdUCALsWefJsU3/B/zNlfC6TS7tMWx9BIOOeMblAKMjSDO9bcm0oaYWEhB
         gIMB9urXXWH6JLuhgaciCO4cdjKOtT32Rk/qBCjRkU9a5Cl0FvaciZXM01QFIcWH5yh8
         uihT4i4rcM+oj8wwTZr3at3+ql+Zo8P+voJ7Em6+YFsfsgJE7dowcQTSZMY4rH2srN4Z
         /ZqHBkWK/NV1uTcvF5JQm4S4rIFh4oMTqx0LdilcxADiwHTE+KCQSRTf//2juONYYhE8
         SraEgkrudiPGhYi+HzSTFBdMJ3DV/Va0Z+gZBmz5bzt9UTcjjvn4Qz9QIJ3cKozie6ZS
         616w==
X-Gm-Message-State: AOAM530SRB7hfpnVRpAg8XHjblR86jK+MLdSSMiRO3tNESDE1gT00QtL
        dfrDkFE42ITG7Lp0+GfdsLNdWe7bAOhIazT1hWWeChi0ngk=
X-Google-Smtp-Source: ABdhPJznzbYV8sguutlJP+ym2wYmSr3JSs6Lt8G4t20KrAZBP5q9G8BwybKouTwwoVsrNXznzC+Bjxp4MJa1URC+4jk=
X-Received: by 2002:a17:906:280a:: with SMTP id r10mr649101ejc.45.1604554639040;
 Wed, 04 Nov 2020 21:37:19 -0800 (PST)
MIME-Version: 1.0
References: <20201105160453.0c2283b1@canb.auug.org.au>
In-Reply-To: <20201105160453.0c2283b1@canb.auug.org.au>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 4 Nov 2020 21:37:06 -0800
Message-ID: <CAPcyv4jLUp=h+mthXca67DW-OvS10sOtz78ESjMcKF9BOB8uTw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 4, 2020 at 9:05 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from include/linux/numa.h:25,
>                  from include/linux/nodemask.h:96,
>                  from include/linux/mount.h:15,
>                  from fs/pnode.c:9:
> arch/powerpc/include/asm/sparsemem.h:17:16: error: unknown type name 'pgprot_t'
>    17 |       int nid, pgprot_t prot);
>       |                ^~~~~~~~
>
> Caused by commit
>
>   45339c019cbc ("mm: fix phys_to_target_node() and memory_add_physaddr_to_nid() exports")
>
> I have reverted that commit for today (maybe I should not have added
> it :-().

Ugh, I'll check my cross-compile coverage.
