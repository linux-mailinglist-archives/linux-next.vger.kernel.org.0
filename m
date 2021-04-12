Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B4E35B82B
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 03:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236561AbhDLBc4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 21:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236590AbhDLBcz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Apr 2021 21:32:55 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9DEC06138D
        for <linux-next@vger.kernel.org>; Sun, 11 Apr 2021 18:32:38 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d17so212242plg.0
        for <linux-next@vger.kernel.org>; Sun, 11 Apr 2021 18:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nfhX4/F7jWBcnfadZvcTONmC7OZQMMlS292d5e8m9a0=;
        b=SSVai9TFSRTAXYwZjQc9LTCSeVzSA6PTs63ezdd2WDpF7iY2K4IM9WejJWUOo9G4d2
         DqmPStlH3Y2X7rZKALYZLHvEO60uCkM+2p+30jYlfIND4GiWQmQIGXSC/O1SHfyV08E5
         5Ek/X0j+j2WRvoLsgrtyybOzjBGAjcBOyo3eD4M8eEHEYhMSXPw9AtPJohfqCSCpGCjF
         DBtzL8252lCQt0J60lcYMZ763UEJZMgIIR0601Fi9wkFAzLJFDxi4AN+q7B0fr7bzaIX
         YvZuRSLbPs5/6gMlP1IMKbC3LKe91XwWSIZke9k0b4lrDgw8swkyDA0sq0r+aVbFo+jW
         Rang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nfhX4/F7jWBcnfadZvcTONmC7OZQMMlS292d5e8m9a0=;
        b=JlcQWDkrVjbxKkYT//saGgbzSwxIjovZR+U8mwkIIzCrRduBZCqLyrmOSO7zlR3AkN
         86WZJG/31LLqgV70vNtOMgkVO2+udKcatpj/3Q6Iuv32GOmCPs4NGeOPD8GbAJZBaMwO
         FEEjsZn/z3R7cOxKyrX76kejOLgifz5oOL6LNSgF5kI+CFx9bUmdhmUunKrylsxfWqQC
         nvAxe+7TCW30Mt0U7tjAFN8yprt4683oPImAOJPi8Ih2+5KplkuDOffJz8yKEEFt/2gz
         t7msjenDRrIc1B1EMNvnrn0G7KUtCwZ0eMKp9BrddKH/nC4+H8Z4gdZtiqrxCldvH/HV
         yclA==
X-Gm-Message-State: AOAM532PeuFlQUohW9tG/cPlCAS8fKFnJlmdkWSh4qoQ1FKvO5LRVoRL
        A/ayWBzJIz5mH5hbjjJrEMkeBA==
X-Google-Smtp-Source: ABdhPJyLSXvS0OIRby2x1S9/XeMRsMR0Jn3wrDMTkDz0I1UlclQ2Lgf6B0ItKUc0ufgKZNmA1zJiuw==
X-Received: by 2002:a17:90a:d3d1:: with SMTP id d17mr25585461pjw.21.1618191157704;
        Sun, 11 Apr 2021 18:32:37 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id v126sm8133112pfv.138.2021.04.11.18.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Apr 2021 18:32:37 -0700 (PDT)
Subject: Re: [PATCH] gdrom: fix compilation error
To:     Bart Van Assche <bvanassche@acm.org>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkft-triage@lists.linaro.org, linux-block@vger.kernel.org
Cc:     hch@lst.de, Johannes.Thumshirn@wdc.com, hare@suse.de,
        Damien.LeMoal@wdc.com, naresh.kamboju@linaro.org
References: <20210411224330.4983-1-chaitanya.kulkarni@wdc.com>
 <0880e158-516f-9d87-ff8c-3835da10d92b@acm.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <69c6b2b5-4f13-3f9a-4187-2bb4b721b3df@kernel.dk>
Date:   Sun, 11 Apr 2021 19:32:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0880e158-516f-9d87-ff8c-3835da10d92b@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/11/21 7:12 PM, Bart Van Assche wrote:
> On 4/11/21 3:43 PM, Chaitanya Kulkarni wrote:
>> Use the right name for the struct request variable that removes the
>> following compilation error :-
>>
>> make --silent --keep-going --jobs=8
>> O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=sh
>> CROSS_COMPILE=sh4-linux-gnu- 'CC=sccache sh4-linux-gnu-gcc'
>> 'HOSTCC=sccache gcc'
>>
>> In file included from /builds/linux/include/linux/scatterlist.h:9,
>>                  from /builds/linux/include/linux/dma-mapping.h:10,
>>                  from /builds/linux/drivers/cdrom/gdrom.c:16:
>> /builds/linux/drivers/cdrom/gdrom.c: In function 'gdrom_readdisk_dma':
>> /builds/linux/drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared
>> (first use in this function)
>>   586 |  __raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq->bio),
>>       |                                                             ^~
> 
> How about adding a Fixes: tag?

Indeed, that's definitely missing. I've added it and applied it.

-- 
Jens Axboe

