Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058134EB21B
	for <lists+linux-next@lfdr.de>; Tue, 29 Mar 2022 18:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239834AbiC2Qsm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Mar 2022 12:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239844AbiC2Qsl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Mar 2022 12:48:41 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CA96211F
        for <linux-next@vger.kernel.org>; Tue, 29 Mar 2022 09:46:58 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id w7so13695529pfu.11
        for <linux-next@vger.kernel.org>; Tue, 29 Mar 2022 09:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Mll/pMxUBALsnuYtHp2CgJeJZP8oeqCPx7ZbOSMz7Mk=;
        b=SVp6nz7Mh4KGeAB6sUGxDOz4z9VibRyKENDnrJ03jjNe4K9FIb4z9fxd907+hI1okf
         96JKIbPjjOt64CqsI1CYXwEooyBDNjCPc2ORwWsRV4f9Fqs4rDQHI6xyRPRQ4Qy+3Hpa
         UJ1C8d30sJWZ1GnA+vCKkeUj5qgGbwwoKMJuct3QJzqUvpOcB2OIjLPzDUL6J4Ioi1ZG
         HPJzM2Sm00b9sONxIBibkMoGPmguJh1w+b3k7TlGYCNCuwyJED257GahKPNiJR8Edo5U
         wCrYd2pTV7wQbn682vnV12jCSbK+/IutXk/taMZW/ZewZ3WJrBIU+ekgiVa6/8SH6BEx
         M3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Mll/pMxUBALsnuYtHp2CgJeJZP8oeqCPx7ZbOSMz7Mk=;
        b=OHpBeXuLJao7HuO8HSdUn8TAQQHrjRnpyvIbhiVkbREjZVD7keXNLolgD+cNHyPsc1
         +3DoJ4Cq41IW0WrZzut6P7iAwJddr7yaCGFoXQ4zfwEnIthtGL+ZD3Exm/FlqF1cZIV2
         Q3yNSNC69zXGzLZzpkfkXy/1kjIv8zEZyy2Sx+pOBuCtmlY1ZptxGTC0uJgAMPw20Jok
         bHRSuO5kV9BilxosKff5QxeGXH0/YPMaO1Aekol6YYsDmNF/wYyozHHIPHsQ2+/yH2Im
         wt53GCI/WQMs0u/EGCUuyq1fi/uempkS+QnWAaww4ncEg04kiGgx+zBwrOHujzx++FSB
         tJiw==
X-Gm-Message-State: AOAM533NgPL00M7yM3CAbj0NHFZvUQVtoroLVRbZgWniDnC2FJcUn+gO
        3S6QHBLOx4sc8HgwzBAk7KB98Q==
X-Google-Smtp-Source: ABdhPJybC4NPgtQQoB80BKs5OokRMkw6fanDwLE97kLL8FlQw1sxVz5LiZzjhvIfVg5/O4RnvDXNPw==
X-Received: by 2002:a05:6a00:21c6:b0:4fa:914c:2c2b with SMTP id t6-20020a056a0021c600b004fa914c2c2bmr28739586pfj.56.1648572417640;
        Tue, 29 Mar 2022 09:46:57 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id z126-20020a633384000000b0039858053bafsm5876859pgz.27.2022.03.29.09.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 09:46:57 -0700 (PDT)
Date:   Tue, 29 Mar 2022 09:46:57 -0700 (PDT)
X-Google-Original-Date: Tue, 29 Mar 2022 09:46:35 PDT (-0700)
Subject:     Re: linux-next: build warning after merge of the risc-v tree
In-Reply-To: <20220329133412.591d6882@canb.auug.org.au>
CC:     Paul Walmsley <paul@pwsan.com>, Atish Patra <atishp@rivosinc.com>,
        atishp@atishpatra.org, Atish Patra <atishp@rivosinc.com>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-f46f3c64-24e0-4284-a6cb-71266e61e9ef@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 28 Mar 2022 19:34:12 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> After merging the risc-v tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/riscv/index.rst:5: WARNING: toctree contains reference to nonexisting document 'riscv/pmu'
>
> Introduced by commit
>
>   23b1f18326ec ("Documentation: riscv: Remove the old documentation")
>
> This is actually in Linus' tree.  Sorry I missed it when it was
> introduced.

I guess I missed it too.  I just sent a patch to fix it up.
