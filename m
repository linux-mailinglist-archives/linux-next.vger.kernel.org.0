Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 769C83AB9CB
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 18:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhFQQgf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 12:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhFQQgd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 12:36:33 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E35FC061574
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 09:34:25 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id s14so5429782pfd.9
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4TO3eGw2DCtY6KaKGGAgRgperQUHgRHyPhb9mSeBbSA=;
        b=UokaqR6lQyOcL/DyR4tDeJOpDsOTRSHHXhEZPMyxOWw0D/wdAoUOF9woR6ln9HQhex
         V7irE3dv01MBH3QFjzNv33AkzExonvmaYh9cUBwS3UCHbwcVfxFUezkyeLkAhWQ4aGlU
         mur7IuAU7FGBO2ujoDfMLnhHZR6+RnepLlRdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4TO3eGw2DCtY6KaKGGAgRgperQUHgRHyPhb9mSeBbSA=;
        b=Cml/jogBNVPQbKkj6Di+7pt61eytp0mQc4W8edKbrMYpS1Nd7nWTHXlTOCovemSQAi
         GSZG3Kgtx+wqqk/+uV3m4yLEEUQFuCgGNlvYgHInVxeec+jFnMvDIoyCrJSIzyjO34bK
         w7vYd+6kgYHRMYuBjeTw1JCEo6Y5Lgo8fIj34DFGv75sPUOsLYm9hrAb9HrEkpWz5nY/
         HHPdH4DOJQ+Y5Ji3ELKxRTOkV+vSpC8NSZzqBjQ3m72nEjkvlFL34e7tYiitplPRZnDp
         yjdlOZOQNZcfR0kPnoZSc/IJ1QyoQyI/Y/+RaiTbtUnhCw7X6VC8MkonjtYq6z+leRbF
         L7tQ==
X-Gm-Message-State: AOAM530Rzg8pyVQGDVOp1ZTsovYywfofyPyfZUbGTvQYOf3Veo4E1UhT
        kOkDtQ05cAr4lOQ49gkcWo8Xjw==
X-Google-Smtp-Source: ABdhPJzNm/DmRxSVnzflpeGAkkhA2ZiyJ9Eav9Z9RzV92/085pNsD8vUpC6zar9O5pMLio667O69ww==
X-Received: by 2002:a63:6644:: with SMTP id a65mr5637787pgc.431.1623947664763;
        Thu, 17 Jun 2021 09:34:24 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:14b4:cd2e:dd64:19e8])
        by smtp.gmail.com with UTF8SMTPSA id o14sm2525081pjj.6.2021.06.17.09.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 09:34:24 -0700 (PDT)
Date:   Thu, 17 Jun 2021 09:34:21 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the arm-soc tree
Message-ID: <YMt5jTLYv+DKWKdn@google.com>
References: <20210617144346.564be887@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210617144346.564be887@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 17, 2021 at 02:43:46PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got conflicts in:
> 
>   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
>   arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> 
> between commit:
> 
>   39441f73d91a ("arm64: dts: qcom: sc7180: lazor: Simplify disabling of charger thermal zone")
> 
> from the arm-soc tree and commit:
> 
>   1da8116eb0c5 ("arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard USB hub")
> 
> from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen for fixing this up for -next!

One option would be to revert 1da8116eb0c5 ("arm64: dts: qcom: sc7180-trogdor:
Add nodes for onboard USB hub") from usb-next and land it through the qcom/arm-soc
tree with the rest of the SC7180 device tree patches.

Greg/Bjorn, does the above sound like a suitable solution to you or do you
think it would be better to deal with the conflict in a different way?
