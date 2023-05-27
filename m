Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDB9F7130C7
	for <lists+linux-next@lfdr.de>; Sat, 27 May 2023 02:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbjE0ADB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 May 2023 20:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjE0ADA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 May 2023 20:03:00 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224BCF7;
        Fri, 26 May 2023 17:02:59 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-ba81deea9c2so1185398276.2;
        Fri, 26 May 2023 17:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685145778; x=1687737778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCYb9wPXyJ/3oXy1yCdw5B+8RtjUO1MjS0Wu3M21DUQ=;
        b=oKcCgQRfKxioZHus4cbkMTbZ0h2JZqWlc5YdRqFRYDbvqayLB5EF5Tp4im5/hgr7YK
         UAPF/fYyuKkUm5yK/hCBXBbFRjVribyXG0TcdQW7R9dJ2BdrdGx228CIiWAVIn71HcUc
         wGBMAQbDJuwQ8nE5vnfi07/m9hPih//8/ZigxnOUMSqrZUlshcJ2UsGvfFUqVJqun4I6
         QzxxXSv5v/NyEba4v5SnfzT9p/3pTc3wuDy5IEOfVqtD4YySPM5i9/h5iM+s1jerpWQu
         M4EWBecQSlrGayDzuxvxeLXtZfidvTqKfPMttLaUEK8UkYZmBimWcooGKkDNNVWXDZqQ
         9+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685145778; x=1687737778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCYb9wPXyJ/3oXy1yCdw5B+8RtjUO1MjS0Wu3M21DUQ=;
        b=Z9Fk4PLK1Bw/YwJ9SYH3VQuq9clJDH2fZozO0RysfIGu7R0e8YY+SLXvuF9Z7Iv6SJ
         YR2y499MX0RTvBkkwEMLsH0S1/eb3QpZk+GLebOzNRgF0ez3keGsC7GddYO6HENcektC
         O0BmkeNmiXC2p9Qm4zIFMJ7WNCrpPVLxsw301EwYqV4l5bBHVgN1Fti17Fn6OlIs9ClE
         m3EM4aSG7dTRQQSSqZmIpci9uxCmHdW35ZnH2ibhlaqrjWnmIXLwpzADK9ktNKw8+zUG
         jPBBlBFhP8petVMGsPr76JdZLyHfwqglp+2X40zanrppkBO4iXC4GDKFv0JcBfec79OR
         /aow==
X-Gm-Message-State: AC+VfDz82fctn1fQ+ysPCbRRCJSAFm79yrELtDzgXlWVGA7//SpkhbJ/
        Su3/2Lauy0CFFkmJwbmH4eJx808foOMYsZvgPcWps7GKfbz5BQ==
X-Google-Smtp-Source: ACHHUZ55mKb9FFBN8YKKanHY3XxUX0onBjkJ9eiAieIHAx6sU+QTlxS2t3UFIeX1TssjgdbVoCVu2TbtbTX0tVRVf40=
X-Received: by 2002:a0d:d9d2:0:b0:561:e9f0:924a with SMTP id
 b201-20020a0dd9d2000000b00561e9f0924amr4006086ywe.28.1685145778280; Fri, 26
 May 2023 17:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <CADJHv_sedgbfxvZkKHjC6quKvxR+E54noFCVF93MvhyK6bwRoA@mail.gmail.com>
 <97ffe91e-bb31-cceb-fb7e-8f7a2252734f@kernel.org>
In-Reply-To: <97ffe91e-bb31-cceb-fb7e-8f7a2252734f@kernel.org>
From:   Murphy Zhou <jencce.kernel@gmail.com>
Date:   Sat, 27 May 2023 08:02:47 +0800
Message-ID: <CADJHv_uXXVdog0GsFCTd+eouVAuX_wT9NRKJeUUqfZNvz34b0w@mail.gmail.com>
Subject: Re: ioprio_set can take 8 as the PROCESS CLASS_BE ioprio value
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     linux-block@vger.kernel.org,
        Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 26, 2023 at 3:42=E2=80=AFPM Damien Le Moal <dlemoal@kernel.org>=
 wrote:
>
> On 5/26/23 16:27, Murphy Zhou wrote:
> > Hi Damien,
> >
> > Since these commits:
> >
> >   scsi: block: Introduce ioprio hints
> >   scsi: block: ioprio: Clean up interface definition
> >
> > go into linux-next tree, ioprio_set can take the value of 8
> > as the PROCESS CLASS_BE ioprio parameter, returning
> > success but actually it is setting to 0 due to the mask roundup.
> >
> > The LTP test case ioprio_set03[1] covers this boundary value
> > testing, which starts to fail since then.
> >
> > This does not look as expected. Could you help to take a look?
>
> Before the patches, the ioprio level of 8 could indeed be set, but that w=
as

Before the patches, it can't be set to 8 because the check in
ioprio_check_cap refused it.
   >=3D IOPRIO_NR_LEVELS
Before the patches, the value can be greater than 8, so it takes effect.
After the patches, the value is limited to [0..7], this check always passes=
.

> actually totally meaningless since the kernel components that use the pri=
ority
> level all are limited to the range [0..7]. And why the level value 8 coul=
d be
> seen, the effective level would have been 0. So at least, with the change=
s, we
> are not lying to the user...
>
> I am not sure what this ioprio_set03 test is trying to check.

I guess it is trying to make sure boundary values do not cause uncertaining=
.
The test case can be updated according to intended kernel changes. So does
other user space applications that may depend on this, or there is none of
them to worry about.

Thanks,
Murphy
>
> >
> > Thanks,
> > Murphy
> >
> > [1] https://github.com/linux-test-project/ltp/blob/master/testcases/ker=
nel/syscalls/ioprio/ioprio_set03.c
>
> --
> Damien Le Moal
> Western Digital Research
>
