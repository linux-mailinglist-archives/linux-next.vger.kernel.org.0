Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33B0665689B
	for <lists+linux-next@lfdr.de>; Tue, 27 Dec 2022 09:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiL0I7x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Dec 2022 03:59:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiL0I7w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Dec 2022 03:59:52 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D304364CC
        for <linux-next@vger.kernel.org>; Tue, 27 Dec 2022 00:59:51 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id bn6so3272834ljb.13
        for <linux-next@vger.kernel.org>; Tue, 27 Dec 2022 00:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWQLsYuuAxXojRNfKMNG4B8jHBGkKFplsXrOiHa/344=;
        b=V+u4Bx7iwQz1LqSbn6HtjuUfsqNEA5fSQU9nxVyzfRTTwtwg3kSqbA0Z7bEz06sqsq
         ofxsyUbwkuP/3Jp6WvnzEAX3R0BeGU+iRCaIS+krJFJC5Zt5gS7PAOusYu/xLMk85748
         2CNziAI3cOhp9woBKFo+n6E+X6fgxv9GnL+MRbSHLaWL8l7CjvXsXB+iMBVKK8yc248l
         SEIo2AwMyfrRw9bbl2w0rRTmG9WZJRFDjVqBpn/S7VZeX3IwveyoYPkvKjkNZ2YgiD2A
         Em+QoE+ExIywQYSeMh0wgeI+NvIospvCz6eoBJqsBQxvgoLkEqdmPuI3lcB/KrZ4cXYO
         6Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWQLsYuuAxXojRNfKMNG4B8jHBGkKFplsXrOiHa/344=;
        b=WNWp9YMz/+s9GFygYHURcwFihd0oKslpL6EgimnAclbF5SK431DcgVB79X1IUibZgU
         h6K6zuPzFW6e7YtTXmNvdS21kIVsy0f2T0dPpHcxFkUgH9EdOklGVkKkUqqS4vIJXsHX
         IpCpZeLLROE5eGSi0GqSpRcDl1wC+xOo6Rbgf5dmsn2uzyYVUNutfSAaM3JL26+t6NSb
         i+IPGG1fJNaKXqcfC1VZX6h04omx/SRh4ZzBOQ0khqGeGUrdZi6HbzNitAmymx3FWO7w
         f3tZdXVB773V39nNnnVHXDgQAmNZxaC8qmp/0XjXtjeVqWXZI15Ggma512kIMCQpPU4A
         fhAA==
X-Gm-Message-State: AFqh2krzUwylG9dwLl9LWSmFGGWbgVOZuko3oPZe4gqxiNCjQ//to9/5
        KKmT+xnRoQHTspSQBugd8n4s6E9/Tq0oPztG
X-Google-Smtp-Source: AMrXdXvStigwQnrkr23l1O7NNOh4uTBT0DV9ZYB0RRVcldVc+cK0w3CedYXioPrl3NEXiBd1mypMuA==
X-Received: by 2002:a2e:2205:0:b0:27f:7335:6a4e with SMTP id i5-20020a2e2205000000b0027f73356a4emr6590922lji.35.1672131589654;
        Tue, 27 Dec 2022 00:59:49 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a18-20020a05651c031200b0026bf0d71b1esm1534837ljp.93.2022.12.27.00.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 00:59:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-next@vger.kernel.org,
        "B. Niedermayr" <benedikt.niedermayr@siemens.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        robh+dt@kernel.org, tony@atomide.com
Subject: Re: [PATCH v2] memory: omap-gpmc: fix wait pin validation
Date:   Tue, 27 Dec 2022 09:59:41 +0100
Message-Id: <167213158105.15520.15674360617085776197.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209112828.581491-1-benedikt.niedermayr@siemens.com>
References: <20221209112828.581491-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 9 Dec 2022 12:28:28 +0100, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> This bug has been introduced after switching from -1 to UINT_MAX
> for GPMC_WAITPIN_INVALID.
> 
> The bug leads to an error when the optional gpmc,wait-pin
> dt-property is not used:
> 
> [...]

Applied, thanks!

[1/1] memory: omap-gpmc: fix wait pin validation
      https://git.kernel.org/krzk/linux-mem-ctrl/c/827e0920dbfb0d92416e56081d70745597403446

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
