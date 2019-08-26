Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4AB9CFCA
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 14:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727251AbfHZMqq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 08:46:46 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37885 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfHZMqq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Aug 2019 08:46:46 -0400
Received: by mail-lf1-f68.google.com with SMTP id w67so4006755lff.4;
        Mon, 26 Aug 2019 05:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=o5VxSqANpF3iSDMsKr09QKmtFoHpsPPzjP35Sih9O7k=;
        b=TZUvwiX/iIDZ88qwz/CJxf+nJvGdZ5VlDEsJHp7XIoQJv39Vxc+77iNAiehQUIFyFZ
         ZLzuytsIuVb25SwlGuf5ycNKRDy9OkR6ZvyQOqhwINmvLzbsESeHfuveEb4mrcIX1B9l
         CmG/N1kaWealPPbW0s97pZ5KlhzlwNA4KrpLdm+oMQUlQ5k34RUN0nPiqMaq6VGSVnZ9
         P1heSdvw2AVQOCUOYW9GRvu8JMY/Sjn8J3l+DlMsq4Y3POh2IB980jWuIr+RzbB7hYRO
         kYbDcvDOxxqfQc7rq13X4N0N5hLtruLIqq6qkSkig3gs1Sg8CPsawYWmkBsQx4eqtk4C
         m6Rw==
X-Gm-Message-State: APjAAAVbPp72/lF9Fo4NYP99nSJU7cn9ujE3B/FLkSb8WxcVkIqLEwKT
        8AWyhqTgpEVPw4KPMQsWieHuKkDA0tjiMNrDqls=
X-Google-Smtp-Source: APXvYqwfidbMez6Z9sGyVV6YsB5yeBlso+6tG0ecCalSdCDiOsyFu0JVkpo51uwZeGJBJY388lHn4wmaEjomEr/t5Ho=
X-Received: by 2002:a19:beca:: with SMTP id o193mr10076386lff.137.1566823604003;
 Mon, 26 Aug 2019 05:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190826215017.02ab0d34@canb.auug.org.au>
In-Reply-To: <20190826215017.02ab0d34@canb.auug.org.au>
Reply-To: myungjoo.ham@gmail.com
From:   MyungJoo Ham <myungjoo.ham@samsung.com>
Date:   Mon, 26 Aug 2019 21:46:08 +0900
Message-ID: <CAJ0PZbRvDMW2EApVJ1aaP4O9P3SQTs6Urysm3g-89NrfvVqP-g@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the devfreq tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thank you for pointing this out!

I've added a fix to the tree:
https://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git/log/?h=for-next
(and shared the patch in a previous reply)

Rafael, could you please pull the fix from the git repo above?


Cheers,
MyungJoo

On Mon, Aug 26, 2019 at 8:51 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the devfreq tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> drivers/devfreq/governor_passive.c: In function 'devfreq_passive_event_handler':
> drivers/devfreq/governor_passive.c:152:17: warning: unused variable 'dev' [-Wunused-variable]
>   struct device *dev = devfreq->dev.parent;
>                  ^~~
>
> Introduced by commit
>
>   0ef7c7cce43f ("PM / devfreq: passive: Use non-devm notifiers")
>
> --
> Cheers,
> Stephen Rothwell



-- 
MyungJoo Ham, Ph.D.
S/W Center, Samsung Electronics
