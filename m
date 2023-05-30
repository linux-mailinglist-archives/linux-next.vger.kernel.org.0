Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B92715386
	for <lists+linux-next@lfdr.de>; Tue, 30 May 2023 04:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjE3CRK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 May 2023 22:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjE3CRJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 May 2023 22:17:09 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7283CDE
        for <linux-next@vger.kernel.org>; Mon, 29 May 2023 19:17:08 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3f6c6320d4eso311741cf.1
        for <linux-next@vger.kernel.org>; Mon, 29 May 2023 19:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685413027; x=1688005027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCd8A6+3IGMfG7RQWMiqJwf4Gzf+IgYaeXtS7a4feCI=;
        b=LzVWZQ+z+GwxTgKPK5mFSi/IgncNwmvJoZziKMNZksF/g6G2PgK0bzjxEIEpeXSN6D
         8OS+i8d2W532Xk+2OF6JgSV0Pc3YIFyhJczfbcGCFap9RXPI5HkHOPEC3PCOlQiQEqMx
         Uxe3GMpt4Q2hw3bm8An8FklLUvrhH9QNT4oxeKjjRhkZSBfzgUWtDOmw1lcBp42AHg6q
         lQ/AsbT+eD/XG5clAnHZ8KbZC3uqIXyrEup5J1uZLN/yKw8UZG1LeeiFXPDJYYo3M0It
         hnhVJ6qQujTSdTbhgWo5ZcH+oDWccPEHWTsJui71h1Mw8s6F6WVRk8OzqA8d7rA1B0kp
         0Gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685413027; x=1688005027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCd8A6+3IGMfG7RQWMiqJwf4Gzf+IgYaeXtS7a4feCI=;
        b=Vr4tU0w+OQ8NxzhT7rBvByKmiPyLDqHwtLBnTg7hiwmIYsXDOPwyGY5kiA3O4OxKCp
         XZacTfSr5ZMS6pHd3QGN27/yN0LzMlnTiC1tFUbnLR4He8kVQI6k62PHIbJBOV+xNHqY
         aiQRYd/SgxLh72ZVYXaCB/3VgEuJrZWX06P2yLb6GB5NLUKJBgWZIdEvv28s3jzrpXmO
         lsVitYoC9wvVNsGnkz0lS3qsWFkA0zDSG7WrmqFjwWGmMAcw2bjZIN61NRdWfhLCj9ji
         qaiKQA8azLPJws5Q3G/hfkp5dOUctzwXRQRyhOki7xb+Pdng7zPeDE98COc/jFbIm3QA
         f4wg==
X-Gm-Message-State: AC+VfDylAuT90bsXtbj1veQZVHy1Ok8b7s4bNj1RdmBoQNaneqIyBHsh
        FH28HTqNRGE/4zw5yGMmFoUB0nD/GwTUwIs3z+NGAw==
X-Google-Smtp-Source: ACHHUZ7B3l7zFW68ZasVyf/oDmTGu2WANcTV1dVtzykLfoXkfsTLicAhIB2XNgScnQAj23X8eOA3nUqd1Wp5VjB9AEk=
X-Received: by 2002:a05:622a:24a:b0:3f2:1441:3c11 with SMTP id
 c10-20020a05622a024a00b003f214413c11mr49067qtx.2.1685413027478; Mon, 29 May
 2023 19:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230530090525.43a8d23e@canb.auug.org.au>
In-Reply-To: <20230530090525.43a8d23e@canb.auug.org.au>
From:   Ian Rogers <irogers@google.com>
Date:   Mon, 29 May 2023 19:16:54 -0700
Message-ID: <CAP-5=fVdM0mgZpdgZBMUEvxyfGjPw65_-b_Pj5yLZN8Ddp1a8A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the perf tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 29, 2023 at 4:05=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the perf tree, today's linux-next build (powerpc perf)
> failed like this:
>
> arch/powerpc/util/kvm-stat.c: In function 'kvm_add_default_arch_event':
> arch/powerpc/util/kvm-stat.c:207:21: error: implicit declaration of funct=
ion 'pmu_have_event'; did you mean 'perf_pmu__have_event'? [-Werror=3Dimpli=
cit-function-declaration]
>   207 |                 if (pmu_have_event("trace_imc", "trace_cycles")) =
{
>       |                     ^~~~~~~~~~~~~~
>       |                     perf_pmu__have_event
>
> Caused by commit
>
>   1eaf496ed386 ("perf pmu: Separate pmu and pmus")
>
> I have used the perf tree from next-20230525 for today.

Apologies, the function was renamed to perf_pmus__have_event. I've
sent out a patch and confirmed this was the only issue on a cross
compile build with "NO_LIBELF=3D1 NO_LIBTRACEEVENT=3D1".

The 1-liner fix is here:
https://lore.kernel.org/lkml/20230530021433.3107580-1-irogers@google.com/

Thanks,
Ian



> --
> Cheers,
> Stephen Rothwell
