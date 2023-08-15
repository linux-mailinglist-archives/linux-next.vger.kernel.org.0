Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C58F77CEB1
	for <lists+linux-next@lfdr.de>; Tue, 15 Aug 2023 17:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237285AbjHOPIQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Aug 2023 11:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237808AbjHOPIG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Aug 2023 11:08:06 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C312EE
        for <linux-next@vger.kernel.org>; Tue, 15 Aug 2023 08:08:05 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bda3d0f0f1so7026835ad.0
        for <linux-next@vger.kernel.org>; Tue, 15 Aug 2023 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1692112085; x=1692716885;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ardLpPzsr7Tjzv/PEhX1ISfceYOB53E6DIF1b0Xw1c=;
        b=jNIM2oyZSHeFsV5Gq9GM+l1KEzbR200w06JDFZWDa29zAbzwbhXw0BbdFYLwaJUBR1
         GYvRy88tlJ8Pdk+wbZaj0tynSi5JocEQdUkC/iBWwQA3GXX2GuHSS2dA2dP0+yl+tCz3
         DGrLFm/H6Tzc7CvWDiJaHYe6rmNNhbls3EhGLAuUX19XeGHQXexfEYyqgcN4ZoTmYtJo
         RRwnzr6uAENPbmfQS0kNdCGj/p+Md8UeQU6f9mM4OvkKgT5eQQIAVwOEPMDarf6MK4At
         AE0dL0O/VEJvu0Izd+l+uDe4YLI7gM8Qy0KWwuLbAXwe7rS9CCxDlYPcjBi1RdDToPFo
         FSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692112085; x=1692716885;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ardLpPzsr7Tjzv/PEhX1ISfceYOB53E6DIF1b0Xw1c=;
        b=F4eRK5Fl7pFPeUOfqDotUmjDIs9b6qMIndOG2gmpBlKSQnPzwhS3SHEAIb5GzklDXT
         iRujqTaTcxTkLthyEX7luMbSHVxRDgkrkk2jw4H4UrCcF4TDEQiNPb7YmKpL3BKipkDG
         zTwTpD2Lay+Rdc5UUOfNKCSe3cCx5kqZsuFonYFS+ZjkCl+FwcLUPEd3WPuq6oDYZRGs
         Sy+d4acmex3Xt4Lc2+FEnoqqGL68EbEPvw9rc6pJFqFNvjeU/+wcfuQieHMVm+YiCgQO
         3i6vEzpP/QCD9Gl/lT8Pb7QpZREhr93oLJkgjc3jwIzVCNyaqX3q4UBELRq1PqiZNO4t
         zFBQ==
X-Gm-Message-State: AOJu0YxFobASTJhI0Kf/BAcDZXc2BngvqZyn2NJpZP+Z9sqqqVbWjv/W
        lKNo3v31tVnC2wubeSldc5I2vCD3pRvlNSfZCxE=
X-Google-Smtp-Source: AGHT+IEnuBktlNYwmu21Ts876LBoTJvo25LkSGJ5bY01k3c183yzSE8VYGkQfy1CjhNK7/Fj9wKy7Q==
X-Received: by 2002:a17:903:190:b0:1b8:35fa:cdcc with SMTP id z16-20020a170903019000b001b835facdccmr15244448plg.5.1692112084669;
        Tue, 15 Aug 2023 08:08:04 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c14400b001bdeb6bdfbasm3228746plj.241.2023.08.15.08.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 08:08:03 -0700 (PDT)
Message-ID: <c39a3bff-01b9-4007-80ac-00ce2b11a902@kernel.dk>
Date:   Tue, 15 Aug 2023 09:08:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Content-Language: en-US
To:     Yu Kuai <yukuai1@huaweicloud.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "yukuai (C)" <yukuai3@huawei.com>,
        "song@kernel.org" <song@kernel.org>
References: <20230815091931.4dd2b277@canb.auug.org.au>
 <8c946512-0cc4-fbc5-ca36-0e2c6d636eb2@huaweicloud.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <8c946512-0cc4-fbc5-ca36-0e2c6d636eb2@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/14/23 9:21 PM, Yu Kuai wrote:
> Hi,
> 
> ? 2023/08/15 7:19, Stephen Rothwell ??:
>> Hi all,
>>
>> In commit
>>
>>    71070e7bd25d ("md/raid10: fix a 'conf->barrier' leakage in raid10_takeover()")
>>
>> Fixes tag
>>
>>    Fixes: 4d27e927344a ("md: don't quiesce in mddev_suspend()")
>>
>> has these problem(s):
>>
>>    - Target SHA1 does not exist
> 
> Sorry about this, the commit was picked from previous md-next branch,
> and I didn't know that it will change...

It's most likely not your fault, I'm guessing Song rebased that branch
and this is why the sha changed. Song?

> Is there any way that I can fix this ?

Only way to fix this is if I rewind my branch and Song updates his
branch to not have this issue, and then sends a new pull request.

-- 
Jens Axboe

