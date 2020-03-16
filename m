Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB6B6187392
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 20:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732416AbgCPTqj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 15:46:39 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:50351 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732413AbgCPTqj (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 15:46:39 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 744635C029C;
        Mon, 16 Mar 2020 15:46:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 16 Mar 2020 15:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=F+L/RnrZWA8hJfqh8UJGEn/VcqJ
        5iOlEAqD0BCAvsvY=; b=KK07tLL6ZJ3e7X2CN9KgOGpO4qt1O64GF8PxQ67q130
        adM4yQTITcBvUGQBhSt4sCXYAQkgq+UX7dRVO0hYiAQKibFzuf5gQ64tul25QQX7
        McsPYfpcn4/XXapnF3S2KXk7Viwm8WeJiw791xHsGr8ADeFFPQsewfSV6m2LKXhb
        HJ9jR7tP5IimiA/7IiOI6qEDIDEq/JOysSZdHK6vZ9yyn+S9m9/RylqWGjp1Vt8Q
        ileP4COWqCPo6EoT8YDfep83WWxuPmrd2V4Ow5mkAgrn1wxQBQOxu7YUqoAh3wnS
        vs4L8xgU6DDNqgL3Ww0RCTKgx23eJBljjF+Aw7JgXQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=F+L/Rn
        rZWA8hJfqh8UJGEn/VcqJ5iOlEAqD0BCAvsvY=; b=tPWJ9tgHcSw/bOJ4yyHpMo
        Urojvf0PHFsqBmjfaQD/pAhPYRB4JSo52OZrEmv0V74m+SzhpXtdvlyLq1MF9l1A
        ChOP0G/g4IuXjOm6GhFaY2rWl080maNGYOphkASki9sxYitLhXjBtJGP1u5FLkp0
        FMICmauDM7H0FY/h8MJI5JlS0nWaOCRx5eSrbgwoF+sZOUEQ0ObnscSHvVYWmVvZ
        3BfdyfePHtHkrf3Fqwk+PblYSx+6hU0Gdvjs2s4uIfVmggZhq+19QviR1yIHB+Nq
        AEe2AIsQevFxWs20WlJBFShejruPWFfU5hoAvQXwrsf37U+MnAeAtz9wTAUCwlDQ
        ==
X-ME-Sender: <xms:nddvXmw1QVmTZv6htHkGqvqqyKEO3LauCopZ3m1nP9p42M_P4IX9_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeffedguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
    dtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehg
    rhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:nddvXj0EAbEEpSe7UVC7ysp_GnLaEX40b64Ij7aYqHaFTwY2OwxZYA>
    <xmx:nddvXnkyBFwmdlNamEyC2LJ215JHkqp8XaBtPN0FfnjtJtr5yX2yvA>
    <xmx:nddvXi8FrZOPEnNu_fL8UrNFBBSVCzMPvfyh-_It6ELbq_9GXjdtOA>
    <xmx:ntdvXqGgZezPTIZRUYZclW3eaJG5UCUYqFMEIWNV6x3Eg38OxJNuOg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3B9D930624CC;
        Mon, 16 Mar 2020 15:46:37 -0400 (EDT)
Date:   Mon, 16 Mar 2020 20:46:26 +0100
From:   Greg KH <greg@kroah.com>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Felipe Balbi <balbi@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yu Chen <chenyu56@huawei.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: linux-next: build failure after merge of the usb-gadget tree
Message-ID: <20200316194626.GC327539@kroah.com>
References: <20200316143752.473f1073@canb.auug.org.au>
 <CALAqxLVbG8C0h3OkCGOAQPpFjrwiqddjONTO-EGmhzz52LnKMw@mail.gmail.com>
 <CALAqxLXfgv0Wt_OhOvYUiorJaSP=9wJj2Nqs-7a5VAs=8T2SHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLXfgv0Wt_OhOvYUiorJaSP=9wJj2Nqs-7a5VAs=8T2SHA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 16, 2020 at 11:11:00AM -0700, John Stultz wrote:
> On Mon, Mar 16, 2020 at 10:42 AM John Stultz <john.stultz@linaro.org> wrote:
> >
> > On Sun, Mar 15, 2020 at 8:37 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the usb-gadget tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >
> > > drivers/usb/dwc3/drd.c: In function 'dwc3_setup_role_switch':
> > > drivers/usb/dwc3/drd.c:551:23: error: assignment to 'usb_role_switch_set_t' {aka 'int (*)(struct usb_role_switch *, enum usb_role)'} from incompatible pointer type 'int (*)(struct device *, enum usb_role)' [-Werror=incompatible-pointer-types]
> > >   551 |  dwc3_role_switch.set = dwc3_usb_role_switch_set;
> > >       |                       ^
> > > drivers/usb/dwc3/drd.c:552:23: error: assignment to 'usb_role_switch_get_t' {aka 'enum usb_role (*)(struct usb_role_switch *)'} from incompatible pointer type 'enum usb_role (*)(struct device *)' [-Werror=incompatible-pointer-types]
> > >   552 |  dwc3_role_switch.get = dwc3_usb_role_switch_get;
> > >       |                       ^
> > >
> > > Caused by commit
> > >
> > >   8a0a13799744 ("usb: dwc3: Registering a role switch in the DRD code.")
> > >
> > > interacting with commit
> > >
> > >   bce3052f0c16 ("usb: roles: Provide the switch drivers handle to the switch in the API")
> > >
> > > from the usb tree.
> > >
> > > I have added the following merge fix patch (which may need more work):
> > >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Mon, 16 Mar 2020 14:34:31 +1100
> > > Subject: [PATCH] usb: dwc3: fix up for role switch API change
> > >
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/usb/dwc3/drd.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> > > index db68d48c2267..7db1ffc92bbd 100644
> > > --- a/drivers/usb/dwc3/drd.c
> > > +++ b/drivers/usb/dwc3/drd.c
> > > @@ -478,9 +478,10 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
> > >
> > >  #if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
> > >  #define ROLE_SWITCH 1
> > > -static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
> > > +static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
> > > +                                   enum usb_role role)
> > >  {
> > > -       struct dwc3 *dwc = dev_get_drvdata(dev);
> > > +       struct dwc3 *dwc = usb_role_switch_get_drvdata(sw);
> > >         u32 mode;
> > >
> > >         switch (role) {
> > > @@ -502,9 +503,9 @@ static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
> > >         return 0;
> > >  }
> > >
> > > -static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
> > > +static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw)
> > >  {
> > > -       struct dwc3 *dwc = dev_get_drvdata(dev);
> > > +       struct dwc3 *dwc = usb_role_switch_get_drvdata(sw);
> > >         unsigned long flags;
> > >         enum usb_role role;
> > >
> > > @@ -550,6 +551,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
> > >         dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
> > >         dwc3_role_switch.set = dwc3_usb_role_switch_set;
> > >         dwc3_role_switch.get = dwc3_usb_role_switch_get;
> > > +       dwc3_role_switch.driver_data = dwc;
> > >         dwc->role_sw = usb_role_switch_register(dwc->dev, &dwc3_role_switch);
> > >         if (IS_ERR(dwc->role_sw))
> > >                 return PTR_ERR(dwc->role_sw);
> >
> > Yes, thanks. Bryan pointed out there was a problem with the internal
> > api change in -next, and I intended to resend the set this week.
> > Your solution looks like what I have in my tree at first glance, but
> > I'll double check to be sure.
> 
> Yes. Just confirmed its the same as what I had in my tree.
> 
> Acked-by: John Stultz <john.stultz@linaro.org>
> 
> Greg: Could you pull Stephen's fix into your tree?

It's been there for many hours now :)
