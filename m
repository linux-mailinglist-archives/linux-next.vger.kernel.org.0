Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A14AE71818F
	for <lists+linux-next@lfdr.de>; Wed, 31 May 2023 15:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbjEaNZr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 May 2023 09:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbjEaNZm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 May 2023 09:25:42 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BEB128
        for <linux-next@vger.kernel.org>; Wed, 31 May 2023 06:25:41 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5689335d2b6so37230907b3.3
        for <linux-next@vger.kernel.org>; Wed, 31 May 2023 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685539541; x=1688131541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fB0ipJPMm2rGF8sYHVKFVeFZVg6tsQPk0Fbm/0GB+ZA=;
        b=OkIXsSIro8PmB3eVXXVblwo0+IvNv61W9g6ZXtPUKjyd3szYBvVs95tejOdWTIg+Q2
         huu77at3xyWmSGt9hiw8WVtZ4n1UG3Sc2XVGP11LLELVEWLSDLVaplelASHjeZonGyd4
         pm+1i0nMVJwP5h/vGuh7E7IDXavRNq15fBplPH+0aQzP6JSo0IxycriPCpQplWXdun0N
         j2mfAzsRdaYAc3vz30lSKvv7fNx1/syMyUk2ipJfEzFNOoNxxxMFaw9e/kQv3KP/LlvQ
         TT8mDVW/4TnfsquOJzfyXcY/YpSDOfoY2BO3/ECbEsXL3xoVPEcYxLsDGPH3KKzMAbyK
         B9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685539541; x=1688131541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fB0ipJPMm2rGF8sYHVKFVeFZVg6tsQPk0Fbm/0GB+ZA=;
        b=czKyizKtxXm+H6T7aNDCikWUaCVBxXFF/OVVWIsNvbR3qWvqtxtsXpMyOH6/+puyrc
         qFfMnIFxpOYasZ/UajzkD5zplFaOT/H2Ih45c1L7BMOSWQg/p39TEFrTzJv61ItVavOq
         g/eJHw1EuDswziLIZDmVzg+DAHd59PdUxLcqQbXmc4d5biOct5RG1fdSmCh/7dGdASG9
         UdOQZFpwGIDQ9b0FilWi3Sr8ydQ+wnX74omovpihgQiBDlkBFhd3bYC+YdTy0zj9D1gD
         oJOKiwa60KBNYyY9rkp07RyidEDrdX9TduSxORYwzlMYO0rv+3yGZChYbgT4Pz7gZz74
         7gow==
X-Gm-Message-State: AC+VfDz7CiY9j+faRe5Y5jGJsF1f4qgHdTJn1jezxt+mpLRwqsa2KVPY
        wDTGys99HckDO8hDVEPfYIaCTVadtolpJj4LfbLkWg==
X-Google-Smtp-Source: ACHHUZ5clsb5efhsDOL+wVqLr3HCnTlOhux7PAZi5smqMgqncIBI3VSw8E5cfc8meoA9/m/QT7vxpZnbaVgSVSRGBLk=
X-Received: by 2002:a81:df12:0:b0:565:4eee:a4d4 with SMTP id
 c18-20020a81df12000000b005654eeea4d4mr5693650ywn.10.1685539540818; Wed, 31
 May 2023 06:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230530074943.5b196424@canb.auug.org.au> <20230530145625.2znyjfd2bujfii5l@ripper>
In-Reply-To: <20230530145625.2znyjfd2bujfii5l@ripper>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 May 2023 15:25:29 +0200
Message-ID: <CACRpkdZZS+UConPEyuiWxJNoC36Y+udbE0ZXnk4jRgNQ3FtF1w@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the qcom tree
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Gross <agross@kernel.org>,
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

On Tue, May 30, 2023 at 4:53=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:

> >   Fixes: 04715461abf7 ("ARM: dts: qcom-msm8660: align RPM regulators no=
de name with bindings")
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Maybe you meant
> >
> > Fixes: 85055a1eecc1 ("ARM: dts: qcom-msm8660: align RPM regulators node=
 name with bindings")
> >
>
> Thank you Stephen, the tag has now been corrected.

Sorry for messing this up, thanks for fixing!

Yours,
Linus Walleij
