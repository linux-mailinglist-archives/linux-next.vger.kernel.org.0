Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F23917B337A
	for <lists+linux-next@lfdr.de>; Fri, 29 Sep 2023 15:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbjI2NUa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 29 Sep 2023 09:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233364AbjI2NUQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Sep 2023 09:20:16 -0400
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6131B6
        for <linux-next@vger.kernel.org>; Fri, 29 Sep 2023 06:20:13 -0700 (PDT)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-iSaAYYJJO06RazDCH-kyKA-1; Fri, 29 Sep 2023 09:20:10 -0400
X-MC-Unique: iSaAYYJJO06RazDCH-kyKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D45C78002B2;
        Fri, 29 Sep 2023 13:20:09 +0000 (UTC)
Received: from hog (unknown [10.45.225.122])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D4AB1005E29;
        Fri, 29 Sep 2023 13:20:07 +0000 (UTC)
Date:   Fri, 29 Sep 2023 15:20:05 +0200
From:   Sabrina Dubroca <sd@queasysnail.net>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        linux-snps-arc@lists.infradead.org,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>
Subject: Re: arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined
 reference to `crypto_has_aead'
Message-ID: <ZRbPBdu0ZJ86juff@hog>
References: <CA+G9fYu2DKDxOEFTeJhH-r_JD8gR1gS8e4YsSrW3rfGegHR4Sg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+G9fYu2DKDxOEFTeJhH-r_JD8gR1gS8e4YsSrW3rfGegHR4Sg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: queasysnail.net
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

2023-09-29, 12:41:51 +0530, Naresh Kamboju wrote:
> The arc defconfig builds failed on Linux next from Sept 22.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build log:
> -----------
> arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined reference
> to `crypto_has_aead'
> arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined reference
> to `crypto_has_aead'
> make[3]: *** [/builds/linux/scripts/Makefile.vmlinux:36: vmlinux] Error 1
> make[3]: Target '__default' not remade because of errors.

Use of crypto_has_aead was added to net/xfrm/xfrm_algo.c in commit
a1383e2ab102 ("ipsec: Stop using crypto_has_alg").

I guess the problem is that CONFIG_XFRM_ALGO doesn't select
CONFIG_CRYPTO_AEAD (or _AEAD2?), just CRYPTO_HASH and CRYPTO_SKCIPHER.

Herbert, does that seem reasonable?

-------- 8< --------
diff --git a/net/xfrm/Kconfig b/net/xfrm/Kconfig
index 3adf31a83a79..d7b16f2c23e9 100644
--- a/net/xfrm/Kconfig
+++ b/net/xfrm/Kconfig
@@ -15,6 +15,7 @@ config XFRM_ALGO
 	tristate
 	select XFRM
 	select CRYPTO
+	select CRYPTO_AEAD
 	select CRYPTO_HASH
 	select CRYPTO_SKCIPHER
 

-- 
Sabrina

