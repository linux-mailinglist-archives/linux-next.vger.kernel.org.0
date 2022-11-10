Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73AFC623E5F
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 10:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiKJJOz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 04:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiKJJOv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 04:14:51 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93E4168AE1
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 01:14:50 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id a29so1977257lfj.9
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 01:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWtnQJaZ/DC2sr1Ii69yeGSZuxu9g3YJF6gE4/PvhMI=;
        b=IyqPqR2HfrTjYWOP26a2uWXKScvs+iwrE2hWCYZOtcqow8xOBNXqf+yqpdAcyAihQD
         anjFfES39Wc3rbVkiYr0dw8tXWiORSEIB6LB9Av6KxIEIIXU8aKRczr4YeFLum9y2JXS
         zR+e2d+V6AWcV+qKg+Rsd23WST+VtCuejCJKGoVajT+GlAvyZ54/WoncChoty4k7JwZx
         T7KnMY30EKzqIw7EAvu2ok1Y/jy8etdvMRJO0/26JnkksiPCkOcqCX6z3rksL41BndP+
         PG+MEcDeEQetWgTjFZrzyHdRi1CetcvMt7QblGBfLIopVkr+IKtEmyt8TAT/F0Mzbmg2
         p9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWtnQJaZ/DC2sr1Ii69yeGSZuxu9g3YJF6gE4/PvhMI=;
        b=Kvnl7gPefB93jUqhfZ6OWPkdvyODFWmEZmvEDTO9o5Gm9/oS+Fx4Coc1rVG/8SdWlx
         djhVThpzjWahJY2Dxs3DoqmXLg1t+xUfoa8HUcEafIbeT+TXhVtUrWTp/MwnwtTIDuFA
         nopvA+UkBd0tXBgI4cANTaHVab65m+plif4ykd9xUd8DMzYTZWwLIm1dlJab+Ho8Wzcf
         ASmgZ1vbsMzQj+vYETEV13joKZb7LeFHvbWkf87yYoGUsFXfOlvOMBrU8gSOVgxl19a9
         xaVG2E0aeoMaZHOWTq35ns+Te9JFsbQ4Tis6wCIjoUfe5TZs4YbWv/jORgKy4TrsomNw
         4OJg==
X-Gm-Message-State: ACrzQf2x/7nGHmVk3iNBoK361B6A+lTYHuTvg/BOcgpr53vMiyuhn1pW
        qMJWJFfLpW5Pcl9HIAUpHTr/rA==
X-Google-Smtp-Source: AMsMyM5SWvMuCZ7I789cGHR6D4TMVXQwi09H6ESZ3ij9ZsmEcuca6j39FFLlvqiJP0mflZ0jTY7LuA==
X-Received: by 2002:a05:6512:22d4:b0:4af:1f59:b6d0 with SMTP id g20-20020a05651222d400b004af1f59b6d0mr1294867lfu.314.1668071688997;
        Thu, 10 Nov 2022 01:14:48 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id m3-20020a0565120a8300b00492dbf809e8sm2663338lfu.118.2022.11.10.01.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 01:14:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-next@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-hardening@vger.kernel.org, gustavo@embeddedor.com,
        keescook@chromium.org, linux-kernel@vger.kernel.org,
        rogerq@kernel.org, tony@atomide.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH] memory: omap-gpmc: fix coverity issue "Control flow issues"
Date:   Thu, 10 Nov 2022 10:14:47 +0100
Message-Id: <166807168409.17460.1069653454790290049.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109102454.174320-1-benedikt.niedermayr@siemens.com>
References: <20221109102454.174320-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 9 Nov 2022 11:24:54 +0100, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> Assign a big positive integer instead of an negative integer to an
> u32 variable. Also remove the check for ">= 0" which doesn't make sense
> for unsigned integers.
> 
> 
> [...]

Applied, thanks!

[1/1] memory: omap-gpmc: fix coverity issue "Control flow issues"
      https://git.kernel.org/krzk/linux-mem-ctrl/c/10913c3c59ce04562230eee4a9d1b0d4e2808842

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
