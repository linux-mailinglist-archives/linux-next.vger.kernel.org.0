Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895447EAB0E
	for <lists+linux-next@lfdr.de>; Tue, 14 Nov 2023 08:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjKNHrM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Nov 2023 02:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjKNHrL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Nov 2023 02:47:11 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4E219E
        for <linux-next@vger.kernel.org>; Mon, 13 Nov 2023 23:47:08 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so5142305276.1
        for <linux-next@vger.kernel.org>; Mon, 13 Nov 2023 23:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699948027; x=1700552827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VR06ltxFQEdp1reUSvUvds1lIfSzzgfu3vrbiPXH7+I=;
        b=kXt2VNIHx26hXq6Y520cYNl458hxr5jAt5obQiAoqpnyUxNKBiPP4MWn9xZummEQI5
         zuTMaqQODtJ1LEDB/b9G0nCJh5bkMK6RXOF/I3CYwOAgytJEnc1VCnEAexteXwf62F35
         rD4LPPELpo6ylDa4x+2XjPHLPzncxBgP27CHZpTJEGSkSY4xZMTGJlWN07uTR5BNjWC5
         mjz1seu9WzvALgZPN3Bv+53Sns6JVKLskMbN0ZvRgfBuPyP9ZPAg7DQlR0xzev52IMT+
         TtGL1vthWM7rZmbcF52ysV/nzTQZSLJQtc/FKzYe1Kdu/HPaW95De3MuSuetXD3lopjn
         wDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699948027; x=1700552827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VR06ltxFQEdp1reUSvUvds1lIfSzzgfu3vrbiPXH7+I=;
        b=QalPpW+sXGAjxta86llq+SVmx2YpXiAK3uY737RXkXnFh+pqCJorFIsYNLkIASdNZK
         Omej18Be0ReFG/pXJ65n/+cXYgGvH9i1LpLNlq8hYLnNICY7PGjAlwanomKqCDzs0UNZ
         NG7meEdFWOrOFGjDT4rFP/eKEb9s2mM6yHgGG8pje8evpgQ5iBPOPwN2uGBrY7Lwu8ew
         2VEdZqTxgwG04uVFXc7Xtim+F2I5xnfRGj1jDLn3SfR7x1EEwlzD15govoBBOReTze8X
         C8vDDD9bQ2ieIRJwXv7fax1BRzP4G7B8aA0I8QVO50LrfrPGn/FFtVQR25INtrpCASk/
         0M1Q==
X-Gm-Message-State: AOJu0Yy1GXL3RIUAoH5leDz0O/G3s/OobVJ+hRfPpXkrft0wA/mcnUUv
        ryfMZO/8KyZCLpsCPIby6JfJ5NJ6ST2udjm1K+e2Yg==
X-Google-Smtp-Source: AGHT+IH7OXaXFQNfZsSr/nNbDU4L+en3c3DdVZzM+CNA5JnM/6GQGX0z/o7Nq1AvRxEpIPUPmeSdGZ9SBmSrJhVcW2s=
X-Received: by 2002:a25:5ca:0:b0:da3:9a65:84b1 with SMTP id
 193-20020a2505ca000000b00da39a6584b1mr6144751ybf.12.1699948027297; Mon, 13
 Nov 2023 23:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20231114131335.3aba4f4d@canb.auug.org.au>
In-Reply-To: <20231114131335.3aba4f4d@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Nov 2023 08:46:56 +0100
Message-ID: <CACRpkdZP6Epat3nnqfzoZwD3FtanARiOFqN_xomga8Syg-F2kw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 14, 2023 at 3:13=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:

> After merging the pinctrl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c:232:10: error: 'const str=
uct lpi_pinctrl_variant_data' has no member named 'flags'
>   232 |         .flags =3D LPI_FLAG_SLEW_RATE_SAME_REG,
>       |          ^~~~~
> drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c:232:18: error: 'LPI_FLAG_=
SLEW_RATE_SAME_REG' undeclared here (not in a function); did you mean 'LPI_=
SLEW_RATE_CTL_REG'?
>   232 |         .flags =3D LPI_FLAG_SLEW_RATE_SAME_REG,
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                  LPI_SLEW_RATE_CTL_REG
> drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c:232:18: error: excess ele=
ments in struct initializer [-Werror]
> drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c:232:18: note: (near initi=
alization for 'sm8650_lpi_data')
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   c4e47673853f ("pinctrl: qcom: sm8650-lpass-lpi: add SM8650 LPASS")

Ah I forgot a prerequisite patch we postponed before.

Applied it now so things should work by tomorrow, thanks!

Yours,
Linus Walleij
