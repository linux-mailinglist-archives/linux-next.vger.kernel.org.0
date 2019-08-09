Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85DDB870BC
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 06:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405098AbfHIEpJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Aug 2019 00:45:09 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:43468 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfHIEpJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Aug 2019 00:45:09 -0400
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x794it7W019781;
        Fri, 9 Aug 2019 13:44:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x794it7W019781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565325896;
        bh=df0sEzxWZq8ySeGezqUd0Gu5Yd91jnr1Jw8yFv3zznI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kyWCi4uTGZPVJAGsUBiaeqtMlKivr/+Jdkm9+GhJAqVQoHzgD3UnsKEB5odoXDxL8
         1GNIt/qLK2cg34+QUT9MJJ5l0i7pXYYuaWYridyJ+bY0P0oGGG+J78OMtF3tFGkEUq
         88r/812ccE8JzunKt0B/nUJdoxmKFXe95+o6FUZXAQb5pVxI09zaFn+po1M0SzIhce
         f3nviG3f1nBcDCTr8mla6wFt1Xaw+8F4ON7iQYiFQ9Ysp/y0QPZ4BJfF2fqjRSxjuD
         J/fAS9a1c4u2CNaK4uKcKK/HwtRWar0/PpacpWoA2XJ92ktRkD6b15VvTjOC/nSBA6
         HXN3WxRkuu1kg==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id v18so37284220uad.12;
        Thu, 08 Aug 2019 21:44:56 -0700 (PDT)
X-Gm-Message-State: APjAAAVk9yjbaeWffkAxWjT0FRSmeJo4z+yJv1duCKngVJvE0rzfYhOj
        MBu0TpOSG97JB5X2f9BNL1CUnP0GHK1HkTStFoc=
X-Google-Smtp-Source: APXvYqwqJy5vILZgO5JWCC5MfeyozBzFJI7asrS040QYhMFPFNY9xCGax/HbGYlCcYYcJJKa8qt2hZ1G5XAp0QRjDIA=
X-Received: by 2002:ab0:4e8c:: with SMTP id l12mr2378717uah.121.1565325895216;
 Thu, 08 Aug 2019 21:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190808181739.62f257ed@canb.auug.org.au> <20190808225316.GA3725@osiris>
In-Reply-To: <20190808225316.GA3725@osiris>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 9 Aug 2019 13:44:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNASzxcicBPM5OkScnwHPef_7X=oiuO_0xCH3f55ACYZEWw@mail.gmail.com>
Message-ID: <CAK7LNASzxcicBPM5OkScnwHPef_7X=oiuO_0xCH3f55ACYZEWw@mail.gmail.com>
Subject: Re: linux-next: Tree for Aug 8
To:     Heiko Carstens <heiko.carstens@de.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Heiko, Stephen,

On Fri, Aug 9, 2019 at 7:53 AM Heiko Carstens <heiko.carstens@de.ibm.com> wrote:
>
> On Thu, Aug 08, 2019 at 06:17:39PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20190807:
> >
> > I reverted a commit from the kbuild-current tree by request.
>
> Hello Masahiro,
>
> it looks like there is (another?) bug in kbuild. With your patch
>
> commit 421a15c167b2d1f43f287da5b75ef2704650640b (refs/bisect/bad)
> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date:   Fri Jul 26 11:17:47 2019 +0900
>
>     kbuild: clean-up subdir-ym computation
>
>     The intermediate variables __subdir-{y,m} are unneeded.
>
>     Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> the file modules.builtin starts to miss a lot of entries when building
> the kernel tree. Reverting that patch on top of linux-next 20190808
> restores the old behaviour.
>
> This is the diff I get without and with the above commit (s390 with
> defconfig):
>
> --- modules.builtin.ok  2019-08-09 00:39:58.148624485 +0200
> +++ modules.builtin     2019-08-09 00:40:07.878637541 +0200


You are right. This commit is bad.


Stephen, could you revert this commit for today's linux-next ?


BTW, I had dropped this commit from my branch (with another reason),
but I forgot to push it to the public place...


-- 
Best Regards
Masahiro Yamada
