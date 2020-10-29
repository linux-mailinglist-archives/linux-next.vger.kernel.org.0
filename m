Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A3D29E581
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 08:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732559AbgJ2H5Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Oct 2020 03:57:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:58172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728264AbgJ2H5X (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Oct 2020 03:57:23 -0400
Received: from localhost (unknown [122.171.163.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F17C920780;
        Thu, 29 Oct 2020 03:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603940909;
        bh=OcoVnUg27s7RybaaylSXl4zThcBO61r0ewug7GA2D98=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SdufBAN/sF9gGK8YLBBjC+apUg9LdYBaT9DBZ94ZQNfKx/EhGGqIao4bweEYNk7fD
         9Z1tIQCvJ8Fb54C7MDcrTkzQzGZwIIznHYJsklVZkg4al2Dsz8ZwPznmeYnsOrzbsG
         +bwEaCdrTXkDVArdQ4U1j2WnPmpRPwg2c6Ggy0mA=
Date:   Thu, 29 Oct 2020 08:38:24 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Robert Marko <robert.marko@sartura.hr>
Subject: Re: linux-next: manual merge of the phy-next tree with the
 regulator-fixes tree
Message-ID: <20201029030824.GY3550@vkoul-mobl>
References: <20201029132052.1ac29c18@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029132052.1ac29c18@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 29-10-20, 13:20, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the phy-next tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   43c3e148830a ("MAINTAINERS: Add entry for Qualcomm IPQ4019 VQMMC regulator")
> 
> from the regulator-fixes tree and commit:
> 
>   c36f74566cef ("MAINTAINERS: Add entry for Qualcomm IPQ4019 USB PHY")
> 
> from the phy-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

lgtm, thanks Stephen

> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc MAINTAINERS
> index 0e8f57817184,f01ce8f451c8..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -14552,14 -14547,14 +14552,22 @@@ F:	Documentation/devicetree/bindings/ma
>   F:	drivers/mailbox/qcom-ipcc.c
>   F:	include/dt-bindings/mailbox/qcom-ipcc.h
>   
> + QUALCOMM IPQ4019 USB PHY DRIVER
> + M:	Robert Marko <robert.marko@sartura.hr>
> + M:	Luka Perkov <luka.perkov@sartura.hr>
> + L:	linux-arm-msm@vger.kernel.org
> + S:	Maintained
> + F:	Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
> + F:	drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
> + 
>  +QUALCOMM IPQ4019 VQMMC REGULATOR DRIVER
>  +M:	Robert Marko <robert.marko@sartura.hr>
>  +M:	Luka Perkov <luka.perkov@sartura.hr>
>  +L:	linux-arm-msm@vger.kernel.org
>  +S:	Maintained
>  +F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
>  +F:	drivers/regulator/vqmmc-ipq4019-regulator.c
>  +
>   QUALCOMM RMNET DRIVER
>   M:	Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
>   M:	Sean Tranchetti <stranche@codeaurora.org>



-- 
~Vinod
