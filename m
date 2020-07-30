Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8EF32334F3
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 17:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728910AbgG3PEo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 11:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbgG3PEn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 11:04:43 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E9CC061575
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 08:04:43 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id e64so28506328iof.12
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mtebjY7zqQmxK4blDByy24YEZvtg1VgS49VyUH+Bk54=;
        b=IFvtypmnuy+FD59buzQsBGlluhs8zj+9N6uxiqSJhSFqkPX345o3ct+kJ07I1a7DVd
         Wt/kT40XJ7NtdugtJzHRfQVLMUZDwf1uEkJiCNYtDezotKmw9o0SmkKDW/E2AWx8AjZR
         DWmzauCwvh/rwYz/8j3Ab1wGhFxsJPFq6w3oMT7J2rToZzcpQgnQ8Bk4ITuj50sbM8IW
         JfNI4LaOtAHcJQa1mhod1stjeUVqDNHnHSEXyCP16wRhbo7/JMeli0N9UP2eyqW5QqCG
         UNl1R7wil5HQ0B6FDhvDk0safChUb76Wl1RcQ3F758MwHtOq6tuuQwAAPRdlYFkJG/bC
         DMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mtebjY7zqQmxK4blDByy24YEZvtg1VgS49VyUH+Bk54=;
        b=IrVM8OVHnO0ohWNIn85VLsXOxSBS2eNrM/07sQnyo3vkMhosuF/2f5ifrjlfOw7QOH
         eKkZkp4EmAiPYLBV5bYK+scoO9w6+F3rtac3rmpoMNAmAy2A+5AoHfUbujpnY8irR/zI
         NFZmL85lwKp3f4WhEbOWQzz1vZDwsqx7U/lK984g4M2lTh+CXzd9x6O1g8xFPlXGiEdD
         +HuJoJIqksRHOFgBr9wvqrC37GTcTPJaLDAqp9cxwPDnfk99Q4n+EdJ4KIH1UIcDZ6F7
         OcPnICxe0870aLVVjqmoMbnacoGRdcGea+FddCVy/2Q9LoDWt6oIwLzDlIHtBfPxAN0C
         UoAw==
X-Gm-Message-State: AOAM530QOyDPlduxkdkOrLj9FY+Ta8va5awEjG1yvZTWngLLi83FMsZk
        FE3egrPql6kD88OaAb/3okRi3kQ3sHg=
X-Google-Smtp-Source: ABdhPJy/LIN0Vx8knW+VahVygoK4OZBhqppeSDsSWVHJQbR9ICzzGFP97DTzi2tbufdFdL7FrC7MJw==
X-Received: by 2002:a6b:b682:: with SMTP id g124mr38836585iof.55.1596121482554;
        Thu, 30 Jul 2020 08:04:42 -0700 (PDT)
Received: from [192.168.1.58] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id b74sm3199806ilb.64.2020.07.30.08.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 08:04:42 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        Christoph Hellwig <hch@lst.de>
References: <20200730080849.70cfeeb6@canb.auug.org.au>
 <20200730081203.5358cbc3@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <93067598-8a12-4f98-0c76-3fd1f14cd16e@kernel.dk>
Date:   Thu, 30 Jul 2020 09:04:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730081203.5358cbc3@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/29/20 4:12 PM, Stephen Rothwell wrote:
> Hi all,
> 
> [Just adding cc's]
> 
> On Thu, 30 Jul 2020 08:08:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> In commit
>>
>>   64d452b3560b ("nvme-loop: set ctrl state connecting after init")
>>
>> Fixes tag
>>
>>   Fixes: aa63fa6776a7 ("nvme-fabrics: allow to queue requests for live queues")
>>
>> has these problem(s):
>>
>>   - Target SHA1 does not exist
>>
>> I can't easily find what commit is meant :-(

Yeah, it's obviously garbage, the commit doesn't even exist, let alone the sha.

Chaitanya, where's this from??

-- 
Jens Axboe

