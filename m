Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93ED5771C81
	for <lists+linux-next@lfdr.de>; Mon,  7 Aug 2023 10:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjHGImZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Aug 2023 04:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjHGImU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Aug 2023 04:42:20 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C3F1735
        for <linux-next@vger.kernel.org>; Mon,  7 Aug 2023 01:42:15 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-78caeb69125so1576903241.3
        for <linux-next@vger.kernel.org>; Mon, 07 Aug 2023 01:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691397735; x=1692002535;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=egVUMnfkRE9YRrGbcJnSDyhsV2A9haD4We8Vn8KKt2M=;
        b=EISyKeZtDR6GxhxHDmcLx55R8wAgFz2f35jVcidRgpyzxUwmxVLyppNOPg87NjeZU0
         xvyTBQLAanlRp0VEN/ao94sxtFhIKhE9l+pK3LD+8JUzUB5B4rACIHKzhgyoNx1U59Di
         I3j3UFhWWWeSYjD6qhjHW9rN/o1V724pL+NtZ+zUmj58SDbl3zyTm0W8JkHU0OqIi3i2
         ZjPBRQTzT4es5ow+7kG6SmhFVn9sVhHtzlG6K6hxeOlwb2opKJAbzHzlUbtyhsM4cEUG
         BfN2aNkb0VfEtZb4Fbml3tHV2U95OJy02RKCVtfdosPRrW2oezLQzQljm1+G14v7Z4X3
         Oz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691397735; x=1692002535;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=egVUMnfkRE9YRrGbcJnSDyhsV2A9haD4We8Vn8KKt2M=;
        b=K2Ruy+ICw6IXAe2lPIOo97g2AkwSRbYh0wtxiDn+yHSZaoHMr+OiIyl95n8qikL96x
         teMvhyiOeMRDVX8FJMGYaKrlaybwVkP8ZjCbOnKyYXPLv181X/E4ybIxTjwYCsnGIp+O
         tLiZUYKJSrpmLhWIeN+evCsmJNzqux08I/atiLwe/6JskZwST5fSPfYSOydyU4hFOkiv
         Kkz++/9IlbRYfJV53xaJAFkF3MsYxo8/twWKU/NWHgbUqYUy9uef+a2YINXPgPiBSjcS
         IXMo260supgBdEUFLC20FIV7n5Osx/Lac/ydGFu6bZ8PjbC4ppwpV5idLFiLzQp49WIf
         GA5Q==
X-Gm-Message-State: AOJu0YwOPB/nKzl0yl0JKMK8VXfjdh5b0+/WS/exyu/aFgnkG2r+t4I/
        IRb3ceVFYN0CL9H4syiB+IZuR9LEEp5uYmPcy1dp1v9uhGicvochivk=
X-Google-Smtp-Source: AGHT+IF59YMRDSz7OaYEyouN2C9YcjHGWQT19vyf4Es9QnuGEqGn/HcblPEikMZNTR9ZILKOvpCXLS9SAky+7cLWY/I=
X-Received: by 2002:a67:eb51:0:b0:444:3f96:ff70 with SMTP id
 x17-20020a67eb51000000b004443f96ff70mr4120479vso.33.1691397734834; Mon, 07
 Aug 2023 01:42:14 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 7 Aug 2023 14:12:03 +0530
Message-ID: <CA+G9fYsnoxm82ik3YNs_qUdZkxkNmVrknhC+ezqSKrEx6WxJ7g@mail.gmail.com>
Subject: next: arm: kernel/watchdog.c:521:36: error: too many arguments to
 function call, expected 0, have 1
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Michal Hocko <mhocko@suse.com>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Petr Mladek <pmladek@suse.com>,
        Pingfan Liu <kernelfans@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[ resending in plain text mode. sorry ]

While building arm mxs_defconfig with gcc-12 and clang-16 on
Linux next-20230807 tag the following build regression was found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
--------
kernel/watchdog.c:521:36: error: too many arguments to function call,
expected 0, have 1
                        trigger_allbutcpu_cpu_backtrace(smp_processor_id());
                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~~~
include/linux/smp.h:271:29: note: expanded from macro 'smp_processor_id'
# define smp_processor_id() __smp_processor_id()
                            ^~~~~~~~~~~~~~~~~~~~
include/linux/smp.h:264:31: note: expanded from macro '__smp_processor_id'
#define __smp_processor_id(x) raw_smp_processor_id(x)
                              ^~~~~~~~~~~~~~~~~~~~~~~
include/linux/smp.h:198:34: note: expanded from macro 'raw_smp_processor_id'
#define raw_smp_processor_id()                  0
                                                ^
include/linux/nmi.h:193:20: note: 'trigger_allbutcpu_cpu_backtrace'
declared here
static inline bool trigger_allbutcpu_cpu_backtrace(void)
                   ^
1 error generated.
make[4]: *** [scripts/Makefile.build:243: kernel/watchdog.o] Error 1



Links:
 -  https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230807/testrun/18858575/suite/build/test/clang-16-mxs_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230807/testrun/18858575/suite/build/test/clang-16-mxs_defconfig/history/

--
Linaro LKFT
https://lkft.linaro.org
