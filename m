Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537292638A9
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 23:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgIIVrV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 17:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgIIVrU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 17:47:20 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C41C061573
        for <linux-next@vger.kernel.org>; Wed,  9 Sep 2020 14:47:19 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x123so3336988pfc.7
        for <linux-next@vger.kernel.org>; Wed, 09 Sep 2020 14:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c43l4haQiH2l2U2Uxeo70dZHTihDun4B2/lN0CtMGwY=;
        b=IEhWgrJqh/LelmsUp+GmgJEU5D0S1P6HNMNZBzcEXC6OX2Dx8t0NbpWWroOPaEizt8
         QZPjkLfGNCy/ErDM0TZ5G45/D4VzTiJtbc+qtSn2jPpuNKrwshlv18DwvAR7paKIMvWm
         BXeYdkGAu4F0iAY2x+UF6d9YO44ybeNtE7a3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c43l4haQiH2l2U2Uxeo70dZHTihDun4B2/lN0CtMGwY=;
        b=pFNHkAqYzhOjfeau3SbiNHOz+udVyp+c9oIlNSR5kkZGHPqjuNkiUIOJC42szeXCQk
         6YtyXhBluiJp1lMbW2lMqMgu/1aiOhjE6CAV0zn+0OBwlbbxn9QOmzPgEcFmuwi/fa3v
         1kH2xdVuYruSd8Mi/Ch8iQeSXKCEsLccsAXEdIqRLIxC6pgbsOkBzfmG8PPu1D+c+Gcz
         N76pSbee0tMfE+segGzsFcKnxn2IUKy0+G9KrSFYS19jVVTV71xfr9ptOIKkztKvct5z
         Qgs78XnL5AaEa/0KFIBOVyxNeJeD2zHqHZNHxOqRowq5A5DTVP64SNXcrGJ8RO/ZLQv6
         4mKQ==
X-Gm-Message-State: AOAM532EEK8pnku+9OKMbGPJURA2FZvZCTti2KhAsfJgICoz1QPSVfho
        uoslhAy9G6RM4ot9rRBwOfIR1Q==
X-Google-Smtp-Source: ABdhPJwH76k4mk8b1qLtiU7RgZYntfKYanCipdXxCyld7g7uIy6GXrZvvmmLCeRPn0Xyz7dtTdV7tA==
X-Received: by 2002:a62:150b:: with SMTP id 11mr2415164pfv.115.1599688039142;
        Wed, 09 Sep 2020 14:47:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u10sm3590464pfn.122.2020.09.09.14.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 14:47:18 -0700 (PDT)
Date:   Wed, 9 Sep 2020 14:47:17 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <202009091446.806D39CB@keescook>
References: <20200909154709.619fe9bb@canb.auug.org.au>
 <20200909072105.GA438160@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909072105.GA438160@kroah.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 09, 2020 at 09:21:05AM +0200, Greg KH wrote:
> On Wed, Sep 09, 2020 at 03:47:09PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the driver-core tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > lib/test_firmware.c: In function 'trigger_request_platform_store':
> > lib/test_firmware.c:517:35: error: 'efi_embedded_fw_list' undeclared (first use in this function); did you mean 'efi_embedded_fw_desc'?
> >   517 |  list_add(&efi_embedded_fw.list, &efi_embedded_fw_list);
> >       |                                   ^~~~~~~~~~~~~~~~~~~~
> >       |                                   efi_embedded_fw_desc
> > lib/test_firmware.c:517:35: note: each undeclared identifier is reported only once for each function it appears in
> > lib/test_firmware.c:518:34: error: 'efi_embedded_fw_checked' undeclared (first use in this function); did you mean 'saved_efi_embedded_fw_checked'?
> >   518 |  saved_efi_embedded_fw_checked = efi_embedded_fw_checked;
> >       |                                  ^~~~~~~~~~~~~~~~~~~~~~~
> >       |                                  saved_efi_embedded_fw_checked
> > 
> > Caused by commit
> > 
> >   18efb2f9e897 ("test_firmware: Test platform fw loading on non-EFI systems")
> 
> {sigh}
> 
> I'll go revert this, sorry about that.
> 
> Kees, can you fix up this whole series and resend it again?  I'm
> dropping it from my trees now...

Oh ew, I will check the configs. I wonder what went wrong with this...
sorry for the noise!

-- 
Kees Cook
