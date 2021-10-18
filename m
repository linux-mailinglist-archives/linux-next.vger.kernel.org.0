Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856A143289D
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 22:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhJRUvv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 16:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232164AbhJRUvv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 16:51:51 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1B1C061745
        for <linux-next@vger.kernel.org>; Mon, 18 Oct 2021 13:49:39 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id h27so10506352ila.5
        for <linux-next@vger.kernel.org>; Mon, 18 Oct 2021 13:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1pihYDCvEf2Z6K75YfFMFw+JWLtxAp6wuhd4PjGIMrU=;
        b=BMRykRu36bs1qv/KCS8lrwYwsUfnO3cug9H4h8u+d6zOxEssNWKUulzXsjRVKiZw3A
         GNqilha1zktsMsji10IxAgDVLDJ3WN7gY3gbR0oT7dWjwQ2O8PDXuOYxx/TXZ0ADhxBG
         1UD1G+RIzg7vmzqrvg1YNlpu3Wqt/JJv2eCMsOQtexgSFvJLX0oZMr247w9+gX3e1Wy7
         0ZytYaq9v920NMkBnxY/Lw9Ci72YIqglCqMK6eKRrbkIPzuopqM+GJPIlF8wSldQHbfE
         N4zu4uJ/KuVw8o4Mp+T3DPasKn6+OF8Yv4MHf/A8r7LbSvtlxusjeOThS5SQ2ysYk7jC
         zdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1pihYDCvEf2Z6K75YfFMFw+JWLtxAp6wuhd4PjGIMrU=;
        b=rAauyuIGufeOCQnfDykKQdhYVi4ZFPAtdp2oEDugOARYhI78XR+DginDrM5l4pXf++
         gKW6qZNcCphuqJWpzjawaksWy6nmQCRJi/FYl/3pWkRqGrs9wVgj5/sWAPSLXrbS+o+Z
         SLXRbzBAcxxuT02HtjOuM3ERs4gKF1+r3abXzsUzWxF2y7GgdwKl6RuE9a2W17Tyx+xs
         FsDYZMkMuwUCh4CgpK0qZotUYqxWkGCRti1+MDpUMwCM7lI4sYEMHfAvO+Q2seV83hWS
         QH6/vXZFTeGgQToleiH89OQ0lPqj12ytTu3sB3IjepKcJJRDEyf87YbGkJsyOluSHRqk
         37jQ==
X-Gm-Message-State: AOAM530KJFlhjUjfSedxwYASzVllIBDNDKcTzfo/EWvYV0J3ijVM18V1
        a65vbdR1nOjwirz5r8aa35TTPzv2+Pa+Lw==
X-Google-Smtp-Source: ABdhPJze41+5g4GW1QdvVLA/JYU8X5q2KYJtJOdGuLvK8N2YMOXJI4wc13EzCed/P5LoYAnbvy+ATA==
X-Received: by 2002:a05:6e02:144e:: with SMTP id p14mr15615072ilo.286.1634590179185;
        Mon, 18 Oct 2021 13:49:39 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id g8sm4647626iow.36.2021.10.18.13.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 13:49:38 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commits in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211019074806.4bb0cbcc@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <de927d6e-15fa-9937-18a5-97ae3020c34d@kernel.dk>
Date:   Mon, 18 Oct 2021 14:49:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211019074806.4bb0cbcc@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/18/21 2:48 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   e036488d8a4a ("md: update superblock after changing rdev flags in state_store")
>   3a79dfe0318e ("md: remove unused argument from md_new_event")
>   b6f5737bc4f2 ("md/raid5: call roundup_pow_of_two in raid5_run")
>   57644bef4efb ("md/raid1: use rdev in raid1_write_request directly")
>   7d5f9b337c20 ("md/raid1: only allocate write behind bio for WriteMostly device")
>   78eef929e8a5 ("md: properly unwind when failing to add the kobject in md_alloc")
>   c57a1efbeadb ("md: extend disks_mutex coverage")
>   a1094e65cde0 ("md: add the bitmap group to the default groups for the md kobject")
>   96c85588b9b6 ("md: add error handling support for add_disk()")
> 
> are missing a Signed-off-by from their committer.
> 
> Rebased?

I'll fix it up - yes had to rebase this morning.

-- 
Jens Axboe

