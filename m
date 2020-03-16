Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF48B1871F8
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 19:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731731AbgCPSLU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 14:11:20 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34750 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732187AbgCPSLT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2020 14:11:19 -0400
Received: by mail-oi1-f196.google.com with SMTP id j5so2814695oij.1
        for <linux-next@vger.kernel.org>; Mon, 16 Mar 2020 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OlMEgEgjibZNlfwxouQ+57JjsQKjrLvMLI/CKh1ah9k=;
        b=dGwE1MR+FkxCLINSCeYkZeFTWgxYektRyLwgGXGEdThmvroTNuxw/t5ATjRo85wx9v
         rxJFfTaXtDjncPrRiWQO7+gNCI3nsm8lFKb3AAMQzUZrHVKSDTCKqQN7vONAVbAsuJ34
         vYBVGcjBXZYNZNHIgBVUlC+YQIFSq0bX6ejFO4BT1ZDMpcQWoC92hNPaxCphMBOs1yxF
         3G1bUcJMVk37l8D7E7fvqPfD7KWrroXgr1OxZjSeH3snqriTMXi9atDGiB96entAlzPs
         Hboa6oozmiV7QG8OnqAqEiZjlfrnIs/+V095u+8LO7eJvNnkFa4sj3QVNH9tLQ3rVZfc
         ecpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OlMEgEgjibZNlfwxouQ+57JjsQKjrLvMLI/CKh1ah9k=;
        b=Qsp6EAKJ5I75p7dBzMw+pJS8o5hsTk5FbnVreiBjF9TLFJaXwnmc1gYXMEdemwBA+a
         5ctyqQR/kl9m5a6C8QIeKR42mcxKPjPeNL3mmCbUdmb9yI7QZ2grAo9+4GKXU8Q1kqr0
         Zvi5rDSGSY8J0Cjaz8vgHrN4Lxp0ezw+2txZLJ2xu39GrpiBZed0OQnAmWOUhsLCuq07
         cOq72j7JdkX9+H5itDtCVudV0/D9bcEdwNsqeDE2CDGYULI4SR2Pj2gyTcsi+A+fIOaa
         ku0Bu0SyiK5lzUHTxOLoKYswMib2+PJuNYn7OxOEd9BRiNUKpMBMtjQ4MOYD+egUgmrW
         TNBw==
X-Gm-Message-State: ANhLgQ19aemFaB7v5/+uoMDccuOlaseSOTQVuYVrIIz4SgvDzYRpeUbd
        jxuiHVS+YTBNoDwWUOlfynWQ5RlusnoxoTXRKlNk7A==
X-Google-Smtp-Source: ADFU+vt9FhfNpUDb9osLtsJujBjl0NAjM6WtgCjkUWw4UHJe8ErCPpAZj3tlFG0jj647UWwukELQQN0gfFfKvhGVW2E=
X-Received: by 2002:aca:ab4b:: with SMTP id u72mr572942oie.97.1584382278532;
 Mon, 16 Mar 2020 11:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200316143752.473f1073@canb.auug.org.au> <CALAqxLVbG8C0h3OkCGOAQPpFjrwiqddjONTO-EGmhzz52LnKMw@mail.gmail.com>
In-Reply-To: <CALAqxLVbG8C0h3OkCGOAQPpFjrwiqddjONTO-EGmhzz52LnKMw@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 16 Mar 2020 11:11:00 -0700
Message-ID: <CALAqxLXfgv0Wt_OhOvYUiorJaSP=9wJj2Nqs-7a5VAs=8T2SHA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the usb-gadget tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yu Chen <chenyu56@huawei.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 16, 2020 at 10:42 AM John Stultz <john.stultz@linaro.org> wrote:
>
> On Sun, Mar 15, 2020 at 8:37 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the usb-gadget tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > drivers/usb/dwc3/drd.c: In function 'dwc3_setup_role_switch':
> > drivers/usb/dwc3/drd.c:551:23: error: assignment to 'usb_role_switch_set_t' {aka 'int (*)(struct usb_role_switch *, enum usb_role)'} from incompatible pointer type 'int (*)(struct device *, enum usb_role)' [-Werror=incompatible-pointer-types]
> >   551 |  dwc3_role_switch.set = dwc3_usb_role_switch_set;
> >       |                       ^
> > drivers/usb/dwc3/drd.c:552:23: error: assignment to 'usb_role_switch_get_t' {aka 'enum usb_role (*)(struct usb_role_switch *)'} from incompatible pointer type 'enum usb_role (*)(struct device *)' [-Werror=incompatible-pointer-types]
> >   552 |  dwc3_role_switch.get = dwc3_usb_role_switch_get;
> >       |                       ^
> >
> > Caused by commit
> >
> >   8a0a13799744 ("usb: dwc3: Registering a role switch in the DRD code.")
> >
> > interacting with commit
> >
> >   bce3052f0c16 ("usb: roles: Provide the switch drivers handle to the switch in the API")
> >
> > from the usb tree.
> >
> > I have added the following merge fix patch (which may need more work):
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 16 Mar 2020 14:34:31 +1100
> > Subject: [PATCH] usb: dwc3: fix up for role switch API change
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/usb/dwc3/drd.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> > index db68d48c2267..7db1ffc92bbd 100644
> > --- a/drivers/usb/dwc3/drd.c
> > +++ b/drivers/usb/dwc3/drd.c
> > @@ -478,9 +478,10 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
> >
> >  #if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
> >  #define ROLE_SWITCH 1
> > -static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
> > +static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
> > +                                   enum usb_role role)
> >  {
> > -       struct dwc3 *dwc = dev_get_drvdata(dev);
> > +       struct dwc3 *dwc = usb_role_switch_get_drvdata(sw);
> >         u32 mode;
> >
> >         switch (role) {
> > @@ -502,9 +503,9 @@ static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
> >         return 0;
> >  }
> >
> > -static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
> > +static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw)
> >  {
> > -       struct dwc3 *dwc = dev_get_drvdata(dev);
> > +       struct dwc3 *dwc = usb_role_switch_get_drvdata(sw);
> >         unsigned long flags;
> >         enum usb_role role;
> >
> > @@ -550,6 +551,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
> >         dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
> >         dwc3_role_switch.set = dwc3_usb_role_switch_set;
> >         dwc3_role_switch.get = dwc3_usb_role_switch_get;
> > +       dwc3_role_switch.driver_data = dwc;
> >         dwc->role_sw = usb_role_switch_register(dwc->dev, &dwc3_role_switch);
> >         if (IS_ERR(dwc->role_sw))
> >                 return PTR_ERR(dwc->role_sw);
>
> Yes, thanks. Bryan pointed out there was a problem with the internal
> api change in -next, and I intended to resend the set this week.
> Your solution looks like what I have in my tree at first glance, but
> I'll double check to be sure.

Yes. Just confirmed its the same as what I had in my tree.

Acked-by: John Stultz <john.stultz@linaro.org>

Greg: Could you pull Stephen's fix into your tree?

thanks
-john
