Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA2CA952E
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2019 23:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfIDVed (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 17:34:33 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34297 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfIDVed (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Sep 2019 17:34:33 -0400
Received: by mail-qt1-f194.google.com with SMTP id a13so283820qtj.1;
        Wed, 04 Sep 2019 14:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0WY8Z7uuOkp45B0a2fjL2sapn2BwsYXAe9J2wXt4+wc=;
        b=KJSOevCeUCfrzTEmkOtFx4hiSyIXXOzGZgFcaE8P6ZVlvrJQIPjS2r/XlCNdHbHLAx
         +S1M47Riu4q6eTb+oFzVocWBwjgOP60V2b8a6QX23wAwp35Lnwqqkp0T0uj5OFe8uWy6
         rRaL3St9XLRffQGhP8c5mpnkIP8DsJyTx3u6LHoAf4RGnJDruLP1pA3eRbOhopDUhFhO
         RGmXGSdkNEl0pTs69iAXVTds0/WlA0WEeuwyT3+kdcxNQ7MHKe+9KMP+yJEeu0hrTOHb
         yXTUMxb6oeqm9IOcf9zn83edOnKZYP07xpOhLiFejlx3LdJH0PcTzrjeWrayg60dH6iz
         Fiow==
X-Gm-Message-State: APjAAAVMcRzafKRfeOuPbexGhPdqKiCxEe0IN1/hOrr872Vo68hAoxRB
        m5wUXM7BMdhGUh/FNMReiHDC6LqMlxEzOsSJZ9c=
X-Google-Smtp-Source: APXvYqyBgE2BrQfpBEN90032uCmlKJX7a6NLdsfC6RJ7xoQxmmxWloFIzA7IYr+hVhQLxc7wq5bsrlYRVweKvZHkviQ=
X-Received: by 2002:ac8:32ec:: with SMTP id a41mr249797qtb.18.1567632872584;
 Wed, 04 Sep 2019 14:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190904204427.1e1a064f@canb.auug.org.au>
In-Reply-To: <20190904204427.1e1a064f@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Sep 2019 23:34:16 +0200
Message-ID: <CAK8P3a306wrT5A7BEnL9BM47Si+0ooVxKy47qiMCjNAiuAN2xA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the slave-dma tree with the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Vinod Koul <vkoul@kernel.org>, Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 4, 2019 at 12:44 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> diff --cc drivers/dma/iop-adma.c
> index 03f4a588cf7f,003b753e4604..000000000000
> --- a/drivers/dma/iop-adma.c
> +++ b/drivers/dma/iop-adma.c
> @@@ -116,9 -116,9 +116,9 @@@ static void __iop_adma_slot_cleanup(str
>         list_for_each_entry_safe(iter, _iter, &iop_chan->chain,
>                                         chain_node) {
>                 pr_debug("\tcookie: %d slot: %d busy: %d "
> -                       "this_desc: %#x next_desc: %#llx ack: %d\n",
>  -                      "this_desc: %pad next_desc: %#x ack: %d\n",
> ++                      "this_desc: %pad next_desc: %#llx ack: %d\n",
>                         iter->async_tx.cookie, iter->idx, busy,
> -                       iter->async_tx.phys, (u64)iop_desc_get_next_desc(iter),
>  -                      &iter->async_tx.phys, iop_desc_get_next_desc(iter),
> ++                      &iter->async_tx.phys, (u64)iop_desc_get_next_desc(iter),
>                         async_tx_test_ack(&iter->async_tx));
>                 prefetch(_iter);
>                 prefetch(&_iter->async_tx);

The resolution looks correct to me. I had to research how I missed this,
and it turns out that the problem is me testing with clang-9 rather than gcc
at the moment. While clang is perfectly capable of warning about this
issue, the kernel turns off -Wno-format when building with clang.

       Arnd
