Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C131314B07E
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 08:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgA1Hiv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jan 2020 02:38:51 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34422 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgA1Hiu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jan 2020 02:38:50 -0500
Received: by mail-wm1-f67.google.com with SMTP id s144so1128273wme.1
        for <linux-next@vger.kernel.org>; Mon, 27 Jan 2020 23:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7GokS7CdGeZZPn1PrPOCpSW46TjRecT73s9cRiHualM=;
        b=Aq5w/piHruuGbRmgv2bptrp+x3Rne0Dds30PKNJDd+TQX6uSVzfNvVGDZ5dGmxw06n
         ka7bPmWRge0gXpL7diWJGs4suptUJBHoUjL2JILNDtKmDb7RtAZoAgmbuXttgYRsjMSv
         y8YRti/wIOZ5TE5fTYdDFqDSGH/UkZDiFHRDvKnBiaXWd2i3uTXG14V+DLJMvRsXFq0H
         u4K/4d4TKrH8J6SdWziqPMVN20kBc8KyvvCIU41/1y7mmbOdKaO521gnsck3mCQNsC5p
         ltwoUPfpgXITfVZcvW8G2jgOIhBas+jV7K08IKXtL8MyShFp0TigB0Dh6bCC0G+J0d4p
         yf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7GokS7CdGeZZPn1PrPOCpSW46TjRecT73s9cRiHualM=;
        b=XEfBwVuS11wtn+uB6AaVQD7FY3o8aQGaiuzgf48H+uk9kifQeXYKXagaiRMRxuy3ka
         FtcFY0EGLM2OMSZqRx5lp0EO3f1mniNuKA0FABXZoqFith6m+6vZSbDXetHaB4dRXEQ1
         Ob9OtAwWIx8pjX1XUoqxMp13G4vwggYfL3wju9Tb4dSen9GRue3js6h87s2StNqbxvK8
         W7YkJ8iejH8GqAyDrdMrl0vL8wzGIPhDDT+5R5xKMUTGadzhcZL+uthwIChP0kx9tx0O
         Cu1rsSx8wcMmpUlsvXV+F/hJVx0fYdy+htAE3q0fSQdWLOb3GlNRmh4/0CB+It33tJ32
         VSOQ==
X-Gm-Message-State: APjAAAVmmAxDTr/IJJAK+emYipQPJxBR/+CQIkveoWR4pWCVvOPRidOV
        fV/yoTIg1LlMeujXs4fTMgNv4Q==
X-Google-Smtp-Source: APXvYqwrMMc5NSaCSwiz7Idymm7eGqj7dO9/KFj2t5izUkAQHpe5nczm+vvnroV1+xYW6bFEoBrFuw==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr3417536wml.83.1580197128140;
        Mon, 27 Jan 2020 23:38:48 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id c17sm23961385wrr.87.2020.01.27.23.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 23:38:47 -0800 (PST)
Date:   Tue, 28 Jan 2020 07:39:01 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Axel Lin <axel.lin@ingics.com>
Subject: Re: linux-next: manual merge of the mfd tree with the
 regulator-fixes tree
Message-ID: <20200128073901.GB3548@dell>
References: <20200128120220.53494c29@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200128120220.53494c29@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 28 Jan 2020, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next merge of the mfd tree got a conflict in:
> 
>   drivers/regulator/bd718x7-regulator.c
> 
> between commit:
> 
>   b389ceae4a8f ("regulator: bd718x7: Simplify the code by removing struct bd718xx_pmic_inits")
> 
> from the regulator-fixes tree and commit:
> 
>   1b1c26b24a6e ("mfd: Rohm PMICs: Use platform_device_id to match MFD sub-devices")
> 
> from the mfd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

A pull-request was sent out to avoid this.

If Mark pulls it, this should just go away.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
