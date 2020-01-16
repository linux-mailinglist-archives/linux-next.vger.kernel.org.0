Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B00D313D349
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 05:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgAPEuy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 23:50:54 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38981 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729064AbgAPEuy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2020 23:50:54 -0500
Received: by mail-pf1-f195.google.com with SMTP id q10so9601787pfs.6
        for <linux-next@vger.kernel.org>; Wed, 15 Jan 2020 20:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=S/UKnCMf1wphMoJ4OYkcWAh+SusvLOSqiimKcfL2Y9A=;
        b=ZfjwP8mMty/3gY8/7UyP5mWSz503gg00xAVxGRihUuAduwFvWaB5lLxfmhETa49rMr
         x4GYE1l0nvMUbDVJ9Lvx/+zMU1/HCc9pieJX9hHMpJj3da7TCmRWlTN2dvnSvSpY1++A
         Qj5gfy3a35lBXVXhgQZoAIy2jcQpQ128Dd7BtTaiNtc3Y2mZurC9MLwSC9Cj7u8nzC1+
         hbpb2au3IUCG9bUfDSMUji+kJlXbCsVJqnDoCIndvE5bv8w9j8f4m9QGdN/AUlllv347
         8jYF57jjhMVk0zVu5pBjqRI1AaBTR7Ujbr+B3rAGYirbKAIIv5hUb4d52TaU8aA37eDf
         3AYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=S/UKnCMf1wphMoJ4OYkcWAh+SusvLOSqiimKcfL2Y9A=;
        b=fytDwkoa1Q1oLGJyhPn6atJt8xMKsltMGr7X9b0HULvrVzk2eFhj2omUIaukspOPfL
         7Mlm0OYL4XR7AyjON9bfuh7waH/ju+04chCggBUo7HF52NZ9PBLRfpe/13FJ6vNcy3Ua
         9TODjjgVm5WqGyYLJ4esHWq/+BPkqZY/MZtd/ZGazbVTLS7gPpWTTbjkQfpdFCtQgv2D
         mdQx1sZHRozmAGxKjkNS5LkDqP8AYVKNGam2c4tbue5m2dxsOyf26SkA76H315VkKcsa
         opLD6yK5mdR3+Ao+K3wguI7UzUunX08Au2XXNSaJvzqSJIQMvY/q3pA/pMlIViHiXmFn
         P2HQ==
X-Gm-Message-State: APjAAAXx5EI7i6VgbuD2oSjMygArhWcS4RFDwyG2sPGWtTzxqpvKhzlf
        XkJW4Q1P9vIkrk0HSK8aczpAMcA3qgw=
X-Google-Smtp-Source: APXvYqx8W8T4r676wWslp3VTMNL+6BkVR5IFd2Wz44CBYJOKTlTYL/G6uYUGnCSjOZMsZRMCILUWpg==
X-Received: by 2002:a05:6a00:90:: with SMTP id c16mr34347767pfj.230.1579150254055;
        Wed, 15 Jan 2020 20:50:54 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id i66sm24001901pfg.85.2020.01.15.20.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 20:50:53 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200116115430.74ba615a@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <4d97c033-c00f-bf96-30f5-9eadab8a2214@kernel.dk>
Date:   Wed, 15 Jan 2020 21:50:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116115430.74ba615a@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/15/20 5:54 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> fs/io_uring.c: In function '__io_sqe_files_update':
> fs/io_uring.c:5567:8: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>  5567 |  fds = (__s32 __user *) up->fds;
>       |        ^
> 
> Introduced by commit
> 
>   813668c6099b ("io_uring: avoid ring quiesce for fixed file set unregister and update")

Fixed up, thanks.

-- 
Jens Axboe

