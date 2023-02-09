Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51816690461
	for <lists+linux-next@lfdr.de>; Thu,  9 Feb 2023 11:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjBIKDF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Feb 2023 05:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjBIKDE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Feb 2023 05:03:04 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD972D168
        for <linux-next@vger.kernel.org>; Thu,  9 Feb 2023 02:03:03 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id x71so813076ybg.6
        for <linux-next@vger.kernel.org>; Thu, 09 Feb 2023 02:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jfTJJaEXRrDUHNq1LPkYpgcCmJkDp+MZ1+rtAQNLDEA=;
        b=Akj02ADt1meSifvrJN+3ql+L1JzvhQpJAw0Cs7xBbWyUaMzEMG0iruJs8JBvXFx21E
         NwvF66wDTO63jZ0+JRS2ikgrikcCDxv7qyKwneftUFFhJP/Q0dNfrELqbiVJk7uQL2aX
         nprWc835CQH9Jd7qMFkrmhabAUkutAYpZiXPqDiArfB1ibZfyOcAQo/tqw9N8TxrHF1a
         qj4JN7CgmlsDgho4tBTgY0AjWY2SoDKhIp5FD2Katz7CfnokCCGUUO2sfzRzsvkQXxqz
         Xr0nbM4xXS5VbMhCLVkSpgQn5kZQCUAplinHpKZHXoCdh7FTRaDUxbcSdTJ+lG7DMjg1
         fGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfTJJaEXRrDUHNq1LPkYpgcCmJkDp+MZ1+rtAQNLDEA=;
        b=RTNqq0u2esmxrauqHRDN5zksFj+5efl9fIXWN2HrV7OoNjhMePjCciBfQonvzc9Z78
         J8tBe3JFmwq6ro6SuhhEb9/eYqV2rK3XxUf5h3rS137ZqGhdgDzgLF92mZrgF8Myqm5B
         VVX0aXcj6sFWvuRwncgYdwE6/FVpXgFS0FtlCLSV5qFT6M1ODI/QLu8DRfoKqv4dBuUg
         dRSkeywDWhZ4fPuUjVhm+w0IT1+1+VnZz6Kx3hSNcM1GlW6nl2U0jkBzz7E73hsdlBM0
         6/pOvkmS4L6C4g2UsTQcMKvFkYlOGAKOPd56fmLw69TUsm/Tfxtc+mJC72+3zEFM1po3
         1HvA==
X-Gm-Message-State: AO0yUKX5eYC0v7GWVIPSFHbC0jbkbrDYcoo9VOvm4AFPz6t2MZwJZbUT
        QhB+BuwXlEuF7m/w3Z6H+zNPWrJ/LBmxMkZRdDVxOg==
X-Google-Smtp-Source: AK7set8Fe9KIIUPsV6Xrmn+GKlIZQdVpLw/AJdHbShK8UH36xu69E35pCLvKrrO6Qnkk6sfvNdBFfCqyDBmK9QuSIJU=
X-Received: by 2002:a05:6902:4c4:b0:8d6:6829:503c with SMTP id
 v4-20020a05690204c400b008d66829503cmr190205ybs.650.1675936982327; Thu, 09 Feb
 2023 02:03:02 -0800 (PST)
MIME-Version: 1.0
References: <20230209150457.401837e0@canb.auug.org.au>
In-Reply-To: <20230209150457.401837e0@canb.auug.org.au>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Thu, 9 Feb 2023 11:02:51 +0100
Message-ID: <CACMJSesBRy_x6JOj2jOHjayxxgdp8QyZ36iCOPinj-kGVr5ozQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the qcom tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Thu, 9 Feb 2023 at 05:05, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   e710abbb1740 ("clk: qcom: gcc-sa8775p: remove unused variables")
>
> Fixes tag
>
>   Fixes: ed432b1ed00a ("clk: qcom: add the GCC driver for sa8775p")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
>

Yes, that is correct. Bjorn: Can you fix it in your tree?

Bartosz
