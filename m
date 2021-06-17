Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B383ABAA6
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 19:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhFQRck (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 13:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbhFQRcj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 13:32:39 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F178C06175F
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 10:30:31 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso6894714otu.10
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 10:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RNIfNMMIjld5PjQjgeiM/kAf3UBf7SmlCglukGZh+kU=;
        b=CdoJpSLAElrrZNIhunET7FF5QeI2gVaX3/gB+100FNbF9gQ/FOoQwC4wanBs59W2e1
         iGQgCOcOKy1rULH/PdnA61FcM0LZN67dZAvWcohz6Dfhzr85/SgltGngpfEk1WBCE5Rz
         PMI/BuX3WRtIkQGqmyz2CdEXXChlR2Z25a/49eZhFS3g6Qmo4TxbqkaJinN8Cl+IOkqK
         3/3YV62ZPIaLAIAxLKRVkILYJphUzIBbVOXoJngKclkiH4yYp0LmKVvb5vWa9yIvwarE
         0/SCE3szhqk9m/1mlF6ixR16YkMrqRrvj5seoMsVuIiyw0DYNiC144rBj0L0MafdGQoK
         0sUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RNIfNMMIjld5PjQjgeiM/kAf3UBf7SmlCglukGZh+kU=;
        b=U8KOnxxMu63aQngtn75YP2e9HkAcwqMhUF20g2572ZXSbrXgB6GCzWUz1VcyO38afE
         EE454YEzGzcrCxUTqwKDdnDz+lXD1fvvHqw3YuMemo0EPBAueuR7r3yxgGyIOh1dBXR6
         qfo2dq23izw/UAYy1m9zvyudOZnQR5qrvFi8zx57XVgFUWSR/anqKUKYwMTgNo/MPyyI
         +eL2+QOFa0aauMuxdo5hMQOYG73TnHiFedfcmyOF1jvx14NL5Igjb8TSS4BCJkiF6RxH
         0V/DKnG+6JdTUAafRXghgHikUe6zTygw0GbEezYUaR8k7zCTR5xdC+d7zk+VEoQjLdPp
         ajFw==
X-Gm-Message-State: AOAM532R1JsQyNFwjotPgyGUuGxa+M0WI0/iDu0asFnuE3b3bmfu1wKZ
        6fs2lViDP7a7rXifMNSmqsBNnQ==
X-Google-Smtp-Source: ABdhPJzTlfvjcgyrdohPn8ZSyOe2Wk4p2iCv4NIaSzEF3sv8prIiuP7z25BdaL/CWgnh1wVm5NQ03Q==
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr5717111otb.257.1623951030847;
        Thu, 17 Jun 2021 10:30:30 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t26sm1433053oth.14.2021.06.17.10.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 10:30:30 -0700 (PDT)
Date:   Thu, 17 Jun 2021 12:30:28 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the arm-soc tree
Message-ID: <YMuGtNTvZKHx4Rhr@yoga>
References: <20210617144346.564be887@canb.auug.org.au>
 <YMt5jTLYv+DKWKdn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMt5jTLYv+DKWKdn@google.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu 17 Jun 11:34 CDT 2021, Matthias Kaehlcke wrote:

> On Thu, Jun 17, 2021 at 02:43:46PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the usb tree got conflicts in:
> > 
> >   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> >   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> > 
> > between commit:
> > 
> >   39441f73d91a ("arm64: dts: qcom: sc7180: lazor: Simplify disabling of charger thermal zone")
> > 
> > from the arm-soc tree and commit:
> > 
> >   1da8116eb0c5 ("arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub")
> > 
> > from the usb tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thanks Stephen for fixing this up for -next!
> 
> One option would be to revert 1da8116eb0c5 ("arm64: dts: qcom: sc7180-trogdor:
> Add nodes for onboard USB hub") from usb-next and land it through the qcom/arm-soc
> tree with the rest of the SC7180 device tree patches.
> 
> Greg/Bjorn, does the above sound like a suitable solution to you or do you
> think it would be better to deal with the conflict in a different way?

Having the dts patch go through the Qualcomm tree instead would resolve
the issue.

I wasn't aware that the driver code had landed yet, so I haven't merged
the DT patch, but can do so and include it in the pull request that I'm
preparing for 5.14.

Greg, does that sound reasonable to you?

Regards,
Bjorn
