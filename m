Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 909D0786387
	for <lists+linux-next@lfdr.de>; Thu, 24 Aug 2023 00:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238721AbjHWWne (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Aug 2023 18:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238785AbjHWWnU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Aug 2023 18:43:20 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EADC71717
        for <linux-next@vger.kernel.org>; Wed, 23 Aug 2023 15:43:13 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-34bae11c5a6so6225705ab.0
        for <linux-next@vger.kernel.org>; Wed, 23 Aug 2023 15:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692830593; x=1693435393;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jW66Cs/qMHd0H/Wpy5K2E+YxASE2LpKhAKWz5+sVLxI=;
        b=OgeBMlDh0to1Jc5A1BmpwxuO9630TrluU+aDJhQDpMSV3NwUm87Ypd3L0xYG26E7kw
         7u2qF4H2NA87Vtq+K8O4n90+EOn/j/v+3tWBptAASYxoyUqZ7wpvrDgKnj6W4Gq4+cbf
         X0x8Uf3M3QiWsPpkZ8g87Ry3FLvv9t1lJNd6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692830593; x=1693435393;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jW66Cs/qMHd0H/Wpy5K2E+YxASE2LpKhAKWz5+sVLxI=;
        b=C8ixqERmMg6cn1X+mo9VyjarJBRRYn5h/N/WWfbfWLKGzmiFoPGqyrJVhNf90J7Ng5
         cS3eryY5y1Pq6EBCnvDOIItVKFiQvazfGzqTGxVJYlBnywyJPVhTrhWFWKG/FrEKukjN
         ZXLpdWYM+fR8GIYkksZPPuiv77iU+qP750af/UC6guotJCGOBYotKN1ZOtj7tBL6u3Kd
         r2RWcy0+m9dMJ8LCJdygAjEWw/abrIs9Wbao9w62QFLsJsEvzgga6ZaH4qJ7A18zlgaz
         OtYsocQXuRW5RzbwvSCyYNNPQcX4kYlFBdn7jUQhOnQOnZT3hGnthcUUEGA5upMBN99J
         lCAg==
X-Gm-Message-State: AOJu0Yy8Jgfs/wklkQem68pJG2YIma+B4vZN1ABKK4JRG2ojUHoTwGQt
        hIb7rQ2+NZZJ2Ds0hhEPSKmmaA==
X-Google-Smtp-Source: AGHT+IEjom4ZUsXKhvfsWH/p/N0srN07dkzu93y1+h8y4WxNRTq2h0u4FQbFBrfzfIXk4EIzQphfmA==
X-Received: by 2002:a05:6602:3706:b0:791:e6ca:363 with SMTP id bh6-20020a056602370600b00791e6ca0363mr17394143iob.1.1692830593190;
        Wed, 23 Aug 2023 15:43:13 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id t17-20020a056602181100b007835686237asm4162142ioh.27.2023.08.23.15.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 15:43:12 -0700 (PDT)
Message-ID: <825fafaa-e332-4657-082d-1325b5b2c4a9@linuxfoundation.org>
Date:   Wed, 23 Aug 2023 16:43:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: manual merge of the kselftest tree with the
 mm-hotfixes tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230823145258.6fb2b8d8@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230823145258.6fb2b8d8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/22/23 22:52, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kselftest tree got a conflict in:
> 
>    tools/testing/selftests/cachestat/test_cachestat.c
> 
> between commits:
> 
>    fbf31ed6e0f4 ("selftests: cachestat: test for cachestat availability")
>    8d55633e168b ("selftests: cachestat: catch failing fsync test on tmpfs")
> 
> from the mm-hotfixes tree and commit:
> 
>    13eb52f6293d ("selftests: cachestat: test for cachestat availability")
> 
> from the kselftest tree.
> 

Thank you Stephen.

Andrew, I will drop the following from kselftest next.

13eb52f6293d ("selftests: cachestat: test for cachestat availability")

thanks,
-- Shuah

