Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CADA509FDD
	for <lists+linux-next@lfdr.de>; Thu, 21 Apr 2022 14:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbiDUMp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Apr 2022 08:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378306AbiDUMp5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2022 08:45:57 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F10731931
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 05:43:05 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2f19fdba41fso50694227b3.3
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 05:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=mIeaFctSEsoLR3nyyuA41iSSvZNBM5Q8wFrycCuIYd0=;
        b=KXYF894QW3BVp1KxCI27PWhMQYj4M4ylYYwG7Yf04NN9QxFYtaz2+8p7cG7Ji/55oc
         adAynaaeQi29SGnJQgiIPYmgYdUxtsXWgoBt9UchRFhL98aDuVkwMpc3sgIRRLr/NVG/
         a4vF+JUL24/l3aA5LFq3NkMY3wRZ95/TuQhYxHi1SH7WFMc+vShS/cqEL68p2290Jclr
         cezFVzxw3ESfictsSZs3mzFnxuv0xX8Ehyzq0lDF99IUtqHB5iNNxk09vhJ6jIpBVqgi
         LcE1s/BV4XSHrA8mJJxR/ZK7oc7oJ1YpToPiXlryVX9g0NVeipsi/5sZHt7ZaEYR1omr
         RE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=mIeaFctSEsoLR3nyyuA41iSSvZNBM5Q8wFrycCuIYd0=;
        b=2Mh7ARPfmfu/T02PJzt5X1AhWHCNh8Iz/F6NSlnKP9RpMpFbbMyh6L3jOyQim8p9WU
         xcnYBZyIP9nwS7THEWEBTG4URViJghXO3w3hrMBvDHlBdEib1cWaKfEni7Pu77+OP479
         RDaMm/eHgxiUe4blYFIFeIkeHf7ukI/lo3/2AlGAg4dyaJ3/6wBokVO+Fk3NXZNe7R4k
         9X7Xm/kvMViQuJ/ZV6j8g1gAZ9TKLkge4X5sHQF80sM6obxK2ssrBGGYqOVYn2x/NvbR
         s42hQT1DXPCAwOT8IGQnBLMz1GAYZMR9Su/gBXMdk+SyfVg43+z/WGZSErgw5ptR/gud
         YWZQ==
X-Gm-Message-State: AOAM531d6yNel5N/rRIa0a4QvNQAtsTcf2PdoZdk5Lr6tx6utW0f+AHL
        39C0GaZ0I32bfeIK7dch/DRFexX0VcssGNKcREqy7Q==
X-Google-Smtp-Source: ABdhPJyEfDDMcm+W2/EznDqS4w3LFcFNuK1bvTNWZkaZ4X2f6GD98Cqgg53dYwlqWQw5Zie9b1Lj+QH8A31CKOrXqoc=
X-Received: by 2002:a81:478b:0:b0:2ea:da8c:5c21 with SMTP id
 u133-20020a81478b000000b002eada8c5c21mr26608137ywa.189.1650544984778; Thu, 21
 Apr 2022 05:43:04 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 21 Apr 2022 18:12:54 +0530
Message-ID: <CA+G9fYvO5OERA0k-r=Q8gbGdUKm0VppL2KPJ9e-R0NreBESo_g@mail.gmail.com>
Subject: [next] LTP: netns_breakns: Command \"add\" is unknown, try \"ip link help\".
To:     LTP List <ltp@lists.linux.it>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "vadimp@nvidia.com" <vadimp@nvidia.com>, idosch@nvidia.com,
        Raju.Lakkaraju@microchip.com, jiri@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Regressions found on all devices LTP containers test cases failed on
Linux next-20220420. [1]

  - ltp-containers-tests/netns_comm_ns_exec_ipv6_ioctl
  - ltp-containers-tests/netns_breakns_ns_exec_ipv6_netlink
  - ltp-containers-tests/netns_breakns_ip_ipv6_netlink
  - ltp-containers-tests/netns_breakns_ns_exec_ipv4_ioctl
  - ltp-containers-tests/netns_breakns_ip_ipv4_netlink
  - ltp-containers-tests/netns_comm_ip_ipv6_ioctl
  - ltp-containers-tests/netns_comm_ip_ipv4_netlink
  - ltp-containers-tests/netns_comm_ns_exec_ipv4_netlink
  - ltp-containers-tests/netns_breakns_ns_exec_ipv6_ioctl
  - ltp-containers-tests/netns_comm_ip_ipv6_netlink
  - ltp-containers-tests/netns_comm_ns_exec_ipv4_ioctl
  - ltp-containers-tests/netns_breakns_ns_exec_ipv4_netlink
  - ltp-containers-tests/netns_breakns_ip_ipv4_ioctl
  - ltp-containers-tests/netns_comm_ip_ipv4_ioctl
  - ltp-containers-tests/netns_breakns_ip_ipv6_ioctl
  - ltp-containers-tests/netns_comm_ns_exec_ipv6_netlink


Test log:
---------
netns_breakns 1 TINFO: timeout per run is 0h 15m 0s
Command \"add\" is unknown, try \"ip link help\".
netns_breakns 1 TBROK: unable to create veth pair devices
Command \"delete\" is unknown, try \"ip link help\".


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: f1244c81da13009dbf61cb807f45881501c44789
  git_describe: next-20220420
  kernel_version: 5.18.0-rc3
  kernel-config: https://builds.tuxbuild.com/283Ot2o4P4hh7rNSH56BnbPbNba/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/520334286
  artifact-location: https://builds.tuxbuild.com/283Ot2o4P4hh7rNSH56BnbPbNba

I will bisect these failures.

--
Linaro LKFT
https://lkft.linaro.org

[1] https://lkft.validation.linaro.org/scheduler/job/4925635#L1272
