Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC956C5A28
	for <lists+linux-next@lfdr.de>; Thu, 23 Mar 2023 00:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjCVXPz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Mar 2023 19:15:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjCVXPw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Mar 2023 19:15:52 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED06719114
        for <linux-next@vger.kernel.org>; Wed, 22 Mar 2023 16:15:50 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso212905pjb.3
        for <linux-next@vger.kernel.org>; Wed, 22 Mar 2023 16:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679526950; x=1682118950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tpbXw3o2mt/ZegkaB2EeTIzsx1g0yxGj5GUQC2NHcLg=;
        b=GSYb4gQPIxrL8LVyWcxnFwU7A0Y1B7dUQCmaw+1Tty0nzPC6nJ4MzNjd6MRcGkBGbN
         GXP3IneUv+j8IX5V1CyH/qZVdSkRHN5nlwBFKmAHe1dgWrGjkOTpcP7fWPebUDAv8i1S
         NMOEiYk7PLRClWgYLYeI3Ixk/tR5X1iZHP3KKJxtB8p2u0xylKx+/S5331yINgJFfODh
         aHM6mRgNXSQE9/w7hRJ4u4i81JiPIvn4ZjtPairaEhMLj4Sat20m930Q5lflhjKIGfpT
         UjHPtTJKlHQsJMsCXiIcFGTtPnE95Z6YtzEMWsjM6irm+niL2pUWyDeDe0n7kr5hGSmh
         L7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679526950; x=1682118950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpbXw3o2mt/ZegkaB2EeTIzsx1g0yxGj5GUQC2NHcLg=;
        b=EDAoUkirR9pMgYjoBsPbTAltFZrb0PLWt4xgTo6fDhNxZiVdylubgoYD2+REYMo+fJ
         /c72djyblhx1kwN30cW2yyMI2anzHL83vPlIw0wcPGg5/X5ApQ/EQyJhdYvfta9W5U88
         LoQxh2gGBOnH8oDYIlEmuVNVsGB+kCfHVllovwn3neOoi4q/VWWMnC8XNQG27/XuMD8+
         0nWUfF2ZkRlg9kgvWbpR8A6FC8QZuqM+GjF8LvJ+CRC7m83yQK89yyOPkOIZd0Ooa5OW
         DZ6Bebr6Ve8Vkj6ShMGLr+BVb4W3PtuPJIyo7RFHcJDr5LgKPjvV40uYBeeKFdKKW7Tx
         qhhQ==
X-Gm-Message-State: AO0yUKXkFqpQYXmzIc1iNZ71iOcfgAwiWOmuH5LADxygWdFD5StJS5Yc
        E44WTUiXehEmmIcu/YDpk4L6Lw==
X-Google-Smtp-Source: AK7set+2uIT+U7UxWDu1J49iNlrzaqzSPp7ovQ3TWTewHT4J0UQVkwIpxHY6CNJfIpQzGGBYwDuOVw==
X-Received: by 2002:a17:90a:e502:b0:233:a836:15f4 with SMTP id t2-20020a17090ae50200b00233a83615f4mr6390037pjy.1.1679526950407;
        Wed, 22 Mar 2023 16:15:50 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id s17-20020a17090a5d1100b0023d3845b02bsm39240pji.45.2023.03.22.16.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 16:15:50 -0700 (PDT)
Message-ID: <82ade7f2-017e-af6b-2fb3-eb1a3f570505@kernel.dk>
Date:   Wed, 22 Mar 2023 17:15:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: linux-next: manual merge of the block tree with the mm tree
Content-Language: en-US
To:     David Howells <dhowells@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>
References: <20230323100204.0917cecf@canb.auug.org.au>
 <3431084.1679526799@warthog.procyon.org.uk>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <3431084.1679526799@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/22/23 5:13 PM, David Howells wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>>  +	if (unlikely(iov_iter_is_pipe(i))) {
>>  +		copied = copy_page_to_iter_pipe(page, offset, bytes, i);
>>  +		goto out;
>>  +	}
> 
> This bit would need to be removed from copy_page_to_iter_atomic() as the two
> functions it calls should be removed by the patch in the block tree.

Maybe it'd be better to consolidate rather than split the changes over
two trees?

-- 
Jens Axboe


