Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4C043AC4B
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 08:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbhJZGbM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 02:31:12 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:25790 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhJZGbL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 02:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635229723;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=0rprKvj5ZesCC1SklrhqP/REbSH/dS08d3sAkdPdbok=;
    b=idY+SN6CsbTsJT/SJhiwxI1ZY7Jejw/9hXy/9Zn5fcViBKyO6x6vwIm5qqjPQ9iryi
    64Y1oQxhvDb1+GqeNls/scrpEp12iVd9agO3N2Fz5jUCzYY15L4dSPAdW67SItOlYp4q
    /RUHvh3w3cry4LpajfuqkqSi11EYz+ynilmHKkhtJEYKk25v1vRU/vi6tcLncmbK8pJF
    QiMh8fP53OArsctdrNhntfyj7THuFTNs/zaov5UA5gvIV/KUX92Lwevs3eeV6fM9cTqu
    9gWawk7NnDZc1ZLsO9hVD07IbckDRQ+Z6jM3qCeCiT9/qZUTASJQZ6xVX3l37o4xFMI8
    hn+A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLUrKw7/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9Q6SgEEx
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 26 Oct 2021 08:28:42 +0200 (CEST)
Date:   Tue, 26 Oct 2021 08:28:37 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the gcom tree
Message-ID: <YXegFbfxh/0nhDmB@gerhold.net>
References: <20211026154415.3f6c7c28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026154415.3f6c7c28@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Tue, Oct 26, 2021 at 03:44:15PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the phy-next tree got a conflict in:
> 
>   arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> 
> between commit:
> 
>   442ee1fc60c4 ("arm64: dts: qcom: Drop unneeded extra device-specific includes")
> 
> from the gcom tree and commit:
> 
>   956bbf2a94e8 ("arm64: dts: qcom: Add missing vdd-supply for QUSB2 PHY")
> 
> from the phy-next tree.
> 

Sorry about that.

> I fixed it up (the former removed the file, so I did that) and can

The commit actually simply moves all of apq8096-db820c.dtsi into
apq8096-db820c.dts. So we should make sure that the vdd-supply added in
956bbf2a94e8 ("arm64: dts: qcom: Add missing vdd-supply for QUSB2 PHY")
ends up in almost the same position in apq8096-db820c.dts instead.

But I'm confused why the arm64 dts commit is in the phy-next tree. There
is no compile time dependency between it and the related phy commits so
it could have just been applied to the qcom tree to avoid this conflict.

And actually Vinod wrote 2 minutes after applying this patch that Bjorn
should take it through the qcom tree:

https://lore.kernel.org/linux-arm-msm/YVwDbUC5WUHmcRJh@matsya/

Vinod, did you apply it accidentally or am I missing something here? :)

Thanks,
Stephan
