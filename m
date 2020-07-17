Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC693223536
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 09:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgGQHLG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 03:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726113AbgGQHLF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 03:11:05 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B20C061755
        for <linux-next@vger.kernel.org>; Fri, 17 Jul 2020 00:11:05 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f2so9865327wrp.7
        for <linux-next@vger.kernel.org>; Fri, 17 Jul 2020 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ArTRNnzZs91FkA6/ho6wtwomeiOgsZ04JTylL3kLyNs=;
        b=kDLT6+leXR3qSGdg6iPjbZzsiQrryZSog3FdKj/+hYTCAgYEN2f+fSZOMcVvcVx8Da
         NTx74nLGPTS7LDBzlM9nQ6Th0UIw0M0dm6aERDQMNDa/DhTFc1Q/kd4rbIuNzRDr/i7t
         YF5wf9g3y6l2hc+M67fA1TG5k0mNpQXFuo/QRrOZbK1TCVk3BAUM3COpO1gdIWy2HDnd
         14sT/3G9ghmBYgX0YQRuq/2hKzVl4PVtucD5NGtVM9HKVY/gQauhpd8bG3waw8hj0InN
         LPesgOo6D+Jg2dcMBmu2cM2xy3rr+NKIqmUszshPHDmyMQTTYn07O26utsNVTc2T3z6b
         e3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ArTRNnzZs91FkA6/ho6wtwomeiOgsZ04JTylL3kLyNs=;
        b=Bz45fqEp5twM+/uMw/2+TPUIZq8QOYEmYRDtO3Z/XFQxyHZIJCr5sOyapc8uzToDYH
         qenV539HJCNsoJTvnt7jANTWX0vm7CgAxdO+fldX0NXiE8PMtl5zkiu12bnWWJb5AORV
         wbPtHR/+7ES1f/sVTryYJkIODsopKOUnAvCIxcfQkyM8za15Vw8Bb6rR5VqoehfoCNZI
         EfuvIcS0Dk/dFa0hSyXZ0zKfQhPArio7q9MPFgMpGRAs+QwsUNEpcF07Ar8mm3EP7XWD
         jSoZrwtuInDIo+Yx2glW2/nH8sVrsIm2uFt1w58X1m2i8w4w2TxM4sVpaUjwPlEFrl9t
         Sxww==
X-Gm-Message-State: AOAM5326rjfYpQatMOv0cXWuS6BSS8L6FXO0b7sZUeFog66/aRKTw5i3
        /eGlPXS8BbQhCafay0qEcgUtGw==
X-Google-Smtp-Source: ABdhPJy9nuaTBwW1I5JOhKknn3r1C08+e8njv/F7IHQArMz57YQ6EzXop430T9F9pKM1MIEDjgNQ6Q==
X-Received: by 2002:adf:a34a:: with SMTP id d10mr8846245wrb.59.1594969864077;
        Fri, 17 Jul 2020 00:11:04 -0700 (PDT)
Received: from dell ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id d13sm13261001wrn.61.2020.07.17.00.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 00:11:03 -0700 (PDT)
Date:   Fri, 17 Jul 2020 08:11:01 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mfd tree
Message-ID: <20200717071101.GC3165313@dell>
References: <20200717134154.50326d78@canb.auug.org.au>
 <20200717065636.GB3165313@dell>
 <20200717165958.41db203d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200717165958.41db203d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 17 Jul 2020, Stephen Rothwell wrote:

> Hi Lee,
> 
> On Fri, 17 Jul 2020 07:56:36 +0100 Lee Jones <lee.jones@linaro.org> wrote:
> >
> > > +static const char *kempld_devs[] = {  
> > 
> > Do you mind if I change this to 'kempld_dev_names' and still keep your
> > SoB?
> 
> No worries, I just did a quick hack, so if you neaten it up that would
> be good.

Great.  Thanks again.

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
