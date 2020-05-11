Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2061B1CDE1D
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 17:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbgEKPGq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 May 2020 11:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728638AbgEKPGp (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 May 2020 11:06:45 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244A8C061A0E
        for <linux-next@vger.kernel.org>; Mon, 11 May 2020 08:06:44 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ms17so7937461pjb.0
        for <linux-next@vger.kernel.org>; Mon, 11 May 2020 08:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iT+tdYyqRDgvuVMsZ4OGGMIEPSaNDFZn3C4PrbVyaUU=;
        b=OhYCfZln8xjCNrXA2rqmTU75wVWvESusZ6O14FJhML3HhfyAo7i7ldiGJ31d4HVsNv
         r87WYM0ILVN5YPujOd+ZKcuR1R8IV9MQPiL/pz0J1GRV8Ph3SUHQQpmF8mo9EZWGPmQV
         QbP0EE4Wc4FVU/awlsy5wHBbjHR6UJa+NCBtbvE/6RpjHKdYVp/YvhahaEuOFpkXRXNz
         w8clS7Ftclvee0JAVShDNPtDgelorrDCSng1VrJKlVcveB1ZUWCk7hKpGXkelddoV8Y3
         ERutYhF4O4Ayp1f5xMqVinb43IrePCtwteTV/2VtvHbFha9CuOjk4Va4iFVSQGMJOGzR
         8OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iT+tdYyqRDgvuVMsZ4OGGMIEPSaNDFZn3C4PrbVyaUU=;
        b=qpDg9WSkFfqM9uOeArXBr6woz/SDvWjk5UNwXVoPmGqnBBAzwErag4qLUg4tlFaT4d
         nBWjCQQcfmKCVwf0jhhCXkL6U+mINyW/Q0/CkDGw+2hGXStf0SAEnvocdlLGuR2hbMOn
         MPrRP9i25KJA3PhFnvISMwMyCcDtzOKupTe2zbOcNqF5eBY3d1avZeYpU4k186ySnBsQ
         fX3oQFRWDxpgjfZLiTvJ9egQXKGU5Tgmm1TCnZJdF5+d0MsdVyKYxaJpnS5nO61LZSZA
         3djmuc9EaZnRJDtzHJaZCgvPyyYxI0HgRTo3CcpJjZ/f/qf7UxLofZWE16WQlGv5zUbS
         YPWA==
X-Gm-Message-State: AGi0PuYelZICkt4PQb86bp0HXvd1WkpKa4i8fJdtduiH1VXJpcqCzNhk
        pytMmw8z/tPoJZe6/webFXesXA==
X-Google-Smtp-Source: APiQypLprHSOYRv+5f5iwrFg5ANEyN/qPI/31A2kr4NNqRxzEAw55I2AEq2Rnk8oRGwlwY3KhEaD9w==
X-Received: by 2002:a17:90a:f40f:: with SMTP id ch15mr19417129pjb.178.1589209603637;
        Mon, 11 May 2020 08:06:43 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:2dd6:4c58:486d:263e? ([2605:e000:100e:8c61:2dd6:4c58:486d:263e])
        by smtp.gmail.com with ESMTPSA id e10sm9395447pfl.195.2020.05.11.08.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 08:06:42 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bart Van Assche <bvanassche@acm.org>
References: <20200511142756.1b7ef706@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <74a0ddc6-8637-c821-7128-4431261b0c12@kernel.dk>
Date:   Mon, 11 May 2020 09:06:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511142756.1b7ef706@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/10/20 10:27 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/block/aoe/aoeblk.c: In function 'aoeblk_gdalloc':
> drivers/block/aoe/aoeblk.c:410:21: error: 'struct backing_dev_info' has no member named 'name'
>   410 |  q->backing_dev_info->name = "aoe";
>       |                     ^~
> 
> Caused by commit
> 
>   1cd925d58385 ("bdi: remove the name field in struct backing_dev_info")

Gah, thanks Stephen. This series is looking less and less impressive,
fallout for both 5.7 and 5.8, in terms of build testing (none).

-- 
Jens Axboe

