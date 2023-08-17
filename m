Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0513577FDDC
	for <lists+linux-next@lfdr.de>; Thu, 17 Aug 2023 20:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351978AbjHQS2X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Aug 2023 14:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354493AbjHQS2F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Aug 2023 14:28:05 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A3253C02
        for <linux-next@vger.kernel.org>; Thu, 17 Aug 2023 11:27:48 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7748ca56133so890539f.0
        for <linux-next@vger.kernel.org>; Thu, 17 Aug 2023 11:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692296867; x=1692901667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=my5DnY3IzJeZvSxlM4n+SCWlVwxvpEaGynhkt3Lq4Ic=;
        b=KEcLvii/5oBxfq7gRCPxpR8Z0b4w3Mx2F/ErAEJJykwfPyq7LiMGrm+U5Q/O2LUBIz
         tVVM7/Tbp7kVuwGyoYQJCb3k5zAzMiHmSxNwizAuOSU8vxEvF00ikTw5HL2MOVMJ7ZIc
         30Q54G6mVLeCzU05bRNIA4IvREmIpdMUq0mHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692296867; x=1692901667;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=my5DnY3IzJeZvSxlM4n+SCWlVwxvpEaGynhkt3Lq4Ic=;
        b=DRnXkexXbjoPEcBML7QtNWeinltUP87UUYH2P8cLWP8MlKfnTIQNjbAa3jYkss+OJj
         mFKCppdGApGgHr1JyqMmt8bTP86/DvPLswTFgxKRd7QvArk+lcSYKCcPZbi/SRiFY3RK
         tm/5deyHcli+yOB6BAqXHWps/PzxoE8heWxP9Jjh1ZhQoHOwkzOgYOesVsW1Orb44aL5
         PdpFKMuHAE1TpsWcW/okFevyKF6gQhVK4cETVEbGSVTLAFt7DwvSjYdCFx3bHNyH1lZ7
         Ms71ndjK8PqwEo8VOLxng6sgaMbF3viCVlJu6MHUPwXBhnYHBNS6WUvp4Ph7UUSg9oQm
         BNDg==
X-Gm-Message-State: AOJu0YyLG0NEC7U4wUptfw6S1wHjZFv93WNmPrQu5lcasP52BEmzPhfE
        6AYb7ddPTtnvmsfZhRKGhcLPyQ==
X-Google-Smtp-Source: AGHT+IFZh9V+tCLewXPjP0YxTdnsXmATpTP0zqTUgiHwm+rfDhfmjoXbho/l4gH9c1Ifbmc7dgxeyw==
X-Received: by 2002:a5d:9d8b:0:b0:791:ad39:660b with SMTP id ay11-20020a5d9d8b000000b00791ad39660bmr679513iob.0.1692296867484;
        Thu, 17 Aug 2023 11:27:47 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id dq14-20020a0566384d0e00b0042b1354452csm4629jab.83.2023.08.17.11.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 11:27:47 -0700 (PDT)
Message-ID: <9cfb4fe4-162b-3f26-646b-71bed3493925@linuxfoundation.org>
Date:   Thu, 17 Aug 2023 12:27:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: duplicate patch in the nolibc tree
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Willy Tarreau <w@1wt.eu>,
        Christian Brauner <brauner@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230817133811.0a73c624@canb.auug.org.au>
 <e0af8d82-e099-49fa-9fbd-6f6bb63b7706@t-8ch.de>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e0af8d82-e099-49fa-9fbd-6f6bb63b7706@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/17/23 10:30, Thomas Weißschuh wrote:
> On 2023-08-17 13:38:11+1000, Stephen Rothwell wrote:
>> The following commit is also in the vfs-brauner tree as a different commit
>> (but the same patch):
>>
>>    ba859b2e419c ("selftests/nolibc: drop test chmod_net")
>>
>> This is commit
>>
>>    49319832de90 ("selftests/nolibc: drop test chmod_net")
>>
>> in the vfs-brauner tree.
> 
> I think we can drop the patch from the nolibc tree.
> The patch is only really necessary in combination with
> commit 18e66ae67673 ("proc: use generic setattr() for /proc/$PID/net")
> which already is and should stay in the vfs tree.

Thomas,

Do the rest of the nolibc patches build without this if we were
to drop this patch? Dorpping requires rebase and please see below.

Willy, Paul,

How do we want to handle this so we can avoid rebasing to keep
the Commit IDs the same as one ones in Willy's nolibc branch?

I would recommend dropping this commit from vfs-brauner if it
doesn't cause problems.

thanks,
-- Shuah



