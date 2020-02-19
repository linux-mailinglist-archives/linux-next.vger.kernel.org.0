Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D0F164356
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2020 12:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgBSL2O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Feb 2020 06:28:14 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46293 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbgBSL2O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Feb 2020 06:28:14 -0500
Received: by mail-pf1-f195.google.com with SMTP id k29so12352138pfp.13;
        Wed, 19 Feb 2020 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wx3s/bkbNNB3vgPZBOWnRZiJqvIY72P39vHnuYlfuuk=;
        b=mvc1kDyCMpGtVRbHxdlrV1jBS9zHKLaAeY3c220YbADnhHBy6koZxJCrr0SzUfqwmf
         wxZhFboilpeoPO4LxgEL5GwtTaFaCWnLe9KgggUTFWLQsK+3C/xPpQhwckbsXSjr/6nL
         0FiRONn+jFcqWQRVAVKYEztEMroYAEdsAP9mQHYmvL+YabTzxwli+0pGKtQ0IUC3XWXZ
         XqDsDH5P+JJbs8aIpNMchQAS3yvFwyMoXrlW1I7mXaQ8vMDtfRMXvjg5hl7rtqZnvaQ0
         IJJ+qlM7yB7eH1y5+aByGkU8ZWp+K9jfbcDZWC/BmXBvBLgvJcNlJZpChuw/2kmBYZPw
         zvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wx3s/bkbNNB3vgPZBOWnRZiJqvIY72P39vHnuYlfuuk=;
        b=S3wCyPZandcCImgYX685TBs/78Fy1zP3StRyJWZAOOa2mk/88Hb5E6tcyHYvKhMZzl
         77zLEqV95rGXX50H9AmNqDxurO5CMADGEn8ifBsiBLXj9WBPVhVQq3HineOtPPpgxJ9u
         L3nj3gtJ4/mDHoUtoLL7kKy/r10Are5D47qnpjfvCAXQZm7e9LBWsQ024cbHbRD1nbRD
         GvtrO/PZ4ofGN2ItTXDqmEsXQlGu7PgL00W17KAaVEuRujgql55uU99eoktiXWaE+CfG
         JBKqjpGcmuySzaOswlRAk2gHKAACkHZ8DOL7uoj/hGnarLsCk9L1E7JKVC5pJsVwHlnu
         E2JQ==
X-Gm-Message-State: APjAAAUPgjQzJac2ZXddygVy+gyuAZKsxxilOBqfpvDo6vSrwGxY7k6j
        ExYRJTB84ZjoaeLUIPhqCQAHsOD951cCdbV1WVs=
X-Google-Smtp-Source: APXvYqzISBXt71R4g+vX/0MspAJXZ3gJ0T21rr2tNR59dt6Gy4t6vPkcY/YRuPp56r79sTBI5DZkH/BSWCh8M12YhfE=
X-Received: by 2002:a63:5a23:: with SMTP id o35mr27161593pgb.4.1582111693619;
 Wed, 19 Feb 2020 03:28:13 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtnwFVPQxgHOU2Bi9y5+q4sSsww47yxK+_3ZAQ9=kyhUg@mail.gmail.com>
 <20200219013824.GB8602@b29397-desktop> <20200219024534.GB10078@jackp-linux.qualcomm.com>
 <CAHp75VfY1Y-jNr=YTfAO+eUOy3xUy9+AgtyJuhEk2ngrxMg5JA@mail.gmail.com> <c39584b0-302e-d1bb-2e97-ffc017755bf2@st.com>
In-Reply-To: <c39584b0-302e-d1bb-2e97-ffc017755bf2@st.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 19 Feb 2020 13:28:05 +0200
Message-ID: <CAHp75VdDu678oL9VU8ea=A89O5L-5pPwkp8SOuySw+bCmtsAxA@mail.gmail.com>
Subject: Re: msm_hsusb 78d9000.usb: failed to create device link to ci_hdrc.0.ulpi
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Jack Pham <jackp@codeaurora.org>, Peter Chen <peter.chen@nxp.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 19, 2020 at 12:00 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
> On 2/19/20 10:23 AM, Andy Shevchenko wrote:
> > On Wed, Feb 19, 2020 at 4:46 AM Jack Pham <jackp@codeaurora.org> wrote:
> >>
> >> On Wed, Feb 19, 2020 at 01:38:22AM +0000, Peter Chen wrote:
> >>> On 20-02-17 14:02:57, Naresh Kamboju wrote:
> >>>> arm64 APQ 8016 SBC ( Dragonboard 410c)  device running Linux next boot
> >>>> failed due to below error.

...

> >> Probably same cause as for this:
> >> https://bugzilla.kernel.org/show_bug.cgi?id=206435
> >
> > Yes, it's the same. I dunno why no fix yet available.
> >
>
> Kishon has posted a patch yesterday for device link issue in phy core.

Ah, good to know! (Seems it hasn't made Linux Next yet, though)

> Please see:
>
> https://lkml.org/lkml/2020/2/18/272

Hint: use lore.kernel.org instead, much better if one would like to
reply / apply / etc.

-- 
With Best Regards,
Andy Shevchenko
