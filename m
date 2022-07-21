Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5302157C3C3
	for <lists+linux-next@lfdr.de>; Thu, 21 Jul 2022 07:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbiGUFeH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jul 2022 01:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiGUFeH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Jul 2022 01:34:07 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD184E62C
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 22:34:02 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id bv24so671253wrb.3
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 22:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pLuaJ2LEb4NfU4vvBKr0ulQIYPO0Q2uVSE08ta5PpNs=;
        b=UZdKi+5jMjtx9+tlEyQBKQQStLl66JDK3Vo6Zre0xl3sBn+tCTd0AnzKQLMK7OKaO7
         UETWKRZ6WccUHsliHG3iMU/QyjZgVE3x3Voq9IJsz4ALn5J1PXfDGexPF6gvYxX+e6O+
         5SRA3GUPfQ9rZgrJhMo28Tzu0v2brHvFJtAaAesubUF/3kYO7mAmvTTJlaCeTgMKJwmG
         q/8UKggAJtVS77zDsEm4r65N8HnHW4LmhKkZ7Nx+5/PL4Pet6Z0YapXiWPVuXWiTTPH5
         ow62/wzkbCRZXEvAlTr9K5UhgFJ1IXnA6c1y7FX0Cmey6wVMpkib2LgtPBZy9ZEJEvmB
         rxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pLuaJ2LEb4NfU4vvBKr0ulQIYPO0Q2uVSE08ta5PpNs=;
        b=p+lKBE1fbhRYohEAafp4bDcxusiznOX8xlb5AUwe/PYWrrA5GtfbYfu9ruE1Web7ZN
         nMpJlqHgsTZYBBL9A2f3FtIo9+J+W4XFeXonvLrd9gGy75ghispdkZnczfKfzfbB0iWI
         64VFEnCeLDovOQialmcQ/xwv4z6zgx0Z2Kr5X98rdM1eQ7+rY/8YS49Y/ygrow0P97nt
         6hHO8WdalEyhZGSQVCe+B1rIg/RWph8BHzyUxe+094YEN70fEw9iGO6JXoUdzUxOCzGV
         Gmv6T982hFnUiXOPEKOTwS4j7Z8IxmZqS2duEgnvt++++M5psAIqmyGS5hBx8VwakNzE
         sfwQ==
X-Gm-Message-State: AJIora8TAB+MgQbfhQlstAeZWKF+QjjGTA9rgso4pIZuArVdZ8qdOYEn
        kjhmRhw8krG8dPoLVSz1nWMd77iMbongPNihpaYV9Q==
X-Google-Smtp-Source: AGRyM1tnX459j02NM7ciHe1lLHAJ6aHOObLD3951hy7Fq78xuph4pEBkFBpJ4hGor2tXgntNmnMQ3bUyJMO5YpKBr9Q=
X-Received: by 2002:a05:6000:1a8e:b0:21d:a7a8:54f4 with SMTP id
 f14-20020a0560001a8e00b0021da7a854f4mr33978134wry.654.1658381640252; Wed, 20
 Jul 2022 22:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220721090500.35774b43@canb.auug.org.au> <CAP-5=fV+Oo+__sWTgfqyVKwyr1FxYYSv9H6H72CgdQN_Jv1ZAQ@mail.gmail.com>
 <20220721135556.5443eff4@canb.auug.org.au>
In-Reply-To: <20220721135556.5443eff4@canb.auug.org.au>
From:   Ian Rogers <irogers@google.com>
Date:   Wed, 20 Jul 2022 22:33:48 -0700
Message-ID: <CAP-5=fXWH2Hm=n5YCaOL3cYys6UXQfPo3H3OeZKTOSvNQu64UA@mail.gmail.com>
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
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 20, 2022 at 8:56 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Ian,
>
> On Wed, 20 Jul 2022 19:35:45 -0700 Ian Rogers <irogers@google.com> wrote:
> >
> > On Wed, Jul 20, 2022 at 4:05 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > I installed python3-setuptools.
> >
> > Thanks, could you give more details? Are you overriding python to be
> > an older version on the command line? What does "python --version" and
> > "python3 --version" show? Installing python3-setuptools should be what
> > you need, but I'm not sure why that's not working for you.
>
> I am not doing anything unusual.  What I meant was "To fix this, I
> installed python3-setuptools as I did not have it installed before".
> It built fine once I installed that.

Ah, thanks for the clarification. We could do something to make the
remedy of this problem clearer.

Thanks,
Ian

> --
> Cheers,
> Stephen Rothwell
