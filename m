Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4FC85E58B8
	for <lists+linux-next@lfdr.de>; Thu, 22 Sep 2022 04:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIVCnW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Sep 2022 22:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiIVCnV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Sep 2022 22:43:21 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD27AAC272
        for <linux-next@vger.kernel.org>; Wed, 21 Sep 2022 19:43:20 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id e5so7919254pfl.2
        for <linux-next@vger.kernel.org>; Wed, 21 Sep 2022 19:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OtLhPCmrBbgG6Ta6nZY1k4zR6lFQhJZyrPCPPbSiPh8=;
        b=eFZAHm/C2Y0mQ6YuQA1eEGnSfo9hr1SWa/BeXa3oq/xsQ8E1RVIi6HJdAnkiaBRZ0V
         XdlUkox4cJgW58rY1u0o60Irh78P2QTtuEDEon0EVtv743ZLKfqETH4WSpzbiDWUiYvi
         5ulBaRQ+qYyzoi+g0z3sxmoFd/gHTcRXkNHfPX8wD+QC84aG8gbNHMcndIC0FetdCu61
         CzUOzzPzcyQ+5tOBwZG1GEN3mc2BnNdCW9Me12dMVQr84TcMNWb4eaiFSgTv8zBu0adI
         GkamwX0qAFIF6nNV/UKN83Fl9v/CDOQb/yYetp48jZErn5BFFU9Swj86rJzE+BZAgAee
         8dBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OtLhPCmrBbgG6Ta6nZY1k4zR6lFQhJZyrPCPPbSiPh8=;
        b=RreBNHL8X3pvAREFvT0SEqGT9xbJnSwcNmeKqsnYbXMS0YkNiM+KjF9I1zLeePBv7R
         XHUgC49r08Kn/4ccqmGyEs4QaGvpjujRJml+Sm/cE+YLx+I8GDK/wyuuG8DaHXp+rsoL
         HzrVBu6o/ckmeuIg5ISreKmiLwrZMjmpskAwdrr2Mv09LqYqXYMoHkd5ymEmeaC9mjw5
         Tqpc68+OdCncswEmTEE11AuY4hK9Q7XLKRtu1iqqZIunFV4wgE+K+TduRrd2BssD4Cjb
         bK+OUDleh142KbO8GxdX8dG4guUUsmjuN/gnv+dgZbmzVQ0vfG766PdkhwTylFgW1myW
         pekw==
X-Gm-Message-State: ACrzQf2toVhibSHtVMxMkCd011+S0rKYRYd+nSx1aimldsFoAO9O8qX7
        SagpLk/WimkQVP8kiE+TSbgMZLlkLco=
X-Google-Smtp-Source: AMsMyM6Wsp28El83ItRe5adEemGqYwj28lvqB09Edm0d2zeFBUyilpHzZD6p5qiXF5cqn+p44ooI9w==
X-Received: by 2002:a63:84c6:0:b0:439:4687:b63f with SMTP id k189-20020a6384c6000000b004394687b63fmr1143385pgd.532.1663814600147;
        Wed, 21 Sep 2022 19:43:20 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-54.three.co.id. [116.206.12.54])
        by smtp.gmail.com with ESMTPSA id t4-20020a1709027fc400b00176dd41320dsm2680746plb.119.2022.09.21.19.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 19:43:19 -0700 (PDT)
Message-ID: <14fa2a39-b5e6-f878-2b87-2dd86b450920@gmail.com>
Date:   Thu, 22 Sep 2022 09:43:13 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: What is the difference between linux-next and linux-kernel
 mailing lists?
Content-Language: en-US
To:     Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc:     "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
References: <3eqrFna3vX_qv5tM9LT_0Mqf7zyT1B5OPa8UcwIvO_CW9eFNly54zZmShglkINpHxXCNo-nDdeabRQ2VkPTwvizp_atYq7LsiuMKqGERug0=@protonmail.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <3eqrFna3vX_qv5tM9LT_0Mqf7zyT1B5OPa8UcwIvO_CW9eFNly54zZmShglkINpHxXCNo-nDdeabRQ2VkPTwvizp_atYq7LsiuMKqGERug0=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/16/22 21:25, Turritopsis Dohrnii Teo En Ming wrote:
> Subject: What is the difference between linux-next and linux-kernel mailing lists?
> 
> Good day from Singapore,
> 
> What is the difference between linux-next and linux-kernel mailing lists?
> 
> What goes into linux-next mailing list and what goes into linux-kernel mailing list?
> 

Hi,

LKML is mailing list for Linux kernel development. There, general discussions
as well as patch submissions and reviews take place.

linux-next mailing list is for linux-next tree, where all subsystems tree
are merged (excluding stable kernel tree). It is a snapshot for what next
kernel release will look like.

If you'd like to contribute, see Documentation/process/submitting-patches.rst.

And don't forget DON'T top post; reply inline instead.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
