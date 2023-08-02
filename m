Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF3B276D099
	for <lists+linux-next@lfdr.de>; Wed,  2 Aug 2023 16:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234492AbjHBOuO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Aug 2023 10:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234471AbjHBOuN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2023 10:50:13 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB4FE43
        for <linux-next@vger.kernel.org>; Wed,  2 Aug 2023 07:50:11 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bf3f59905so805596566b.3
        for <linux-next@vger.kernel.org>; Wed, 02 Aug 2023 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690987809; x=1691592609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCYYmzNqtzxNv8UbxN3uv60kE4E3C48+cD2+0APdVk8=;
        b=lRZYtjDheibM8ACJPzTInMwsWUg3Pql6i36ylhajcCXvOPRnTi7Xpy9LN3kQEnsLrA
         erqEyS6qmPtsc358kXKc6rkECfMjmWZMalO9kJNBbE9VgagwO6DDiLiXIVIgdJ57tOoF
         9W4JQPq40N5B5fypy47M5oI8OWgWBwqbr0xDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690987809; x=1691592609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCYYmzNqtzxNv8UbxN3uv60kE4E3C48+cD2+0APdVk8=;
        b=Si202g3JzaA6u4kul3bmkFbbg8+jwbcLPFQLVtKj0CVy5O8AGPaUJ5ft85i/mVwPoo
         vmr4ZiiQyRS25I6KNjLYkuAvU1/11GGmc5yDdmElxFLqTWtjaXBbASQ/exXDNzr7Q9fp
         rA+qysX6cLdsiStft1KiU8WsWxWSPG1VJfBzoAG2mOL+OoO5u0kkv4HfZPBMxKkLpjW2
         AM40I2CZtJpYQeFXgJ8MAKHiYTgixx+lh4xymI5h02m4J2HV9PnBptg9PP/uH3D+mZzb
         y6b1LBASKfgsWf+V6spJ/sIfolPFR7CzYr3YbCpRQ0fq46FcKAt17PmSKGvzSpsMMloi
         B39w==
X-Gm-Message-State: ABy/qLZWioWMvRpZW22GVLn4e9hwji6VVQqj81P8vwJhtCDFZyUB9DCx
        M+Cccysv4blt1K+L+vMviNJ1E6TcrqjlO+2uc6nyDY4n
X-Google-Smtp-Source: APBJJlGmMWCSjK69Gfs16aD4r6cG8GQ+jgBW2My9qUy81KR6yanadXofBbjz59uoUyCa3BiSvjXucw==
X-Received: by 2002:a17:907:2ce7:b0:98d:76f8:217b with SMTP id hz7-20020a1709072ce700b0098d76f8217bmr5181486ejc.73.1690987808803;
        Wed, 02 Aug 2023 07:50:08 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id v5-20020a170906564500b00992e4d8cc89sm9263509ejr.57.2023.08.02.07.50.08
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 07:50:08 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5223910acf2so14245a12.0
        for <linux-next@vger.kernel.org>; Wed, 02 Aug 2023 07:50:08 -0700 (PDT)
X-Received: by 2002:a50:d70e:0:b0:522:203b:c348 with SMTP id
 t14-20020a50d70e000000b00522203bc348mr412547edi.5.1690987807863; Wed, 02 Aug
 2023 07:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230802142136.0f67b762@canb.auug.org.au>
In-Reply-To: <20230802142136.0f67b762@canb.auug.org.au>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Aug 2023 07:49:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XEbpuMb4FvDkVkkX+Btig4eFnNrp5LWs+rQJ9Sy3wg4w@mail.gmail.com>
Message-ID: <CAD=FV=XEbpuMb4FvDkVkkX+Btig4eFnNrp5LWs+rQJ9Sy3wg4w@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Tue, Aug 1, 2023 at 9:21=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>
> include/drm/drm_panel.h:270: warning: Function parameter or member 'follo=
wer_lock' not described in 'drm_panel'
>
> Introduced by commit
>
>   de0874165b83 ("drm/panel: Add a way for other devices to follow panel s=
tate")

Thanks for the report. I've posted:

https://lore.kernel.org/all/20230802074727.1.I4036706ad5e7f45e80d41b7771642=
58e52079cd8@changeid/

To fix this one.

-Doug
