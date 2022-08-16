Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79ED5962DE
	for <lists+linux-next@lfdr.de>; Tue, 16 Aug 2022 21:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbiHPTKZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Aug 2022 15:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236893AbiHPTKU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Aug 2022 15:10:20 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0826A5E317
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 12:10:20 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id y3so14723969eda.6
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 12:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=yzrVpPuDYTxXMkdItXzTsS/x0cvNzj9XD0M7B64fKkM=;
        b=hRVUjFvYmNjBenxN26rM1xLF3lI5JQT01UB04cU3e6k+/745Td4UiuUQ7TZ10C3voN
         siR7BMzwAUZsTJpxsypPp+ZGfQt91NHSg6/aSDd4A5Kd6mL7hB/2C5qiNVvp0kFEiqpZ
         Ts68OOg3tm882msV1Ffr4efqdWvIqV5y5DDDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yzrVpPuDYTxXMkdItXzTsS/x0cvNzj9XD0M7B64fKkM=;
        b=kA6e42O7BcBPgf41wDR+DAbVbGR2k7GnBVvB7qvZij79WD5AZ+3pHecaEHkal32KYH
         sHjNKxhrL/pGrwlPYXeNKn2pkYct8vDThNStuIzZ+eLUC7HqOKdbcy9gdXWbu0iIYGS+
         HCn8Zc7ClySUnJumXxSu+vUYxQI7EP+DA6VoVHT3E4rbGA1tHviHTfPrFRtjvPVbKIoq
         hU+RApPSFTBX0diRUfD9bUJO+aSplLnM9HvCgkBGsWrE6yoV1/nOaLOd6jVeiVPtR3bs
         pVTwmnvJlzRXnKJQ77nOrTz7mH9AK+HGWP5irKtDVn9ZAoryw1cVzdA2y69ejlPQEqxu
         Gk1Q==
X-Gm-Message-State: ACgBeo3XJeeUtJrdbFQDeL82MdjnaoURgPrpwo0R1ZlNvDTKPOvCcguR
        Smy/Fv2gQxPVqM3SIVFIM2pwqBwhoAO7ekc3XPU=
X-Google-Smtp-Source: AA6agR7KPt1ca1LvYdxaFbrDES9uxHkbLJkwPHaUizXe+yV+zxM9HjIkQBtCwWIIb4G1PJs8Cl+FzA==
X-Received: by 2002:a05:6402:4241:b0:43d:a7c9:8b21 with SMTP id g1-20020a056402424100b0043da7c98b21mr20199856edb.374.1660677018366;
        Tue, 16 Aug 2022 12:10:18 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id ec8-20020a0564020d4800b0043e67f9028esm8833380edb.20.2022.08.16.12.10.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 12:10:17 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id bu15so5234205wrb.7
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 12:10:16 -0700 (PDT)
X-Received: by 2002:a05:6000:1888:b0:222:ca41:dc26 with SMTP id
 a8-20020a056000188800b00222ca41dc26mr11814187wri.442.1660677016516; Tue, 16
 Aug 2022 12:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv2Wof_Z4j8wGYapzngei_NjtnGUomb7y34h4VDjrQDBA@mail.gmail.com>
In-Reply-To: <CA+G9fYv2Wof_Z4j8wGYapzngei_NjtnGUomb7y34h4VDjrQDBA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 16 Aug 2022 12:10:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=u9+0kitx6Z=efRDrGVu_OSUieenyK4ih=TFjZdyMYQ@mail.gmail.com>
Message-ID: <CAHk-=wj=u9+0kitx6Z=efRDrGVu_OSUieenyK4ih=TFjZdyMYQ@mail.gmail.com>
Subject: Re: [next] arm64: kernel BUG at fs/inode.c:622 - Internal error: Oops
 - BUG: 0 - pc : clear_inode
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, regressions@lists.linux.dev,
        lkft-triage@lists.linaro.org,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 16, 2022 at 12:00 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Following kernel BUG found while booting arm64 Qcom dragonboard 410c with
> Linux next-20220816 kernel Image.

What kind of environment is this?

Havign that inode list corruption makes it smell a *bit* like the
crazy memory corruption that we saw with the google cloud instances,
but that would only happen wif you actually use VIRTIO for your
environment?

Do you see the same issue with plain v6.0-rc1?

            Linus
