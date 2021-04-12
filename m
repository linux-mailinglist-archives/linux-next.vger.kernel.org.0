Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6402935B86F
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 04:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236554AbhDLCPA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 22:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236542AbhDLCPA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Apr 2021 22:15:00 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0854C06138C
        for <linux-next@vger.kernel.org>; Sun, 11 Apr 2021 19:14:42 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so8567265pjb.0
        for <linux-next@vger.kernel.org>; Sun, 11 Apr 2021 19:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DMu4LCM6csSyRutrVohDHx+4nOuQRDGpUb1uReu3+2k=;
        b=buSLwAJFxaP/ZlCbsmtlEsrwMU3jsL6Jc5rwfBBrUyq98GaskGl9da1w+az8psLs+g
         Vdaa3PF6f6MVTZ1HoI0DA4+FfL9VpjR41Ttf1bgie/H4O16vRFKhv2fofk6mfxqWqNX3
         BBpZJ2aS9dF26z6kMuuYxyn/V3IV2L1rvsepR0qW+GSPv0oSN4JnSZfplHaDX9l06NhG
         +dPasFv656oJJOVtHXerruQ5YHsmaSCxzJ3kPDLk7bdk+BOISVwHpbgil+vRDGZ8YzdP
         1KAjnuAxj2zdubhYVdCHhTvE071L51ELoPOWvK4RJvO5cfusUy3a9o5wkGHiAtNm8sMY
         EFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DMu4LCM6csSyRutrVohDHx+4nOuQRDGpUb1uReu3+2k=;
        b=iEnqCoSFOfikzN4tzH3w/QIcmCNgW9s3LOCd6Sey7gq7elHY0FS/K6rd7D0ttWt47n
         dzUPXQ4TAm/S8GDyYZBQo1uKqAC7idi5TCtwqVweBE5jfkM9d6BQs7SCiuFriFSWnh1y
         8p1fuybq2cnwyjy1Y1wdJ/Hg0TL81iCXWVlxw1iJE0mvi+hu1WfC1Q7TiMKWDI7OlEHX
         9nLdEf4c4dnjjIq/pi9JfelAaaQugAtBhy2v3MyviXpmENODoA2Q7yQWYmxHaxaSWwoB
         yV4O8W0dLkAQbYkL1zJH7q9mPuPlIwn0KNPg2GaNziSZ+ph1JEQBi2B459spWuAqWGFU
         98lg==
X-Gm-Message-State: AOAM530J04EzQJ6Zrkwg7IeKja6070gEhsZGNkWXjHiqEx9iYBRdh0uL
        YSJuj3h3NwhWHmppgrO/rKoVGrMpTYjotQ==
X-Google-Smtp-Source: ABdhPJwL/ZSO4EBMyRb24S5T9Ha0/jL2fVqLQNz88Kocolt1gum+NYkgybd7sb3Kpz7Wc+0O7OAnuw==
X-Received: by 2002:a17:902:8688:b029:ea:f782:5eae with SMTP id g8-20020a1709028688b02900eaf7825eaemr3069521plo.15.1618193682240;
        Sun, 11 Apr 2021 19:14:42 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id i126sm4972723pfc.20.2021.04.11.19.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Apr 2021 19:14:41 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210412083404.2d0dcf7c@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <0aa24415-74c5-1adc-6e27-edf37285de4e@kernel.dk>
Date:   Sun, 11 Apr 2021 20:14:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210412083404.2d0dcf7c@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/11/21 4:34 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   6fa6517fe62e ("ata: ahci_tegra: call tegra_powergate_power_off only when PM domain is not present")
> 
> is missing a Signed-off-by from its author.

Sowjana, please reply that you're OK with me adding your Signed-off-by to that
patch.

-- 
Jens Axboe

