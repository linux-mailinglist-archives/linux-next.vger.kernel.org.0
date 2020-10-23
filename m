Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25DC52967F1
	for <lists+linux-next@lfdr.de>; Fri, 23 Oct 2020 02:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373764AbgJWAa7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Oct 2020 20:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S373792AbgJWAa5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Oct 2020 20:30:57 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8450C0613CF
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 17:30:55 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id w21so2391032pfc.7
        for <linux-next@vger.kernel.org>; Thu, 22 Oct 2020 17:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l3qcvdtan5dRvVPenI5CllkZ6Ty3UdDPZyBIxdORfFE=;
        b=L+oYxbd6BfZRhIxnb3+SepAKFoG0NtpjVRy8NAR9HrfTHZ88C9L+22i54mFhUZFen3
         saw8Gc+xc6SaqhdhGtzN6DyAhlKu4Vr8nx/xAzPRuWdHLCs1S6r9UV9Gg5IJ0fGmOnZz
         zLBI2jHn2uBLs6Q5HJ9aBTRPgXqaX2bX6yQu8zYG4UtBGQ4e06xNo2OJUZ2Kkpf48ZBI
         9mylobKBvOICOkYktb6CgDu8bkW2BEhJa1sPmhPsVoMHBIwhbGpvgbSCx3K3nadWUUjw
         T/UOEvQoplSgkeCVV39lrPwPg1ahaiDg9Dvtk2VqnesqGbglDjielZtGsAUkL6w3z/rn
         OaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l3qcvdtan5dRvVPenI5CllkZ6Ty3UdDPZyBIxdORfFE=;
        b=rrqywxx8H6jWd7yGkCXTENoc+k6OySnWpbF2LBNQX0gQj6JwPlwGt8oXbwSvuYedH2
         TmjbV+60kDh8p9aMNivhkD5SRxJK0p5lWUZPBGgU8b9scyf8wyEmmgZNCmuaFAz0UmLx
         3ljQ4z0+R/LO83Q4ft3kZFzmb7nDy3rus1RWNcoecgUPCTydGD8AKcOQDVqbqyDmsQdR
         g0dbCLPOmBDV3/PmA8PNPpBb2TgztOgmem+aSMU45VxJpOoWWTk0Md0VJRHOAtbbsGYJ
         Qa26xinTuUDvjbaNLn3lV/nWlLUmEQzqPtKK+4Pmzp7IYkhHduCS4B0LS+NwN45KhEhl
         SkSA==
X-Gm-Message-State: AOAM533Ytsm1VIdxn1N/4q3yvB6eK2m5zS6g7MI3OY5lSJ0lsRwJtYdc
        tBS15J5vqnhJt9huSzgdjR5R7HG9B8z1dg==
X-Google-Smtp-Source: ABdhPJzRn1L8whkpveiSYUzNPhqhdmqk0fgt0PRA2LFodj6Qd5PrePl3B6VZedAGMunmN3idimZLYQ==
X-Received: by 2002:a17:90a:c28c:: with SMTP id f12mr4594071pjt.146.1603413055146;
        Thu, 22 Oct 2020 17:30:55 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id hg15sm3089785pjb.39.2020.10.22.17.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 17:30:54 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201023104840.7a94077e@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <e9e12abf-4413-bca9-e8fb-bbfcac38182d@kernel.dk>
Date:   Thu, 22 Oct 2020 18:30:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023104840.7a94077e@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/22/20 5:48 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (KCONFIG_NAME)
> produced this warning:
> 
> fs/io_uring.c: In function 'loop_rw_iter':
> fs/io_uring.c:3141:21: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>  3141 |    iovec.iov_base = (void __user *) req->rw.addr;
>       |                     ^
> 
> Introduced by commit
> 
>   a5371db1e38d ("io_uring: make loop_rw_iter() use original user supplied pointers")

Thanks, not sure why I didn't use u64_to_user_pointer() in the first
place - updated now.

-- 
Jens Axboe

