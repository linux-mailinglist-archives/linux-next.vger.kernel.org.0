Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6222252E9
	for <lists+linux-next@lfdr.de>; Sun, 19 Jul 2020 19:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgGSRFd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jul 2020 13:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgGSRFc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Jul 2020 13:05:32 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE30C0619D2
        for <linux-next@vger.kernel.org>; Sun, 19 Jul 2020 10:05:32 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a9so3339205pjd.3
        for <linux-next@vger.kernel.org>; Sun, 19 Jul 2020 10:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rm+ZUNmz42i49+8HSleDh8syNULnEr9j572afF7Mzjs=;
        b=c1bkVNtufUQB0LzCaDll0bv4MjFg0PvcgSuzyEv+5TBypThJ9lum4OyWA680pIheuv
         UfITsozvyM+VMZHLcUzZJMOz/L7+eF0yd5iuo00A7UnHJuBYnmYcMVvIhHiILcYgiCxW
         mBKhOpL2TylDctbQhl8AWgy9irky3vMLVJjC9BGMgpPox1UNQRvq0Q35WyNbF/yTEc6S
         to0a3S+WgW9OwiwnEf5gn6yhUnToHyNpV6Er7CRfbwpO42faOCB2ZgWhhrvwrR+7V7lu
         QOkhZ2ofXtiK/Kf+pmnq973HQMj2djwoX0G7e3qsonDKYnjt97x6uww4IOLkqglCxHbg
         p5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rm+ZUNmz42i49+8HSleDh8syNULnEr9j572afF7Mzjs=;
        b=WSpEFx1GXMRC9v1BtyeRbk4TZGuJFjhkNNObJ4nTT3Xec91mQsfbSLOR5MXnXl87lA
         H2LVnF6JgeQyG2e5n2wkDJz8nw1uzm2EJ3w+8xpyPURi4+uGAj94sWFc2Zpovr0Uc8SW
         gGMcGPkrhbdGJhnk/DikMkjYvVHiSnmVcNWsYl7hdCmNQy+rwWzJlkdfPoIeqrDhKP/5
         Zz5SIqk27EIOm5ENyxd4MZlZXCweDLSmKu/n67+17Ghor7bDufBeV7IOramJmhQGnROi
         bfLD2Tp5cIvAtPO63VJ2aHCAS/MVC6D4jQ8WMVs+AUAsrUako/QF6+uY23QNiagAlxDy
         VFBA==
X-Gm-Message-State: AOAM533BHRtwnBj5ICIBS+TeOobHAKN6yNH1VCmenuQoUABkHId2bDSs
        vbadi10Oz8pa0gszuIvzp8FGow==
X-Google-Smtp-Source: ABdhPJwuULdEXFD36AtFRB/oIPgxUFVcjKoHqbzCbXhGMUrFfqwxUWb2GXc98khAIUzH9T8stRYhWQ==
X-Received: by 2002:a17:90a:2749:: with SMTP id o67mr19839181pje.183.1595178332191;
        Sun, 19 Jul 2020 10:05:32 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id t20sm14300845pfc.158.2020.07.19.10.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2020 10:05:31 -0700 (PDT)
Date:   Sun, 19 Jul 2020 10:05:22 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     <davem@davemloft.net>, <kuba@kernel.org>,
        <linux-next@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <jdmason@kudzu.us>,
        <christophe.jaillet@wanadoo.fr>, <john.wanghui@huawei.com>
Subject: Re: [PATCH] net: neterion: vxge: reduce stack usage in
 VXGE_COMPLETE_VPATH_TX
Message-ID: <20200719100522.220a6f5a@hermes.lan>
In-Reply-To: <20200716173247.78912-1-cuibixuan@huawei.com>
References: <20200716173247.78912-1-cuibixuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 16 Jul 2020 17:32:47 +0000
Bixuan Cui <cuibixuan@huawei.com> wrote:

> Fix the warning: [-Werror=-Wframe-larger-than=]
> 
> drivers/net/ethernet/neterion/vxge/vxge-main.c:
> In function'VXGE_COMPLETE_VPATH_TX.isra.37':
> drivers/net/ethernet/neterion/vxge/vxge-main.c:119:1:
> warning: the frame size of 1056 bytes is larger than 1024 bytes
> 
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>

Dropping the NR_SKB_COMPLETED to 16 won't have much impact
on performance, and shrink the size.

Doing 16 skb's at a time instead of 128 probably costs
less than one allocation. Especially since it is unlikely
that the device completed that many transmits at once.

