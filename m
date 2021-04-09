Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98AD435946B
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 07:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbhDIFSS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 01:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhDIFSS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 01:18:18 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9430C061760
        for <linux-next@vger.kernel.org>; Thu,  8 Apr 2021 22:18:05 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id r12so6668856ejr.5
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 22:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=YFWCdm8gK/rxc5k1ld9Wf9KmQQO/U3GJZHseXv0RvhU=;
        b=blihwRCH6BPRaNb6n+4GjpRzJe0CLY+voSb/0Q6RtjNKxbyFuYxgiXJW8ZAD5xp8y/
         KVm2LokvqO+3o5TUyFf8bY5PV5xcwkglds0fmNpyeidH4JnLq/NDnyZKr9gZgKF1Y5MQ
         RnUpx4pGJY1U42VsARWS8CnFv8LNF8zmssAf7tjpgtLIxsPq33rqx1X6hg30wGNRE9FP
         ybInYJqEOjgQ3en+oyp+wHdFkTgAjFZwqG9b3qdGsdvz4EW3g2/O75VaLUmsuh4reeqg
         fA6Je1xnivfCdmwPoj2Sr5Oza3xW4vDu7XCNUyaUAtZeMrZ63yZNbrXrWs0lxHzABaWQ
         Wf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=YFWCdm8gK/rxc5k1ld9Wf9KmQQO/U3GJZHseXv0RvhU=;
        b=ZK4cstONCaSD7SsaxUNsVUCcmPfhfHpy4LNuLY/8oWHHvlo6M5SOOCz0mFJBZr0ZiX
         VhDPAYmlIkTj4KHQdtXm8MSA5jKuC0YB/BvVnk4gyoXqSKwON2sgCIzg2kWDqVv90MEv
         5LEJwU1+Ef0kGZqPoivNv8rww7GqF9MnxwkDL2irg+Pwliq8LwHhEnkyUok9tgB0NlzJ
         Znz+S1CIXhVxt/vE/TLWdrSHxAo8TtYOHMRjzGcU4VvOw2s8bTNmSceJSetKjBa40s2J
         ssHVhX616ymr6wJBMhrpXRZ7wKQ3QUE39Hz/M6ejSS1/Y7eW/bU6MakSM73PKvEGtir8
         9R4A==
X-Gm-Message-State: AOAM532oQqEfixqGhoz2tcabeHc6jDdjqBmOS+QFpVzJrfipXfELHN3s
        MxwErZwcCdoYJvCeBbXMXKblLeNsgv27ddfeMTF5UqA+ZOwFPe2E
X-Google-Smtp-Source: ABdhPJyAYw1Bwp6jKS3SxG1Cpit61Ggd/8J/n4HfRANmqtGHieko6wg1KVMUr2Vgr1/f6WKlkLzH8EYHgXzT2zuWwVo=
X-Received: by 2002:a17:906:9605:: with SMTP id s5mr14703271ejx.287.1617945483617;
 Thu, 08 Apr 2021 22:18:03 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 9 Apr 2021 10:47:52 +0530
Message-ID: <CA+G9fYtNAEwCk1WkA_25FVUrR0QJ2vt2Dh_w+m-QOSjb8f5TBQ@mail.gmail.com>
Subject: [next] drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared (first
 use in this function)
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Christoph Hellwig <hch@lst.de>,
        Jens Axboe <axboe@kernel.dk>,
        linux-block <linux-block@vger.kernel.org>
Cc:     Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Hannes Reinecke <hare@suse.de>,
        Damien Le Moal <damien.lemoal@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next tag 20210408 architecture sh builds failed due to these errors.

# to reproduce this build locally:

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=sh
CROSS_COMPILE=sh4-linux-gnu- 'CC=sccache sh4-linux-gnu-gcc'
'HOSTCC=sccache gcc'


In file included from /builds/linux/include/linux/scatterlist.h:9,
                 from /builds/linux/include/linux/dma-mapping.h:10,
                 from /builds/linux/drivers/cdrom/gdrom.c:16:
/builds/linux/drivers/cdrom/gdrom.c: In function 'gdrom_readdisk_dma':
/builds/linux/drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared
(first use in this function)
  586 |  __raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq->bio),
      |                                                             ^~

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Regressions found on sh:
  - build/gcc-9-dreamcast_defconfig
  - build/gcc-10-dreamcast_defconfig
  - build/gcc-8-dreamcast_defconfig

--
Linaro LKFT
https://lkft.linaro.org
