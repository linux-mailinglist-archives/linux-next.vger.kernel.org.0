Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7DA3C75CF
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 19:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhGMRjS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 13:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhGMRjR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jul 2021 13:39:17 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14B8C0613DD;
        Tue, 13 Jul 2021 10:36:27 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id z1so24045283ils.0;
        Tue, 13 Jul 2021 10:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3g3Cijcla/89iW/EaZQ3ICotAAUfLUSO4IjB0gva++I=;
        b=TLYTOtHW+I/97sh6kVagbdreOYfI9M9MYYXUCCXpCj6pp3RAp5fg+pgCzCHNpnTRDA
         qiE02gVe1eszsEHXhwrCqS132BTv4Tfu5zf4aRZL53pmUpqvohz0clyltG6EJiHLzqFW
         d7NM4VorrQZVetfIUh/2Z6bLE82VnMZXtxNb0B4MQTMIz8OIz6lyqJMsZLVP2sR85APH
         PRlvj8fQaDbvH9YdJpNCyXsSnoOKHLjcBxO0ojnoIIqKBRKufBN69IY+28lE9gKPvLCt
         D0jt2LAbkB/Vcgl6+FiQPDIwvYrx/4iAAgrS1M1s47RXjoHDwKUwhh6ArpWDo1LtDt1t
         FfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3g3Cijcla/89iW/EaZQ3ICotAAUfLUSO4IjB0gva++I=;
        b=EpL85oBxPUhbywwHRQHDK2Wga/Y3PNzt9eU/xbk6NbkzIT/dZRPDg1A4B+ZdIf0eBw
         LibvcUq+VtkeBaN6d5g+022QOWY103Olp5JjOHlSC6g6KXZPZRAxeiOlRDDa15P4vVPg
         lPiS2GyMwUG4bbvdKURXJteHOmI0vrDaXx10wZtOhBYBDXiYqC6YhLmatMKlRPYhAMyr
         0/dpol2cS7PqQ4HxV44vRbjoUYLg6QqH1LNZTgma9lAhRrwXP11Ypd6KWpGrdtAmS0pV
         SrAI9iUxfuRhWMaVnEwX3qw6fXXy1wnTILD9GP+dBXUQUUNrV1v0wTwxkYPpK5kOLa37
         PjAQ==
X-Gm-Message-State: AOAM532xcB45SmtbZQ6P8C7TPNeh6szxMdeCBJfW2/sOUum30V/3frBd
        u+wfkrcRYx1E4O+d5SXPEV5GjbV/AwFgTwGgzSghA/H7
X-Google-Smtp-Source: ABdhPJxVun6yT94sLQ/aoNlj+GeZwl2RReWNavCS2anXbOYD3Nn5r8IBT0p98c6YPrRXmrIDg0ytN3udg87qbu2IoUU=
X-Received: by 2002:a92:b74d:: with SMTP id c13mr3699097ilm.176.1626197787248;
 Tue, 13 Jul 2021 10:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210712120828.5c480cdc@canb.auug.org.au> <c47a7f0b-4b5a-30c3-ee1e-2973793a9534@infradead.org>
 <20210713111029.77bfb9bb@elm.ozlabs.ibm.com> <56341950-abd6-8a9c-42ca-7eb91c55cc90@infradead.org>
 <8ed74a96-7309-3370-4b8b-376bface7cc6@infradead.org> <47f394e5-c319-3b79-92ad-d33b0d96993e@infradead.org>
In-Reply-To: <47f394e5-c319-3b79-92ad-d33b0d96993e@infradead.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 13 Jul 2021 19:36:16 +0200
Message-ID: <CANiq72mDL+CA9CnhDG5Sij4ufVzGHrWvZ9eaWSSXQMDYbpL-6w@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 12 (no Rust)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

On Tue, Jul 13, 2021 at 5:31 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> OK, I found some 'patch' failures in my download logs, so something
> in my scripts didn't do its job.
>
> Thanks for bringing it up!

Thanks for looking -- if I can help with something on my side on the
Rust tree, please let me know.

Also, if you found what went wrong (e.g. the end result after `patch`
failed applying something), it would be nice to know, in case this
comes up again.

Cheers,
Miguel
