Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7DF1788D4
	for <lists+linux-next@lfdr.de>; Wed,  4 Mar 2020 04:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387589AbgCDDB2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Mar 2020 22:01:28 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:56161 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387553AbgCDDB2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Mar 2020 22:01:28 -0500
Received: by mail-pj1-f66.google.com with SMTP id a18so231339pjs.5
        for <linux-next@vger.kernel.org>; Tue, 03 Mar 2020 19:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8zFTVbTQU7V0OF6FX6oDnQG5+NUAJ3hxQM3Ad109F48=;
        b=dzOwMbyLpBiRKf7FAh5JcPXOWnscGPta89pkjmV5CLAxCAfe75icMIjGlPt3oe3uBo
         dCQEC00ZrOsSm650/HvuIeNjmoMWOgt5/18i/Uzj/VD7Ws0/kpty9/56BH5Ktimq5x3d
         3874cVy/52tN0A4U+zzKRExYn7P3PK736UrRrceBigW69RFUoYoSSb7z49glapnD9W5C
         22SJ97vPK38jZUwi+igKrZqT7CEgOrlW5sQK3DGfXvZu1hkRukm1m+SmdQFi5yp2gkwy
         MCapqZAqRAa7Qc9fjw/NAFgOHmm7J1Fu/DxOZA6dxwGvd1HQpOodxDGRoqzZj4FI4wUU
         yt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8zFTVbTQU7V0OF6FX6oDnQG5+NUAJ3hxQM3Ad109F48=;
        b=S7EnTbBpGXFYSlWgwm++QRBPbZgf+Q/sk0j9I5+v19EAlDc6F+11E/k2d071r1nk0m
         +5C4BAUEA2WimC8ZkIrP5zeNo2f62JvszHuDzZ7VHi1Yh+fqrYN0S0iF/oZYjwWo/SsM
         3UUlbKYQInmw+P38hg/592iUfMlqnNgB5v6oGSif4aXXu6sQDduRnPeObIJvDfoRKY2q
         9wEb8qrNW9Yqt+KYWTjmKXJSqXb1oAuRGceefMa8+KA+4klU3JzBDYgOxupByuso1eJR
         8YjoScLwVuMCGDhN62b0K2NseADNi33ZurVS5zar7RlwpRHIvihuW0pdjAvMiUECk/Ep
         pxxg==
X-Gm-Message-State: ANhLgQ1rTAh7OHdRCgpq4TU3YhWpVHwNhBCj+Og5kC9L6azWnWmSBQgu
        JcasIM2KcP7tqKeMoplc8N6kdg==
X-Google-Smtp-Source: ADFU+vvUs+OrIckddXX8LhPmztePsb0qpVAGmJjwtx41tZ+o+TVc09hMoD4phxhSzlDeWKRxfdhnDQ==
X-Received: by 2002:a17:90a:f8e:: with SMTP id 14mr711003pjz.159.1583290886902;
        Tue, 03 Mar 2020 19:01:26 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id mr7sm507482pjb.12.2020.03.03.19.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2020 19:01:26 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pavel Begunkov <asml.silence@gmail.com>
References: <20200304131750.55d84beb@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <cd8154ef-bb6f-aa7c-2553-582f0b497516@kernel.dk>
Date:   Tue, 3 Mar 2020 20:01:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200304131750.55d84beb@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/3/20 7:17 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/io_uring.c: In function 'io_close':
> fs/io_uring.c:3415:3: warning: ignoring return value of 'refcount_inc_not_zero', declared with attribute warn_unused_result [-Wunused-result]
>  3415 |   refcount_inc_not_zero(&req->refs);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   62e0c6b73a2c ("io_uring: make submission ref putting consistent")

That should just be a refcount_inc() and also looks like it should happen
before the async queue. I'll fix it up.

-- 
Jens Axboe

