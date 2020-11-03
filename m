Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6892A407E
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 10:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgKCJnY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 04:43:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgKCJnX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2020 04:43:23 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978F6C0613D1
        for <linux-next@vger.kernel.org>; Tue,  3 Nov 2020 01:43:21 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id t11so17466280edj.13
        for <linux-next@vger.kernel.org>; Tue, 03 Nov 2020 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FFd3mvhuQMY/+bsfnVKNY7hNDVTrPNGeeWvSKBTt/6w=;
        b=arYDKw0T/wCpqExPGZaCoxeicaXqBaBLG/rtsFLovNIGxliIWwpjvyoeoIX4sLmmQ/
         XcJeYYzamHLxiqIZVvh8ECoqpzi6zQuhnT8yHA2NI4i7Oj12Nu7NPW3/H2HRuAhxFS/f
         m8UHRQjc5aVaOzzjo+9URvrphNdC8NtQCUjiXVPj6vXBJqVu1/u8sVFtS6Q6Rn/Eut9A
         Pp6AzIsTVAnc421Fw+Jp0wXnOGkkUmdSdfGpfinV+YTNaPaJMglfAna460V9XmlJXzFC
         sjzB/+B2mjgarsY/89FEJRgGoZGkfPCrRzBJOiTRwo3XgCpBvb9gI3Fo1VPEOR7o4jBF
         5ETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=FFd3mvhuQMY/+bsfnVKNY7hNDVTrPNGeeWvSKBTt/6w=;
        b=TlLsJEC4bN3EkKviiP8EkdNu+n/hoxzingBWlzvueyhNd4Y2fSbplIBz/RPfFm/XiH
         qv8qSFwj4a0ChebXtSOFD0dsAFfo8rFwsy3rp+x/2BMQXvIhI1GUbHJa77C0iosFHv3K
         G7FiMhi0fpfp2HU0tCOtOjZicge5yq7KFoOQaKjRpS8PkASOh0UeWBlmPC1hO05x08JM
         2h4qLsAM9QTusRnZnWpDdtgkGB6LNWaDtfQEKDYudByEX8fwuFK+RGo8hpUl7XQMalub
         vZCQ70Y7WqAzH1htE3tEdQ69aidY31Mo5vMMxQ7T+8TJ7UmkNXng3Nk5C54JrqOpG1J7
         LoJQ==
X-Gm-Message-State: AOAM531/rC17Ym9pEoRlZY961TUnI9oVaraGtrecuDt0S3XGhe/mEjlf
        JWCx+ZPHMHJ7hhRxkjcwGI/mbdp19kwD4mHucFfohtJIEFzt6o23
X-Google-Smtp-Source: ABdhPJwGZRXstRG2NgMYG0hFSTe89LWHITcBb74FWuHjiKJrodeo1tE1qaHQHTez8XVyFSt3zX7Yx29h1pErpyUZhEc=
X-Received: by 2002:a50:cc86:: with SMTP id q6mr21740872edi.78.1604396599677;
 Tue, 03 Nov 2020 01:43:19 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 3 Nov 2020 15:13:08 +0530
Message-ID: <CA+G9fYsqbbtYXaw3=upAMnhccjLezaN7RUjysEF4QhS6TfRr-A@mail.gmail.com>
Subject: ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, linux-btrfs@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
        David Sterba <dsterba@suse.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next 20201103 tag make modules failed for i386 and arm
architecture builds.

Error log:
  LD [M]  fs/btrfs/btrfs.o
  MODPOST Module.symvers
ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
scripts/Makefile.modpost:111: recipe for target 'Module.symvers' failed
make[2]: *** [Module.symvers] Error 1

Full build log,
https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=intel-core2-32,label=docker-lkft/891/consoleText
https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/891/consoleText

-- 
Linaro LKFT
https://lkft.linaro.org
