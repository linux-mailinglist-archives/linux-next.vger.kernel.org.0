Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4946157661C
	for <lists+linux-next@lfdr.de>; Fri, 15 Jul 2022 19:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbiGORdx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Jul 2022 13:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiGORdv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Jul 2022 13:33:51 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5AF13E1F
        for <linux-next@vger.kernel.org>; Fri, 15 Jul 2022 10:33:49 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id os14so10192145ejb.4
        for <linux-next@vger.kernel.org>; Fri, 15 Jul 2022 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WfVY8tQkbJO6PFTeEdb3SLzVsb+vAJ4gu2cqddeKcwU=;
        b=WtFzaSIsuNUvPl7xOKFYOFPvsJouVmlPm4dcWspJ2KV0T8TEcZOUPwMlZTZin7eUzc
         M03B4Ba2wgC01WT86nG/RqZdmXFKRLM5KSi3IJZRPPITaaCu5osjkPul2SiUrgSPu0Ni
         WG2+1rfWIjUPk4hHmR5kQyiVAh5WGUhBY+kfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WfVY8tQkbJO6PFTeEdb3SLzVsb+vAJ4gu2cqddeKcwU=;
        b=4NGEMTVYXWHan68a1BpoB2hVLCEEJlCId318Ffd3fB5SzypIAoT2Jx/pJRL98fnwGQ
         cMKFb+9SyO+/3fPkYTaufETJcaardzsnAH695RphasMTCJiFhn4qMy8PbFJRfXKEoulD
         5PAlYaLqS9qLUPQyXl75jhzMYrNOKyNp7u2cb/5z0n6nu6pvuF8cLC9JD4ANrfm/L4q6
         5cKIdCZjfHxi2AzZil7fP+6DBk6zSEawT9WPBRTGAfmJYL+FHZyAMlUnHBopzt56D8Dw
         SCY/0zOOCCX6vJZ8w/dSmfX9v2CIlZR5syirZuRyajft/W5s6NJ1V5XSoVpHsT0tcYVj
         NWRQ==
X-Gm-Message-State: AJIora8Kxz44t/VxlLXsOhGrCbIHHk9rILQqClU3HNsVH8H4y/C5dJZ9
        WIFh4KWqAe2/ez5+tVVwiH/GiKw0YlE52JUc+n4=
X-Google-Smtp-Source: AGRyM1u5ioS9941IfH/soIeQbengwMxCHlJrS3rHMXVfs0Etve2XXgQHFbZLo8Gq3Co4uP0DjTOrRA==
X-Received: by 2002:a17:906:4fcb:b0:716:ddcd:d124 with SMTP id i11-20020a1709064fcb00b00716ddcdd124mr14799279ejw.488.1657906428170;
        Fri, 15 Jul 2022 10:33:48 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709060cc900b007263713cfe9sm2273802ejh.169.2022.07.15.10.33.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 10:33:47 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id bu1so7632151wrb.9
        for <linux-next@vger.kernel.org>; Fri, 15 Jul 2022 10:33:47 -0700 (PDT)
X-Received: by 2002:a5d:69c2:0:b0:21d:807c:a892 with SMTP id
 s2-20020a5d69c2000000b0021d807ca892mr13544923wrw.274.1657906426849; Fri, 15
 Jul 2022 10:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220715140259.205ef267@canb.auug.org.au> <YtDoqhuAt6Sv6qgV@ZenIV>
 <5614fbc0-509a-6341-bef2-8857f4fe610e@kernel.dk>
In-Reply-To: <5614fbc0-509a-6341-bef2-8857f4fe610e@kernel.dk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 15 Jul 2022 10:33:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjzpt7T+iuOd9pDR4Mkb+2SCoxi3H2uL+DTGTX+Ur5cGw@mail.gmail.com>
Message-ID: <CAHk-=wjzpt7T+iuOd9pDR4Mkb+2SCoxi3H2uL+DTGTX+Ur5cGw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the block tree
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Ming Lei <ming.lei@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 15, 2022 at 7:43 AM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 7/14/22 10:10 PM, Al Viro wrote:
> >
> > I suspect that it would be a good idea to slap
> > #define no_llseek NULL
> > into include/linux/fs.h for the merge window, then remove it (and all
> > stray no_llseek initializers) at -rc1.  Linus, would you be OK with
> > that approach?
>
> Not Linus, but I think that's a good idea as it'll reduce the pain for
> any new users added in other trees.

Yeah, sounds fine to me too.

                   Linus
