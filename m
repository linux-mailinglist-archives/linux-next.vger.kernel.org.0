Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152AC3044E9
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 18:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390338AbhAZRSR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 12:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390686AbhAZIzU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 03:55:20 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2197EC06174A
        for <linux-next@vger.kernel.org>; Tue, 26 Jan 2021 00:54:40 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id c2so18497552edr.11
        for <linux-next@vger.kernel.org>; Tue, 26 Jan 2021 00:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=GGyBTb5u2IaUHbKiQ/SJcFo7rVvuCNL30ZstU8LYN/E=;
        b=BJF5+4SDPOkOCjs/4jNBihoQpnOZDsoC6XVRVTS2IXkC8sVxCVyNh1urW7WxOrRozy
         /yolIxrdnurMrhSzgq0YxbEOG+IgutS86Dgx5KXErqpeCLY+Q/b5NWyYFloYeAK5gKFI
         HF7sL+SzoCH82bT/koETLFf3o5kEwgNYMpUTxzJreCPEZxJBoCJF80dcsHEfw4STm1S3
         lamrPDYxrfzCSGyMdNMqkpzx/hVp3q/NcGWqgROMCYlq2mk3qttUYxETdp5dSdhHOF2d
         42xlWPg+yQtQnSQ7+Oah/LyNKnDhjV3pEmi8untGU6M933S8mkfFkSMu6J9WrgP/6onq
         o2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=GGyBTb5u2IaUHbKiQ/SJcFo7rVvuCNL30ZstU8LYN/E=;
        b=I1h6bFJ0sifz/jsgoVoOIRliIIXr7ybSbSCRfAb84Zhkw1Pwi6r8lzKO7h7uzB1a/2
         jlZabd2G9kcHKi0hIaX7EqlpCE2LOo10UXHpHBy4vQy2GVS4y04EMNbBTyanSBLV3CdY
         8AJr0Y3Ef8GPhmE+Ing1d5Q6i81qwMxOkSS8VIv84zOkdFiQkIupaJUIclho0m5ccXO4
         tJg9hyj0r8GXaoWYVkDI9WoausWk6YkKORxComcY1x62uh6ZU2/vrAtR2mHH85Ct4WkT
         IJtVH+sL3YxWIYvNNFeO8gpo0zDVcEDmtWkKiVibrAzKvIc7v7uLshT+7A+Wh5rincAJ
         93dQ==
X-Gm-Message-State: AOAM531WqdT7XH5jiM45sJM9XWHWIVvo07vamD6LRSpGfO2tm2CoY8mb
        jL7U3gFrOi8tApljM8iRbIYr4C2Fgp7gF2V/GIPUgEef0EoBrmM9
X-Google-Smtp-Source: ABdhPJwT/9Wb6/ynC7ThfNRIUvGN5jTnfb2/1aNKw0X7NVF05sImHp6YY/JgB91UAukCwenk83S3pKDmx3C7e1Gap08=
X-Received: by 2002:aa7:d905:: with SMTP id a5mr3900786edr.78.1611651277854;
 Tue, 26 Jan 2021 00:54:37 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 26 Jan 2021 14:24:26 +0530
Message-ID: <CA+G9fYuWbKX6o1HS-9vAs4PHQKhv0d33V6x0TZ6_UHVy6yp-qA@mail.gmail.com>
Subject: s390: syscall.c:165:3: error: implicit declaration of function 'sched_resched_local_allow'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-s390@vger.kernel.org, lkft-triage@lists.linaro.org
Cc:     hca@linux.ibm.com, gor@linux.ibm.com,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

s390 build failed on Linux next 20210125 due to below error and suspected patch.

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=s390
CROSS_COMPILE=s390x-linux-gnu- 'CC=sccache s390x-linux-gnu-gcc'
'HOSTCC=sccache gcc'
arch/s390/kernel/syscall.c: In function '__do_syscall':
arch/s390/kernel/syscall.c:165:3: error: implicit declaration of
function 'sched_resched_local_allow'
[-Werror=implicit-function-declaration]
  165 |   sched_resched_local_allow();
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Link to suspected patch,
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/s390/kernel/syscall.c?id=29819dc5f5e3dbb1770ee2062140b6566755ba00

-- 
Linaro LKFT
https://lkft.linaro.org
