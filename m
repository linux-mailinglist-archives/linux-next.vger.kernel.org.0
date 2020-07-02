Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABE91211AD2
	for <lists+linux-next@lfdr.de>; Thu,  2 Jul 2020 06:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgGBEHn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Jul 2020 00:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726361AbgGBEHn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Jul 2020 00:07:43 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B464C08C5C1
        for <linux-next@vger.kernel.org>; Wed,  1 Jul 2020 21:07:43 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id o22so6878904pjw.2
        for <linux-next@vger.kernel.org>; Wed, 01 Jul 2020 21:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GAH6ryWr1XYB1ggxji+dhT1fSzyaM2fT6l3rS9nVfOY=;
        b=vBIn6A3a9VGvi55v0oucV9eBYHiFBsqeb3Faw6QREovl8TYoCO4p7A1Ggr/lHFb+k2
         hTzCEN9Df/pM0NHW5t40UHVsOUsXdbrv+G23qOWugZqZgpQmIZN/mmL1pguPoxjzIG0N
         H8h2dUYUxv+01VsiSNNQB3WVzGI7piLrj/EMJB9dq0q59bkmDIcYPgy2IlHqo61Kcpce
         JZmVrGkZlHwTUNPpgOo6Dn29MGkzRurSMp1yzHLHEDOqV1ktwIMcNPxI5oD5EsFTk9gr
         +/EQPubzBjQ0VMO4O22g17fHI2gtqkLv18NE9frOFoAw1hj4uK+11PQ4YTgOTtHaAJA0
         UY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GAH6ryWr1XYB1ggxji+dhT1fSzyaM2fT6l3rS9nVfOY=;
        b=GBXctwa32W7z+jJ7186uZqbbwCtu42+lHheI3oO9zPGWzQpxYXX0MO+5NcM3dOFatE
         H93YST5lUr3XjOuqbK0AJ+y7ZSr47TRMILSPlMR/hM6vF4BeKgjX6BJPSsNnjx24LO/5
         Qaz5rSzp8yDciGsuzFJLlhsvc+cnxM47BHU/mymN2+Wwn2G0BCOsGlfIyvtGjPnznUGl
         FaNv4UTY+eDoksOlrSwIZ0rCtVCw2KhuWPOfCKlGTn9DPWDknRMTVLUuHwF06qvZ/0Av
         jomKueDQqt8gWmYTDk9DVy523Ixa7WxrrtzjvzE7JEyW8XiD0inARworDlA7zpmM+ufs
         7J8w==
X-Gm-Message-State: AOAM532aHFsJUtPnkoDTC5cL1y/DEZB/Mi7Sz8XdAMBzOIVJ/ED/6upG
        YZ0YS6PtO8dsnYdOLHNQXlWJZg==
X-Google-Smtp-Source: ABdhPJwJTXbS28eFnzRkeoeKnTOqsgZ9d9rqynQb+L2B85/DtTwJZBxinj5ZDG6SLIPXUQaYDnn5JA==
X-Received: by 2002:a17:90a:b25:: with SMTP id 34mr29072875pjq.220.1593662862472;
        Wed, 01 Jul 2020 21:07:42 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:b0a2:2229:1cbe:53d2? ([2605:e000:100e:8c61:b0a2:2229:1cbe:53d2])
        by smtp.gmail.com with ESMTPSA id d18sm6448347pjz.11.2020.07.01.21.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 21:07:41 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
References: <20200702112112.04d3f992@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <5f9ae650-9e3c-e9c2-3bc5-d7afbdee778d@kernel.dk>
Date:   Wed, 1 Jul 2020 22:07:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200702112112.04d3f992@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/1/20 7:21 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> drivers/md/dm.c: In function '__map_bio':
> drivers/md/dm.c:1296:24: warning: unused variable 'md' [-Wunused-variable]
>  1296 |  struct mapped_device *md = io->md;
>       |                        ^~
> 
> Introduced by commit
> 
>   5a6c35f9af41 ("block: remove direct_make_request")

Thanks, I did fix this one up, just haven't pushed out the updated tree
yet.

-- 
Jens Axboe

