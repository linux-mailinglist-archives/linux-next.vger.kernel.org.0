Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 252C657C255
	for <lists+linux-next@lfdr.de>; Thu, 21 Jul 2022 04:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbiGUCgB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jul 2022 22:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiGUCgA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jul 2022 22:36:00 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A921D336
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 19:35:59 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u5so322946wrm.4
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 19:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VqmzPsRoQUtQQLCqBZaksSJCZdedraAjaKBqFxITMf0=;
        b=XwrCn5FUkCoJgYv24Y9WOPzewP9cZ+h84e8RO1ACno2pA0lyagADV+s//yvCpc5Usd
         dvxBAxOQ4PDBlTcdiRhBdN4XmsS91P2rW+wkqtSUwtMN0wk7Bjo6j2nz0AJYilAXx8Yq
         0liDzgRBePKy3qYqV6E/WaexRuEnW8hD8edEvoKjeLMxb2qbdY4MQODd0z9BhOopghrI
         ZdBmXvBDcMCDaJ32hyCEXRjYxLmni1UFskDOYxYC+/V6ykBKHOqa4hYNA9FtlmWZlyN5
         UnCpwiuyeMQ+LwyGsJtyuFRhoMsf+Rf4np+JNzY38ZGHTn6ZnKKaXCutrtAaQ8O1UjiZ
         lk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VqmzPsRoQUtQQLCqBZaksSJCZdedraAjaKBqFxITMf0=;
        b=FiJn+fWFc6nsDwU+lZWdccQ7xCR90T0qufnPY4iqluyk9XYtPU120U51HRC+E8ogOj
         5+Oab9CKKuICTpaIWjsKj1OCwCtiMVL5cCOhSNE2q6qixfoAzaNB/8LF41CsDZ3ucbKh
         d6lFKuU4aasBDSyg56iZ7QvogBDdsKFGaQvS5n2zWyIEBF7S6zndvHVXoWepSqa2ggfj
         CuED621l3TfOaVNGlTN2mLjcKCjEQWu5G40knkLo9AHptP9bTn+cV+pJlOJez04dpPvK
         R50gpDsccnOdJNN5H4DUyURol1dJJ1K3/cY/cMbfxaZNLYtCmwg0VxLVivMmw/u1zuj+
         W5Ng==
X-Gm-Message-State: AJIora8omlkGEMHFVM/vvHe6WrCd8I+VLVH0Xf6ygMk9JIwyzVa6QiHO
        6z+Tc0KlNlYPaFWr36K5K+7ZU3NiJohKLeN9Fuu3qHZ5Yqw=
X-Google-Smtp-Source: AGRyM1vLldRzfJBxIPk3X5buyWrLNnStBvGVL8RiAnMbD2FCnu5GVC3c/94CrP+XUiDL5BR9sPQzj0WKVynUZ8o9yg4=
X-Received: by 2002:adf:e28d:0:b0:21e:4c3b:b446 with SMTP id
 v13-20020adfe28d000000b0021e4c3bb446mr3739209wri.300.1658370958022; Wed, 20
 Jul 2022 19:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220721090500.35774b43@canb.auug.org.au>
In-Reply-To: <20220721090500.35774b43@canb.auug.org.au>
From:   Ian Rogers <irogers@google.com>
Date:   Wed, 20 Jul 2022 19:35:45 -0700
Message-ID: <CAP-5=fV+Oo+__sWTgfqyVKwyr1FxYYSv9H6H72CgdQN_Jv1ZAQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the perf tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Ian Rogers <rogers.email@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 20, 2022 at 4:05 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the perf tree, today's linux-next build (native perf)
> failed like this:
>
> Traceback (most recent call last):
>   File "util/setup.py", line 31, in <module>
>     from setuptools import setup, Extension
> ImportError: No module named setuptools
>
> Caused by commit
>
>   ee87a0841aa5 ("perf python: Avoid deprecation warning on distutils")
>
> I installed python3-setuptools.

Thanks, could you give more details? Are you overriding python to be
an older version on the command line? What does "python --version" and
"python3 --version" show? Installing python3-setuptools should be what
you need, but I'm not sure why that's not working for you.

In any case. sorry for the inconvenience of this. Thanks,
Ian

> --
> Cheers,
> Stephen Rothwell
