Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7805A4E3979
	for <lists+linux-next@lfdr.de>; Tue, 22 Mar 2022 08:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237355AbiCVHTn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Mar 2022 03:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237368AbiCVHTe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Mar 2022 03:19:34 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E831C1EEFA
        for <linux-next@vger.kernel.org>; Tue, 22 Mar 2022 00:18:06 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id b19so23587087wrh.11
        for <linux-next@vger.kernel.org>; Tue, 22 Mar 2022 00:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rOPH6g37mauJoa2trxdFJdkR5hRR2ETwMr/7bfJTMVs=;
        b=ECmoAO6pUz5bCOcqf0VjrZStJXin03xM1sXJYLPNpOrw/efsdaQ9T3QISm981kdFIk
         ttvS4MEmLE6zZwzPh+Q62fnjXdEwS7bJxXAh4pJTGki2KiqC/8HiN9MS4/uwWJARnX9U
         CR7I63zLZUo9H2YSiL3ap4rC/fCuZS++znRcLVfd53Obxk+z5/cyMaGdjXWyAlnklchI
         /gjH3Wzc4Aa2Pgi07mD7JCgASK8Nvv7e6HMEyWrXJVlYl2FDAmfUCWOLoXpXBQDE1AYU
         C/SSnwusEQ+nh3cvj86u0fK85nCaN8fD0ReHDDy9+4QjaWmT862USFlLAaiBWT2AM0LL
         CLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rOPH6g37mauJoa2trxdFJdkR5hRR2ETwMr/7bfJTMVs=;
        b=GDOqd+9VRd0S2Ed3HqXvb1bu18adSK2+JARJKa28NDtnd0si9613Bgiv9jFHxeXzPq
         ghA8Pl5/fL6aMSVy93kjMd20pKLFoi+7MJPiE/20HIGsisWi4cMqxnpwEKiqE7+Rv8Sz
         2lAomCE3g/fgCXyP4JmuZwwAyc0GaEOyv4MGh7+XQhk2W/qjEg72jhCMSMSKJEqhJxJ0
         tfXK2zw7DNxODNRSQCCk2hP9+gQ9rZBdbJFdO8DHreMDCLXhhzHUesKC+i52bx9y3uYH
         fEAhqNbAF8xMSa0CUqZiJGdolwSZJmsuaC/TdjmxFhIilfdlabQzi4O3RnVvIeX1AkyA
         CAKA==
X-Gm-Message-State: AOAM532AwtOfnMaaljIn5k40pu/te7YKGIYGa6k/8MRcwA6EZYxKykv0
        Y6ikGl4WDJtiT11KGGpH/Ia7/A==
X-Google-Smtp-Source: ABdhPJw8Nh+0d/8bu4YZeafGMb3cldwCg6y9uuMJF9kjovNL53b5FPU7i37C87TwMmaa46JtpHv7RQ==
X-Received: by 2002:adf:a41c:0:b0:203:daeb:165f with SMTP id d28-20020adfa41c000000b00203daeb165fmr21807101wra.188.1647933485475;
        Tue, 22 Mar 2022 00:18:05 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bcc0b000000b0037e0c362b6dsm1225250wmh.31.2022.03.22.00.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 00:18:04 -0700 (PDT)
Date:   Tue, 22 Mar 2022 07:18:02 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the mfd tree
Message-ID: <Yjl4KsmOQWVfUui8@google.com>
References: <20220322141029.1885af98@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220322141029.1885af98@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 22 Mar 2022, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next merge of the devicetree tree got a conflict in:
> 
>   Documentation/devicetree/bindings/mfd/syscon.yaml
> 
> between commit:
> 
>   844dd8fe02f2 ("dt-bindings: Add compatibles for undocumented trivial syscons")
> 
> from the mfd tree and commit:
> 
>   c1ff0c0f24d6 ("dt-bindings: mfd: syscon: add microchip,lan966x-cpu-syscon compatible")
> 
> from the devicetree tree.

Did you accidentally hoover this up Rob?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
