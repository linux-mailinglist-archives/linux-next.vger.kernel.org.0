Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7888A4C64AF
	for <lists+linux-next@lfdr.de>; Mon, 28 Feb 2022 09:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbiB1IRp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Feb 2022 03:17:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbiB1IRo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Feb 2022 03:17:44 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFABD40A06
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 00:17:06 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id v21so14045395wrv.5
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 00:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=W4EWrovrKwniOj1aDeQhCcb/kTFjyzBYFDvE9xPTT6c=;
        b=ytZUlgBVeIjNC4P0r9W5xNvMhC/NtQaC06IzqNdSlfdi9w21ZJD6lUUuyPBbV3kHMJ
         ReSNX8i3gX0IodyN967zzpkqe1aiQO+t0Zsc6ACKWQqc+r4T/vQmbCEOpii3Yb+6RjoP
         7nM8pytviaMiIBGiot+fugobC7A3wADEbrV6P9w+yIDqI5L+79+ADaLvlsH7+MmTzLxJ
         I6coPFlefsIm5Gx2//F/q0xnnvRlHtfUZIbPrOZ+ySwIK1Zh/2rmWbfAvLUX1eaijFvr
         +RioFLmat/zUI6DZvC4oUJyDbF+tg2L5k4s+SXOf8kqtCQ9s7R2jmiqYyglub+/UBPk+
         8H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=W4EWrovrKwniOj1aDeQhCcb/kTFjyzBYFDvE9xPTT6c=;
        b=JPdCZkimF97RGXHB6/xS5x5zNid4+YRlst//WiCkg4YvPX1IHMfopcxJVBHmiBC5XS
         VmKbVSEuJG8frpf1xvp9FTb2VlW13qgfhOCV4CQAovbq60u/DmrjkY9h/bZUqydQ/96t
         U2FF3GqBAcAEqI/1vPerFlN+MEWj0cRb03GqI5MANEqpvXuxn1F3XwQPAY6ZDCsLGUMp
         xCanPHb7Ng6cSRbEUAlytBxCLl9g/p56cvQqlBTcNMro7UN2mLA0j1O/TMf0u65p+9XK
         7jPtTAdbyRN4vDHrUoG983FfvyvL7e+RCS0geOeXg+3LDhhTr6+TRc7fu646C3DzNNtu
         f0YA==
X-Gm-Message-State: AOAM533x81ep6QMacPBtyVV9iqQF84WR7fwpI130c0P6qd+c14SUsUBb
        +4wDWxGJdXmpG55CmO88jFa4fQ==
X-Google-Smtp-Source: ABdhPJwAZx+rlSBha8ANhAUaASGKtoMMJk+uo49L16UcGWjQXU3vuKONTJa/2clEF1PS1JTBTKdeCw==
X-Received: by 2002:a5d:6da6:0:b0:1ea:75c7:77f0 with SMTP id u6-20020a5d6da6000000b001ea75c777f0mr14907685wrs.566.1646036225378;
        Mon, 28 Feb 2022 00:17:05 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id c4-20020adfed84000000b001e5b8d5b8dasm14034904wro.36.2022.02.28.00.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 00:17:04 -0800 (PST)
Date:   Mon, 28 Feb 2022 08:17:02 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     broonie@kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <YhyE/kPA71bHsHDz@google.com>
References: <20220223165416.2359767-1-broonie@kernel.org>
 <YhZo7xnNRKz8U1Lf@google.com>
 <20220228170826.4dedaf6a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220228170826.4dedaf6a@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 28 Feb 2022, Stephen Rothwell wrote:

> Hi Lee,
> 
> On Wed, 23 Feb 2022 17:03:43 +0000 Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Wed, 23 Feb 2022, broonie@kernel.org wrote:
> > 
> > > After merging the mfd tree, today's linux-next build (KCONFIG_NAME)
> > > failed like this:
> > > 
> > > /tmp/next/build/drivers/mfd/sprd-sc27xx-spi.c:255:35: error: redefinition of 'sprd_pmic_spi_ids'
> > >   255 | static const struct spi_device_id sprd_pmic_spi_ids[] = {
> > >       |                                   ^~~~~~~~~~~~~~~~~
> > > /tmp/next/build/drivers/mfd/sprd-sc27xx-spi.c:242:35: note: previous definition of 'sprd_pmic_spi_ids' was here
> > >   242 | static const struct spi_device_id sprd_pmic_spi_ids[] = {
> > >       |                                   ^~~~~~~~~~~~~~~~~
> > > 
> > > Caused by commit
> > > 
> > >   6fc90b92e9c7ef348 ("mfd: sprd: Add SPI device ID table")
> > > 
> > > I used the MFD tree from yesterday instead.  
> > 
> > Thanks.
> > 
> > Will fix for tomorrow.
> 
> I am still getting this build failure.  It is an x86_64 allmodconfig
> build.

The good news is, this is fixed locally.

The bad news is, I didn't push it to the public repo. :)

Should be fixed for tomorrow instead.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
