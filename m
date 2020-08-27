Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF3F2544C1
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 14:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbgH0MHi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 08:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728946AbgH0L4i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 07:56:38 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F179C061235
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 04:01:36 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id e14so2568545vsa.9
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 04:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YjN36ux3ZCiiBlL2gD5vkxNtFHi1HK0Zk2s0f0PusEQ=;
        b=nth4/rZi82Zdz4tORtG6KRkbO6PJcfhbUipiV7FzRSL7ARbIxYr/bK46JmHMNDbTWX
         /cgbjFquc0bNf/O9zhcb50kBbuQT/lS/x/91HjSw/POXb2FfQGCzWKcC2DfjqUIh+aSN
         waVMbLrc837pa9LSXJQBOpjxHx326Qd09J/H8tAMadBVGSKCnbfs+1DFxHWfcgtTAVvP
         YXhk6Cl869ZBNCyaNJIAqpZe+3AqRVL5pSgcQXSB/W0Lpn6vS8GkQ/5PWNZzspG8BGba
         apse2isGgrRFGohOdCM3+lUOZrnJw2U7KJg43iRhNC16HW9uDu1fhIAo8faNhAH+ngPp
         8xeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YjN36ux3ZCiiBlL2gD5vkxNtFHi1HK0Zk2s0f0PusEQ=;
        b=Be7xCcbbY+DyTMfK/h3LSXaAFSLeVXCXKeiv9WGW+PXBRgH5flwhnOrOrywzi0tW4L
         EzSb+obaa/xmQzRMcsjDJ36j2bSPEB5PW5i2kY43oEkNlLWw/ePPOvukjjgHQBI4iEuD
         cXODODbtdI4rT9ifZ37fdgIK/gDp+fVX3SLlWR7WyujxV4nsne68oQxYuDrTgNspY82v
         XeY0ESeG/H1/+zQ0pTm6KQqkeVNvtbYuPSHFw/LkNZN0W9J3dydpG0w5qNznBOGNCId1
         DzazEyfw0Mf+EJnopkzAZH57iRxN6oSwuFuP75GJulk1nmp+chyVzGONZX6AZIxdwrQ1
         iPMw==
X-Gm-Message-State: AOAM531pPSGPw4r6wixeQgOEkrwePj7RHQPNf94qQOM7sQQ/rdRFI4IF
        env8XxBXbKWbn73PxI0gPiPi6K5P9erEc9PtPXNqHA==
X-Google-Smtp-Source: ABdhPJyJUYc+NBvK+NXE8XWvv2+AizG6r7WTq/pC7wizO0q+ooK8tNj0sdNML6eLDXSPdAK5R9iEpw1HwRiMxWxMe8g=
X-Received: by 2002:a67:e3cc:: with SMTP id k12mr4760839vsm.173.1598526095417;
 Thu, 27 Aug 2020 04:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvK5UkERLuBSRH5t2=j5==dbtw45GTMta9MafyJDqFsFA@mail.gmail.com>
 <20200827094651.3grvs6ungv3dh7y3@vireshk-i7>
In-Reply-To: <20200827094651.3grvs6ungv3dh7y3@vireshk-i7>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 27 Aug 2020 16:31:24 +0530
Message-ID: <CA+G9fYsdpmd92vRWz8z5Lp+=F+vV4dNVZrc5o3MH5WVWD8pWvA@mail.gmail.com>
Subject: Re: WARNING: at drivers/opp/core.c:678 dev_pm_opp_set_rate+0x4cc/0x5d4
 - on arm x15
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 27 Aug 2020 at 15:16, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 27-08-20, 15:04, Naresh Kamboju wrote:
> > While boot testing arm x15 devices the Kernel warning noticed with linux next
> > tag 20200825.
> >
> > BAD:  next-20200825
> > GOOD:  next-20200824
> >
> > metadata:
> >   git branch: master
> >   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >   git commit: 3a00d3dfd4b68b208ecd5405e676d06c8ad6bb63
> >   git describe: next-20200825
> >   make_kernelversion: 5.9.0-rc2
> >   kernel-config:
> > https://builds.tuxbuild.com/LDTu4GFMmvkJspza5LJIjQ/kernel.config
> >
> > We are working on git bisect and boot testing on x15 and get back to you.
>
> Was this working earlier ? But considering that multiple things
> related to OPP broke recently, it may be a OPP core bug as well. Not
> sure though.
>
> Can you give me delta between both the next branches for drivers/opp/
> path ? I didn't get these tags after fetching linux-next.

git log --oneline next-20200824..next-20200825 -- drivers/opp/
b0531b897c9a opp: Set required OPPs in reverse order when scaling down
b11044e5204e opp: Reduce code duplication in _set_required_opps()
c67ba698f5fe opp: Allow dev_pm_opp_get_opp_table() to return -EPROBE_DEFER
8aaf6264fc7f opp: Remove _dev_pm_opp_find_and_remove_table() wrapper
f3364e17d571 opp: Split out _opp_set_rate_zero()
10b217365b94 opp: Reuse the enabled flag in !target_freq path
72f80ce4ef9b opp: Rename regulator_enabled and use it as status of all resources

- Naresh
