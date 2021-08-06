Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D1F3E291C
	for <lists+linux-next@lfdr.de>; Fri,  6 Aug 2021 13:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245302AbhHFLIv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Aug 2021 07:08:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:56076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245297AbhHFLIu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Aug 2021 07:08:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC0876105A;
        Fri,  6 Aug 2021 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628248114;
        bh=AkJthIdwA3V29erIPtuJUcVG20xxA45EHeqwN534hnQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UXEEbppUdgqwoHzcnkPkvP1EKPDDYQMBG1z6orahqF+tuEJOBJoUbJTdbjEtNTEjg
         gPfZQdCiK7kRtIQaWginYZo9k7LB1o2HJQc9HwtngAhge92PgdFfUZaoYvPq2sCxYk
         50042xDQQ/ygwWfLhSC5AjyAY7jzqY4ixEyUv8Yc=
Date:   Fri, 6 Aug 2021 13:08:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: linux-next: manual merge of the qcom tree with the usb tree
Message-ID: <YQ0YKiFVx0KrkW5s@kroah.com>
References: <20210806102138.27373-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806102138.27373-1-broonie@kernel.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 06, 2021 at 11:21:38AM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the qcom tree got a conflict in:
> 
>   arch/arm64/boot/dts/qcom/msm8996.dtsi
> 
> between commit:
> 
>   1f958f3dff42 ("Revert "arm64: dts: qcom: Harmonize DWC USB3 DT nodes name"")
> 
> from the usb tree and commit:
> 
>   9da65e441d4d ("arm64: dts: qcom: Add support for SONY Xperia X Performance / XZ / XZs (msm8996, Tone platform)")
> 
> from the qcom tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 78c55ca10ba9,31686950004e..000000000000
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi

Love the fix, did something go wrong?  :)
