Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E44071FB68
	for <lists+linux-next@lfdr.de>; Fri,  2 Jun 2023 09:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233979AbjFBHzM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Jun 2023 03:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbjFBHzL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Jun 2023 03:55:11 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99CE195
        for <linux-next@vger.kernel.org>; Fri,  2 Jun 2023 00:55:09 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-bad041bf313so1836369276.0
        for <linux-next@vger.kernel.org>; Fri, 02 Jun 2023 00:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685692509; x=1688284509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfUTeseUGXEEUlE30OF+/5HbrcwjUvFpA3eoy6gM8VI=;
        b=ZFlwsKfrtKv8nccTW1ynyV8Ow1ttp5teJzkXQqFDVFbzU5zcK8pXygenJNEoeHzGgE
         0WVbf+x9hNbKUq4RvsB54cBUtl6NIbGPlDNkcvkzrg32MriRs06PDBe4o8PjGKpJGjcA
         K49LGL7PqWy4ZcQ8K4FJLWsg5m+X1at6jjt1H+KZHJTfemVoSxwPlPNsoTugBB2osxU9
         v90OeJ6acyId+RUb8ptLhrDp2jdE6Z0g3bGC+/ODOqdKqvpLlbA3QjzkY0Vlmn5oNbz+
         DGOkXlcCHw6EGTY8xcwss+HEmQJkc5v31rjFWzen9UySKWUC36nOSiA8v2AKVD7bcwZu
         3mEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685692509; x=1688284509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfUTeseUGXEEUlE30OF+/5HbrcwjUvFpA3eoy6gM8VI=;
        b=CcupNVogjDOBBITxN9jhoeBD6w68ys3JPqR50zFbVbUYOEI9zMciFJfCPSIZoTyEgM
         gxPMsBMziIGic3BEM0hoGzfYUhTPNWkHLT8lCobCT9HZP94Be4N7nOtAEnUYZwzA236Y
         BKsDnj446u20cKBKZQu2I3bpxprDwMYyZ8T8ZnSp0NwPaZPlWr1KOohGVkxyvnb8fmjZ
         FxlMuxhutURVUcqZsLnBvbUYxHgmhAxj8FE/CCcO1K42vXUM1/GR7llETUX7XaaFmt8G
         Y6BtwmiVRBRnItS+arL3jOsOXV+cvKXJyYezUmbLJJAg4u7t460AFDgALC6pszlLAGHr
         lZeQ==
X-Gm-Message-State: AC+VfDyVyuO4QZNmL6AqmgPVs++7xHIe5YliYoHZAnS1TLPxZmUZ9T5J
        R0YmO/Xh6eW5r/e2d7HKUnTFIzG1asiPkT2jjdmHEQ==
X-Google-Smtp-Source: ACHHUZ6F88rYHkPZ5pZUyNKTBuTY7mjWeiff1zNz44DIPqV7wFX50tv4KDwlV+F76YHpIJsf8SZMWHJq7WuKLygNZaQ=
X-Received: by 2002:a0d:f5c2:0:b0:568:d63e:dd2c with SMTP id
 e185-20020a0df5c2000000b00568d63edd2cmr9001174ywf.11.1685692509051; Fri, 02
 Jun 2023 00:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230602132654.4497f896@canb.auug.org.au>
In-Reply-To: <20230602132654.4497f896@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 2 Jun 2023 09:54:57 +0200
Message-ID: <CACRpkdYua8NfFYYDCpDoggu3P34DQu=QdYR+2UuqO1uL2rdkmg@mail.gmail.com>
Subject: Re: linux-next: duplicate patches in the char-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 2, 2023 at 5:27=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:

> The following commits are also in the arm-soc tree as different
> commits (but the same patches):
>
>   b866e7e7f995 ("misc: sram: Generate unique names for subpools")
>   ca3222ac4477 ("dt-bindings: sram: Add compatible for ST-Ericsson U8500 =
eSRAM")
>
> These are commits
>
>   21e5a2d10c8f ("misc: sram: Generate unique names for subpools")
>   38bd22dac71e ("dt-bindings: sram: Add compatible for ST-Ericsson U8500 =
eSRAM")
>
> in the arm-soc tree.

Hm hehe I was a bit confused, one misc maintainer (Arnd) merged the patches
to the SoC tree, and another misc maintainer (Greg) merged them to the
actual misc tree.

My misunderstanding that this was handled through SoC like drivers/soc.

Arnd can you drop this from the SoC tree?

Yours,
Linus Walleij
