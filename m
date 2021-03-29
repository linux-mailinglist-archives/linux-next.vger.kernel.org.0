Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9471E34CD4A
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 11:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhC2Jsx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 05:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbhC2Jsv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 05:48:51 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD0AC061756
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 02:48:51 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso8190640wmi.3
        for <linux-next@vger.kernel.org>; Mon, 29 Mar 2021 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OyMXSReW5FYxUKuG3bzOVzDvXsFOeos0aY2G6CR/ZWQ=;
        b=yXTW1lq7sr7MfPFMudBJJW3aAoI+xbdYXVRC+H2zJTTVYyqnWRW1i4AgBbvDiHvn3m
         Q2fkk7Z/ZZjQDzLQWLXrXlVaCEMJzSWm7uNCKveGUclEdfvbTXzrk4k0uwfQgtBlWa3v
         MdLcm75t0ppSj0/VGwe9qCuHR21X9x7FXZwHFMMWLLddMezUlkNe3+a8tkUsnOUfv+Ui
         MpNsBJ5MY5PZu46Cx84/pUCqyHCsjp28sjWaSv7e1zkVXPzuGFNxhlO2El3igaodaIPt
         QQXkqa9Vsy8q3Gb7GEj/sB8Sfd570q0aarzfcic0/kOvVNtnmyXCz2ycHLTsZJ9oGM5B
         0YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OyMXSReW5FYxUKuG3bzOVzDvXsFOeos0aY2G6CR/ZWQ=;
        b=KV/3U6vZ9yNJyxbpUrx4yWKKarcTWWyjJa38IddE70p/LAgWOr1XJKIloCbZThRcPM
         QHgmI9g6qHP57CyvSa9ir+QJUcqYGYePGR6VNrxNGthI1f9l122B7RJRO1sXZnI+CU6f
         kcHGkpueqoQWuynq1Bwa3ssq1EeXgAnMeFuxJimzZgb/Np5LUmeMyIwpCsWPsK2dbHYL
         MmQUuWEZRqeqw04AreMT1i6UqTMCpVb0S/Lz6dW8tLE1HKqoS3opr79+vlHIZSqSEeHK
         oTTiXm2mk5BK8Ykv9XRWvCOToHwgTJ+srHqmweCNaI4G9qTYmESqlX0j935ypQDmWNTD
         +R5Q==
X-Gm-Message-State: AOAM5333Vj1akTEK5YQgYccCu/VCovYUEvp56LWzQoREOIHRLjfmV/hg
        t4FTbqq3gmv4HXUhDy5V/LyOV4GAcWAanA==
X-Google-Smtp-Source: ABdhPJxbgDYoFM6blksIzoZrNSp5FDcXl/dwr+Pc88v0S7ka0SMIJAUSfT5ORFZQaPH57iOUoe8tWg==
X-Received: by 2002:a05:600c:2945:: with SMTP id n5mr24024486wmd.78.1617011329805;
        Mon, 29 Mar 2021 02:48:49 -0700 (PDT)
Received: from dell ([91.110.221.217])
        by smtp.gmail.com with ESMTPSA id h20sm23342409wmp.38.2021.03.29.02.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 02:48:49 -0700 (PDT)
Date:   Mon, 29 Mar 2021 10:48:47 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the devicetree tree
Message-ID: <20210329094847.GD2916463@dell>
References: <20210329195351.3322aee1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210329195351.3322aee1@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 29 Mar 2021, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the devicetree tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> drivers/of/base.c:1781: warning: Excess function parameter 'prob' description in '__of_add_property'
> drivers/of/base.c:1804: warning: Excess function parameter 'prob' description in 'of_add_property'
> drivers/of/base.c:1855: warning: Function parameter or member 'prop' not described in 'of_remove_property'
> drivers/of/base.c:1855: warning: Excess function parameter 'prob' description in 'of_remove_property'
> 
> Introduced by commit
> 
>   3637d49e1121 ("of: base: Fix some formatting issues and provide missing descriptions")

Ah, I see.  Will fix.  Please bear with me.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
