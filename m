Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E851517579
	for <lists+linux-next@lfdr.de>; Mon,  2 May 2022 19:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380032AbiEBRNC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 May 2022 13:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386521AbiEBRM6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2022 13:12:58 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C594E5F8B
        for <linux-next@vger.kernel.org>; Mon,  2 May 2022 10:09:28 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id l11-20020a17090a49cb00b001d923a9ca99so13224342pjm.1
        for <linux-next@vger.kernel.org>; Mon, 02 May 2022 10:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YBdd2ryEYbQhNto7V+FEIeigFcKN5dcvsQcbEloBsSw=;
        b=XYRI5MqlUqBCgnv3M/9BUQuzTOPzzNxiJdVK1orCZnzHz7dA6reJYKPqYCU1tcPmtq
         cUigVtCagPxRxAmkyrVrK0V062Z1GofJ9KKeCG9eWm39/CqCM8nBoKs+Y0dZmtWHeDt7
         VZL6umn0BklTenRO/3A0Ow1+x28lU2+ZRRdLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YBdd2ryEYbQhNto7V+FEIeigFcKN5dcvsQcbEloBsSw=;
        b=EwJNS0gJn5kKBhs4HLHahbn18/fPneiSneWIHYD76ew0rbJWqbjiTzZgOlth3DTmf4
         ClY1S+B3e5uvFdSH459DQ0yqYqZOgA4H7FAfFe4rjnvDCGj+V5hbYMll7n6GnddXQQW7
         PRKIbmzALe32yztW4PpceW+zPWnZp9Juv1u14+3Z9rPbzs22/AxXb5pkvQBMNxq6D3x6
         hOA19/h2A6vq0vtZGaRckLL3t1zXw+94Nf2/8BzZzNT856cY5XZFUT/3t2udH+nDf7dP
         dv1CsSkTkGPJQbtb1al410a+DbAldMBHYiAc/YZYvQBfawYbaC7R+Ebq2FcvbsrWMHX3
         p8dw==
X-Gm-Message-State: AOAM532Cs7zzxYEfizMNWUrqSnV6GWhTFvhT5kPNVRGmOdvIT41RRi/Y
        0xLgg7rKTDdy0vFE7yJJYhSOwQ==
X-Google-Smtp-Source: ABdhPJxkgIjQEoLrqIr9pTzpjKkepzj3G16lxAM5zrjtg1fwCIRZhywsUjgqUg/oWK4ovXfHbqsB0Q==
X-Received: by 2002:a17:902:cec5:b0:15d:1e53:6f1a with SMTP id d5-20020a170902cec500b0015d1e536f1amr12831600plg.2.1651511368310;
        Mon, 02 May 2022 10:09:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c272:7186:601f:66e6])
        by smtp.gmail.com with UTF8SMTPSA id co21-20020a17090afe9500b001cd4989fedcsm19210563pjb.40.2022.05.02.10.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 10:09:27 -0700 (PDT)
Date:   Mon, 2 May 2022 10:09:25 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: linux-next: build failure after merge of the usb tree
Message-ID: <YnAQRQWK6ozI8DZJ@google.com>
References: <20220502210728.0b36f3cd@canb.auug.org.au>
 <Ym/DPS99n8K8Lltu@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ym/DPS99n8K8Lltu@kroah.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 02, 2022 at 01:40:45PM +0200, Greg KH wrote:
> On Mon, May 02, 2022 at 09:07:28PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the usb tree, today's linux-next build (x86_64
> > modules_install) failed like this:
> > 
> > depmod: ERROR: Cycle detected: usbcore -> onboard_usb_hub -> usbcore
> > depmod: ERROR: Found 2 modules in dependency cycles!
> > 
> > Caused by commit
> > 
> >   c40b62216c1a ("usb: core: hcd: Create platform devices for onboard hubs in probe()")
> > 
> > I have reverted that commit for today.
> 
> argh, I thought the build issues were fixed :(

Sorry about that :(

The *build* issues were actually fixed, however I did not try
modules_install ...

> I'll go revert that series from my tree later today, thanks for the
> report.

I think the dependency situation can only be resolved by linking
onboard_hub_create/destroy_pdevs() into the USB core module. My initial
idea was to build them into the kernel binary, however that doesn't
work because onboard_hub_create_pdevs() calls usb_of_get_device_node(),
which is part of the core module when CONFIG_USB=m. The two function
are relatively lightweight and don't depend on internals of the
onboard_usb_hub driver (besides the device id table) so linking them
into the core module doesn't seem too ugly.
