Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E9328EF5E
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 11:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730671AbgJOJ1s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 05:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727753AbgJOJ1s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 05:27:48 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE3DC0613D2
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 02:27:47 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id t18so3262590ilo.12
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 02:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U/oWxjxOfWlAIEhqMrrUligmtkGSiaLafGJiqZMoZ+A=;
        b=RddR1mJzacpz//w0bbpREDVk2eN/vNgniNb6ER0bp7XU7rzMAGfibxLc8KB+4j3HgM
         VxyYVpeJhgZOKcY0ck8LDt6tJeKzoIA94Hd8AKYNqZT+edFGr1QkFWLwtRcZtYD7c1bR
         qAOadY/5erawCDQQ6KuuFjyTJkKCObwnTNJJXS/jEr+gDKIywgWypFwcnyK7dPNJcQ2r
         9bE8icpeivGjjlj0wsJ2OsgYsbBESIRVaSt9rfmGq8V+cvo23lVYsXIDVHwvMo3G4SOP
         5Tt++WXzi+2GdCwWS4bk+Ku5SyYY4gALETMT5xiWsEmDCJjIxrvSfZhkly8S+YSTG6gM
         3Vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U/oWxjxOfWlAIEhqMrrUligmtkGSiaLafGJiqZMoZ+A=;
        b=pYPrviT9VeRs6iNcfk2NW6wgXXjBSykAeB7EU0qcFaVR8FT0JU3lQeBKOhmzsunKcz
         nCIqvSeT9lpSg+tSqxB0rdiRj/FAv0son17IN/xX8biWt6Z3Kf2EVAdJN9vPBVtLXufq
         /s2pyl69t6M8ci/GQTN6bGEHddlZlvnscojwV2m4OeFtgRZv+FDzMwWe6muN83C7Fvtj
         4qqiMnp+t82r/OK5sx7UNRluanRuA3uf3XEWctOiW9PHQldCGk71jaKWecFM0xza/Soy
         pgMuJHYLgac8QpekcA252JuGWoNeGULUru5cKflJD5AiyiShndNfdW204p0BO7eg8s+I
         lf/A==
X-Gm-Message-State: AOAM5339PqxcdPr6NDQqa36qSHNkqi65x8JzX8HP24obOxpD1ppivTOw
        ag47yPO+YfM4CFu8VfsTCUsdgDeCnIVgcx/2Q+AyWA==
X-Google-Smtp-Source: ABdhPJzuNZ0EsyUKZ4jMeEV+MX1ryS5DfGZLElWyD4suz6V11o4XlTjjxwTv/CKJxtg/UqmVK5HZyB7EdzngW1pF0s4=
X-Received: by 2002:a05:6e02:5ad:: with SMTP id k13mr2483422ils.71.1602754066287;
 Thu, 15 Oct 2020 02:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202650.2530280-1-keescook@chromium.org> <20200928202650.2530280-3-keescook@chromium.org>
In-Reply-To: <20200928202650.2530280-3-keescook@chromium.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 15 Oct 2020 14:57:34 +0530
Message-ID: <CA+G9fYtqqzWtb65pk8J=-Afv0KZ9iy3_bA-WmiJjbe5Y6qXbAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] selftests/run_kselftest.sh: Make each test
 individually selectable
To:     Kees Cook <keescook@chromium.org>
Cc:     Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Tim.Bird@sony.com, lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 29 Sep 2020 at 01:56, Kees Cook <keescook@chromium.org> wrote:
>
> Currently with run_kselftest.sh there is no way to choose which test
> we could run. All the tests listed in kselftest-list.txt are all run
> every time. This patch enhanced the run_kselftest.sh to make the test
> collections (or tests) individually selectable. e.g.:
>
> $ ./run_kselftest.sh -c seccomp -t timers:posix_timers -t timers:nanosleep
>
> Additionally adds a way to list all known tests with "-l", usage
> with "-h", and perform a dry run without running tests with "-n".


While testing this patch set on LAVA the skip test functionality is not working.
We may have to revisit test definitions kselftest skip logic
or else
may add one more option to skip a given test on run_kselftest.sh script.

ref:
https://github.com/Linaro/test-definitions/blob/master/automated/linux/kselftest/kselftest.sh#L196

- Naresh
