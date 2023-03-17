Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8AF6BDF8C
	for <lists+linux-next@lfdr.de>; Fri, 17 Mar 2023 04:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjCQDYL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Mar 2023 23:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCQDYJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Mar 2023 23:24:09 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488A730B03
        for <linux-next@vger.kernel.org>; Thu, 16 Mar 2023 20:24:07 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3179d0e6123so546365ab.1
        for <linux-next@vger.kernel.org>; Thu, 16 Mar 2023 20:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679023446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCSqGOebHu9n0+LN2hjA/D9CVT3lWroxcYCRN+ofeiQ=;
        b=rHQzdoi2CX9fQW340JoiFV/kpUBw4XktPqgu89JP3yjO4oGcmTVQBOiACKzLdUlqF+
         mT2cSicfgi+Gn2ZSP35qt6U3LR6SwQndxkRKNaMXcNRYmW+cOWZ+Tz1B/a1v5ftsoiwh
         +zNQ3b51dAt47ONi2TpJIxrVRY+QDZUM8mBrEyHx98fFgtxN4M4US/V/pT5H+Y9We1nF
         ETHAfEMphFlbPG60i2kU/ZjTYCp5vqgvQKqe1ysbA6wzN9nl+4bA7oqPSOdy4a743ddR
         d6oWBkwy59Qr2YR1EeeRHPlhJ6hWPY0jOJzWDbATlhrLcQstsIOO3neCxbcxVC394EID
         oFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679023446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCSqGOebHu9n0+LN2hjA/D9CVT3lWroxcYCRN+ofeiQ=;
        b=b0UptemSWIwjkDze7n0QDNWrX9wcC0A9iK39uM+e1vuXNe5OsotT1P7cZHrqRqvfSB
         mzMb3cYLnfFUXJtz+U/tBPrRrgdiPCcD4bF+irVPGWfeHXz0aXuvoeo0/aEftenMJFZH
         DEOKeknZqQXhlcwcIubacbYVbHCgi4FNvKRHji4GELtY7nL6C6PJgsZ74ZuGA0F8VQXi
         h+Z/uOEiqrw7TsZAMyP36iLSkkUaSif2Um2ObY1MdM4FPXY8LNgpsnK+fTsKB0hnZYJs
         hHWvW6jmCMKtAuKOAJ4nyBGNkunZjpzS1Aq8r2YjySXLWEd1ZRt3OV/nZxgTYsjtmgEu
         4ZwQ==
X-Gm-Message-State: AO0yUKXtybb2iMRV10M9RovXufPWAgIzCcTQhJ8Ce8kmv5F+akErHJsX
        0EbeLR8HTKgQ4dH/HFIHHxYrjEiI6vGAKFxN0jeleg==
X-Google-Smtp-Source: AK7set8fy1ymfsgvlr9vEFIjHhSd8uxk3XJxK49NVVJzHl/PPrc60KC3nHEcL1q76E1x0k7Xt+TBhYxqkdMC9FClvzk=
X-Received: by 2002:a05:6e02:1bc1:b0:322:2970:1950 with SMTP id
 x1-20020a056e021bc100b0032229701950mr201121ilv.8.1679023446246; Thu, 16 Mar
 2023 20:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230317095025.49aa34f9@canb.auug.org.au> <7D15C431-1AB6-482E-B4B9-289A15C0E2E4@gmail.com>
 <20230317105513.591a6383@canb.auug.org.au>
In-Reply-To: <20230317105513.591a6383@canb.auug.org.au>
From:   Ian Rogers <irogers@google.com>
Date:   Thu, 16 Mar 2023 20:23:52 -0700
Message-ID: <CAP-5=fXzFUjbHE=qX89QX-CquT46L9-EcGEJ2L2--1k3ZMF_VQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the perf tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        namhyung@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 16, 2023 at 4:55=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi Arnaldo,
>
> On Thu, 16 Mar 2023 20:11:11 -0300 Arnaldo Carvalho de Melo <arnaldo.melo=
@gmail.com> wrote:
> >
> > Can you try adding NO_BPF_SKEL=3D1 to the make -C tools/perf command li=
ne?
>
> That made it build.  Can that be automated, or is there something else
> I need to install to make it work?  Or, at least can the error be made
> more informative?

Good idea. I'll look into a feature test to cover this. For context
the change that altered the behavior was:
https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=3D=
perf-tools-next&id=3Da980755beb5aca9002e1c95ba519b83a44242b5b

Thanks,
Ian

> --
> Cheers,
> Stephen Rothwell
