Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED4B586858
	for <lists+linux-next@lfdr.de>; Mon,  1 Aug 2022 13:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbiHALnh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Aug 2022 07:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbiHALnQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Aug 2022 07:43:16 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D1C33424
        for <linux-next@vger.kernel.org>; Mon,  1 Aug 2022 04:43:04 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id h28so3998749pfq.11
        for <linux-next@vger.kernel.org>; Mon, 01 Aug 2022 04:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jCZfqgpMIYNePan17xLuQgg/2P+1/yoh0ZDJdZ/18tI=;
        b=IDlZWskTF70cLwVWU511IykP7AjcAZQRAs8VbYY0NylYCYM0GJ2goPqkXxs1+3oyAL
         xruycQ6vh21/kXgFQ6YyXhYqPqZ1o1sM/twBunN/05CtkUSL5NTNSUCHOQL3+WBfWj1S
         4AcaDOZME9ihzikOxhHpu0dIqXM/TVkSLeCIYgjNTgNpA/o/fx8RZj6i7fG4XxG7J857
         a+TOwHrJ0DMEUMKTcXDe6HvsFadmvS+FKR7TchULQyxH8Pc9IWAUDAD5cFxGV9PfKnH7
         6kWiotPrDaGVwgmgJ1jE5AIkwo8+ZF8NPfTbwRjIc/oXl6AWhp/dOZfbjp2DwFyzAKT7
         8P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jCZfqgpMIYNePan17xLuQgg/2P+1/yoh0ZDJdZ/18tI=;
        b=J8eWDeoQdi1tHlrF0oTOBKwYs0D5/eZkG0JJTGr5N331V1MawVWqLAzSGDhI/X6xFI
         yAYqk3MM2JODpKOgdYO1ehBNomS8QIiXiZ5Dr449jjvZy/I6LRIBMM/KsMDVTIwocx37
         x93hQ4c7RcMqGVN6EotMinY6foJpn1rnsMTmddxgOEhG1p6JCc4TSWq8jSI5Ppec/Riw
         X/OukDgcVWUdgU5wBlJdoPWD2pyCkXaNcOzuQQcxemTnPcRltOu7U3gkWoq3JoaPZjw2
         yowAkUCtyth2FnlbLOr+/urrV06rebQDIMlPhnb7b2k3/+9HYdO61tbM8pdxK1KFvlBn
         OqYw==
X-Gm-Message-State: AJIora+yH/aKB271obY13mCgHqHLkpevqf3nXzlVSi0njnhzTuIZkY1o
        hhdzJHUd60OJa/Xs/Y+nqD14Nw==
X-Google-Smtp-Source: AGRyM1sy7zJbZBiuLqJ7c7UTW7/Bu4BYqPzTf/WcI22nbTu9nQpq2LYP0aw6jf2JYIEIq3ZhrUjwiA==
X-Received: by 2002:a05:6a00:17aa:b0:52a:e94b:67e5 with SMTP id s42-20020a056a0017aa00b0052ae94b67e5mr16104010pfg.76.1659354184093;
        Mon, 01 Aug 2022 04:43:04 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id n16-20020a170902e55000b0016d5cf36ff8sm9496422plf.274.2022.08.01.04.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 04:43:03 -0700 (PDT)
Date:   Mon, 1 Aug 2022 17:13:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        regressions@lists.linux.dev, Linux PM <linux-pm@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: WARNING: CPU: 4 PID: 326 at drivers/opp/core.c:2471
 dev_pm_opp_set_config+0x344/0x620
Message-ID: <20220801114301.k6ya3gfyy3pcrzwx@vireshk-i7>
References: <CA+G9fYuGFReF0Z9qj7-80eY0gz-J2C5MVpno_8NjrGSH5_RB0Q@mail.gmail.com>
 <20220725102711.p6eerjjzgeqi4blu@vireshk-i7>
 <f914f5c5-dd61-8495-b362-3043406582da@linaro.org>
 <20220801023636.p5ytjqasedpohmdy@vireshk-i7>
 <d074daf4-c8e1-927d-9edd-2575f2335aa1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d074daf4-c8e1-927d-9edd-2575f2335aa1@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 01-08-22, 14:36, Stanimir Varbanov wrote:
> Viresh,
> 
> On 8/1/22 05:36, Viresh Kumar wrote:
> > On 25-07-22, 14:55, Stanimir Varbanov wrote:
> >> Hi Viresh,
> >>
> >> I can take a look and provide a patch to fix that.
> > 
> > Any update on this ? I am going to send pull request for 5.20 very soon and it
> > would have been much better if this was fixed before I send that.
> > 
> 
> I'm trying on next-20220728, but applying [1] gives below errors:
> 
> /linux-next/drivers/media/platform/qcom/venus/pm_helpers.c: In function
> ‘core_get_v1’:
> /linux-next/drivers/media/platform/qcom/venus/pm_helpers.c:299:4: error:
> ‘struct dev_pm_opp_config’ has no member named ‘clk_count’
>   299 |   .clk_count = 1,
>       |    ^~~~~~~~~
> 
> 
> Do you have v3 for Venus driver ?

You don't need to apply anything over linux-next, it has everything you need.
The patch you mention is dropped and we carry separate calls to configure OPP
resources for now.

-- 
viresh
