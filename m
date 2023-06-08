Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF307279D3
	for <lists+linux-next@lfdr.de>; Thu,  8 Jun 2023 10:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbjFHIVh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Jun 2023 04:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbjFHIVg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Jun 2023 04:21:36 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18080E43
        for <linux-next@vger.kernel.org>; Thu,  8 Jun 2023 01:21:33 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-43c1e5978e4so58440137.1
        for <linux-next@vger.kernel.org>; Thu, 08 Jun 2023 01:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686212492; x=1688804492;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6tWt9hq7oJWIK0sNaWAHnzAJvTEXAfk0DnS35SM/QQw=;
        b=TxPpjwlI5V2V/STEYIyNogdtw0Tnl81nLYK7nEXOwxx9KyXd755BC2+Y/ZPdcCYzgb
         sP7CWPOAwODC4hj9MlqsBCFj1TNpoYhMNxp3ExYyRA0LQ6odGDeeh6tXIZll/KbPQrON
         6RQq12QuuGppcHXR3OzV/dnojaVWESC1HYfWIemlzIMpI8pdbmwy1AmJvRNvlu/s8p7e
         6MuFQ7S7k8UZWUHgmgWgvBgDvLv3VpU+bX7qL1+bTxTarbWk83jE7bHI6IvjsLiLndlU
         K8yv4v/SgmKdyl57TCLh0B6i5LjCw8wNjKCC5Y4Aq07QEgD7vbZr+yDQNbvbQAdNZ9/s
         gadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686212492; x=1688804492;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6tWt9hq7oJWIK0sNaWAHnzAJvTEXAfk0DnS35SM/QQw=;
        b=Z9MfzleRnUfH3UDvCMiNS/KX9uRMMC4d/AWr94BH0cGjiauTiBBBqKz/QxR+Rf5H0i
         mr42VFkcTL27qRycoTFRvUvrVW1GxSh3mmegpU5HfVK5/YYe4zDr/VFT39cP/5Jofhkq
         Q+4sCcLqRFRNHcdCV+3oMyaTDs3WA6MW4LqTwqNMp+dwdL14W/T0DGgCtujOqojSRQln
         3pyKHFJn+azwgyPYAWAvNjzi+jwFmmFsQPtkVaFhJMupxyoKwaqNhe4+56MaqNSX4Hse
         p78UXszMlmRkefeEfhjIgW+8f1XKxjc8KBVccfcuAsxkFE+4LW8y0HZn6Dd6qNtknezb
         yUZw==
X-Gm-Message-State: AC+VfDzOHaixtNOAdwxGaULOJZ4EFrosXwKCtyus1aCf8GOY5erVPgB/
        f9bENqiQFTAnQ4LdQxrPXCVmR07WNPYQp72Q/ZmWTGp682ZOFWUwwiZp5g==
X-Google-Smtp-Source: ACHHUZ5LnBh74TZNJm+lPfZOtPEO8qBk+wfhEKNBUuSAJ7GJzh5GFnoTm8SYNEhtLtYsxRZYxlPmqcMaPOju8PDgpcI=
X-Received: by 2002:a05:6102:3a72:b0:43b:56af:df85 with SMTP id
 bf18-20020a0561023a7200b0043b56afdf85mr1466008vsb.15.1686212491646; Thu, 08
 Jun 2023 01:21:31 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 8 Jun 2023 13:51:20 +0530
Message-ID: <CA+G9fYueMV2gFF0sYR4Lf3btcEoxMpOy0_YvpjvS26WFZ2pcBA@mail.gmail.com>
Subject: selftests: -e error: missing kernel header files. Please run this and
 try again
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc:     Shuah Khan <shuah@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        John Hubbard <jhubbard@nvidia.com>,
        David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Peter Xu <peterx@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The make kselftest-install failed on Linux next 20230608.

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build
INSTALL_PATH=/home/tuxbuild/.cache/tuxmake/builds/1/build/kselftest_install
ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang' LLVM=1 LLVM_IAS=1 kselftest-install

make[3]: Entering directory '/builds/linux/tools/testing/selftests/alsa'

-e error: missing kernel header files.
Please run this and try again:

    cd /builds/linux/tools/testing/selftests/../../..
    make headers

make[3]: Leaving directory '/builds/linux/tools/testing/selftests/alsa'
make[3]: *** [../lib.mk:77: kernel_header_files] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links,
===
https://storage.tuxsuite.com/public/linaro/lkft/builds/2QsWmEgSFF9iwodTUrWsdopV4Qp/

--
Linaro LKFT
https://lkft.linaro.org
