Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2AAC6FF032
	for <lists+linux-next@lfdr.de>; Thu, 11 May 2023 12:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237626AbjEKKyu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 May 2023 06:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237547AbjEKKyt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 May 2023 06:54:49 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB20559C4
        for <linux-next@vger.kernel.org>; Thu, 11 May 2023 03:54:47 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-ba6d024a196so131826276.2
        for <linux-next@vger.kernel.org>; Thu, 11 May 2023 03:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683802487; x=1686394487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B4GytqVhEgk48g8DyzhuT+wTefONX8H2tmAh5E87e6M=;
        b=Ut67zPA2J0cjc/lF7UcP5YwQVX711m/wTi0YUO7mHmZ1b1+ERbSa3x45R7g6vR1+uU
         TMSnAPbF916mJgAtSqG8nq/K4X62SDK0gwukviLuRK0idLO8CyG89wKnoWCQEepD6SH/
         yPJxLd4YDOHe/jwKpYCWPfeBm2BW9AJKXsfxDZ2q/fYxT/dmZ0id35X7uoDd13w4nXcD
         KyCmPxKSc+lmbHb2DTGsQwdHaja7vW1iPlpejXd/KggHhXOvys5wN5nxZjNjp3p54vd+
         auYTJiKN/3KU45W0P/CX+MiasfF7rl7K2kkWI977fuHJGc2obmicIceME+/HbhvvzWnI
         Cm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683802487; x=1686394487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4GytqVhEgk48g8DyzhuT+wTefONX8H2tmAh5E87e6M=;
        b=LHxViVIFIKe30ssIGQbavYP/rV7VLZ6B/SQh/T+fAlvEupRPa1wLd4c1Mo/NkwFe0U
         Mm4GjVSxGP6AswEApBTwMn1bfxhvHz7sMGWtWnF7JCif31sTu1YdT99DFGxNlvL88rxM
         4yt02o0iweq8YbAKAWSoo6OrDuS0R/C0yt+ShSBLatzDcWUVK8VATUhWZQZLl2xG6RLK
         ydFQJmMYXh70VJzsTerQocE9gVX98bCXU4EoQKyhGm9WptF5yp/Ur6rfrM6SOvfoZUFY
         zwIjtfNzclVh1POCgDOLwQKzj3XM+z2uAk4lNxAPRVtNIJJzRPRKAnokRrQPUKCYKsvZ
         rUuA==
X-Gm-Message-State: AC+VfDz+h+dcIE980Vhkbrlw+ZB0r2dFH11d/9kYJqsn5C3yQg2eg3Gg
        xzZBsDQmN0syZUEMRE4bNEVXOGO3Y/YwqaIZbJyZfO1rtrMCmv3N
X-Google-Smtp-Source: ACHHUZ7jxTCUYsI/ITKDlQjOCkSFTz1SoM0cCfbFkfJBGdSV9QLz93N6Kba5h6hB9EmbUyyTgdDnKSpOm2WMa5K1dSQ=
X-Received: by 2002:a25:ab0e:0:b0:b67:463e:a719 with SMTP id
 u14-20020a25ab0e000000b00b67463ea719mr20489951ybi.46.1683802486909; Thu, 11
 May 2023 03:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230510111833.17810885@canb.auug.org.au>
In-Reply-To: <20230510111833.17810885@canb.auug.org.au>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 11 May 2023 12:54:11 +0200
Message-ID: <CAPDyKFqEkx_KhNSVdy_mLe78WLNXDRvjnMprzaYvtgF2STawVA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mmc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Abel Vesa <abel.vesa@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 10 May 2023 at 03:18, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> error: the following would cause module name conflict:
>   drivers/soc/qcom/ice.ko
>   drivers/net/ethernet/intel/ice/ice.ko
>
> Exposed by commit
>
>   31dd43d5032a ("mmc: sdhci-msm: Switch to the new ICE API")
>
> I have used the mmc tree from next-20230509 for today.

Okay, so I have dropped the offending patch from tree now.

It looks like we need to rename the ICE module - and Abel is working on that.

>
> --
> Cheers,
> Stephen Rothwell

Kind regards
Uffe
