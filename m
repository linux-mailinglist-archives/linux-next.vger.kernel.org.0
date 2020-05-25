Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4411E1495
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 21:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729559AbgEYTDs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 15:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgEYTDr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2020 15:03:47 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D30BC05BD43
        for <linux-next@vger.kernel.org>; Mon, 25 May 2020 12:03:47 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id v2so4042094pfv.7
        for <linux-next@vger.kernel.org>; Mon, 25 May 2020 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+zZvfQ9uHEcIup7MCl+X+CsUnoR1rGvk/AB5eqrO2gc=;
        b=S3wCwl5Zq/JaG4MuDdB4aCHBce7iBLI4XtmboFqCQK4GIuePZwfBYQJJdtXr1k7hUh
         5V7zvNPvjam68fJZZ0kNFKU+122AjlSTJgmLYrC8BAOwmIwSOUSOZpZkcylUlBthYDAy
         Fa7AsXyZm662yGHDrguZvBPg/HvU4AULESaJ+U1KsywvLDTBN+yuIbnC25LT54M34Fhm
         ZvOjkZk3XYyiC34o6cllfK/WSSPkXML5JbvyTxLmQNiA+K0ATMPAugPyp7mTwajppvad
         HwOU06CdBST0cIt00v9uVoOCMUiUMndEMjEXtAudlZcWg1DWH8Vo94MSedJDnxlviJZK
         gB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+zZvfQ9uHEcIup7MCl+X+CsUnoR1rGvk/AB5eqrO2gc=;
        b=kYbOTx6M5BKX2og961ZlSrgycO5U2Ju+Df8uJ9hxAIyFz6qDG4LGUerl6yos3uxLLI
         kxZicCpI7Vzoth3lYNboLLKFltFr1v+0u/+9m8c0NmvP44L3R2xIUHS0IXfypmov8nQj
         8lOECyXmeyGjVu9/J8d+JxTYl9Vmq7nvPoyoLRQ2Al9fu6hbBTTH2WuEq3UUM4ZeSlKD
         wyf/af+MAZ8yCbxHhTk6XK2EEKJyOmF/1Hj0Uv7ZUtiuHf30ai594awXEnGyoeTGA1TM
         iZBFEwwa/MP5pqaMyGBYnGvms4DjPi4t9vXBQGplL0gfMLf0xZakHTVt2X6QoQP1SQca
         ht9A==
X-Gm-Message-State: AOAM531S554N+IGGf2xTfCE8iY8UzrEL7MKV6kK9LTdu1RE+X4xYC/ZK
        Mv6PqJqpQN8Qe/YKmtS8BkrvBg==
X-Google-Smtp-Source: ABdhPJxsO2BATErq1hdRMq+47FTRMwcZqrwtKyAss+sFid9AQbw59BL9UQzeUW9fi2iigF0qEz0ZNg==
X-Received: by 2002:a63:34cd:: with SMTP id b196mr10800118pga.2.1590433427045;
        Mon, 25 May 2020 12:03:47 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:3c00:cb1c:41a3:c8d? ([2605:e000:100e:8c61:3c00:cb1c:41a3:c8d])
        by smtp.gmail.com with ESMTPSA id u20sm13638359pfn.144.2020.05.25.12.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 12:03:46 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Goldwyn Rodrigues <rgoldwyn@suse.com>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        Christoph Hellwig <hch@lst.de>
References: <20200525150837.54fe6977@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <c0e6af76-46d8-ccf0-3874-0751f7622caf@kernel.dk>
Date:   Mon, 25 May 2020 13:03:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525150837.54fe6977@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/24/20 11:08 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> mm/filemap.c: In function 'generic_file_buffered_read':
> mm/filemap.c:2075:9: error: 'written' undeclared (first use in this function); did you mean 'writeb'?
>  2075 |     if (written) {
>       |         ^~~~~~~
>       |         writeb
> 
> Caused by commit
> 
>   23d513106fd8 ("mm: support async buffered reads in generic_file_buffered_read()")
> 
> from the block tree interacting with commit
> 
>   6e66f10f2cac ("fs: export generic_file_buffered_read()")
> 
> from the btrfs tree.
> 
> [Aside: that btrfs tree commit talks about "correct the comments and variable
>     names", but changes "written" to "copied" in the function definition
>     but to "already_read" in the header file declaration ...]
> 
> I ave applied the following merge fix patch:

Looks like a frivolous change... Thanks for fixing this up Stephen.

-- 
Jens Axboe

