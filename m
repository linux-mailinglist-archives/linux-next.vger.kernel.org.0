Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E29FA4C6D27
	for <lists+linux-next@lfdr.de>; Mon, 28 Feb 2022 13:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236745AbiB1Mtx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Feb 2022 07:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236915AbiB1Mrr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Feb 2022 07:47:47 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074DF78059
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 04:46:49 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id u1so15230849wrg.11
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 04:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ENGlgL22OWGxOqpN7D6oXT0hPbVh0EZ15Mfm4UzwnvY=;
        b=ljyjusgUpWXziHEKYTetMqrmUP11BZzq9qcRuzLvnsBBDvDFMWWBboFzEhXE0FRKgH
         sabnPHqcCRzixCkwQ9jjzyfoUtEEo/geDmfMcpKcf7X1IJQVNNGpCM9iNudyut9JaLGD
         gIjc44NB9u9Y+r5TngXZYQR+tzMO9RU5b3G06QuYWQ9EuamTqf/nuxDimEoZDRzsmJLP
         bGIQNAn2i70MzrRxpINOlnLqMuFGFgn6RUz7oGwzUT9HFXcqLe5UH3Etr1nnsyAPw4xm
         1Xbqp+ZTV1YsUtxLAkYLaSkITgK7JZ4hRVlx2Bdx0XoUUUdx0ZDxcK+pyL4iWFxsNcKd
         AHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ENGlgL22OWGxOqpN7D6oXT0hPbVh0EZ15Mfm4UzwnvY=;
        b=reC57aIdcq9r4W0YDYzh+mFfvKk3nx/iyfViMP6HFvLfJP6Vsv+4zU60sRrLSvGFlj
         WDR6Hst960XRtfJOdeLbuzmkYT7oiVHdhWgHFIKXyYK3njbjAEcjgMOfGUFN8jn5UQV6
         nJ19g5TVwhmRLetIW0q3EDgXhlz7IDvBFOk83m2PUOI02nkos6EspXaHgM8dHx6ciTyb
         DFlspaNvct4rTHnx51li4HhEMxxP1Bjb4it8OkrQuz38ryk9J7xLwN6Oxmye6/4P5bQ6
         BmhB0S2ToYftyEt2k8QmFfrVFtUpi2nguLmTWNsX9AOAYVrjBrDgXcS+d2MgeBtcLMON
         QKEQ==
X-Gm-Message-State: AOAM531WelHi/6Fhs7ZGb2i6Q41mnAEeKXRweZCwGIxVwN/kHo4M8ykq
        xNt/Xx89m2Qy84/awA/yUP406A==
X-Google-Smtp-Source: ABdhPJwqS0yccbm1J0MBxEWU/k07soEzJwbYH8MePkGfCGdFtIgewWhv4vABIqsTTlRKUnh9dhxw/g==
X-Received: by 2002:a5d:6b0b:0:b0:1ef:d826:723a with SMTP id v11-20020a5d6b0b000000b001efd826723amr2405653wrw.420.1646052406418;
        Mon, 28 Feb 2022 04:46:46 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adff485000000b001e322a6ba79sm10577218wro.86.2022.02.28.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:46:46 -0800 (PST)
Date:   Mon, 28 Feb 2022 12:46:44 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Alistair Francis <alistair@alistair23.me>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Robert Marko <robert.marko@sartura.hr>
Subject: Re: linux-next: manual merge of the char-misc tree with the mfd tree
Message-ID: <YhzENKPtY+WOp566@google.com>
References: <20220228193928.3ec6ee98@canb.auug.org.au>
 <YhyPfcjJtIKNQtF8@google.com>
 <Yhyn72NO/roH1gA8@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yhyn72NO/roH1gA8@kroah.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 28 Feb 2022, Greg KH wrote:

> On Mon, Feb 28, 2022 at 09:01:49AM +0000, Lee Jones wrote:
> > On Mon, 28 Feb 2022, Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > Today's linux-next merge of the char-misc tree got a conflict in:
> > 
> > I did ask for this *not* to be merged when it was in -testing.
> 
> Sorry, I missed that, I saw your ack on the patch so that's why I took
> it.
> 
> > I'll follow-up with Greg.
> 
> Should I revert this from my tree?

I did try to catch it before a revert would have been required.

But yes, please revert it.

The Ack is not standard and should not be merged.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
