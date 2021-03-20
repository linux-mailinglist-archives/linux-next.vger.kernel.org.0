Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4DD342BC3
	for <lists+linux-next@lfdr.de>; Sat, 20 Mar 2021 12:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhCTLMi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Mar 2021 07:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhCTLMY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 20 Mar 2021 07:12:24 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCEEC0610D4;
        Sat, 20 Mar 2021 03:57:52 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 31-20020a9d00220000b02901b64b9b50b1so11017183ota.9;
        Sat, 20 Mar 2021 03:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wq+T61KApM0Ouyl3nQpQtU5i7jv09KyVNafls9wYT3E=;
        b=G6y+aIVp4bkGoqKP9TLsSFfaIqtmBntdjtikoCs4K5ETlkRHrtgZQl26jxWLHmOQfq
         FwIXt167KW8W4/hBjtD4DvQInNYVB9tq1wKzFr1zJO0I1I0RLZgnTLfhZtStt7c3TMxj
         vj/UhkejptddWaCyVVFtE/pZgq74ubX/ipW+yLqlpMMuXG3Zr/Bk5VCY8QHU4LGzDzmw
         ZJysASyxgWiXFgx5TWaWgdG/ANoPI6kecLPCkZNs0IyAlZ8rUu7Gpu46Olk0JfzUVxG8
         P57WDZelWsWlpwEfYd6tvUY4QtlMqmpRbqpkcbGbKtLf2UVUc8W7YzcPmZawo4RjSUYD
         lkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wq+T61KApM0Ouyl3nQpQtU5i7jv09KyVNafls9wYT3E=;
        b=amn+KUXfGpPN9bj/rWnSbhQKL9aQGyKR9/3fqcb2yjSjNadxdgzt4FcEHBCO/Xomzq
         aW9H/4EDCYHvdE8NdedmYELhoJvUT48SCXfJokV0pLJLSISbAJtw/IIZFL9wD6sJkHRh
         10Ivb1DWQ0PgfS+/UwymazPaLfM2FW3A/+uOP9UjO3K6p4UoycTm7KKXyqW7WDIKhRxN
         j3fTFfOTIaYsh065pTbxlQ2PrMt4jO5S8iY4TMwzEh4xy3uVr5FSEbtBwUSW1vxh3uu8
         mgfDjpKanZe+xVXqkYycq1+BYmqTF6ePrkBEw1xdUesvQePawHx8Z+dcZhAUUGFeVlYu
         vBRA==
X-Gm-Message-State: AOAM531QQan8UGf9CiuXrQobwhWs+B4Gut6qEFlWkiP1rcChsVEwQgGz
        oT/2I+Vg3AGvziNoVRGiE3Rnq59MWWfmDlYu2vHsHl4gbxM=
X-Google-Smtp-Source: ABdhPJwqES/7JYz78OVBuEc5iqC2Dr3ly8ac5o8k6r0c7V8Y3wPc7U7rJgh3hh6SMALB1iyp9dYqjIldKiiWfUfADSU=
X-Received: by 2002:a5b:449:: with SMTP id s9mr11474745ybp.115.1616223504876;
 Fri, 19 Mar 2021 23:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210319175950.509fcbd0@canb.auug.org.au> <YFS1h6h+71sRlwFR@osiris>
 <20210320162734.1630cc55@elm.ozlabs.ibm.com> <CANiq72nKJBVsuvqr17qa0xnkQTUz9aaAGRi8SfXZAn-G=RYQXw@mail.gmail.com>
 <CANiq72n+-9vtpvvHTD=QzpskCbZEvTWhDXUaHrkwsJn4M3fjXg@mail.gmail.com>
In-Reply-To: <CANiq72n+-9vtpvvHTD=QzpskCbZEvTWhDXUaHrkwsJn4M3fjXg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 20 Mar 2021 07:58:14 +0100
Message-ID: <CANiq72mp4=4FZ_Vq1pzA07vkJ1mKFKOFFhcVoH9zTJjLtrBc9A@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 19
To:     Stephen Rothwell <sfr@rothwell.id.au>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Mar 20, 2021 at 7:49 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Reproduced on s390. However, under defconfig, one also needs to revert
> kernel/livepatch/core.c to avoid triggering the assert, i.e.:

Stephen: I will put this in rust-next so that others don't see
problems on their side and test it with a allmodconfig for powerpc and
s390 -- is it Monday the next round, right?

Cheers,
Miguel
