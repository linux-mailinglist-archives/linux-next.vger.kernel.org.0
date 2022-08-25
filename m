Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 574DB5A0FD6
	for <lists+linux-next@lfdr.de>; Thu, 25 Aug 2022 14:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235195AbiHYMDO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Aug 2022 08:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234778AbiHYMDN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Aug 2022 08:03:13 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6601F80F41
        for <linux-next@vger.kernel.org>; Thu, 25 Aug 2022 05:03:12 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id y3so12705881ejc.1
        for <linux-next@vger.kernel.org>; Thu, 25 Aug 2022 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=RamDCEaIXyiXm4WM32o+F3fWmNmvLw/8sbPKL5+G2Rg=;
        b=mjUFxyOYKahYZ1YokYcS9/JWT/bVnPFgRpU5ux2g/FsNjtjJOlvcL2J1FU1DhWMqAd
         K739WMS7wbee5N+upICA4QNuNzRvtL7YnWPaRVPYFkpcvS+2JclXDZekLZp+Lxlt19Rt
         cZAe2BmqoDFJ97TPoWBYLt0XhPzw46l6lxcWiqJo78LYYtBA8RVx6fgnvSqtbhOxrGwm
         sNzRaKObuEtIEE7hiXI+wO4a2otdahZg0eafhXUdytkmPEbtrxuptuiyicscuYqOVG+x
         CG1GDJwVnEN+vXsugUzz9j9k3H5s4JAtHNjQMlVV0jZL+V3oWwKeAf+EI+87CS08OaaQ
         gSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=RamDCEaIXyiXm4WM32o+F3fWmNmvLw/8sbPKL5+G2Rg=;
        b=OrYGKzOa+V+0rOnXpgfDp+JP7FXAlBEHhBsWQ6HQgJnJnTdj6fh+XzxhnuACuu7OLy
         2tloDGBJLCRoRoyoHiPZSU5SQShK0O6owaHUvcJVT77AKhlZjse7FXEzx/aP4wQ0vxWD
         P0rj/X4DbT1FEaulH0Jhf7DKRVT1TZAw3Q7eIaSSK4ap0QZP1pm2BNpOfX9Xx1+7p6n/
         sG7H10F178rRS9xhD//xqIQOCDuyImUQrVHWeZUwcVytJHe9bqi7gmsh5teayGbOUZiK
         sNi6sxlp6C24ooiNSuSvX2Xb0eXJNe0jGxfUAhAgkMwoJAER98OPILMG2JCqSVHkQMEY
         JYKQ==
X-Gm-Message-State: ACgBeo3JSdgvVvezEZTDwxYnfics23UxQgkEetCpc4xpeO9p4/G9S2Ou
        MYIBZG66nFmaoHZlEx+Q4pMiagC/Fokj6yr62OnYWA==
X-Google-Smtp-Source: AA6agR7LTpZVv3rPaiNB0JxqigRBk7MQBLLYjvHtD2V3JZjR2I725zkwq4l2Da1yoAIiTKYsAU9mae+WaFReWV+bf1c=
X-Received: by 2002:a17:907:6d93:b0:73d:8593:9608 with SMTP id
 sb19-20020a1709076d9300b0073d85939608mr2332160ejc.203.1661428990978; Thu, 25
 Aug 2022 05:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220823075314.63d0a03c@canb.auug.org.au>
In-Reply-To: <20220823075314.63d0a03c@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Aug 2022 14:02:59 +0200
Message-ID: <CACRpkda4jL8vH5ZRQgp+CgsokLB0+r9dRW2jXY-OK2frp0PWaA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     =?UTF-8?B?Sm/Do28gSC4gU3BpZXM=?= <jhlspies@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 22, 2022 at 11:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In commit
>
>   2648ede07315 ("pinctrl: rockchip: Enhance support for IRQ_TYPE_EDGE_BOTH")
>
> Fixes tag
>
>   Fixes: 936ee26 ("gpio/rockchip: add driver for rockchip gpio")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").

I went in and fixed it up manually, thanks!

Yours,
Linus Walleij
