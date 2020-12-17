Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D632DDA43
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 21:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731127AbgLQUmx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 15:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbgLQUmw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2020 15:42:52 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35DCC0617A7
        for <linux-next@vger.kernel.org>; Thu, 17 Dec 2020 12:42:12 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id 2so132855ilg.9
        for <linux-next@vger.kernel.org>; Thu, 17 Dec 2020 12:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LvhMc5ZjtLwbA9X7poTR4ZwUeBf8/KaB1u2Nd9aCJNU=;
        b=0q3RLct3Y9xBJWrxIVx8Iw80mSKSvetFJ2YiBfQC6Q2Y26VvWz2wCJSrjGFpUk8Zjk
         s/tOwjFnT4eizJM/0RcYXw4yF0J1+DOZbCfc1VDqyQ+5Hvrs1aJMWZXcw6sAMDBPo1QA
         iMuK5QQmjhcOENKCU3SVUTfWvR/gznYQ4XsxfU64zcJJsO8iL2iFmIEQ5drosm3bPeI+
         n6m5xjTKGiaoVAZo94qBlyOSxTEWyZ80oD9V+/VYZse/pTUL1d8N69y/nCNrTRkZYacK
         8fgUugcqiA893qlmmVM40GmYAo5MXb6GtE9ZkKuA36PVX+L0DFF7m+8AUf0b7o2bvEuD
         IhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LvhMc5ZjtLwbA9X7poTR4ZwUeBf8/KaB1u2Nd9aCJNU=;
        b=f6kFx/odU22Yz+dpRvbEO0b+9a+PnbZOIBNP/ohlRJpz8MplXJtmnnLST8n5Uze34g
         seiBsNKsFdP+llYFO0/up2U+hOHWkNQv+4CHAnV1ry0rQ7yw8wym9C4hb2vz/hRg3LDb
         fQVka9mekmfIV82798KUt7tAbFS+atgO3ZSuhy/GgLEAdsvsZ7y6wEjuO2nw7X6yA1Qc
         9+ASW+Uo2PQ78e19Pyifpc78G2qe686EOqO5uWqAQvknl4ASMGrt8+4ydOu6QWZiByCT
         M1mWL7utdKngyVg36NfFqnOTOhz4hazwVBRO+Nf6L+Cn1m0+7GjjpXoSfawd6nJfokpY
         UFJA==
X-Gm-Message-State: AOAM531rd6CKGa/NZy4Iie4N2dXdh4Jb6LKYOtPRjuSFHG9C+sMRHrKd
        lAGkDAZYHA2yuNxihsOLZ5QjUA==
X-Google-Smtp-Source: ABdhPJyfJApG9ACrgd0cFsBaVAdD2Zeg+uZmgMA2e5Bft9xlFUzzyxe7Cp9CUGayPdzJqzMVZFLETA==
X-Received: by 2002:a05:6e02:1525:: with SMTP id i5mr745091ilu.14.1608237731874;
        Thu, 17 Dec 2020 12:42:11 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id k23sm4293713ilg.57.2020.12.17.12.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 12:42:11 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stefan Haberland <sth@linux.ibm.com>
References: <20201218073806.06395319@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <23286bf8-6eaf-8601-7d2a-5c7a8c11460f@kernel.dk>
Date:   Thu, 17 Dec 2020 13:42:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218073806.06395319@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/17/20 1:38 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   358e7cbf87b4 ("s390/dasd: fix hanging device offline processing")
> 
> Fixes tag
> 
>   Fixes: 47825e05d93e ("s390/dasd: fix endless loop after read unit address configuration")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 41995342b40c ("s390/dasd: fix endless loop after read unit address configuration")

Thanks, I fixed it up.

-- 
Jens Axboe

