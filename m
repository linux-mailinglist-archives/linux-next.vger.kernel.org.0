Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1C07C8142
	for <lists+linux-next@lfdr.de>; Fri, 13 Oct 2023 11:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbjJMJAG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Oct 2023 05:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbjJMI7r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Oct 2023 04:59:47 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D030CD70
        for <linux-next@vger.kernel.org>; Fri, 13 Oct 2023 01:59:07 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a82f176860so925007b3.1
        for <linux-next@vger.kernel.org>; Fri, 13 Oct 2023 01:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697187547; x=1697792347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LY9spmJrhcOezy2EjPWsMY6rVJufts0+wxcGP0sGlYI=;
        b=AiPANlXzCoSslBxJ2arU/hPyY6BUmFU4HJnx019WrU3R7GIR1MSN2wgnx3w7ij4hNo
         2wWNhl5MxU+mgjpiZqaDmuILzmy/9ocgaKLdLkqF6f+wrRf/H+CFf2K/BzQiK3bc0VDs
         cX3XN6N5aQjDCF9j0Pjqokk5XukA8cKZ0S4Ebw0S+g4jOHvIIG9rM/LTz3vNfuD6x9NZ
         9H5ILwwMDySs1Bzc0p60yOi0fLZ24/sQslxxizbes6EO6+bkaaztn7LuJP1cIQAoDb2H
         27X/QPBxTuGoikhFexresRoSLUV0TFSRUIlNgsfOIzKiXH+0unI+AtGBMM2Un7PlGmFx
         ibxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697187547; x=1697792347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LY9spmJrhcOezy2EjPWsMY6rVJufts0+wxcGP0sGlYI=;
        b=E5vOOwyrLmhBBjUqp4CLWWp5RedGlR/nZGqSFjvPO4670fF+uIcl7fvZZEr7BkkplX
         eudsE5knwWikU+aJsbCd1AItENL8lcDtwZBJlHSDmhtax8zHpd8QQrd9gPG3IQo3XcAf
         WYex2oHwNTcnDqlO9iR4+56YgNzYP1J6XV4pxUPQi1NcWwe1YB59kFX7Y5RA9w4bkG5W
         lSop2/VGvME7bCtqbcWSNnIS8XeObiWOv5L0wnGDFej2clEkGobKgsO+WsUjLcLohnro
         ciBppm7niBxTyJ6JsvT/BABQRsaSgdwO0mUTlZOWKarLiMk/56MnKpxFHIb0gz/EWeTp
         yCng==
X-Gm-Message-State: AOJu0YxywOb1QZSlr7BIa6sA51yFAWPNkKVWAbMNVZhhUjQWQMqhIExp
        E/Ap37pV+U8u5huoWecAhk3Bka38JQmdDFeef8QcEQ==
X-Google-Smtp-Source: AGHT+IEx/g2baPtRzVkYptZrt4pvcenqNurbUliCbZGYsbmlVWe/i8CjsRgluV6GGCEed3Bk+Wr5X4mGUPo1KVgu6Zc=
X-Received: by 2002:a0d:d549:0:b0:5a7:c8a9:79e8 with SMTP id
 x70-20020a0dd549000000b005a7c8a979e8mr10254784ywd.4.1697187546823; Fri, 13
 Oct 2023 01:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231013091831.60a032c2@canb.auug.org.au> <CACRpkdaEVUfFg-O53NBiyWPsjx0VZVMKK7o2ikUMSCy0_AJUGQ@mail.gmail.com>
 <CAMuHMdX3LXZiRRAHSb1FU6nrgtPnyewbUwp7R9Rw2zbxziYz7w@mail.gmail.com>
 <CACRpkdYNRyL-hywayP97PsLvhEk_Dm4HdnYHHo9N50GXMuxWCg@mail.gmail.com> <CAMuHMdUSirm9mxjRMEh3uBeo71smOwKfuvmSrq6TauCs664mmQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUSirm9mxjRMEh3uBeo71smOwKfuvmSrq6TauCs664mmQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Oct 2023 10:58:55 +0200
Message-ID: <CACRpkdZPOoGkauvQkozp-B3Vi3J7Z8eNvncRYOpF9zMmMyXt5A@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the pinctrl tree
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 13, 2023 at 9:37=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:


> > > The only difference is your added SoB?
> >
> > No, I'm not that vain...
>
> I don't see any other difference, though:

The difference is not in the commit, the difference is that the merge
commit is not
there, so it is a commit on top of my pile instead of v6.6-rc.

Yours,
Linus Walleij
