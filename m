Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 309B7586833
	for <lists+linux-next@lfdr.de>; Mon,  1 Aug 2022 13:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbiHALgW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Aug 2022 07:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbiHALgS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Aug 2022 07:36:18 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BC630F7C
        for <linux-next@vger.kernel.org>; Mon,  1 Aug 2022 04:36:15 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id k8so11607802wrd.5
        for <linux-next@vger.kernel.org>; Mon, 01 Aug 2022 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=TkN7bSrJQdjDoFinRxijD+n1KUpjxCr2jvc4gFaZQsg=;
        b=kUK95Fke57kTCvv6sjnJgvdKv5j9XtdaGiepaBmQJ7zSvNvNbDxgTKpT7yOYXmUwAH
         upJnFoAIwurEwHgC06/tKwe8y+0DHWyBKOlN6ehTJokBjVv7VZGGB8HiBh8jf0A96Ksl
         I7gBZqY2wgqzVA30VyWm99Y4os5ZIdHkb7sNWG2TSziYWs9JiLxkpVinxe9xxDTKNqhh
         sWvT07gHrLnQRiA+FSWKQQ/PNkQuIvUJnBGEmQChK0xZtvFH8FTaPHia6hI44bOn0W2a
         XwWuLuw9OThOyCRAB+IDJfIxqSbZiaahFJ/Ulbe0lX7mcP1WdadkuI/SnVRndt+ABSez
         37Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=TkN7bSrJQdjDoFinRxijD+n1KUpjxCr2jvc4gFaZQsg=;
        b=HSIkh95htwWX+4ku2Qbxu5h0ukgyAq0aouKkdzflYwlnY8a5QJJXs9HXzLyeewZLi2
         xfvc3Eg1r0Ol2dW2OVJKC2RgL71mDRFedQJWdyujR/jEYcW939JyEHvetOU0pn0YlgJR
         S3IHAMkA+VHKuT2TkGD+T5y0/BHzWeUlpYk8M+YNfPxRtAHEHqt0UdcGvgmpbcyoQnRq
         /Pzp7ipq0KfgQ00B0dhvLhRfoOKwFWFD7bw7X6ud66d5W6zjXLyr9HBcYvoMANnq4w90
         ZMZj203WIKlebrX+129YM0k7Ez0bMKTFzThTj7DQW+FxYS0x4NbR4t/2lH8H0S6zn75y
         +1HA==
X-Gm-Message-State: ACgBeo2dM05e2UL0DvIM/3S7tijtiqhw7bgjspkvldOlIpHHRh/rD1t3
        jExoETPcq2esBSdITnbldC5Dag==
X-Google-Smtp-Source: AA6agR6VZNw7lErgPuo5lY+pi8rx8rGv+AM512EJlW681/QflhF+9adQqDol/o+hWHa55Q9LKUD8Tw==
X-Received: by 2002:a5d:5a12:0:b0:21e:8327:7e03 with SMTP id bq18-20020a5d5a12000000b0021e83277e03mr9991022wrb.567.1659353774087;
        Mon, 01 Aug 2022 04:36:14 -0700 (PDT)
Received: from [192.168.1.5] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id v11-20020a5d43cb000000b0021ec76a0c36sm11406750wrr.106.2022.08.01.04.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 04:36:13 -0700 (PDT)
Message-ID: <d074daf4-c8e1-927d-9edd-2575f2335aa1@linaro.org>
Date:   Mon, 1 Aug 2022 14:36:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: WARNING: CPU: 4 PID: 326 at drivers/opp/core.c:2471
 dev_pm_opp_set_config+0x344/0x620
Content-Language: en-US
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        regressions@lists.linux.dev, Linux PM <linux-pm@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <CA+G9fYuGFReF0Z9qj7-80eY0gz-J2C5MVpno_8NjrGSH5_RB0Q@mail.gmail.com>
 <20220725102711.p6eerjjzgeqi4blu@vireshk-i7>
 <f914f5c5-dd61-8495-b362-3043406582da@linaro.org>
 <20220801023636.p5ytjqasedpohmdy@vireshk-i7>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <20220801023636.p5ytjqasedpohmdy@vireshk-i7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Viresh,

On 8/1/22 05:36, Viresh Kumar wrote:
> On 25-07-22, 14:55, Stanimir Varbanov wrote:
>> Hi Viresh,
>>
>> I can take a look and provide a patch to fix that.
> 
> Any update on this ? I am going to send pull request for 5.20 very soon and it
> would have been much better if this was fixed before I send that.
> 

I'm trying on next-20220728, but applying [1] gives below errors:

/linux-next/drivers/media/platform/qcom/venus/pm_helpers.c: In function
‘core_get_v1’:
/linux-next/drivers/media/platform/qcom/venus/pm_helpers.c:299:4: error:
‘struct dev_pm_opp_config’ has no member named ‘clk_count’
  299 |   .clk_count = 1,
      |    ^~~~~~~~~


Do you have v3 for Venus driver ?

-- 
regards,
Stan

[1]
https://patchwork.kernel.org/project/linux-pm/patch/989d085e6ff7ca6196e7076bba3aad8ac8851b00.1656660185.git.viresh.kumar@linaro.org/
