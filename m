Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33653EB65A
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 15:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240714AbhHMNzY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Aug 2021 09:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240741AbhHMNzY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Aug 2021 09:55:24 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D353DC0617AD
        for <linux-next@vger.kernel.org>; Fri, 13 Aug 2021 06:54:56 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id n12so11420991plf.4
        for <linux-next@vger.kernel.org>; Fri, 13 Aug 2021 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oQC/n+C5wkFlClIPjHrqQ3kOoEWEq/Nw32k6usYG8aM=;
        b=Q8JyhdOIIC+vHiSG0UUYTJzmCspHV1ym1fFrXKyoFsMdhOXCGSkKDZPXXWsXhE4tBF
         uHz0Hq8WZWOlSI1vx6Y26CDoSptb7tu+7iqh9uVryYolTwc/LIE5fONzrY3u7HNbN27O
         o3hVSSLMA8D1dsgEcHVmKA+QIytfTYiLAhV1ylrpuGmR9iF5qwF8k+p28xtEc4mAThRt
         7PlOrioxGTfkWnDsPoM2g4IFhDbM6xtZ3UFU0msk3G/b7iF8pBo8REac006S32AgtoV5
         W+BSQ7BVImreNCkD6OVlHkj6vbfAfwjcKyJRuNqdRGRNsYcQGZTYL59JNkxYUIPVjHcV
         LxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oQC/n+C5wkFlClIPjHrqQ3kOoEWEq/Nw32k6usYG8aM=;
        b=aE4AOSYStWNEFJ6XpXlz5e2X1FFo2KlGwyPxI5JUKw28iS8f/hMYu96E6kLSdp0rx2
         HGMMIZ3x+1lmm69H79HQ5pyErGnftQEvLP01XKEQwNFh8aHPgA/xWLsc/G0szSBwoLf4
         LwjgdpdZbKgvodHQxsDN2PD5HFgeMXisVeG2/q2QbCaLhN0B0kxZtbdNxz96LNjf7iBT
         5tavm5jI3ebjWFatHSz7Ddea5bN92W5xDOFDPMA0zcGzzSYaOIr5exHphoV8XnVVUVSj
         99O3XhrAlemOsNu+iJPwZG/sxRS35bC9Ol3NPcDNseJEF5ZeEf/Tb2M8Tda08BU2f6e9
         cPEw==
X-Gm-Message-State: AOAM532w7doDk4vG1EOj32Q1a7GP8Qy0MRB4aTnk3U4fYiaXTCYk2pTb
        BoglynApqXa9YEjQryaCNRcgmyu29uqp1Q88
X-Google-Smtp-Source: ABdhPJzemwI9mYnJQDtqzhrX2LcxCiDY/8WOBCEpJgn4EHMB1KhKMDIJxfaep7LxosNv0MIIuX7IlQ==
X-Received: by 2002:a62:878a:0:b029:3e0:7810:ec36 with SMTP id i132-20020a62878a0000b02903e07810ec36mr2610733pfe.4.1628862895920;
        Fri, 13 Aug 2021 06:54:55 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id bo14sm1991744pjb.1.2021.08.13.06.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 06:54:55 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210813194116.3a0297d6@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <b2492209-732c-9871-6085-6a17659f6429@kernel.dk>
Date:   Fri, 13 Aug 2021 07:54:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210813194116.3a0297d6@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/13/21 3:41 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> block/bio.c:1689: warning: Function parameter or member 'nr_vecs' not described in 'bio_alloc_kiocb'
> 
> Introduced by commit
> 
>   1cbbd31c4ada ("bio: add allocation cache abstraction")

Thanks, fixed up.

-- 
Jens Axboe

