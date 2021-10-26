Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C4343B0BC
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 13:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbhJZLHj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 07:07:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:34006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230077AbhJZLHj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Oct 2021 07:07:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B78E260F70;
        Tue, 26 Oct 2021 11:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635246315;
        bh=VGhPpFfL5BossM+E4n+D1m/5wTu65hMQGXK7T8D9gwQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VT8kkntcC1aP0qicKzJUNTcUvnWOo9LpTIjsR0ygPsDHM+QBybdChx0dTeNTOwywk
         AU9EBZcZC9PhD5+Vm1QgTXc4N/ycZl31qisMMCFItaL2qRr84xTKCEsvGNDV8qIE2g
         tEOpoMfV4OlyXfV7lBAz0bJ9mzZRfU/nZir2iUnr0Y3CtWXAQEF/dpyVzr93rdanJj
         1v43F+2TffVr+sP0lMZCmc9SGHkuc+lvAzKDqbQVfsUumFJK7Hw74HirAesX3oRqOy
         YvyQaPzyy72VBxUfZU0wL+FmAZcOiLcg418KF3Fni7Kdij0JvLCfDU30wpmQP4Bhjl
         CCgMbhrDBCSzw==
Date:   Tue, 26 Oct 2021 16:35:11 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the gcom tree
Message-ID: <YXfg57VRAW/slmgb@matsya>
References: <20211026154415.3f6c7c28@canb.auug.org.au>
 <YXegFbfxh/0nhDmB@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXegFbfxh/0nhDmB@gerhold.net>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 26-10-21, 08:28, Stephan Gerhold wrote:
> Hi,
> 
> On Tue, Oct 26, 2021 at 03:44:15PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the phy-next tree got a conflict in:
> > 
> >   arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > 
> > between commit:
> > 
> >   442ee1fc60c4 ("arm64: dts: qcom: Drop unneeded extra device-specific includes")
> > 
> > from the gcom tree and commit:
> > 
> >   956bbf2a94e8 ("arm64: dts: qcom: Add missing vdd-supply for QUSB2 PHY")
> > 
> > from the phy-next tree.
> > 
> 
> Sorry about that.
> 
> > I fixed it up (the former removed the file, so I did that) and can
> 
> The commit actually simply moves all of apq8096-db820c.dtsi into
> apq8096-db820c.dts. So we should make sure that the vdd-supply added in
> 956bbf2a94e8 ("arm64: dts: qcom: Add missing vdd-supply for QUSB2 PHY")
> ends up in almost the same position in apq8096-db820c.dts instead.
> 
> But I'm confused why the arm64 dts commit is in the phy-next tree. There
> is no compile time dependency between it and the related phy commits so
> it could have just been applied to the qcom tree to avoid this conflict.
> 
> And actually Vinod wrote 2 minutes after applying this patch that Bjorn
> should take it through the qcom tree:
> 
> https://lore.kernel.org/linux-arm-msm/YVwDbUC5WUHmcRJh@matsya/
> 
> Vinod, did you apply it accidentally or am I missing something here? :)

So dts was supposed to go thru qcom tree, I guess I missed giving right
args to b4!

Fixed by dropping this

Thanks
-- 
~Vinod
