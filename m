Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE0E1DE963
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 16:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbgEVOq2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 10:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730119AbgEVOqZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2020 10:46:25 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB1CC05BD43
        for <linux-next@vger.kernel.org>; Fri, 22 May 2020 07:46:25 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f4so5081573pgi.10
        for <linux-next@vger.kernel.org>; Fri, 22 May 2020 07:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PP3NlRQyU9hVtOdAQG1RX9CTlatqPKoXALMeR0iOkSU=;
        b=lxlss0ZnfC4Z/AbhW67TOHU6mhwsl1MwL6RchBIVSr/q+I2CV8QoajVGUif9/k/4sk
         U/t7cSReHxUX/OESlDS5lVyoJVYFtCzkNBSJ8iskjmqqfmuJpp0LSgBFO8YmuJiE4qqu
         PZsB+Gj7MFYbLow6WLjiKlbkYZJt9cXBYrFOFdV+7HT7H4tyKre3aZalNxIF1wbK6SWo
         2RQO994KR8W0zBxufyyT3KUGbdwoMkvZoYYcePbIhBHPsqbUIL0wWNNbPf+KWy2ix2WO
         JSGx86NTWKao51q6tFo82+UH2Hta73TUuqGLCATWgF1MyeynsJfhdtlWnON4Pvs+Lbnh
         TNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PP3NlRQyU9hVtOdAQG1RX9CTlatqPKoXALMeR0iOkSU=;
        b=IgWLjUVIWvmPdJd4yunLkxMKJG0hN1DcnvJ6R9iUFxzZv96CgKDlF6YQuMz7VIoNj2
         I9QbxdLKXglNGNYNXqKul/7/bhjMMks/ywrOiDe9vOpyi5aFVWFDSIQAlYE/GHXEVYb4
         dqnoLdy7DrOfwYdZtw55x+nrELvmomaFMH28n7lVGUCbGQ9r2KJAk9ZdjamUSP2vyRe4
         zgMLHg8HPeqch9ttSztG59G79DqKsspFZClEkGD/8VID+AvLifud586q0kbfBcBRLqnz
         /tYMn79Rvb3pjy2zu83vqH324DllxDOaVky3WXV9fWcLBOqD/4I04LEfgQUOW0x5P3x0
         JG2Q==
X-Gm-Message-State: AOAM530pygzAdk81Qn+qz5BQaJNk4Dfmhu0Q+xQ8WkJ8m/78/kX2eRlK
        dl8nO+WL5uwY4GkaBtCgCO78Jg==
X-Google-Smtp-Source: ABdhPJyOskFVbu5Q7jztS/JY+dJEhfz7pdsgkS1G8FHxMjsxcwx7mtvJ/wUGWknKrnr7P9rFJfWeCA==
X-Received: by 2002:aa7:9510:: with SMTP id b16mr4234538pfp.265.1590158784741;
        Fri, 22 May 2020 07:46:24 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:892a:d4e5:be12:19f? ([2605:e000:100e:8c61:892a:d4e5:be12:19f])
        by smtp.gmail.com with ESMTPSA id mn19sm7014158pjb.8.2020.05.22.07.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 07:46:24 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
References: <20200522213202.38ebe825@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <7bb2cb93-062c-4ef5-4986-5dd82694edfe@kernel.dk>
Date:   Fri, 22 May 2020 08:46:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522213202.38ebe825@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/22/20 5:32 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allnoconfig) failed like this:
> 
> fs/libfs.c: In function 'generic_file_fsync':
> fs/libfs.c:1116:9: error: too few arguments to function 'blkdev_issue_flush'
>  1116 |  return blkdev_issue_flush(inode->i_sb->s_bdev, GFP_KERNEL);
>       |         ^~~~~~~~~~~~~~~~~~
> In file included from fs/libfs.c:7:
> include/linux/blkdev.h:1875:19: note: declared here
>  1875 | static inline int blkdev_issue_flush(struct block_device *bdev, gfp_t gfp_mask,
>       |                   ^~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   c64644ce363b ("block: remove the error_sector argument to blkdev_issue_flush")

Gah, I'll fold in the fix. Thanks Stephen.

-- 
Jens Axboe

