Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1775645E34
	for <lists+linux-next@lfdr.de>; Wed,  7 Dec 2022 16:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiLGP6T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Dec 2022 10:58:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiLGP6S (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Dec 2022 10:58:18 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344A82A406
        for <linux-next@vger.kernel.org>; Wed,  7 Dec 2022 07:58:16 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id c2so10296335qko.1
        for <linux-next@vger.kernel.org>; Wed, 07 Dec 2022 07:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qs0nZ1rFh/s7MTR6+29xGDMlHk1tahA90qx6nUbU6w0=;
        b=W3sB3oJvRoNx0VC2yM2FQ6Ev/+nc13R58IJFJndvG5zrSCt4KXWHdZ6zV2f5P04vwC
         coYp7i/4L0D6qBB2/mM6gC8B5Hap5ikN4lYCxc3NuIUa5HEE4oGDq26/N2dHmz2j+6xW
         xTvds0opU2zCXTeoD7kWOdDY+WZHi3NFuBZ84RxKKSv84sq/tsjhKfs3IHaizDPOd9Ps
         ZV90N1vR/8LTGEYyr62UIaXclWH/qK1088y+O21hgS7g6HBOCXlupU4IX/C1w/UMEYSB
         Na7a2jWUpQbOwmVLiE8yXlpyo/WKygc+zlp4rghG9CldbdiwoayMt8s+1pKTrPW6y9vh
         Oq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qs0nZ1rFh/s7MTR6+29xGDMlHk1tahA90qx6nUbU6w0=;
        b=NHuDZHv9U9yRNHRaUOiepS1oZW2uWQk+1vA2+91rqWQ7w/5kzeM/J70nRhXeJNZl1+
         7k9VslzzDvZA+3P6iZMPFObUcqXugBtfRvlh3A2OnTeMLJlefgNAJ1xONldOJgZ1Dmfq
         6TVyxgkMkMQaYN1O4fV4By65aPoP48N1VPIkLtSuSc2XSy+Sr2sKzQFhQkftbSewGOpI
         x2vNVoXSuDt0AObFCay4Ssv2/hOCMIkpn3A35+eRaEj8tMD0rt+meFPFQg/qrJ26JUuK
         ygo9oAJmfM24I0fpiq6lAscjE2npPVu8bFyw4Oq2ktvDjU1XUoYncaL/RQ25VzWnStJ6
         5B7g==
X-Gm-Message-State: ANoB5pnBJK8ta98Vt9AtudIV4P/5h5nlS7IKob67a7bLIdl2G4uAb5qT
        Ehcsts1FT8tM2F5/eF+bHno5UIjw2vr7dgY3Z+AWemYcO/iOP+ba
X-Google-Smtp-Source: AA0mqf6MVYwoYOhFT0gxk5rqGIihkNKVqwUwRwH46llz3gEgyDjhmfIbn9BLQr53oVvP6jd52Fdnrhp6onLZcC0LK/g=
X-Received: by 2002:a05:620a:cf5:b0:6fe:c37b:880e with SMTP id
 c21-20020a05620a0cf500b006fec37b880emr9851138qkj.221.1670428695952; Wed, 07
 Dec 2022 07:58:15 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 7 Dec 2022 21:28:04 +0530
Message-ID: <CA+G9fYv_UU+oVUbd8Mzt8FkXscenX2kikRSCZ7DPXif9i5erNg@mail.gmail.com>
Subject: next: LTP: syscalls: epoll_clt() if fd is an invalid fd expected
 EBADF: EINVAL (22)
To:     open list <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, regressions@lists.linux.dev,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        LTP List <ltp@lists.linux.it>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Jens Axboe <axboe@kernel.dk>,
        Anders Roxell <anders.roxell@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, chrubis <chrubis@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

LTP syscalls epoll_ctl02 is failing on Linux next master.
The reported problem is always reproducible and starts from next-20221205.

GOOD tag: next-20221202
BAD tag: next-20221205

tst_test.c:1524: TINFO: Timeout per run is 0h 05m 00s
epoll_ctl02.c:87: TPASS: epoll_clt(...) if epfd is an invalid fd : EBADF (9)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd does not support epoll : EPERM (1)
epoll_ctl02.c:87: TFAIL: epoll_clt(...) if fd is an invalid fd
expected EBADF: EINVAL (22)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if op is not supported : EINVAL (22)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is the same as epfd : EINVAL (22)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if events is NULL : EFAULT (14)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is not registered with
EPOLL_CTL_DEL : ENOENT (2)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is not registered with
EPOLL_CTL_MOD : ENOENT (2)
epoll_ctl02.c:87: TPASS: epoll_clt(...) if fd is already registered
with EPOLL_CTL_ADD : EEXIST (17)

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


Test results:
https://lkft.validation.linaro.org/scheduler/job/5931196#L1367
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221207/testrun/13492039/suite/ltp-syscalls/test/epoll_ctl02/log
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221205/testrun/13412113/suite/ltp-syscalls/test/epoll_ctl02/details/

Test results comparison:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221207/testrun/13492039/suite/ltp-syscalls/test/epoll_ctl02/history/

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: ee9bda616d36d2dc864aa294c2656fad88c9efa0
  git_describe: next-20221205
  kernel_version: 6.1.0-rc7
  kernel-config: https://builds.tuxbuild.com/2ITqQKvBJSwcIYKcYvEdPjjrw64/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/713047540
  artifact-location: https://builds.tuxbuild.com/2ITqQKvBJSwcIYKcYvEdPjjrw64
  toolchain: gcc-11

--
Linaro LKFT
https://lkft.linaro.org
