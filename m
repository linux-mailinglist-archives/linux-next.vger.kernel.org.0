Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1556A6461
	for <lists+linux-next@lfdr.de>; Wed,  1 Mar 2023 01:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjCAArW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Feb 2023 19:47:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjCAArV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Feb 2023 19:47:21 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1736D313
        for <linux-next@vger.kernel.org>; Tue, 28 Feb 2023 16:47:20 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-53852143afcso324446067b3.3
        for <linux-next@vger.kernel.org>; Tue, 28 Feb 2023 16:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677631640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZNLOOA6V1FdxYxKlKVOuSG3jgXgKeynJFdP+l7+9c8=;
        b=Eb+4HVoRD0pk0/B8LuleRXJ71ijsmdJyUYHoNufWB1H38IxH5fayfK/bO+rYZPH7/D
         efecLxnHQDAUT1SheYjVDOc9ffrUXTXqKybPzl60jQ3/CQ/gc+plVHlRed6oSpIHRP7a
         O8HyV0RnpBbmKxsURR3+WzuKrI5QlvoviaZITYjQbVgFmCg03L9SoLUcIWnh5kNdOolI
         wmOozhp4VX45lDqv3UVDp3APEOjDEK5q4VDU6FS/DGj9gDIIuD25lHgVTC9X5hxndtVn
         2sZOePdqKU3PXUedPVqVoRH+XP/lz8ymSGOYauSvB2Vw4xqVOwcgoOZduIpIKGxYuPPz
         6b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677631640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZNLOOA6V1FdxYxKlKVOuSG3jgXgKeynJFdP+l7+9c8=;
        b=4k/35TYiKrQfdAiuQhWcV0TUSWCfa+jU4jDl/wwwPOUjeYfO/wJERgqt9qNtM1i3M2
         buAXccDalC7HTw5Wp50d5NZCng9IYFB10fJtmHJw1spsf2z2QCMmV62b3nIGxvTZUxIi
         5YtRIFVCCEA0zSC+7r4t8F6PbbAg7RRhZ8cI3/MQdJLpu4zFpFBtK6GuU3i8FMw17TNz
         DJKqrTL/Smcr0uisRebUX9C8T5/YGVexykeeaOi7eaf1zMB1iVh6bVc15xQgxCZ5Irfs
         HZ7vM2i2hyhecyvPCBUSPdJblGOECZdQxhYBCC8dclSIsgLAoh+tAvXpHHm6CodijMI9
         oawQ==
X-Gm-Message-State: AO0yUKWpFIsjgBwcXjU8Jokl7Et5fUqkmp2Ffr7Nfgt8M0BCpXDyYuMY
        2shwOL+ArvrHd9Id+Oo9w1aURy4DzQCoepKwnDqnag==
X-Google-Smtp-Source: AK7set/J07DdqF0aPjuy1pHng+YWhh80fytCyJrcSZqCyhBuJplJU0xIIwTBLG3t+583cxXsFeu+Le9Qib1HiRh6iQ4=
X-Received: by 2002:a5b:e92:0:b0:ab8:1ed9:cfc9 with SMTP id
 z18-20020a5b0e92000000b00ab81ed9cfc9mr1507985ybr.6.1677631639744; Tue, 28 Feb
 2023 16:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20230301113648.7c279865@canb.auug.org.au>
In-Reply-To: <20230301113648.7c279865@canb.auug.org.au>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 28 Feb 2023 16:47:08 -0800
Message-ID: <CAJuCfpE8QwBDxRSY_dCNhias3s7K4bNoyUV6e4Ye6SU_qyYbCw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the mm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Tue, Feb 28, 2023 at 4:37=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
>
> include/linux/mm_types.h:1105: warning: Enum value 'FAULT_FLAG_VMA_LOCK' =
not described in enum 'fault_flag'
>
> Introduced by commit
>
>   5827f16cffd6 ("mm: add FAULT_FLAG_VMA_LOCK flag")

Thanks for the notification, Stephen! I'll post a fix for this later today.

>
> --
> Cheers,
> Stephen Rothwell
