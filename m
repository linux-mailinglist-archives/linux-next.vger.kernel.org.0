Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6AE54133D4
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 15:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbhIUNMx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Sep 2021 09:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232702AbhIUNMx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Sep 2021 09:12:53 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF476C061574
        for <linux-next@vger.kernel.org>; Tue, 21 Sep 2021 06:11:24 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id t189so17068931oie.7
        for <linux-next@vger.kernel.org>; Tue, 21 Sep 2021 06:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TWtHzEu/gD1Zw56vCKGmQROoHGCryZqK6F3uj2KWTAM=;
        b=uq40lSckBwwodltmKvdIWmPwNNW7kGDh++qEHiNdpDPmY+ujIXUXaBucN1joi+TIpc
         bH0NlxYTpSbYwNUH8dmE3atXitAeqgjsin0WlfHdkQI14nCSxTA2uxDrxbWk3Uv0gGLa
         jWoyvUfXOIPq+MHv9LqMrMo6hlojyFD9pRmu6Nr+Piqh/hc4CuUCoRyRNG6pgwN83oCi
         KY8YtjMwZlV0UFc160ptglYQNni92ZQ7q+6GWFg+9+mOwUS6QY47WU105NhSmHwaZ7o8
         aqgroZRveo3OCqmiroXiGIIrTjRDeJ/HjqMxqaVB2rvevhuaJeAYUQNNFDxxiCRHoE3l
         d/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TWtHzEu/gD1Zw56vCKGmQROoHGCryZqK6F3uj2KWTAM=;
        b=7kSxkIrJu87A/LfsPZx4wedwzRZX0FE2E8u/D1rAEsV5YpCfwtBH7rMgJ/1TS3dm31
         lgmvaBtL3DhmeTubD+wVeYvFkbiqvPdf/NMy9l6Kh+ddwTAXMXwpLvHfrHlMc9Dzl24U
         nkABE4uqILRPOh1nttDgN4RUMw2Bp3TqJh8lOM3Wlli/8O+asYgOX8lczW3XufuyqaN2
         ZH2Blbce9Ed+sn6VizYtGw0bFokd0Hg5gXP+6adAfzV3Zs6QWM5MtYn1YR8Pn5oHdzI8
         LJFxm2oGtqf9xXYCKCq+KUwgf6eYz6Yrvf32unEidefPHuxs/+PvKlHESKurx3iKJYPL
         AEJQ==
X-Gm-Message-State: AOAM532Ibdka58Z7rsgCVI9S5do8X6yujOM8tgaa9xUQK9CnTgXfDIux
        95gzzthS/MOi0nKmUBVjGKWvJ4lCLME3DQ==
X-Google-Smtp-Source: ABdhPJw/6rlV+lzycaHb7Fo8j/cTOGcOYnY1OjxlmVcxKXwqRt0w0mmvDOQfqd5aj+h3si8ZPcWzPw==
X-Received: by 2002:a05:6808:11c3:: with SMTP id p3mr3658597oiv.23.1632229884160;
        Tue, 21 Sep 2021 06:11:24 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z18sm4040644oib.27.2021.09.21.06.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 06:11:23 -0700 (PDT)
Date:   Tue, 21 Sep 2021 06:12:06 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Gross <agross@kernel.org>,
        Baruch Siach <baruch@tkos.co.il>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the qcom tree
Message-ID: <YUnaJolAAZmhs4kU@ripper>
References: <20210921123032.02cd498b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921123032.02cd498b@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon 20 Sep 19:30 PDT 2021, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi
> 
> between commit:
> 
>   261e8a95d9aa ("arm64: dts: qcom: ipq6018: add usb3 DT description")
> 
> from the qcom tree and commit:
> 
>   9da2c3f76164 ("arm64: qcom: ipq6018: add usb3 DT description")
> 

Greg, this is not a USB patch, can you please drop it from your tree.

Thanks,
Bjorn

> from the usb tree.
> 
> Same author, same date, but the former has this committer comment:
> 
> bjorn: Changed dwc3 node name to usb, per binding
> 
> So I used that version.
> 
> I fixed it up (see above) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell


