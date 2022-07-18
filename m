Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC83F578CFF
	for <lists+linux-next@lfdr.de>; Mon, 18 Jul 2022 23:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbiGRVlj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jul 2022 17:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbiGRVli (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2022 17:41:38 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943A7DEA
        for <linux-next@vger.kernel.org>; Mon, 18 Jul 2022 14:41:37 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id i14so23334615yba.1
        for <linux-next@vger.kernel.org>; Mon, 18 Jul 2022 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=11hzfogXOAnA+QZrTEs9fkbIDkZiqX5r5itghbSCq60=;
        b=dboWeBtiOrt1/oQ7dsI7qPXJcM/JRXGM+36KEKdlAE5wlXWnINACAXhPgeqV24OiE3
         aUFEz9Wo6ef4Hoc81/RZc3nm/krWKCiJR0HnbnJ8/Hz59WoaflRJ7oXYB6d4/E8dC1i4
         3xi0+fnuLm5Pqh5035PoCBm7IEAW08cSbp2Uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=11hzfogXOAnA+QZrTEs9fkbIDkZiqX5r5itghbSCq60=;
        b=APvGk1gTnRTJPnDujSHbOmKU8MHjEvT9EBcVGDOaUYhRAk/6cIIGfLXWpLr1Crxlsu
         Wn40CucAGC65kNySCbALd0XhUM3vQisSL4qRkKAscROPSx5F7ap1Wg80TdIwmUsDJ/dn
         +bSZDwOVAaSQaFazOEcBwqh7zi0A6+BuBHoKR9pJz7sFSgw4toOgZmscU9e+WbPtgJyP
         IVa3Yma1cd3XBmvHsWX8NchzKUcD2q7ERPYeguBO7z9HAcQ2K3o/M854vsmZ7xyqdB08
         xKDxONfUJg4icpp4SvKUL29Jvc0qIbELrImzRpTHuahpX4yqt5nFFAYkeFeuoEJKDUuK
         xvqA==
X-Gm-Message-State: AJIora/mKja9KlqyuQXGAQHF0n+mki8gc1C0ezg66eH6DfVoZvjkEFMV
        O0+6uXeJ7KdM4qoGhwpAIBphnMilLRqH4RpYcf7jsg==
X-Google-Smtp-Source: AGRyM1uxecbBwMgr6XtFdCndO7oF4254MFrOti40qpwETkSUihyQLM8KgCq5Ea21/K4aUBmZbGWxNn8h53USGV5Beig=
X-Received: by 2002:a25:dc52:0:b0:66e:ef32:6316 with SMTP id
 y79-20020a25dc52000000b0066eef326316mr30768547ybe.197.1658180496854; Mon, 18
 Jul 2022 14:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220718163158.42176b4e@canb.auug.org.au> <YtXF8TUZHNRUUyJh@kroah.com>
In-Reply-To: <YtXF8TUZHNRUUyJh@kroah.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Mon, 18 Jul 2022 14:41:23 -0700
Message-ID: <CACeCKafbgLmhLoYQiTTDkeeJ26HqFYBHXtcpwQkzOyO9LESEFw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the usb tree
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Benson Leung <bleung@google.com>,
        Guenter Roeck <groeck@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen & Greg,

On Mon, Jul 18, 2022 at 1:43 PM Greg KH <greg@kroah.com> wrote:
>
> On Mon, Jul 18, 2022 at 04:31:58PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the usb tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > drivers/platform/chrome/cros_typec_switch.c: In function 'cros_typec_cmd_mux_set':
> > drivers/platform/chrome/cros_typec_switch.c:52:16: error: implicit declaration of function 'cros_ec_command'; did you mean 'cros_ec_cmd'? [-Werror=implicit-function-declaration]
> >    52 |         return cros_ec_command(sdata->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
> >       |                ^~~~~~~~~~~~~~~
> >       |                cros_ec_cmd
> > drivers/platform/chrome/cros_typec_switch.c: In function 'cros_typec_register_switches':
> > drivers/platform/chrome/cros_typec_switch.c:244:23: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
> >   244 |                 ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
> >       |                       ^~~~~~~~~~~~~~~~~~~~~
> >       |                       acpi_evaluate_object
> > drivers/platform/chrome/cros_typec_switch.c:244:49: error: invalid use of undefined type 'struct acpi_device'
> >   244 |                 ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
> >       |                                                 ^~
> >
> > Caused by commit
> >
> >   e54369058f3d ("platform/chrome: cros_typec_switch: Add switch driver")
> >
> > and commits
> >
> >   34f375f0fdf6 ("platform/chrome: cros_typec_switch: Set EC retimer")
> >   bb53ad958012 ("platform/chrome: cros_typec_switch: Add event check")
> >
> > interacting with commit
> >
> >   b1d288d9c3c5 ("platform/chrome: cros_ec_proto: Rename cros_ec_command function")
> >
> > from the chrome-platform tree.

I am very sorry about the conflicts.

I can think of a few ways to address this:
1. A fixup patch on top of linux-next updating the function signature
to cros_ec_cmd() ; I will send this out if you'd like.
2. Pull in Commit b1d288d9c3c5 ("platform/chrome: cros_ec_proto:
Rename cros_ec_command function") to usb-next.
We will also have to pull in dependent commit 015cd0043503
("regulator: cros-ec: Use common cros_ec_command()")
3. Revert the entire cros-typec-switch (patches 3-9) series from
usb-next and wait till after the merge window to apply it to
chrome-platform directly.

> >
> > I have used the usb tree from next-20220715 for today.
> >
> > I will fix up the cros_ec_command() rename with a merge fix patch after
> > the apci usage problem is solved.
>
> The ACPI issue should now be solved in my tree.

Sorry about the missing Kconfig dependency, and thank you for applying
the patch quickly.

Best regards,

-Prashant
