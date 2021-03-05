Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E52532DE4C
	for <lists+linux-next@lfdr.de>; Fri,  5 Mar 2021 01:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbhCEA0s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 19:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbhCEA0s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Mar 2021 19:26:48 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1872DC061756
        for <linux-next@vger.kernel.org>; Thu,  4 Mar 2021 16:26:47 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id m6so871347pfk.1
        for <linux-next@vger.kernel.org>; Thu, 04 Mar 2021 16:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0OJ650cc3bleSBx+mJgi4qu1UohhUOj7m//L8ZaYoHI=;
        b=xcv/gH5BsOkDFZUL24Mg/OICBHIxlsRePddDJ4aUnZ4IQuL5py1bw3UkpEtHunkkeR
         m0cEMhqN80cqJANwxx+0lbnxFxWi7O4lMmVGY+QQPNPOJMLEFE5tE1wDTDMr9uoQXTHn
         nSuUcp6tk+4o3BxwvNiTGhtOkKPANNlUXk4AT9MrKpY2SpEh5eBrYyVs1rmt1zdcuYM5
         3w4Mlg+yyDs1d4PXPHtVwXOn05kvFelJ+LH+4+homIKjsgS2PPSPeNlQWBRQepiSK7v4
         cXEI20MLzET5Sko6Z76fWMjHdLl8Vkl0LsBe8dp7+wi1Wvg8ciyzzx5+lRWJDrxGKdO1
         xbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0OJ650cc3bleSBx+mJgi4qu1UohhUOj7m//L8ZaYoHI=;
        b=Xb/wuyN/9o1tE3lTg4sgnf5Vjnw6wHkwYtUCDunb1+66kDLYNmj4UTOsrS+luZ7nuq
         loMdvykx5Ay+WeyatDGOdQzmZpsBav5f5I+oTpXT/IYWQkTSONBmB6VJXBW2d8OT7nwq
         0fDYMfS0y3rJtmcqZBJJ2kRKoEzO89BloN6Dyier6PJUOwE7BLFHeWiBc9YE68QYYPOk
         SOwTFXbeuNr9WoS0yz208Jx9NUyXkvxUQ8lakl754wm0xTQzRfhCps3SxWRcDOunQC3U
         SMdoDKUB40HlhJPvrF87RnlmPUZy8iFwYsVLlrV/Qh1xhUt2N2KFVFzvsodw/X68BNFw
         qj4Q==
X-Gm-Message-State: AOAM531zBjE83BBqBRTcHyZJFEp2pAvtFCH+f8VUgVFqATg8ccWOTdn6
        cNNQWqSV18WRgTR+jVoUN8gqT20KCAWfJA==
X-Google-Smtp-Source: ABdhPJxqT8uX6QIoib5qjmJbI5Dd5+zlsc/+lH1gaI2ttusRPalDlG94Ta7g4iml9o6CJMSfV3QgKg==
X-Received: by 2002:a63:7885:: with SMTP id t127mr5617475pgc.237.1614904005518;
        Thu, 04 Mar 2021 16:26:45 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id s10sm457132pgl.90.2021.03.04.16.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 16:26:44 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Wagner <dwagner@suse.de>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210305105239.377577b5@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <726a90e9-7139-8d0c-6e05-fcf8c15ac6ca@kernel.dk>
Date:   Thu, 4 Mar 2021 17:26:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305105239.377577b5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/4/21 4:52 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   284e4cdb0c0b ("nvme-hwmon: Return error code when registration fails")
> 
> Fixes tag
> 
>   Fixes: ec420cdcfab4 ("nvme/hwmon: rework to avoid devm allocation")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: ed7770f66286 ("nvme-hwmon: rework to avoid devm allocation")

Christoph, since there's multiple commits with issues, mind resending
a fixed branch? Then I'll drop the one I pulled today.


-- 
Jens Axboe

