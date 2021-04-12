Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4AB35B8AC
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 04:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236615AbhDLChB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 22:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236482AbhDLChA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Apr 2021 22:37:00 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9266C06138C
        for <linux-next@vger.kernel.org>; Sun, 11 Apr 2021 19:36:43 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id m11so8233281pfc.11
        for <linux-next@vger.kernel.org>; Sun, 11 Apr 2021 19:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pXGUTCuwQEYmj1uTHhPOB9cfdu3ZZBqB6U+/rfdEAR0=;
        b=aP4RlfXUP3gMHGZUAbY0r962xDlEkBPZcayRWgzCUro9tXIvBJ3fPKESsBB0ldceKs
         AmJH1tN7YVQ09KITLCK0ySl8D7JYfNUZrsmhSX33SiJ1+34zm7bJ27zw+z3GWA21eJGr
         NFXHjuBe3yJWqsNEkwYNmTnmZEFs7bZZq6I8ftUkDJTw/GLSWVA3dtfrsS+jvGAfh/iI
         gbyi77/Hp/T/d1030CYIiQnKc/89sk0EiLUFQaXtkk1UezkG+GQtbm0m751xV3as7EWj
         rXECirW1OoNCA8vGawjDYS5jyoOLHfHZC5l0DOJzyJ0RV/QOC8Jv/x+vJpIow6aTyUeF
         mZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pXGUTCuwQEYmj1uTHhPOB9cfdu3ZZBqB6U+/rfdEAR0=;
        b=qJbCd2K31UVh5NJPpIUD8FLb/vomVJlX6YkyYR0fhxaWF83DXsFZ4PrI7hw8WWC1XA
         3d5PSHkz11mBA3FMZfSnaB0k9nw2fzmx/V3BOM3NAT1eT3tE3jJR6gszWxSu/S5FVKMK
         KGVrWAJklR3yrtA8eqQbBls2Xp9IWHk2PMHQeaP03OzT9+U5Gf4HqaICzdskHgtdHutq
         REAGX3E0MOqx7gtcNBfIcXIG5ZMIPHwIiO6t7bu2CHKmgyK4yNFWsQlRFXvMyc0O7x15
         1S4az/WMOuHkApsCVWGmwF9n0I1gaXw95Yx1pd8aHUsXXMaGN1ccfQp9nPj50U4IM+pR
         CZlA==
X-Gm-Message-State: AOAM530P4eHOE6kCeALEw5cS8N9WUP4PGVsax4QDCVm2sytDdeCB0j7B
        WWsq/GXCsC/YE4gR/vUBRXUDQmXp/xFPYw==
X-Google-Smtp-Source: ABdhPJzb1E3KCGKLsAtn2eoYWgujQ33fMAWmRNqizdMU3kzh6KdnKp4++JGJFkl7CCK2Jik6xLUBBQ==
X-Received: by 2002:a63:fd44:: with SMTP id m4mr24865907pgj.233.1618195002955;
        Sun, 11 Apr 2021 19:36:42 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id w67sm9656066pgb.87.2021.04.11.19.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Apr 2021 19:36:42 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210412083404.2d0dcf7c@canb.auug.org.au>
 <0aa24415-74c5-1adc-6e27-edf37285de4e@kernel.dk>
 <02ac7276-e3c7-79b2-b3b0-361bbb884d16@nvidia.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d2d4d147-65f5-a039-ac2b-ad2eff8c0db4@kernel.dk>
Date:   Sun, 11 Apr 2021 20:36:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <02ac7276-e3c7-79b2-b3b0-361bbb884d16@nvidia.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/11/21 8:26 PM, Sowjanya Komatineni wrote:
> 
> On 4/11/21 7:14 PM, Jens Axboe wrote:
>> On 4/11/21 4:34 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Commit
>>>
>>>    6fa6517fe62e ("ata: ahci_tegra: call tegra_powergate_power_off only when PM domain is not present")
>>>
>>> is missing a Signed-off-by from its author.
>> Sowjana, please reply that you're OK with me adding your Signed-off-by to that
>> patch.
>>
> Sorry I should have checked that. Thanks Jens. Sure I am OK with it.

Added, thanks.

-- 
Jens Axboe

