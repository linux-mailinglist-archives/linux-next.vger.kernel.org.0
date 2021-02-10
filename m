Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48EF6315E5B
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 05:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbhBJEwN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 23:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhBJEwM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 23:52:12 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E536C061756
        for <linux-next@vger.kernel.org>; Tue,  9 Feb 2021 20:51:31 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id b9so1561902ejy.12
        for <linux-next@vger.kernel.org>; Tue, 09 Feb 2021 20:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=XaN/0XOML5ISGne77tosJ/UMQ+VNnecYRI0zkEqsHfQ=;
        b=wRxhh7aw3E28nJI/1G9scXLgbWxiPPrTA9EIBBogeqS2OH09opamaOKvvyD5f75vok
         y/buCtLML1AcX3LylM8xdR2kna+DvS6idJ9Qo56F0p0CNw7YMbYZ+1ZFZNqomcKq4JAg
         DZHi/j0b5VftZB7BD4Fd1T8K+nnX2PwdVRghrWeEDK5+DoiHRTwD9zQu6DeBN89bmDIt
         QDNJlUKGxRw10xKsVKUmv1vsA8/IzPzaI0znuis1cJApEOWP3tWJhNltn88LmwiORcs+
         8G/PqVwfSu2iLngLvqJp+yogmMFXtr7NNWMoVc0y0riaeP/ioMvqX9ig8GD6zMw7tUZH
         Z94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=XaN/0XOML5ISGne77tosJ/UMQ+VNnecYRI0zkEqsHfQ=;
        b=ek3HcbBpt+qyadq3G7QiCWIa/6f1KLo5t6/m4qg9VHpqOGeVYLWS5k6K8asEk4z/41
         gSprAkk6/C/2TxLJ+C1CYDrRX9kElJ9wfdnS5w/4d2+OLsUKnJmdL7pBYIsHmG8BUsQG
         UmInOyRdG9QeQkRlREFu8XNrYJEhUFYdeXP1dIrku38/azLi/FOw+PxAOJEETRu5HFP1
         SvVy+YKdMJHV3+qVyjSnpa7UhL0oft62CMF2V/+XaI62wPDb1aFvchH3SmtleLz4X5m4
         cqk2A9c63OWKl+wHkvgCpGSkOM+VoPW47NUd8mclS337tQTxAU1+KPNIvewdMKJ4eTAP
         M4dA==
X-Gm-Message-State: AOAM531/YRn/lspv3DjHsWzGCfJhj1G4l6eFkr7+/54Wdw0BjeE3rupx
        NZUMGLFTM65/Qkdt0ngBtrOmI5p5Aa5C1OwTtEqH5BBJ/2qNeIVq
X-Google-Smtp-Source: ABdhPJwIZvBOETdhaNiVYBcViLC8njG0hErwOb+CC7WimPqDDwrqyJGXRcDVM7UyWidbxWeJ+u73Y1LgiHXNFkYWoEo=
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr1086056eju.375.1612932689516;
 Tue, 09 Feb 2021 20:51:29 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 10 Feb 2021 10:21:18 +0530
Message-ID: <CA+G9fYvUst_2scufRYP-qOTr22oAO5LEyH-yu0MrXj4S-TVWPQ@mail.gmail.com>
Subject: [next] [arm] ERROR: modpost: "udp_sock_create6" [net/rxrpc/rxrpc.ko] undefined!
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-afs@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        David Howells <dhowells@redhat.com>,
        Xin Long <lucien.xin@gmail.com>, Rolf Eike Beer <eb@emlix.com>,
        eric.snowberg@oracle.com, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next tag 20210209 arm omap2plus_defconfig make modules failed.
   - arm (omap2plus_defconfig) with gcc-10 - FAILED
   - arm (omap2plus_defconfig) with gcc-9 - FAILED
   - arm (omap2plus_defconfig) with gcc-8 - FAILED

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'

ERROR: modpost: "udp_sock_create6" [net/rxrpc/rxrpc.ko] undefined!
ERROR: modpost: "setup_udp_tunnel_sock" [net/rxrpc/rxrpc.ko] undefined!
ERROR: modpost: "udp_sock_create4" [net/rxrpc/rxrpc.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:132: Module.symvers] Error 1
make[2]: *** Deleting file 'Module.symvers'
make[2]: Target '__modpost' not remade because of errors.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

build log link,
https://builds.tuxbuild.com/1oF9lZzseBXx1Dl1IkVLgB4nvhM/

-- 
Linaro LKFT
https://lkft.linaro.org
