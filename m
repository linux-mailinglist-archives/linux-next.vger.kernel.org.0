Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EECE01E6374
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 16:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390935AbgE1OOv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 10:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390932AbgE1OOu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 10:14:50 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D19C05BD1E;
        Thu, 28 May 2020 07:14:49 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id c3so2428946otr.12;
        Thu, 28 May 2020 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SyynWlYFcaOqFB3tjQeSxVvr8sMjk+dE9KsVMLkNf5w=;
        b=HGw+Y4v5NkRoIY0/xn9YHGq9FGwkaN2diCcilEjFK7bqat7dPLeflJgjQc4Wy2H4t6
         uKurL1UCvRF35zIjxS6GRQk15msdZrPGClJxw07gYncIhQrv23GGSCfFU7KanoILEx4M
         rWXS1ntFI69zCCuaLlw4LloUlZyFdRzRjrp3Phv2ApasM+s98Uz2bCgus2XpM3nvRFdP
         osIhQSgMegzFKe4B0oSSayp10VJI09sJyJmwaTbv948cGAxzk7rFkNj9/vwL6/ZxsKp0
         chsDF2W7+iaXVMFA6JvYE81D3eZZE7VbfAlaVLJDPPdWIXDxSIpd06zQvo78gsOvmAXZ
         f9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SyynWlYFcaOqFB3tjQeSxVvr8sMjk+dE9KsVMLkNf5w=;
        b=ne920CSdMQJuDG7gcov2B52qt1Fp5UZ39GHqI8DcgSLcdQFqTWsXfQ4jHSVrnCsWWw
         gQsMfzYF9fpT1WJOcunE5k72ZxMUdKlBgWNZJPSXUnnakQm3MrXY8W6QwMxi/rX6FgPm
         UlLxtxaVnZed/xZUs0QPc9bg+vI0nwvznVzPQ92Ik/aPH/DVj5OYZqYyC+TZwuZ3kGjL
         8pWr6ZskXsn21ZFmqUg3H1bdnfhCHuwC+AzFSodAwGYeu010J+ge+n+jropNOaKW+tMy
         xhOINM6tdMgiAE3K25tx7qJcIkPo+dFsfKSxHGMBv3ansrt/p585kvTxaQDPFLqo2eUv
         A4Sg==
X-Gm-Message-State: AOAM530CvURwG2CBptoCUhY7KSkpInxLE2V8Eg4WPWb+/hhdHc+gM8OT
        S6Mqnr7B1xVMuu5bwgYcYQF0jwwl//DTVVe4VGgA
X-Google-Smtp-Source: ABdhPJz89e6MLnH4MZrjqPxPmj4zeAqE/00KDqFat+IMnPp0ptpy1ETuTfZ1UTNMJ4R2h2/Td21ENE8vmcffmnESZl4=
X-Received: by 2002:a9d:51ca:: with SMTP id d10mr2418626oth.129.1590675288045;
 Thu, 28 May 2020 07:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200528162215.3a9aa663@canb.auug.org.au> <20200528104916.GD3115014@kroah.com>
In-Reply-To: <20200528104916.GD3115014@kroah.com>
From:   Rob Herring <robherring2@gmail.com>
Date:   Thu, 28 May 2020 08:14:36 -0600
Message-ID: <CAL_JsqKYUOPFS=0rWuUL2HLNz1DdKbYULckAWnCq-0v96-1S4g@mail.gmail.com>
Subject: Re: linux-next: manual merge of the usb tree with the devicetree tree
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 28, 2020 at 4:49 AM Greg KH <greg@kroah.com> wrote:
>
> On Thu, May 28, 2020 at 04:22:15PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the usb tree got a conflict in:
> >
> >   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> >
> > between commit:
> >
> >   3828026c9ec8 ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")
> >
> > from the devicetree tree and commits:
> >
> >   cd4b54e2ae1f ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")
> >
> > from the usb tree.
> >
> > I fixed it up (I guessed, taking most changes from the former) and can
> > carry the fix as necessary. This is now fixed as far as linux-next is
> > concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the
> > conflicting tree to minimise any particularly complex conflicts.

Ugg, I fixed up a warning on my side...

>
> Sounds good,t hanks.

Greg, can you revert your copy and we can get rid of the conflict.

Rob
