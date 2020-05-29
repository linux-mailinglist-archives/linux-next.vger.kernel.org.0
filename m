Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B85B1E7F9F
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 16:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgE2OFC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 10:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgE2OFC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 10:05:02 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4450FC03E969;
        Fri, 29 May 2020 07:05:02 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id e12so502251oou.2;
        Fri, 29 May 2020 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CYRqGAPd7Nbln9pg80ifNLqY2Whkx49a8W1wUFnMfic=;
        b=QfDQpjqBlnv6Yj1N6Anl9uJ3YcNZnjH0Ib15kr1+2tQbRSnf94HJ6/Fo3ea32us0BQ
         Uy8Godv84duvD/5zmijOT8cURctb4oI7zplzbnrxP1h05QOugXNqhI3XAszrDR7hHo8C
         t/yjE6RTSoqTFuOKaPOaIc4MDalaIY6KaK74OUblZyt2yh10lpfBXvLxzTBPKCIe6ZCU
         CNLhpj8N1hZbPyyv62BhR7hYG1kaoKovC58r+lQTtbZ3JfJgQkuiswnTwq6AvwGyPJHh
         pLQeeQdwPE1WymIq01aX7/z8KGyvpcdjhWahojOdeK8UIJhbQkVoc1na0omAY8KiqzRn
         eRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CYRqGAPd7Nbln9pg80ifNLqY2Whkx49a8W1wUFnMfic=;
        b=DjT8oSIWYBfqVLVmwQeCBWPz6xtXbhxTgXxlZ5Sl9hQuu7p7TRczAAOM7PbR8m8S6D
         8SbW6HHrzzTzCQHMITYPBpWPXsdyd1TBqq4TVla19JuBNyd6Jw1y+Tj/gTas+Bxi7QY2
         /chkHpWvVi9eH0XXsV0inbc5AKSulLZYpy2R/tUKLz3BsR9MJ71nvQX76k3DOoNdPvcf
         I4UCaoKwCKqNSyxY8o9Urmmd/CxZAxNXVRixgPs0TJ697nWzhacE1oZUqJ3VSikftP/V
         o+zHGPqbdmfkq7KG6vG+ulWRQ2TTSymLTHu9zucyiLbzX6b2EDIfzUIjeqAzd9Ui0ogU
         GS/w==
X-Gm-Message-State: AOAM5329rtWP9OQIGjqIXzrQenLYlbzEsWFRuSXG/FHz423gR4ByoT1u
        vegrjEGvh2X2jxOhpToefZhbJomrHh2DjAHl0w==
X-Google-Smtp-Source: ABdhPJxfhFsEVQaxxygetM/2DenSnZ8F+ceAfOKoqP5d3sgeltIE+B2H0htdLKggRQO+Bx4CvOgm52IbU3KEzBUw57E=
X-Received: by 2002:a4a:8c52:: with SMTP id v18mr6584603ooj.25.1590761099687;
 Fri, 29 May 2020 07:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200528162215.3a9aa663@canb.auug.org.au> <20200528104916.GD3115014@kroah.com>
 <CAL_JsqKYUOPFS=0rWuUL2HLNz1DdKbYULckAWnCq-0v96-1S4g@mail.gmail.com>
 <20200529082641.GB847132@kroah.com> <20200529082840.GC847132@kroah.com> <87pnan1677.fsf@kernel.org>
In-Reply-To: <87pnan1677.fsf@kernel.org>
From:   Rob Herring <robherring2@gmail.com>
Date:   Fri, 29 May 2020 08:04:48 -0600
Message-ID: <CAL_Jsq+cKXO71U_HVG0nZzbQ_B4GwrmcyzkECSTJUAuBzQgcZw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the usb tree with the devicetree tree
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 29, 2020 at 2:44 AM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Greg KH <greg@kroah.com> writes:
> > On Fri, May 29, 2020 at 10:26:41AM +0200, Greg KH wrote:
> >> On Thu, May 28, 2020 at 08:14:36AM -0600, Rob Herring wrote:
> >> > On Thu, May 28, 2020 at 4:49 AM Greg KH <greg@kroah.com> wrote:
> >> > >
> >> > > On Thu, May 28, 2020 at 04:22:15PM +1000, Stephen Rothwell wrote:
> >> > > > Hi all,
> >> > > >
> >> > > > Today's linux-next merge of the usb tree got a conflict in:
> >> > > >
> >> > > >   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> >> > > >
> >> > > > between commit:
> >> > > >
> >> > > >   3828026c9ec8 ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")
> >> > > >
> >> > > > from the devicetree tree and commits:
> >> > > >
> >> > > >   cd4b54e2ae1f ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")
> >> > > >
> >> > > > from the usb tree.
> >> > > >
> >> > > > I fixed it up (I guessed, taking most changes from the former) and can
> >> > > > carry the fix as necessary. This is now fixed as far as linux-next is
> >> > > > concerned, but any non trivial conflicts should be mentioned to your
> >> > > > upstream maintainer when your tree is submitted for merging.  You may
> >> > > > also want to consider cooperating with the maintainer of the
> >> > > > conflicting tree to minimise any particularly complex conflicts.
> >> >
> >> > Ugg, I fixed up a warning on my side...
> >> >
> >> > >
> >> > > Sounds good,t hanks.
> >> >
> >> > Greg, can you revert your copy and we can get rid of the conflict.
>
> Did things change recently? I always got the message from DT folks that
> DT changes should go via the driver tree. Has that changed? I can stop
> taking DT patches, no problem.

Not really. Mainly, I've been taking some schema conversions as they
tend to be standalone patches and to make sure they validate (this one
had a warning which I fixed up and that caused the conflict). Most
bindings don't see multiple updates in a cycle, but this one has
obviously become a mess.

If it has my Reviewed/Acked-by, then I'm not taking it. If I applied,
then I've replied saying I did.

Rob
