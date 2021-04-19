Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FCE364934
	for <lists+linux-next@lfdr.de>; Mon, 19 Apr 2021 19:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239538AbhDSRuq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Apr 2021 13:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240109AbhDSRup (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Apr 2021 13:50:45 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C78AC06138A
        for <linux-next@vger.kernel.org>; Mon, 19 Apr 2021 10:50:14 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id b17so29839401ilh.6
        for <linux-next@vger.kernel.org>; Mon, 19 Apr 2021 10:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K/JiRHNlFjwYLSVVtgx/x/EDPBSENpgrycP6BNxv2zY=;
        b=YSyahX7voyh8YjJwkltHQB3UWps6RYXzHWsCJWkrfPbSVY1LxPuHkcIL8zOLErX1Nc
         ONEuZL0HgiPh5YUBQs3C+BbV+vN+6z3OsFO7XemJdko6H5Gyh4c/LOLEt8oXRmIEbkFU
         hNp02pXqz5fApGuTCvUzpZv5WxDuaPz1uE6puSn1NHu1E0nUcX9x+dL7MKSSDX2o7ysg
         YqwxDss9O1mvTVet908V7ViC3Fj+GtoQdeeapeskAnMi9m51Xq3ximTAcanlEQ9fttwp
         PB6uUTCKrUT3DXE9Ygrst43Z63c3eic1z+u/Mgq5TEslDxilLh+oG+p5DAMnJ90NykRE
         c4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K/JiRHNlFjwYLSVVtgx/x/EDPBSENpgrycP6BNxv2zY=;
        b=QfuWLwicbiBAF7Uixux1PhgLYpx6iO+Zhm70hmE/QW5igvk/ZEatQV5uCcRu4Mh5fy
         LLYo1UaKkG7PG4GKcsMrLef0XjteLwKndQH4SXYNi/5CUU4zC1TnG0VP6q3aclNOBWan
         ETgRCjGlolT/kIEaLRsrZaCWF21JXAmTRwRVUybO3ZOg8g2q9/9T47qUGijoPvRfL42p
         4OgrFEtLc+tnvKav/3F/7wBkuIY6R5PRIgMoGLHQQAptWufYqHV1pOGaln8BG+GT1UZv
         QdeF0xaFCk4Z83kuK2DvAQAsCRsYPGXh8k22o3h9XP7PybopCFKFYJpU4/gJMoD2fk5z
         eWDg==
X-Gm-Message-State: AOAM5306CVplRgVFfTXYb+d5Lpu5fvIn/6hEyIlsfMi1fMMrmJRzxCIa
        6G4XolCrA43PFWBZDcM7W3cTGQ==
X-Google-Smtp-Source: ABdhPJwilAIebXVaLqaM8jw2aH1ULyghdiCgybjr2E615YoWP9BcmHCp2GRUmacf97qGNkhrpl4pjA==
X-Received: by 2002:a05:6e02:144f:: with SMTP id p15mr18427131ilo.143.1618854613637;
        Mon, 19 Apr 2021 10:50:13 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id 7sm7431304ilj.59.2021.04.19.10.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 10:50:13 -0700 (PDT)
Subject: Re: linux-next: Tree for Apr 19 (bcache)
To:     Coly Li <colyli@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        linux-bcache@vger.kernel.org,
        Kent Overstreet <kent.overstreet@gmail.com>
References: <20210419202309.0575ad77@canb.auug.org.au>
 <66d41349-60ba-f27f-5c56-3520a40dd83f@infradead.org>
 <f4ca485d-614b-6924-63bc-0948d087bdc3@suse.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <76e63e74-2237-f672-eb10-edde017bc76e@kernel.dk>
Date:   Mon, 19 Apr 2021 11:50:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f4ca485d-614b-6924-63bc-0948d087bdc3@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/19/21 10:26 AM, Coly Li wrote:
> On 4/19/21 11:40 PM, Randy Dunlap wrote:
>> On 4/19/21 3:23 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20210416:
>>>
>>
>> on x86_64:
>>
>> when
>> # CONFIG_BLK_DEV is not set
>>
>>
>> WARNING: unmet direct dependencies detected for LIBNVDIMM
>>   Depends on [n]: PHYS_ADDR_T_64BIT [=y] && HAS_IOMEM [=y] && BLK_DEV [=n]
>>   Selected by [y]:
>>   - BCACHE_NVM_PAGES [=y] && MD [=y] && BCACHE [=y] && PHYS_ADDR_T_64BIT [=y]
>>
>>
>> Full randconfig file is attached.
>>
> 
> I need hint from kbuild expert.
> 
> My original idea to use "select LIBNVDIMM" is to avoid the
> BCACHE_NVM_PAGES option to disappear if LIBNVDIMM is not enabled.
> Otherwise if nvdimm driver is not configure, users won't know there is a
> BCACHE_NVM_PAGES option unless they read bcache Kconfig file.

But why? That's exactly how it should work. Just use depends to set the
dependency.

> But I see nvdimm's Kconfig, it uses "depends on BLK_DEV", I understand
> it is acceptable that LIBNVDIMM option to disappear from "make
> menuconfig" if BLK_DEV is not enabled.
> 
> For such condition, which one is the proper way to set the dependence ?
> - Change "select LIBNVDIMM" and "select DAX" to "depends on LIBNVDIMM"
> and "depends on DAX" in bcache Kconfig
> - Or change "depends on BLK_DEV" to "select BLK_DEV" in nvdimm Kconfig.

The former.

-- 
Jens Axboe

