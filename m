Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1319257315
	for <lists+linux-next@lfdr.de>; Mon, 31 Aug 2020 06:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgHaEls (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Aug 2020 00:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgHaElg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2020 00:41:36 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885ACC061575
        for <linux-next@vger.kernel.org>; Sun, 30 Aug 2020 21:41:35 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u128so3883684pfb.6
        for <linux-next@vger.kernel.org>; Sun, 30 Aug 2020 21:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tKBW/F//Odqb5tM/8/4W6YOQLh46rA7wiAa9+W09lUs=;
        b=c7qfDC09HduGCiqIk+BgOYpQ9cvQvrcoJ68UU8Om0zB6UfcJuBggEjd3zzgQiQSvWz
         0cx6iY68Z3P6Wp/t5Qbf/E6ovg3xn5scdjX29vQ9aEWfrxC9SJUv5iGNJgN6lD2ORyYg
         U3IerKG6ipw6v5cNOcAXAWk6qtm+Ey1GST3evZhR46so5KxZy9kA1E2TtjvhZoaKFjov
         bHVxUnufMR8HN58YdZNjvhAg9uS3dFQuD8Ufk6DrYMO0/QP+sv2gTl7u734p3k2lGHps
         rZcq/O8vyDLshkQH+D1qAiHIycDiP2Fk7+LrYiXCUxIhlK3MLYABLrKOALQqyvQyFpaD
         VQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tKBW/F//Odqb5tM/8/4W6YOQLh46rA7wiAa9+W09lUs=;
        b=uPjSJoElY9WPNdveUxd1Kel6LzdSD6XMN1srV444wJECwj2r6W4jIXeN6xOjNt8mRx
         prlB1VYvXEUPj3DRzfTJEZLaDl5lOyQMgVI1eNXa/Fox8cTbudsW5uyTS8VY2KlZcIH6
         HO6op2WC//0pLUYguLwPi4TdKcCvJ8bqTfJnipfXQsAW7KuhT3+8Mv2MyiY1ubYlO6Ep
         JeppxpHDGSrsit/fOJJYtP5SoYhTJUrdVQPRFe8lULiM7yZ2J96MyfRV1QMEZjVAVU5C
         RA2m0uih5XyjwlXfybXyBbb3BigbAHemmFLJ/Z9EHC2OvuF6OvaO+d+95xBbZ5a/lPop
         dHiQ==
X-Gm-Message-State: AOAM532JkpW0zhfKSCfNoBvFnT6D1XCrjZp8fAB8EPULTrto1wnLJU05
        GjZi3VrpT0LSNuVgwUECR9/BJw==
X-Google-Smtp-Source: ABdhPJwRrm2hAT1+zyOzYg5wvxBV6hOve2sGkJOFOkrgXNNu1vlfGDGouDr0VBs0EX8TzqHhtvmClQ==
X-Received: by 2002:a63:354:: with SMTP id 81mr7199979pgd.216.1598848895038;
        Sun, 30 Aug 2020 21:41:35 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id a10sm6214503pfl.28.2020.08.30.21.41.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Aug 2020 21:41:34 -0700 (PDT)
Date:   Mon, 31 Aug 2020 10:11:32 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        open list <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, sbhanu@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>, nm@ti.com
Subject: Re: WARNING: at drivers/opp/core.c:678
 dev_pm_opp_set_rate+0x4cc/0x5d4 - on arm x15
Message-ID: <20200831044132.jb7aflr2sfbart2z@vireshk-i7>
References: <CA+G9fYvK5UkERLuBSRH5t2=j5==dbtw45GTMta9MafyJDqFsFA@mail.gmail.com>
 <20200827094651.3grvs6ungv3dh7y3@vireshk-i7>
 <20200827211832.3ebeda8a@canb.auug.org.au>
 <20200828045128.y7ybkd7dnvn4h6dt@vireshk-i7>
 <CA+G9fYsn1S-SieuP85-Z4qKO+aNyqJarrBR0xx0X-YbtF9eo0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsn1S-SieuP85-Z4qKO+aNyqJarrBR0xx0X-YbtF9eo0g@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 28-08-20, 15:42, Naresh Kamboju wrote:
> Viresh,
> I have applied the v2 patch series on top of linux next-20200824.
> and tested again the reported kernel warning is fixed [1]
> 
> [1] https://lkft.validation.linaro.org/scheduler/job/1717615#L1881

Hi Naresh,

You meant this one ?

[PATCH V2 4/8] mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()

Great, thanks a lot for testing these.

-- 
viresh
