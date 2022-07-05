Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C94B566EE2
	for <lists+linux-next@lfdr.de>; Tue,  5 Jul 2022 15:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiGENFx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Jul 2022 09:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237779AbiGENFc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Jul 2022 09:05:32 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E992DA9A
        for <linux-next@vger.kernel.org>; Tue,  5 Jul 2022 05:32:50 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d16so11024576wrv.10
        for <linux-next@vger.kernel.org>; Tue, 05 Jul 2022 05:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3h8IwJb/X5yrsXPZtVPE+zLoArglTBKDiVaZV8Tb8Ys=;
        b=O8JZXQkQru+6Hqi3SMebkFGvcbgn25KO75WaDQGcmIQhQnOoP9pP6XBkIK5c9RcHZy
         HKOE9w5PNv+zPdK3ZE/RxVgWREZH69/ZdsSdJ/UsJp+CVkHUBpy4jLsrN7hTiOLYEcoY
         aB6Qo9tEsOPEUeB76j8rhTPK2qJ1Nbz3yQNl80BGgBrsGcFMW4+SRZ6kEPJ0XtmVWcij
         sFPEVPoPnfoKb5x3YR+iR2uApdKzZgt1d3JMvpKx4BSr9Ccf/F4TIpWOYPmkWH/Qp1Nt
         A/YWOovHCsjGWSq0jLdxSZJWKZ/g9cEW3TeWZwAfXjjde1HtPh5slnPR3LF9LJ76a6Qc
         88Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3h8IwJb/X5yrsXPZtVPE+zLoArglTBKDiVaZV8Tb8Ys=;
        b=d+PWBdz3Fdh+21RLhI1VkaIty24ExJ45ILyvgEX8jfy5V33UsZOjJWGeH7lvw95ham
         Ft0pC5mDdsJ8TvA0T1VF3gEeyxblboP7ME2jsnz2M5pkrATq4K0Bi1Yj1zEH4N9jsxtj
         3VJIRfnYMrF3j0Kx9Crcvsu3s6wYDkDnaX1hV5GL+83Y1LIYaCS3foq5pNhIbBRbRyHe
         do3+rovELbRP6ayzAOlX2eWZQQjdhTVI5igKSCFsNHf4iE3fLGU4zzHT8FYaKXrLfcAn
         EmTEB3EN7Oy1MbfbgDSbx46ekp39zlVnF2DSrnadqt8AK3YIieJqMaLTEUXoCN9oa6wh
         eaMQ==
X-Gm-Message-State: AJIora/4vQiS+wYAx+PMCUrJid1OIjKox+MvhxXPqOKPDvhfj9C2PzuE
        AlUYt1+8NkPYALgXlAqFl0BpZA==
X-Google-Smtp-Source: AGRyM1sGW8Pl/DwqS8c+Bs0FDAR2JcJiL7UdVqHIgFGkVWx1F+zQl0fPY1XSaAPAFVPMN+NnfQIZdQ==
X-Received: by 2002:adf:f44e:0:b0:21d:6eed:bd0b with SMTP id f14-20020adff44e000000b0021d6eedbd0bmr5466121wrp.216.1657024369204;
        Tue, 05 Jul 2022 05:32:49 -0700 (PDT)
Received: from google.com ([2.26.241.96])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c0a0600b0039c747a1e8fsm19728277wmp.7.2022.07.05.05.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 05:32:48 -0700 (PDT)
Date:   Tue, 5 Jul 2022 13:32:46 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <YsQvbia3TXHe/CYS@google.com>
References: <20220705115439.5a189cde@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220705115439.5a189cde@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 05 Jul 2022, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the mfd tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/mfd/axp20x.c:634:35: error: initialization of 'unsigned int (*)(struct regmap_irq_chip_data *, unsigned int,  int)' from incompatible pointer type 'int (*)(unsigned int,  int)' [-Werror=incompatible-pointer-types]
>   634 |         .get_irq_reg            = axp192_get_irq_reg,
>       |                                   ^~~~~~~~~~~~~~~~~~
> drivers/mfd/axp20x.c:634:35: note: (near initialization for 'axp192_regmap_irq_chip.get_irq_reg')
> 
> Caused by commit
> 
>   8c7d8aa029a3 ("mfd: axp20x: Add support for AXP192")
> 
> I have used the mfd tree from next-20220704 for today.

Aidan, what are your plans?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
