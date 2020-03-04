Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E39261790A8
	for <lists+linux-next@lfdr.de>; Wed,  4 Mar 2020 13:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387966AbgCDMvq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Mar 2020 07:51:46 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45236 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387776AbgCDMvp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Mar 2020 07:51:45 -0500
Received: by mail-wr1-f65.google.com with SMTP id v2so2227920wrp.12;
        Wed, 04 Mar 2020 04:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=slqfxWKHrSdIw9QfR0BP/gbOIKFxiCgZIC59uZ7bA1g=;
        b=T3fI3J62Qx0pCDIHyM4bu7UUP4rwdo+ZSZDcZkQ+Y+rpqzDzK9xG0IMbmKLQcuydpE
         t8OC44HEjNkv+WM7ojqUAr5A5AJ2tPlU+n10uDIwfyHo+N8KU0DMsb0jCL/c0PpHFKRC
         JtZ6Hh4Kcjseh6WnO2lHL6OAmE/8DQlEmf5YBBAkqCTKD04jledDZRW2wZir1SM2or3r
         a7okpASxsZ1H6kaG7LVCql491u4PEHz7PSrG9H/DsL+5SITRi3/3Qz6OH2X4aLCxKLJE
         FJXEs2aJ1qsTWSeW2OyHSFFvbwqsYJca6jQIVn3x3L1gq90fYzhdfiElCXM2eQ6yjvco
         XJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=slqfxWKHrSdIw9QfR0BP/gbOIKFxiCgZIC59uZ7bA1g=;
        b=WC8isSJ//vQVrtPKxHvxz2wOOYvDi+ojI2YMG3TdjpyhjtyuC6SeuNqeQlMJPbiFBg
         tMWNBhhBJAB9hkCK63Xsc9vPv24njq39czz1slsshPKw0/ky0el4FTpaLA5QB7OjjIbr
         D7n+ZrRMj1Bb/mobEC1pQ35BQNQwZGHTPSmnZEqKr+cFsTCgGWxohDCs7QabaPKZ36XP
         brexm0y1NUKXKW9+cUSMuY7Z4hLm2sfze7qdTvJqykg/ymGb0q1KbLOSwieooyq97ACB
         c0dHTi71dI42PwNHmEnBxPai9I82RQ/3PeCtQGlfEHrB/dzSO7ZDdDaiq62I+2VeLdvc
         Z56w==
X-Gm-Message-State: ANhLgQ2RNVXd0WVrtTIHYD0kGzJ8r5ngvpuaIgEJoBrAZsFHpvF53sNG
        iS7M2pqqcA/Bo/TLiNoCU1tBY2ka
X-Google-Smtp-Source: ADFU+vtho9USVhYD0f78d0OPAj15suoFb8GtVQUyhjTdnVj0hpXXhHtM1VhO3XLZpBl/NPm/DmkD9g==
X-Received: by 2002:a5d:4e8b:: with SMTP id e11mr1002920wru.136.1583326302395;
        Wed, 04 Mar 2020 04:51:42 -0800 (PST)
Received: from [192.168.43.187] ([109.126.130.242])
        by smtp.gmail.com with ESMTPSA id t187sm4247704wmt.25.2020.03.04.04.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 04:51:41 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200304131750.55d84beb@canb.auug.org.au>
 <cd8154ef-bb6f-aa7c-2553-582f0b497516@kernel.dk>
From:   Pavel Begunkov <asml.silence@gmail.com>
Autocrypt: addr=asml.silence@gmail.com; prefer-encrypt=mutual; keydata=
 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 bA==
Message-ID: <d19697ab-8cb0-fad2-3dd8-dab296f61c69@gmail.com>
Date:   Wed, 4 Mar 2020 15:50:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <cd8154ef-bb6f-aa7c-2553-582f0b497516@kernel.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 04/03/2020 06:01, Jens Axboe wrote:
> On 3/3/20 7:17 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the block tree, today's linux-next build (powerpc
>> ppc64_defconfig) produced this warning:
>>
>> fs/io_uring.c: In function 'io_close':
>> fs/io_uring.c:3415:3: warning: ignoring return value of 'refcount_inc_not_zero', declared with attribute warn_unused_result [-Wunused-result]
>>  3415 |   refcount_inc_not_zero(&req->refs);
>>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Introduced by commit
>>
>>   62e0c6b73a2c ("io_uring: make submission ref putting consistent")
> 
> That should just be a refcount_inc() and also looks like it should happen
> before the async queue. I'll fix it up.

Yes, it's better to. Thanks!


-- 
Pavel Begunkov
