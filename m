Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F459189DEC
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 15:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgCROdW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 10:33:22 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:38773 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgCROdW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Mar 2020 10:33:22 -0400
Received: by mail-lj1-f180.google.com with SMTP id w1so27330107ljh.5
        for <linux-next@vger.kernel.org>; Wed, 18 Mar 2020 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=XF5S4XxJDvzuKvczlMPC3brfPAk78vzQeXC6ETpLBZI=;
        b=l81RBBfzP7Dw/gUWj2/x/6CbwsAtfF9hI/+ROQMlzJ85+02CYWcRou9ncfaDyyssCH
         ejEaoS7axwEdCEbJloyWnQjeAqyRLvzQPTQki2cVvGGVBObg6nbjUI64ao/WLfuA5U9V
         dThsCy8N5yaveHKJJ4S4jgBYVh2kN1FJsKoYa8cD5sLXMFgVrwKNSUhentKpaLvGTrPD
         S5eTslz9LLWRlpgJAPV0IHN6wC5Ro5sTTVgd0MoI+UXvgw86dJMiUfB1Jl9Z8IDE1J3Z
         UGcz0WMMx3dVmMhIu5o39jMKy+PheMk3gWKIlLJLoKqhzotkG3Ev4x6rwpaAHFq0Rqoo
         w0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=XF5S4XxJDvzuKvczlMPC3brfPAk78vzQeXC6ETpLBZI=;
        b=lzdf5kyCyBhSgHtHCSwrjVpx+ESiMQK9EfwKDmXs/CBwtkgJoD9+OY9jaBsU+jPoGi
         D5GRSrfcBeCgyxAAlDrFQxxXWaahiPFGNqp4lU6+R38CH5VtuQduAkZ+FqIxF5BOsG8G
         V6mtDttTSTNydsZtNucJDx9oTnVbF+OInLrJPffNlfSHyVsZmqmzYfiUUk7Mt1qBTpWK
         Wt7kfddxxptVcDWToxbeKW0YWPZ8Ip+HzmhbYuDzn69Wq2vEFOfx79/v+0RJbmbU4xxd
         Qy7f6aNfS1ZNKOwUFmKKJykmdRRfQ5Xo4CFWucy0puetyfVaS5izhvZjHq4yu3xOXNtJ
         pRng==
X-Gm-Message-State: ANhLgQ3WIDQLuyNdIHc2GOtrBUscNbze3Be8Dkj6vfSkw+l/7CK+5STc
        OhLcrepYG2lY2C51mWzG9jQTgTkJMFG5hhg5DUbLFA==
X-Google-Smtp-Source: ADFU+vvDUw2azv5wuxvYN1sBPD4zgg6lx6ShyeW7lx3uJBMBnxMuGtEecjIe9jUXO8NzsyMmVaCSoFcH62+sHNrNuOY=
X-Received: by 2002:a05:651c:285:: with SMTP id b5mr2500039ljo.165.1584542000262;
 Wed, 18 Mar 2020 07:33:20 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 18 Mar 2020 20:03:09 +0530
Message-ID: <CA+G9fYtk0jCB1M=MeYP4SshXjyyhLJbHuSzpOkq0OPVjSRpqZg@mail.gmail.com>
Subject: mm: hugetlb.c:5449:62: error: expected ';' before '{' token
  for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL)
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     lkft-triage@lists.linaro.org, Roman Gushchin <guro@fb.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>, andreas.schaufler@gmx.de,
        js1304@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next build failed on arm beagleboard x15.

Build error:
/mm/hugetlb.c: In function 'hugetlb_cma_reserve':
/mm/hugetlb.c:5449:3: error: implicit declaration of function
'for_each_mem_pfn_range'; did you mean 'for_each_mem_range'?
[-Werror=implicit-function-declaration]
   for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
   ^~~~~~~~~~~~~~~~~~~~~~
   for_each_mem_range
/mm/hugetlb.c:5449:62: error: expected ';' before '{' token
   for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {

config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/am57xx-evm/lkft/linux-next/718/config
                                                              ^
full build url:
https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/727/consoleText

-- 
Linaro LKFT
https://lkft.linaro.org
