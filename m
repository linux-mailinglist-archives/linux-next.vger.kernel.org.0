Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFE12DA13F
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503085AbgLNUNf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:13:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502894AbgLNUN2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 15:13:28 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1164C061794
        for <linux-next@vger.kernel.org>; Mon, 14 Dec 2020 12:12:48 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id k8so17035816ilr.4
        for <linux-next@vger.kernel.org>; Mon, 14 Dec 2020 12:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R0djdFVfiLhwXdPF2sC9wzpfiMJReCx8378wS8crAdQ=;
        b=pzzIA8Xr2kWo6YeaYZQFCcJ3kK0f8401/xEebM0O0EzI2aLnrHSHPLZ1PPXCUmfXXT
         7cficpyqJPnmKFUyKyGakkBHKJx55Y4IhTGX1oS5WZn7DXqKIsXP3CM0tmI9QgQUv/vu
         w/rTD2bxwdXn2HSUgYjipNKFAexktjoGxY2rrrSo6HmMCig35Bm5dQHcMurBfVdtZkG1
         9133kDZVHLUZ2Ezio2UbfYz//hfQmEHEz10KuqS6BELq0qOPLKIxtXXSw/oOJXL1HnFo
         49FsLXLmvloJgKBqY3wMxak3+sTvidjAXn1SbZCix5fH/Kbev+vZkBdKJOy2wubXnUvx
         LI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R0djdFVfiLhwXdPF2sC9wzpfiMJReCx8378wS8crAdQ=;
        b=mimn53EhG1iPO6vR5BAmHqmEc+eaYFqtGCbAn1fG8LXqWDcGzBijWTRzlm/PAAmvcV
         T8Zy7VKDw3HYlGBvN82EUEpS5uYSMYr8GlocHY+iORcWNNu5OqhkYyoiKEVzpsL9kJLm
         2D0evYeIblA115dm9rqQr52FUQp6HHApV5xFZW47d2yKjDNAN+tUHIddMQFANks/XfRO
         fyT0jJU0VdAG0zbYOrkAcO+bME/b5CqDWS6q1QTnUgP3ukmG0FdRxCBecReSdARFrmSp
         GXJjd+x/rwV9sTul9HSmYUGqxKqjoXIfGNCOLs629tpB+/TzJNrQ4L9ijPXtXaEAWSlN
         6IgQ==
X-Gm-Message-State: AOAM533grlP12kfAS3j8P8t28ng6zz4mQrrPVS5plFEAnjdCiHOjLR8Y
        1wqrIBx5RplLQrSN6sUzXFerQMCBLHO+uQ==
X-Google-Smtp-Source: ABdhPJyWvwY0fr/Z+wReYHmlL4RUVHFaF5Dfr2o72c7PuHUh42UbVrPCveuFak52cuHdYL0KPhG5ZA==
X-Received: by 2002:a05:6e02:b28:: with SMTP id e8mr38310171ilu.240.1607976767621;
        Mon, 14 Dec 2020 12:12:47 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id y15sm11746584ili.65.2020.12.14.12.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 12:12:47 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Sterba <dsterba@suse.com>
Cc:     Damien Le Moal <damien.lemoal@wdc.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201202150149.42543862@canb.auug.org.au>
 <20201215070956.6852e939@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <25c43226-f937-0866-9c0b-46867bd04cc7@kernel.dk>
Date:   Mon, 14 Dec 2020 13:12:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215070956.6852e939@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/14/20 1:09 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 2 Dec 2020 15:01:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> After merging the block tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> fs/btrfs/zoned.c: In function 'btrfs_get_dev_zone_info':
>> fs/btrfs/zoned.c:168:21: error: 'struct block_device' has no member named 'bd_part'; did you mean 'bd_partno'?
>>   168 |  nr_sectors = bdev->bd_part->nr_sects;
>>       |                     ^~~~~~~
>>       |                     bd_partno
>> fs/btrfs/zoned.c: In function 'btrfs_sb_log_location_bdev':
>> fs/btrfs/zoned.c:508:21: error: 'struct block_device' has no member named 'bd_part'; did you mean 'bd_partno'?
>>   508 |  nr_sectors = bdev->bd_part->nr_sects;
>>       |                     ^~~~~~~
>>       |                     bd_partno
>> fs/btrfs/zoned.c: In function 'btrfs_reset_sb_log_zones':
>> fs/btrfs/zoned.c:606:21: error: 'struct block_device' has no member named 'bd_part'; did you mean 'bd_partno'?
>>   606 |  nr_sectors = bdev->bd_part->nr_sects;
>>       |                     ^~~~~~~
>>       |                     bd_partno
>>
>> Caused by commits
>>
>>   a782483cc1f8 ("block: remove the nr_sects field in struct hd_struct")
>>   0d02129e76ed ("block: merge struct block_device and struct hd_struct")
>>
>> interacting with commits
>>
>>   ab3ea6d0e65c ("btrfs: get zone information of zoned block devices")
>>   1a4b440a1c2b ("btrfs: implement log-structured superblock for ZONED mode")
>>
>> from the btrfs tree.
>>
>> I applied the following merge fix patch (which may, or may not, be
>> correct but fixes the build).
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Wed, 2 Dec 2020 14:55:04 +1100
>> Subject: [PATCH] fixup for "block: merge struct block_device and struct
>>  hd_struct"
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  fs/btrfs/zoned.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
>> index 155545180046..c38846659019 100644
>> --- a/fs/btrfs/zoned.c
>> +++ b/fs/btrfs/zoned.c
>> @@ -165,7 +165,7 @@ int btrfs_get_dev_zone_info(struct btrfs_device *device)
>>  	if (!zone_info)
>>  		return -ENOMEM;
>>  
>> -	nr_sectors = bdev->bd_part->nr_sects;
>> +	nr_sectors = bdev_nr_sectors(bdev);
>>  	zone_sectors = bdev_zone_sectors(bdev);
>>  	/* Check if it's power of 2 (see is_power_of_2) */
>>  	ASSERT(zone_sectors != 0 && (zone_sectors & (zone_sectors - 1)) == 0);
>> @@ -505,7 +505,7 @@ int btrfs_sb_log_location_bdev(struct block_device *bdev, int mirror, int rw,
>>  		return -EINVAL;
>>  	zone_size = zone_sectors << SECTOR_SHIFT;
>>  	zone_sectors_shift = ilog2(zone_sectors);
>> -	nr_sectors = bdev->bd_part->nr_sects;
>> +	nr_sectors = bdev_nr_sectors(bdev);
>>  	nr_zones = nr_sectors >> zone_sectors_shift;
>>  
>>  	sb_zone = sb_zone_number(zone_sectors_shift + SECTOR_SHIFT, mirror);
>> @@ -603,7 +603,7 @@ int btrfs_reset_sb_log_zones(struct block_device *bdev, int mirror)
>>  
>>  	zone_sectors = bdev_zone_sectors(bdev);
>>  	zone_sectors_shift = ilog2(zone_sectors);
>> -	nr_sectors = bdev->bd_part->nr_sects;
>> +	nr_sectors = bdev_nr_sectors(bdev);
>>  	nr_zones = nr_sectors >> zone_sectors_shift;
>>  
>>  	sb_zone = sb_zone_number(zone_sectors_shift + SECTOR_SHIFT, mirror);
> 
> Just a reminder that I am still applying the above merge fix.

I sent in my core changes, but they haven't been pulled yet. So I guess
we're dealing with a timing situation... David, did you send in the btrfs
pull yet?

-- 
Jens Axboe

