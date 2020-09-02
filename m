Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF06825ACBD
	for <lists+linux-next@lfdr.de>; Wed,  2 Sep 2020 16:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgIBOP2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Sep 2020 10:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727935AbgIBOPF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2020 10:15:05 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13B9C061244;
        Wed,  2 Sep 2020 07:15:03 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 31so2592433pgy.13;
        Wed, 02 Sep 2020 07:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cFLb4ALCE9PWhj/xokRnuSTEiqPwTe35SqHGat4xPp0=;
        b=MjpScwUdFE3fRuo4tpJ8mThAprEUlU5sAZ1fVxRkhEKDEURdoxqeTfLUqAUtptSn8P
         hzdbKjDUgDMFzmTJUr8SNWxWrI+zjb2opOoq/sBVmg0ylKz2tanz4eaOEIhP2BGT7Oeg
         lP7tVRFb9tcRF3AczoMazWas5btp3qBuN2ZH/vDBKkG2gEdT2GARmAXtAcP3ZrBAmdfN
         RpEfYzDo1gSUMee6dByOJcejSVRuvpkxwDV6CepIjeQboDVRT8j7b27eaZmyNDYG+dD8
         ZqkPCotHQlenkafHjlsisWb+KFV54K/qW01lNY56EaK1rLhSdy8k7EUI1mwkk8V298li
         5A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cFLb4ALCE9PWhj/xokRnuSTEiqPwTe35SqHGat4xPp0=;
        b=YfH3EQKGF9b2nmctQtntAIvoTujPkvAhxtnKNwhkhri/1MSQX6G+vce7RNkW7ubuLE
         0V2NFpDjmhFcqK1h5UQX6SCEPHUQQySycctexL73btvwx8dmcDtx/nazZSzJMtfxyhz7
         SALvRoV2rYE/MHaFl8yfCt7UhrIUvTfIUlTmrk7MWse5UP0xPxror0u7i5NtlP7gomFe
         qmSS0/AHrtdC64ijgAKz6vjZ8hK8MuynHry9OA049FqM9f+/AykpmeYOjAqtfNwPIfjI
         Z4iC4A9EvZSY9+el7IBGQHO7dJ/YoD5xqz9MzRmVvfngTXONSt9sJeuYKZLGazB2oM7A
         xCEw==
X-Gm-Message-State: AOAM532AeRZz+KJDJF/y8TQweV2uKLGxuXvSANjti5SQ4NZVBPyKh2u2
        4mWebWyEqPJn6U1PonUlZ/1ezicdaCH4Mg==
X-Google-Smtp-Source: ABdhPJwW4Z0ynOopYuaSrZSMqfN7YG8EJohAI7fTxnN0I+NmXgGNZWynN/Psc6pizc9um0Rvsagvpg==
X-Received: by 2002:aa7:80d3:: with SMTP id a19mr3338479pfn.102.1599056103443;
        Wed, 02 Sep 2020 07:15:03 -0700 (PDT)
Received: from gmail.com ([223.190.81.142])
        by smtp.gmail.com with ESMTPSA id u8sm5751415pfm.133.2020.09.02.07.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 07:15:02 -0700 (PDT)
Date:   Wed, 2 Sep 2020 19:43:12 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pci tree
Message-ID: <20200902141312.GA50412@gmail.com>
References: <20200902110743.0519779d@canb.auug.org.au>
 <20200902123312.GA242674@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200902123312.GA242674@bjorn-Precision-5520>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 02, 2020 at 07:33:12AM -0500, Bjorn Helgaas wrote:
> On Wed, Sep 02, 2020 at 11:07:43AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> > 
> > drivers/pci/pci-driver.c: In function 'pci_pm_thaw_noirq':
> > drivers/pci/pci-driver.c:1037:6: warning: unused variable 'error' [-Wunused-variable]
> >  1037 |  int error;
> >       |      ^~~~~
> > drivers/pci/pci-driver.c: In function 'pci_pm_restore_noirq':
> > drivers/pci/pci-driver.c:1169:6: warning: unused variable 'error' [-Wunused-variable]
> >  1169 |  int error;
> >       |      ^~~~~
> > 
> > Introduced by commit
> > 
> >   89a8561c63d3 ("PCI: Remove unused pcibios_pm_ops")
Hello, I did compile test it with W=1 flag. I am sorry, I must have missed it.
> 
> Fixed, thanks!
Thanks for the fix.
