Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC794FE03D
	for <lists+linux-next@lfdr.de>; Tue, 12 Apr 2022 14:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350456AbiDLMkX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Apr 2022 08:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354125AbiDLMiD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Apr 2022 08:38:03 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECA8606E2
        for <linux-next@vger.kernel.org>; Tue, 12 Apr 2022 04:58:20 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id f17so1750093ybj.10
        for <linux-next@vger.kernel.org>; Tue, 12 Apr 2022 04:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=2EUjs9gwEDMy7LHuJBroFZXQIirV6oCphrwgEBTjZVs=;
        b=pHDy3zchONQDxCSNtqCdQynLqUUyVo4f9Qa8aaXqo7K32qrdHZyeyL//EGuipGZVaI
         vx5Uj6iTQk3mrVe9kysUCbgYojMGQ6KpbNM6lhPGqNI5guGmqx3WLe+UAI/KCIM+asIA
         +rmUImgKCUN7TJIg5Dyto+1Sn/p8RjbmweUVEV6MOyKVJu/dX0QRgVCXCeUxjxrzcC9r
         zSG9fiEId/qZTWNHOJyEcs6r+NkCt7IUpZgrXRQcFYV3cujji30vZb4K98C3JMMW69iT
         NrWWxGmfTtmxnx+Eb1nUk1wf5b70kKvaw1lzdmPOxhV32K9hPoMtsG0ggam1/T4zT+3f
         RP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=2EUjs9gwEDMy7LHuJBroFZXQIirV6oCphrwgEBTjZVs=;
        b=eXI3YfIb80NBs52RKui90rgnq80v6rlixzXVHe99V0byJrCcR9/R5Ca/fOyIcr0ys9
         mp4dUGFurEAULK5948lNrcjZKZBIlGURwnsJ8Ihwb1PHXSGpc6hoStTro1a04nKNpwUR
         D+9LwHuzObfU9QUneEoLE7NlP6z+lMNpFiE6FwaAsH8bd1yp7jS5+10R6Sush84iBYMv
         X8/TDxp6W5KoMJQ4KX8jsR4J+y5fOy+ZOJkMYOuQXIhD0cQB8wpPs20mD7GdiTDNvvSl
         IaCjQiINSBR310hTMs7PEjGauUS4mKGBVhmqeh7Ri4BOH0IxHRDvuTc0rvfydLg2M9vK
         oLpA==
X-Gm-Message-State: AOAM530FZ+Xan/9lT1MRPp1VvQCPBF6dzv9RVEgGKsGHUV1hlPda1XAc
        B64WBBYwLQRmtdq/DCRn8I6IEl3COO3sErPY3RShrRHIvoRw1p3j
X-Google-Smtp-Source: ABdhPJwpCofFDAgurIftVBg6F8woJY0S/ugXgXQF55+fs4vKYd5MJLcXk4WDShFm3ANHr4/M3XfgEYDUGF5b2IvlzJE=
X-Received: by 2002:a25:ae45:0:b0:641:ba5c:7745 with SMTP id
 g5-20020a25ae45000000b00641ba5c7745mr404985ybe.537.1649764699316; Tue, 12 Apr
 2022 04:58:19 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 12 Apr 2022 17:28:08 +0530
Message-ID: <CA+G9fYvXn1tgpESouPBwZgKnoeUNjM3CV1nzDWac6PjHqTskog@mail.gmail.com>
Subject: [next] ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Qu Wenruo <wqu@suse.com>, David Sterba <dsterba@suse.com>,
        Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Filipe Manana <fdmanana@suse.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
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

Linux next-20220412 arm and i386 build failed due to below errors
with kselftest merge configs.

   - build-arm-gcc-kselftest
   - build-i386-gcc-kselftest

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=i386
CROSS_COMPILE=i686-linux-gnu- 'CC=sccache i686-linux-gnu-gcc'
'HOSTCC=sccache gcc'

ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
make[2]: *** [/builds/linux/scripts/Makefile.modpost:134:
modules-only.symvers] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/27gbe7oAHMk1LgDocuplOU85I62/
[2] https://builds.tuxbuild.com/27gbaEooLAS3OTMnEVMVSsbxTcZ/
