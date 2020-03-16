Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E199B187158
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 18:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732032AbgCPRmQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 13:42:16 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41962 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731136AbgCPRmP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2020 13:42:15 -0400
Received: by mail-ot1-f65.google.com with SMTP id s15so18737977otq.8
        for <linux-next@vger.kernel.org>; Mon, 16 Mar 2020 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qhncLtarCzRlJMoBi8hB921jlCqL13EkGiu5gBmAYjg=;
        b=dQs1PTnjnl/5W47pOKmpnd1Y2tKhX2upHf4sIuVADHlRkbwGArJ0Yj5dG+Gpg0Bux9
         Db11yvt5seTO9EUFw97JDcQMyEvgcyWdUvEnVhv6tvSuSy0OCBdfrBtbyl/hXMUQgEgo
         UKjyieu99l5kLxB1zV/StaLaraOFzOmlLGahOyBxBx2HIspDPg5y5vHcPNJjRu3/iC/r
         XfoQrmbHBUYo7YpgA0qs/naQXj+x/kX53Dv5yX+0d3XRD/Bz9gk66RshjZtnirKrOo1s
         vhL3exYJaJGGg6XjjccWJ9HsNtTQQVHk+VRHm5ZzHAAGwRAa9rP90s5kz/t7Q4cjzyol
         xRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qhncLtarCzRlJMoBi8hB921jlCqL13EkGiu5gBmAYjg=;
        b=bnzhql4kjfZeL259se+USF82WW4aAK3GruAyVORh/fTvv1ygvfg0tB9VoUgoDSu3eT
         VGxX+Yo2eG8W0a3ppFAOaCp/aaT+/o/WQBbtwdw0KuzT2ZIejnWuk1T905WF68hQZnNk
         PtfnbWYgkTb8jfBtzK/fdsl3SAb7du67OuMFUO0vFnPPkbX0Wqwyba+Fo4Fcz2H3WbCA
         GrY02KkGSW+lbQyPHQh36McQ/547R1j4A6I0WDFYXbYJqfRXncqHyA+p4Ho9XBG9Q5wX
         9rCeG8Mei6+uc2AaXELCI2ZWDL7zCH/G6zVFEN1o5k8MB30FpxUruMmUobRBI/+EnVzu
         qmAw==
X-Gm-Message-State: ANhLgQ3k9P/9jmgRpFxqrkXSPviqsatX5t2vz8MC51gzaEMiW1fzVtzv
        56G28kM14RuSFDQ9fOQjha44XCPRRAcnm1d15+ffrg==
X-Google-Smtp-Source: ADFU+vuP/KkkZgDywii83iNHUDiefA29hNlDag61OgomS1t4Udsa1TmC2ebMVs5Ip2CtPXE3wttnfYR+56S3gzF7DkI=
X-Received: by 2002:a9d:75c6:: with SMTP id c6mr314816otl.352.1584380534428;
 Mon, 16 Mar 2020 10:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200316143752.473f1073@canb.auug.org.au>
In-Reply-To: <20200316143752.473f1073@canb.auug.org.au>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 16 Mar 2020 10:42:00 -0700
Message-ID: <CALAqxLVbG8C0h3OkCGOAQPpFjrwiqddjONTO-EGmhzz52LnKMw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the usb-gadget tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Felipe Balbi <balbi@kernel.org>, Greg KH <greg@kroah.com>,
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

On Sun, Mar 15, 2020 at 8:37 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the usb-gadget tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/usb/dwc3/drd.c: In function 'dwc3_setup_role_switch':
> drivers/usb/dwc3/drd.c:551:23: error: assignment to 'usb_role_switch_set_t' {aka 'int (*)(struct usb_role_switch *, enum usb_role)'} from incompatible pointer type 'int (*)(struct device *, enum usb_role)' [-Werror=incompatible-pointer-types]
>   551 |  dwc3_role_switch.set = dwc3_usb_role_switch_set;
>       |                       ^
> drivers/usb/dwc3/drd.c:552:23: error: assignment to 'usb_role_switch_get_t' {aka 'enum usb_role (*)(struct usb_role_switch *)'} from incompatible pointer type 'enum usb_role (*)(struct device *)' [-Werror=incompatible-pointer-types]
>   552 |  dwc3_role_switch.get = dwc3_usb_role_switch_get;
>       |                       ^
>
> Caused by commit
>
>   8a0a13799744 ("usb: dwc3: Registering a role switch in the DRD code.")
>
> interacting with commit
>
>   bce3052f0c16 ("usb: roles: Provide the switch drivers handle to the switch in the API")
>
> from the usb tree.
>
> I have added the following merge fix patch (which may need more work):
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 16 Mar 2020 14:34:31 +1100
> Subject: [PATCH] usb: dwc3: fix up for role switch API change
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/usb/dwc3/drd.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index db68d48c2267..7db1ffc92bbd 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -478,9 +478,10 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
>
>  #if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
>  #define ROLE_SWITCH 1
> -static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
> +static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
> +                                   enum usb_role role)
>  {
> -       struct dwc3 *dwc = dev_get_drvdata(dev);
> +       struct dwc3 *dwc = usb_role_switch_get_drvdata(sw);
>         u32 mode;
>
>         switch (role) {
> @@ -502,9 +503,9 @@ static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
>         return 0;
>  }
>
> -static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
> +static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw)
>  {
> -       struct dwc3 *dwc = dev_get_drvdata(dev);
> +       struct dwc3 *dwc = usb_role_switch_get_drvdata(sw);
>         unsigned long flags;
>         enum usb_role role;
>
> @@ -550,6 +551,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
>         dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
>         dwc3_role_switch.set = dwc3_usb_role_switch_set;
>         dwc3_role_switch.get = dwc3_usb_role_switch_get;
> +       dwc3_role_switch.driver_data = dwc;
>         dwc->role_sw = usb_role_switch_register(dwc->dev, &dwc3_role_switch);
>         if (IS_ERR(dwc->role_sw))
>                 return PTR_ERR(dwc->role_sw);

Yes, thanks. Bryan pointed out there was a problem with the internal
api change in -next, and I intended to resend the set this week.
Your solution looks like what I have in my tree at first glance, but
I'll double check to be sure.

Thanks so much!
-john
