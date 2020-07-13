Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A7821D42E
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 13:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgGMLBu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 07:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgGMLBu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jul 2020 07:01:50 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56377C061755;
        Mon, 13 Jul 2020 04:01:50 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id e8so5870294pgc.5;
        Mon, 13 Jul 2020 04:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PLDTOUjo+Us4PRzbHAHkncjVeQotYYWeKuV0fTxuxQE=;
        b=P3a0aMxZX57xTDDVtevvhPbtILAUCdoVYemwr5tYof8eC9gmOilvR8DRwo2TSxiimi
         2o3mzJYJtaAfcMRFswp6OA/hCdzUdg6y7CHIwZ7qlFIX/BvG43K2wWxroIzpPQ172sVj
         qSQiGi02tzfySYjmmZWQuHB+0x49TXjbvo9oJNOeyEVx9jj9iF5XrgFkP1xc1lph4lev
         3z0ZUWJC2xEsUA0/XKy2y6xhnmD00BaOz4ULqB/6E/GzZVzZxAaR2Iz9HRmxKnoyMOUH
         yUFRLuwCxTvOI4cz0B0IDvIfmvgurWAi5go9mCNtFOmBMlWdP8sQ3COujb3TBUAAXOrK
         8t3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PLDTOUjo+Us4PRzbHAHkncjVeQotYYWeKuV0fTxuxQE=;
        b=pNy8jjEhbExphgs36K3P0QP/SwF7n3MxtrcXUm7KyQWJSX3neeeOhxYsUfZP7Kv6UU
         3+OYCIoYl5c8/f5UcMjNiyQ5S/FZP9D1SXujmxBGoAg4yjPqi40lkqqMXrSCkwo87PU2
         iJTixOSn3c43ykFfw6Biv/RbzU9t+my9o4A7pyGy7fXQpDfZqs3wanEVdTsTHUmRpWVB
         k9TK+y0MJyrbtauXI/pEUQ64CWV01np9lihLcdNxbdWGB7+9fQTOEIGx9oRuJG8Iphz8
         yoLa7Imv30O923Ox2L4ZrApjYGu58bNtg8vQuyEt3qqyqTpux2vULU4weyK5YTuxYPpR
         sTaQ==
X-Gm-Message-State: AOAM530AnlGMgW1HHcSlcFV0byuJ84wPMA/9xwlD0B51cvR9+xlKQFoB
        JhI5JepxkUMa5v2JotR5zz94lQvzx90aEbalVO4=
X-Google-Smtp-Source: ABdhPJztjlzZ8I15mA4ZUtzxH6wmgoWCnIb3FoBThQCtQHqaa9n4qxq2ugmElZ2h3BA113XeuRp2rLN8RtucOjJLSZk=
X-Received: by 2002:a62:7657:: with SMTP id r84mr71646218pfc.130.1594638109708;
 Mon, 13 Jul 2020 04:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200710183318.7b808092@canb.auug.org.au> <20200712155604.GA342822@smile.fi.intel.com>
 <20200713080152.63ee1246@canb.auug.org.au> <e519f1c2-9761-4866-4878-09cc3da23d1f@infradead.org>
 <CAHk-=wib+gfHwo0zADm-rMXuBaHMdosudtBXeUk0qfQEna9Hjw@mail.gmail.com> <f5a764f8-74d9-c11f-c1d7-2b22fc42f6c6@infradead.org>
In-Reply-To: <f5a764f8-74d9-c11f-c1d7-2b22fc42f6c6@infradead.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 13 Jul 2020 14:01:33 +0300
Message-ID: <CAHp75VeTrktumdYOpyHSdO4kFY=73BTEe2N460oAHWSY+FuWmA@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 10
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 13, 2020 at 5:37 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 7/12/20 7:27 PM, Linus Torvalds wrote:


> Thanks for replying.
>
> I've already got it built & working.

Me too. 0.6.2 works for me.


-- 
With Best Regards,
Andy Shevchenko
