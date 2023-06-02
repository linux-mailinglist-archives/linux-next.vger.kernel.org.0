Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCBE771F7E0
	for <lists+linux-next@lfdr.de>; Fri,  2 Jun 2023 03:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjFBB1z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Jun 2023 21:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjFBB1y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Jun 2023 21:27:54 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749A91AB
        for <linux-next@vger.kernel.org>; Thu,  1 Jun 2023 18:27:16 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b039168ba0so13350265ad.3
        for <linux-next@vger.kernel.org>; Thu, 01 Jun 2023 18:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1685669235; x=1688261235;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLhysu5X9UxQfBGfCZtDhIQQXCqeJE8gI3TdTT5SohA=;
        b=RnA0/XVZmrABGY0nXyI0+NqS2LXx3RBnn+7SwYDHZzDTF599egBwtCorifk78jxvSO
         dYs1cJUIhSID98GbKYwqLlME0QGCRd1hZyI46i7q8CCQSZs/s72KqjM/OPcEmRRVmAZg
         E7u+c1cuHf7pmiqC/mr8FQpBN2dUsmV9i28mdehyEfbXhA7x4TFYup9BaYspiijnoZsf
         Jj/IBSzjwyQV5EKM3pdEEZ2mACYSIW2H9sxjlKZ8EG9pkegAO1rKDhE2nDSWG3n0Lzjf
         HwsXeKD5tiY19RVYtz2vcaeoOPT0qTV9CT2Zx2uSu2SRWLEwoqjfPLw285hxoOm4C02B
         unUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685669235; x=1688261235;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLhysu5X9UxQfBGfCZtDhIQQXCqeJE8gI3TdTT5SohA=;
        b=KtcjJW4U0IYajaGrkOLuPSnjd+7rRpzE++WtipIwZILoKWLl3XNw+/kp4noDJoPmxA
         ag4Cu6fWkH6n4ymZbdg7Z28RCqVlBcCFXXvGvk+OHrseBZws7T4YQ6EOVXqVfpBcq7Dg
         XzWk4RT8fTWrX82kfBF0Q2CQETagkOVQ6p8CK2ZiIhjRAfCFFZZEhNOXL/AEBXO5dvDF
         ZXbJs3GYKj6KWfguSxJXbE/88J+FIVEZ3YCeWXQctL9R5FFvY2HBt7aBtJa1rwMjw5F4
         zGUpbAl0IKEwAY2FBtNZQhGReoFjDdohzJRJb1W5Pazoc65HWBOkYKn/2XR/OBONB+qU
         yHKw==
X-Gm-Message-State: AC+VfDx4FklgHFxbCY/q1o/v+fyzo3mVnSk+56cw7p8B7HBCD6QTtW/0
        Nml0ztkq10LQ3MfDbip6bENIkQ==
X-Google-Smtp-Source: ACHHUZ6eY36iEi1lBCEM7QWVAtl+EJLMywA/C1PLyZM8c6+4RjxTX+0vpy32nDqgwClSRQBWr3NpQg==
X-Received: by 2002:a17:903:1250:b0:1ad:cb4b:1d50 with SMTP id u16-20020a170903125000b001adcb4b1d50mr1269218plh.43.1685669235364;
        Thu, 01 Jun 2023 18:27:15 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902714b00b001b1a2663e9bsm43640plm.77.2023.06.01.18.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 18:27:14 -0700 (PDT)
Date:   Thu, 01 Jun 2023 18:27:14 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Jun 2023 18:18:15 PDT (-0700)
Subject:     Re: linux-next: Fixes tag needs some work in the risc-v-fixes tree
In-Reply-To: <20230602091245.30a4d4b4@canb.auug.org.au>
CC:     Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, alexghiti@rivosinc.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-9a6d193c-81d2-4838-94b1-907c14e7639b@palmer-ri-x1c9a>
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

On Thu, 01 Jun 2023 16:12:45 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>   073b51fedd87 ("riscv: Implement missing huge_ptep_get")
>
> Fixes tag
>
>   Fixes: f2aeb0118ddd ("riscv: mm: support Svnapot in hugetlb page")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> In commit
>
>   3e1989a048ec ("riscv: Fix huge_ptep_set_wrprotect when PTE is a NAPOT")
>
> Fixes tag
>
>   Fixes: f2aeb0118ddd ("riscv: mm: support Svnapot in hugetlb page")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: 82a1a1f3bfb6 ("riscv: mm: support Svnapot in hugetlb page")

Sorry about that, these are fixed.

>
> -- 
> Cheers,
> Stephen Rothwell
