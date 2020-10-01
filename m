Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF0F82807DE
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 21:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbgJATjc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 15:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729993AbgJATjb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 15:39:31 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CF7C0613D0;
        Thu,  1 Oct 2020 12:39:31 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id f18so5551934pfa.10;
        Thu, 01 Oct 2020 12:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=SPcB9PRLE4Rv1DUHX+tpu1/hiifa1pG9KnXgnqq/a/s=;
        b=nifLmTBXrl8gufM4JyFiY1b3pEy2SV30esAznXzpwv2lghHa4pwWGppepfW9eF7kzm
         JRk1otsvaMt7acOpoKkzGGN5dw844L56KoMf5AR7KL/rdmmn4WsJ3/LY7TY46pU/cvB4
         /8QWYAty0ysqOTu5eQClvDpOASWg4t8Ua21jmXE2qGFQnsO537BJPB9x02exl4wqodbT
         dnGieKHoW8TujF04X1VZP0sh+HqvBHoSrXvKqX+49y0oHJL+hHFeLCSUECR9cEDEDTuB
         Ul8s5uIpaSMqSvStQYpGsox8V8GfUSS/WbpuPL+VwlCjbwge3nONBLN47TTXtLHlzcNR
         yTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=SPcB9PRLE4Rv1DUHX+tpu1/hiifa1pG9KnXgnqq/a/s=;
        b=F/ychwu7giTYwl36luKhvG8pLCZjXt8eYxXJwUokcnxFUAd8KNDpH4WV/KqEcXhV6Z
         J63Bl2yjf9m94AYFAXdxcAWKs5wWzz+TiIBRBAN3Ntr7r64EvbyUTjkzJ9I40AsRVHMk
         0I2QDTabpi9IgyfUe1PgQFaiWsi6MQ9GcASE9Kin3h/26WIMZ6qre+20EHuXnr2urEKy
         hdwyJMbpVqvgQLggvppFEN/d+NCIhQENvh0/zHM3V41kZ+Cku1Wx0YAedOPrrzGoxl30
         ZCi0+Oi0wtrFSUjsu5NdSB4iNeooxavZeFxoAuQk+/CiaZ1pDY3RsMX8eTiAKqLeoauH
         GtKA==
X-Gm-Message-State: AOAM53308eGYvHCAkv8eJORCQWNIrj0LVZ0hqMAP1l6Hj7cvIckbR6Vl
        Q03+kRSvc8kQs6+C6lbE7RCRWZj+N6Sx/5cMh9E=
X-Google-Smtp-Source: ABdhPJxnqMTN9nUuF213zA5vrKRWwSCjz0Ugxtlu0Y7kc+71pDoi6wNrjc2FhTqfuPhrp2X2biuvbw==
X-Received: by 2002:a63:3247:: with SMTP id y68mr7309544pgy.224.1601581170642;
        Thu, 01 Oct 2020 12:39:30 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.217.69])
        by smtp.gmail.com with ESMTPSA id h10sm6719960pfh.217.2020.10.01.12.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 12:39:29 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the bluetooth tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201001215350.02b20b8b@canb.auug.org.au>
From:   Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <bb4e90b0-9fea-4160-cb29-0a2bb247e475@gmail.com>
Date:   Fri, 2 Oct 2020 01:09:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001215350.02b20b8b@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 01/10/20 5:23 pm, Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>   44d59235ace5 ("Bluetooth: hci_h5: close serdev device and free hu in h5_close")
>
> Fixes tag
>
>   Fixes: https://syzkaller.appspot.com/bug?extid=6ce141c55b2f7aafd1c4
>
> has these problem(s):
>
>   - No SHA1 recognised
>
> Fixes tags normally refer to the commit that is fixed.
>
I'm sorry for that.

The commit that was fixed is
    ce945552fde4 (Bluetooth: hci_h5: Add support for serdev enumerated devices)

I'll send in a v2 soon fixing the tag.

Thanks,
Anant

