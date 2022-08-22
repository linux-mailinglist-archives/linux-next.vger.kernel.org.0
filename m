Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A398D59C43A
	for <lists+linux-next@lfdr.de>; Mon, 22 Aug 2022 18:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237029AbiHVQe2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Aug 2022 12:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237030AbiHVQe1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Aug 2022 12:34:27 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA70E419AA
        for <linux-next@vger.kernel.org>; Mon, 22 Aug 2022 09:34:23 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id l1so15519948lfk.8
        for <linux-next@vger.kernel.org>; Mon, 22 Aug 2022 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2vQSeG17lzwccuXXheDklfdz+rvEzFZchuxcxOfWA70=;
        b=QS+1k7+PE+rePGoe9S3/Sv5bzXx+MhKRdXlXZFyr/Fbt5c6Cz9Zaanza+Ak1wKazBk
         m/rIfz7sa8ff2z4xpc0om5KqeFWYh/69V8JYMeB2GHSkRL7O9KD8hncg+smlKcyWWVPT
         MqFz/Ce4uMUr1qiCsX2rfd2wEeDM899inOCWguVFSAHBHudGjIfswLuaL70NbPhh6wak
         eStexTI6QP7EpgiA3CHeM8D1rfdZiMDqMUNmbiNeMo+s5hO0ktzSywOJxF751Wa/eKMR
         do7TXBX3bO0L16iRgPQ1jbgVrKwlcLIreT0U2UkFsZhZ5rRebQfMNqFHxKluHLm67odY
         uBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2vQSeG17lzwccuXXheDklfdz+rvEzFZchuxcxOfWA70=;
        b=zCVVIeJobGHvH8Nga3A7yqZM+VH+3PlaWLbpBYqBsvZncGnhTS+VM8ClaSTQ0RKuOJ
         XgbNVl4hDjUepzZ6Qg9Xs1x5I1VIpcsmCuhShjOQB2DJOGM47w4QOC5Jt/6pQn56L5rM
         tpkCjknvd747nxLA9E1nhVDzV79mdqPnw1OLID6v+MXAgQjGghvIbm/6IcKCEyVfo1Tl
         JABx8bskUiA/yjtGij6AdwphdxaEbhNdVI8Uf2xyU82DUfgCa7JNvjKtfSSUyss3eLT7
         S+ufzjZqKs/qogSX9HQ+ia5QrG/ahJrLCHkxTBkLBCbCYB6WBpOxGeSn+IMLtSyJ8zpG
         iCdg==
X-Gm-Message-State: ACgBeo1xGKimom864xeZh+Dc3/4AGA5kUi9+3MR/p912xFJpMqpD0ACU
        nAmGrRGCkrI1Aask/Fd++mpeNK0MweMpgsSqaVNURQ==
X-Google-Smtp-Source: AA6agR5wdEQEK+Retm/u5BnbwMryz3pxZ3P0il+KFDxb5lpW/sWxxXD0EVQECkE4rzxIJGgJ1jK/jYaZzrJSAyb58/M=
X-Received: by 2002:a05:6512:2356:b0:492:e06d:7530 with SMTP id
 p22-20020a056512235600b00492e06d7530mr2582685lfu.103.1661186062033; Mon, 22
 Aug 2022 09:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <YwNMUlAmu/qCjuva@debian>
In-Reply-To: <YwNMUlAmu/qCjuva@debian>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 Aug 2022 09:34:09 -0700
Message-ID: <CAKwvOd=9ozTdeYDWzY0i-hrD4Vew5qPAcamx6wo_Y7PA+nCYBA@mail.gmail.com>
Subject: Re: build failure of next-20220822 due to 4e6bedd3c396 ("ASoC:
 codecs: add support for the TI SRC4392 codec")
To:     "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc:     Matt Flax <flatmax@flatmax.com>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 22, 2022 at 2:28 AM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> Not sure if it has been reported,

Hi Sudip,
Thanks for the report.  Two ways you can check if it's already been reported:
1. Check our issue tracker
(https://github.com/ClangBuiltLinux/linux/issues), you'll see that it
has been (https://github.com/ClangBuiltLinux/linux/issues/1691 ->
https://lore.kernel.org/all/YvvbKry5FVFbNdcI@dev-arch.thelio-3990X/)
2. Search for the warning message on lore.
(https://lore.kernel.org/all/ -> search for
"sound/soc/codecs/src4xxx.c Wsometimes" ->
https://lore.kernel.org/all/?q=sound%2Fsoc%2Fcodecs%2Fsrc4xxx.c+Wsometimes
and you'll see two reports from bots and two from humans).

> builds of arm64 with clang failed to
> build next-20220822 with the error:
>
> sound/soc/codecs/src4xxx.c:280:3: error: variable 'd' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>                 default:
>                 ^~~~~~~


-- 
Thanks,
~Nick Desaulniers
