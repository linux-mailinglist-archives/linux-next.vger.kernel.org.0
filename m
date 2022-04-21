Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4741D50A8BA
	for <lists+linux-next@lfdr.de>; Thu, 21 Apr 2022 21:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386991AbiDUTGM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Apr 2022 15:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391721AbiDUTGL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2022 15:06:11 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301164C432
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 12:03:21 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id v10so1627002ybe.5
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 12:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=unnM4fXSMJiSpgzSnbjZz/++wfkdNxCsxaJNQt54SI8=;
        b=yYOJAm4NGLIM7VhPfoM0A7UQlxtEAXOJ5Za+zj3E+xbN5syIkkj2m+fituMnbqpqbj
         MAiDcU2LdLTMxmLpV0AKC0h/NbvsMeDpzZgxGjbjWsKQPMZgaKP9BIJDVQd0zMPYF9po
         Vin2Od6SxsI63H8+mR9FZkeZAgbUt390qhzMJ9L9VZglAp21KMC75thGdhMQ1B/aHqYS
         JHgmzlaJBQfQHcw6bMyAtY2KogmKKIQN5yTLCjgmdRSeFobyeCCjcO+9mQ4aXUcqs74N
         9pdTeqIqkQGDgy1DRsyG6X3HORECTQ/njdqXVjfcy3maBanaXCuvlLBjXy9yoTbWWI7Y
         BNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=unnM4fXSMJiSpgzSnbjZz/++wfkdNxCsxaJNQt54SI8=;
        b=lMU4QqIsM4/TyZia4wlabE/XWGgHLdW4gzdxJj29kECpTX4Q2AOS0+1Q3wlhaORcry
         XvBUr/0PhEm57a7qz4wP8ztNLRVS2K9VgA3Vq+0XGFqiamcP1KhLEpRgV4jmJ9Bg1KCZ
         qmrYRKpgFRb9iUwwIAO+fFH9YiuOVEqhwZJQZ+ztcVVL4PwnjdMEYHVCi6Qq41s+sNTJ
         vsfOF6mCC/NVTOMmj3YyMTWk0VlDN6xTdEiInAipUzDO+k3AaRaWbeK/cxETwkZcGlxJ
         UAlzvLmerMY9AeXqN4CHDigDkjBc13vSW7gnIp8clkuBJybcTZWslq5I/zyz0w+f1RJ+
         rDVw==
X-Gm-Message-State: AOAM530MzQ5yP8zjLamitN78cQgPvALTKxVX72aD2CpaR1n9eRcwv1C1
        sHu8tbiXpxcKqhtkU89D3UCwcxPcSNGiDPuMmJ0Cj8sLX2RATFdd
X-Google-Smtp-Source: ABdhPJyHzNIYg5C4PJ/cejBQRmSKW/dyS0OVtZsBDIZ2e0UwpSgBZ6Gk8wH3JAqmB8QausXlAat9W0SAdbIea4rEv4c=
X-Received: by 2002:a25:ae45:0:b0:641:ba5c:7745 with SMTP id
 g5-20020a25ae45000000b00641ba5c7745mr1147553ybe.537.1650567799668; Thu, 21
 Apr 2022 12:03:19 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 22 Apr 2022 00:33:08 +0530
Message-ID: <CA+G9fYvdfYBq+Q=-XUJcKHSYXdubdoqhExRpjrqCgf_N3pPpHQ@mail.gmail.com>
Subject: drivers/usb/typec/tcpm/tcpm.c:4724:3: error: case label does not
 reduce to an integer constant
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, linux-usb@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        heikki.krogerus@linux.intel.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux mainline and linux next arm64 builds failed with gcc-7.3.x.

drivers/usb/typec/tcpm/tcpm.c: In function 'run_state_machine':
drivers/usb/typec/tcpm/tcpm.c:4724:3: error: case label does not
reduce to an integer constant
   case BDO_MODE_TESTDATA:
   ^~~~
make[4]: *** [scripts/Makefile.build:288: drivers/usb/typec/tcpm/tcpm.o] Error 1
                                      ^
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org

https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-mainline/DISTRO=lkft,MACHINE=hikey,label=docker-buster-lkft/4259/consoleText
