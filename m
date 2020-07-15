Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55DB221057
	for <lists+linux-next@lfdr.de>; Wed, 15 Jul 2020 17:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgGOPIJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jul 2020 11:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgGOPII (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2020 11:08:08 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9957AC061755
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 08:08:08 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id h16so2239907ilj.11
        for <linux-next@vger.kernel.org>; Wed, 15 Jul 2020 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N2Tc17Rr4p8/CnE9/Q69Mw8vNfjf1wSeomUtzrfVVt4=;
        b=bAXyF5mnFFNR50WGQCzoR4y0e+YNErNmhCFIzAXmeEtskZ7YDy+JJQIW87Ox8yK/vB
         rwIwwOP6uTHi8U6q0Pad9dFtVOntIC5IJtLE5CKpTeiotgrWDY50fKatgrtcfdYUUnhN
         Zi8Ip7+cnsbF+I9HXiuhpj9cCmF0fxr90MjB7LXT0hgfOK/6RScSZbxcSMoo9ANXRXlP
         lGHrWhatHeSzlG2kFnOurhmusDInccD2yNh+pvPnM9UqTA8v7TuOO2bU4hogfiDWQgv5
         SXPUq3OtKkytIWOpLAos/2TRw5XbiaJZej4OIefJXGRnTRHXfDjDi1tHtInU33l5qCtB
         AV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N2Tc17Rr4p8/CnE9/Q69Mw8vNfjf1wSeomUtzrfVVt4=;
        b=E/jXsnGWsAzLVp24OGHd6T6FPYFnvv7ThHfSZ7Y596eIMjjS3p20KlG0PRGIw8G+mr
         AOHflqSk5D7s7HCA9cOcjZ50lYJB/B28Lw0yIdAgbmy3M9ixKaXhssA7ljImr39UdaE3
         DXifApGJ23J0/W+1C2BsDDYXUud+9xQiC/3olkkxV76CSyT47Sdq6ZkcFOIgQUOJC3Nh
         5hUS1fiobotWkgt+6bqn1DlYiCafEFj6GhAngsKzn48exbjdPmTDArOgOeoRRoscQ+5l
         yF+1M2LM9itY5Nh5DV9pISj5M+M8whN6rndxf0JTHAU7ZM9sAqqFzgSX2uxcGnYEkO6v
         02UA==
X-Gm-Message-State: AOAM533Hs+K+us0+4nKIwTuECO4X78yZJjL7EWXRynPj1T6pN9TGiiXX
        z3do7yghmlqAA5QzAYZ/W/gyMw==
X-Google-Smtp-Source: ABdhPJwFgGIm9OBMGPtFlk9DjAAg1pLSFUTqlyBWPGuVv1d4Ker51JWjIoh/EMy1vWoA1unf4T5oow==
X-Received: by 2002:a92:48da:: with SMTP id j87mr10913166ilg.197.1594825687973;
        Wed, 15 Jul 2020 08:08:07 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id r2sm1271254iop.34.2020.07.15.08.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 08:08:07 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200715121423.6c20731b@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <22e580c4-be3d-5917-b8dd-4a212f5160f3@kernel.dk>
Date:   Wed, 15 Jul 2020 09:08:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715121423.6c20731b@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/14/20 8:14 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> block/blk-timeout.c: In function 'blk_round_jiffies':
> block/blk-timeout.c:96:14: error: 'CONFIG_HZ_ROUGH_MASK' undeclared (first use in this function)
>    96 |  return (j + CONFIG_HZ_ROUGH_MASK) + 1;
>       |              ^~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   91ba0f529364 ("block: relax jiffies rounding for timeouts")
> 
> CONFIG_HZ_ROUGH_MASK is not defined for this build even though
> CONFIG_HZ_100 is set. The arm arch does not include kernel/Kconfig.hz.
> 
> I have reverted that commit for today.

Thanks, I'll take a look.

-- 
Jens Axboe

