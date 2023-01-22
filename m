Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDE56772CF
	for <lists+linux-next@lfdr.de>; Sun, 22 Jan 2023 22:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjAVViD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Jan 2023 16:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbjAVViC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 Jan 2023 16:38:02 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF90F18A81
        for <linux-next@vger.kernel.org>; Sun, 22 Jan 2023 13:37:47 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 141so7708045pgc.0
        for <linux-next@vger.kernel.org>; Sun, 22 Jan 2023 13:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oe89yTjGNmmMUneDO1NsmFMgS00g5APq0GaajvfZiZ0=;
        b=J+daCyhSYvDYWVjODQE6PTdfJoZ/ugHBfEw9RdNa4DoHyo1sz0xA0/EJfAq/MsCiGo
         0IHi2W3TAjZz+V/tJ8BsQ9GUDI6K0etRzWK0h+Uh67To7mLugsDzjEAMjIbWJVRr4+Pq
         QoUL0GUqHrLAEP10C+V1o8Hq6aU5MiD0AgcC2gsVsQHEh3CEedzvx0vIprp7buTYJR1l
         16gNNdO+aIiTjKlDFYHcZaSdzJ7RfjT7Fbokuzg884aZuKjBXyG2bK0PU0lmt+kbzub5
         dau2YmokqakH0ocDY17ExpfqvM/6rzhhKQlBbFVliIQz73ghY9GuIFYnqedcsZ4eA+x7
         Xi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oe89yTjGNmmMUneDO1NsmFMgS00g5APq0GaajvfZiZ0=;
        b=qyU/GsLM8m+1FnFATj5w062Jir9Wm95zruxbHw/TuaVAievNJuBubSRLgtGf0/VMZ5
         FrCzXPr9Q6MyTiGr921V2RlcfA3JWO/E4rMuysp0prKgmqJqoAr2n0Yt+QKmTAxsIS3z
         pdrP2nF1s3MRmdiZ0o3BDu82Mw9jvvaMAqcpbvqurCzsArhJeYgezqUJKSKGQH9Z+dmw
         +nTcm4rSiuOT4seC+kmKRnJPU8lEGjkUad4XLlflfRuJX1nhbyrEM/HXA5K6dZK6X3xp
         pJ22d66edVwpv627oTWunQNBjcHs3KOy64juuYgXM26DjkLi2IV91Ctue9pdVkkBS0LX
         pL/w==
X-Gm-Message-State: AFqh2kpbP7jPmmHo5yxPglS1aq4bE1RpFoFLAsZqRebj00gWiyP0U2hs
        v87FnmVqHfMJ6MKxyO40N/AknQ==
X-Google-Smtp-Source: AMrXdXszoC3+w1Q2zpPGPMKmhkMrf+BkeuMJJxCc2NsQnWAXRpcEltY7WDe9CHNW06GZjFQWhmcpBw==
X-Received: by 2002:a62:87c9:0:b0:587:4621:9645 with SMTP id i192-20020a6287c9000000b0058746219645mr5490475pfe.1.1674423459230;
        Sun, 22 Jan 2023 13:37:39 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id y24-20020aa79438000000b00574ebfdc721sm30736947pfo.16.2023.01.22.13.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 13:37:38 -0800 (PST)
Message-ID: <dd18f35d-6b16-9601-90b3-2efc2cbed173@kernel.dk>
Date:   Sun, 22 Jan 2023 14:37:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230123080830.7d50fccd@canb.auug.org.au>
 <61a0120a-4cff-90c0-6f87-4957aaee7a0b@kernel.dk>
 <20230123083458.45f3641c@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230123083458.45f3641c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/22/23 2:34 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Sun, 22 Jan 2023 14:30:15 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 1/22/23 2:08 PM, Stephen Rothwell wrote:
>>>
>>> Commit
>>>
>>>   24337ddf1ff4 ("io_uring: Enable KASAN for request cache")
>>>
>>> is missing a Signed-off-by from its committer.  
>>
>> Fixed up, thanks.
> 
> Thanks.
> 
> Except you misspelled "Signed-off-by" :-)

Hah, damnit! I never type that by hand, except for here... Anyway,
fixed THAT one up too.

-- 
Jens Axboe


