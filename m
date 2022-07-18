Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A2C578D53
	for <lists+linux-next@lfdr.de>; Tue, 19 Jul 2022 00:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236091AbiGRWIg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jul 2022 18:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiGRWIg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2022 18:08:36 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CAE31391
        for <linux-next@vger.kernel.org>; Mon, 18 Jul 2022 15:08:35 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id i206so23413204ybc.5
        for <linux-next@vger.kernel.org>; Mon, 18 Jul 2022 15:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Im+gNjNQiawkcFElqAzCDfzGB6FFifP1C/Cihomf+A4=;
        b=G2YQWQ9m0SecS2sRuVEf8pIn5HBTTKAcgHcpb+3nBeThtnHyapncJb16wSrgkydKRX
         /RsMwpWe6axg4EOh0dxrkmuDMbx2sX8/6RmTSit5Bt42d+EljbVS+Yl+ZVY+MxuZhvZX
         0HC2qU6rHPDvFzxa9yjbuteS/faoJZW+vGgew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Im+gNjNQiawkcFElqAzCDfzGB6FFifP1C/Cihomf+A4=;
        b=4h0HRI7kTkC0X5Fugg5lx7Htouo4Y51brJq0DwsvA+WXFnzDIlc/FF+OeO56m4fe0W
         aRFOY75p+zefrSr5sLaJ/CTNNSGTdEnfU16d9EzZa2BcpGL/J8Z3wTnxsPr+19stRgGL
         hPbVXPd1ZXqxa282GU2dv+FxDIepLdoyq1Xp6KBieUh2t3K9SaMSMtDWq1vTPENJnFnH
         AfCFx6zpkso2eBg8j5kWF2+WJuh8/KSVlyKb4UmqrxbhXKGYjsa8iIhhCiZVE35TW/UQ
         uHgqs5uQU2MxAX1U1ARp2gSKQRGi+j0ZJArBurN6kSpvVltHaMf44iOJT0kWZlVdzdgy
         OUdA==
X-Gm-Message-State: AJIora/aypEHc5UD70lSnjpoTNf2o0hOIUHgKCr1s5Ye5fcbgKI05JGi
        l+GjjAhP5r1EXZlXhzdbP0Ctrp9r9T4HF27yxrfdskSTxDc=
X-Google-Smtp-Source: AGRyM1szTTGIztDFCsJ+rOZ1Akq8FG5h7CsQbaIyfbYC+xMo1LLJy5RH7KP2WEUrCZY2Nb3z4vtnDz5pPzyHGAnXQJ0=
X-Received: by 2002:a25:dfd6:0:b0:670:24c7:dcc6 with SMTP id
 w205-20020a25dfd6000000b0067024c7dcc6mr10226037ybg.494.1658182114456; Mon, 18
 Jul 2022 15:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220718163158.42176b4e@canb.auug.org.au> <YtXF8TUZHNRUUyJh@kroah.com>
 <CACeCKafbgLmhLoYQiTTDkeeJ26HqFYBHXtcpwQkzOyO9LESEFw@mail.gmail.com>
In-Reply-To: <CACeCKafbgLmhLoYQiTTDkeeJ26HqFYBHXtcpwQkzOyO9LESEFw@mail.gmail.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Mon, 18 Jul 2022 15:08:20 -0700
Message-ID: <CACeCKaerEFmkx_Dv27RJ=nrPQAQ9pcteeBQ1y90LbN+_-P2W=Q@mail.gmail.com>
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

On Mon, Jul 18, 2022 at 2:41 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> Hi Stephen & Greg,
>
> On Mon, Jul 18, 2022 at 1:43 PM Greg KH <greg@kroah.com> wrote:
> >
> > On Mon, Jul 18, 2022 at 04:31:58PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the usb tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >
> > > drivers/platform/chrome/cros_typec_switch.c: In function 'cros_typec_cmd_mux_set':
> > > drivers/platform/chrome/cros_typec_switch.c:52:16: error: implicit declaration of function 'cros_ec_command'; did you mean 'cros_ec_cmd'? [-Werror=implicit-function-declaration]
> > >    52 |         return cros_ec_command(sdata->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
> > >       |                ^~~~~~~~~~~~~~~
> > >       |                cros_ec_cmd
> > > drivers/platform/chrome/cros_typec_switch.c: In function 'cros_typec_register_switches':
> > > drivers/platform/chrome/cros_typec_switch.c:244:23: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
> > >   244 |                 ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
> > >       |                       ^~~~~~~~~~~~~~~~~~~~~
> > >       |                       acpi_evaluate_object
> > > drivers/platform/chrome/cros_typec_switch.c:244:49: error: invalid use of undefined type 'struct acpi_device'
> > >   244 |                 ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
> > >       |                                                 ^~
> > >
> > > Caused by commit
> > >
> > >   e54369058f3d ("platform/chrome: cros_typec_switch: Add switch driver")
> > >
> > > and commits
> > >
> > >   34f375f0fdf6 ("platform/chrome: cros_typec_switch: Set EC retimer")
> > >   bb53ad958012 ("platform/chrome: cros_typec_switch: Add event check")
> > >
> > > interacting with commit
> > >
> > >   b1d288d9c3c5 ("platform/chrome: cros_ec_proto: Rename cros_ec_command function")
> > >
> > > from the chrome-platform tree.
>
> I am very sorry about the conflicts.
>
> I can think of a few ways to address this:
> 1. A fixup patch on top of linux-next updating the function signature
> to cros_ec_cmd() ; I will send this out if you'd like.
> 2. Pull in Commit b1d288d9c3c5 ("platform/chrome: cros_ec_proto:
> Rename cros_ec_command function") to usb-next.
> We will also have to pull in dependent commit 015cd0043503
> ("regulator: cros-ec: Use common cros_ec_command()")
> 3. Revert the entire cros-typec-switch (patches 3-9) series from
> usb-next and wait till after the merge window to apply it to
> chrome-platform directly.
>
> > >
> > > I have used the usb tree from next-20220715 for today.
> > >
> > > I will fix up the cros_ec_command() rename with a merge fix patch after
> > > the apci usage problem is solved.
> >

Sorry, quick to the trigger (again). Thanks for fixing up the
cros_ec_command() rename.

Please LMK if any other errors arise from the various patches across branches.

BR,

-Prashant
