Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D79AD10C4C9
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 09:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbfK1IQW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Nov 2019 03:16:22 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41344 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbfK1IQV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Nov 2019 03:16:21 -0500
Received: by mail-lj1-f194.google.com with SMTP id m4so27437425ljj.8
        for <linux-next@vger.kernel.org>; Thu, 28 Nov 2019 00:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dlwaqEfjT5graM8RWQ1ek299Dj4eK17tSarlzL5nZUM=;
        b=l+E4ygaS3q5mYwlHDuFCSXQ77eYxgnZq4FdzjB4K2crLne5PNmNtouWf5MmH+0mP+a
         KyoynhY40PGrUD+TebyOwFZ7I8rILisxXtwWvkjSjp+QFIcKF3t6ro7XSoXsUbsGa8uH
         XHyTKCRmj/e/0OnKWOD2Y7d+xWz/TgL9/VHd5f1gwQc0UxFZ7PH3t3xWXhoCptaVW2I1
         QmskW4aj5jbewzlKdZv7gv1VOEU0aFmTaAujR/2y70Cbdydft/nWRUpxbAauXDasusdc
         q2007xskJ60GRtI5D8u2I2U9rHNvg6+7n279miEuRgOumNA8L9DgosI68SPwk/58zh8v
         WFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dlwaqEfjT5graM8RWQ1ek299Dj4eK17tSarlzL5nZUM=;
        b=ZsrM6r+OoYZRT40Zmy5XLVkqhIXPvLvd8dwXlhJx5xWwYAmP6cXTjiRZHkdl7MkV11
         Xl1ycihnS1jcAQ1Zpg+Swtz5JtFl1ywswilnjmAcI3lwN98OHp2CnmUqgUvQNLW4Ues2
         /0oS2jE0jjAzx4qr4ujSS8SsxxtRACKukgWvd2ZMBfZL1KxH8/GQyT9xJyyKdrijtL7+
         Br99JdX5uFPunwdyI4Y38nhy9PI5Cxbr9V/cLR0wBDLNy02rOWldP4KDiuPOX1g0MwGo
         e/P7FZH7lpaN3s69PY7ShrjZ9+grJi5cULnjXitB0++BLTRs1pvvkGPaBBi6YqAurQQN
         wQCQ==
X-Gm-Message-State: APjAAAVoi4L3Tmdt0ZNLMINLIckJ0j5aBqk0in0cOCIp/OQVuXK7dXXG
        FZMK4ctITKF4apLXMSxNvDn9BYIx54uzQCgBu2Mryxqneqw=
X-Google-Smtp-Source: APXvYqyTE9eYnDMIvHYYYoLUZ9fGJAvAWhf7bt6cQqx4sbnSjEzG3In1wSpDQ95JnJ/UyfSwZGmvFUTCfZ/EW9cdkyw=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr33605730lji.251.1574928978081;
 Thu, 28 Nov 2019 00:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20191128080832.13529-1-rahul.tanwar@linux.intel.com> <20191128080832.13529-2-rahul.tanwar@linux.intel.com>
In-Reply-To: <20191128080832.13529-2-rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 09:16:06 +0100
Message-ID: <CACRpkdbKE6eHsyuCM5oCkhj=bP4H=omiFfdA6qf+g7xQzJBYQQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: Fix warning by adding missing MODULE_LICENSE
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 28, 2019 at 9:08 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> Fix below build warning
>
>    WARNING: modpost: missing MODULE_LICENSE() in
>    drivers/pinctrl/pinctrl-equilibrium.o
>
> Introduced by commit
>
>    1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a new SoC")
>
> by adding missing MODULE_LICENSE.
>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>

Patch applied, I will send by express to Torvalds once the build
servers are happy :)

Yours,
Linus Walleij
