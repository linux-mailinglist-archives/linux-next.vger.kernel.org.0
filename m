Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7AB3C787E
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 23:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235139AbhGMVGx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 17:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236022AbhGMVGx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jul 2021 17:06:53 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DEAAC0613EE
        for <linux-next@vger.kernel.org>; Tue, 13 Jul 2021 14:04:01 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 11so111367ljv.1
        for <linux-next@vger.kernel.org>; Tue, 13 Jul 2021 14:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0/WzDWmZUq8jX07GulngkcAUpVh4+cRWNFXLGvNWEeI=;
        b=EcEjIIgQMnPfw3kb3KLbeGApDG4e53k159at93bSWI/G3rcs8agKmkFnyWlj64JjSs
         1V0oqyXuyLZqCVUwBRYlGq4mMsc0KeLco5nUrr8LWqo1p6SlsBut4z4ZATD6Gp+jGjMA
         tmpcDv5Xm/v7mNQuRGh5BCs8ywWxgw4va4ciRZ5NTmWr+YncMNtETWMIT1+gZt/fXaA0
         9/60S1/bCEZBTUdC8FyMSr04MaXWm7pFI215a7zwwIgS2wPCKlLvaLTWnuFSvlOZmK9c
         CIkJpOPP66lsxPTCMs47Uv/5SVWPro87N7+MC4nJIi0x3KBNHl8XRj/n0VBcJM4JsbIn
         fAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0/WzDWmZUq8jX07GulngkcAUpVh4+cRWNFXLGvNWEeI=;
        b=U3rpehEqejKEHA2kjcyID55Y7F80x5v3jzHLI1Czj9GJFgT2L0+GB0b5x1S7ljP9vP
         ZZW9NiREiqpJ3XNtjR8CInzaXnSyynn+q311LmzBFh+nph9ke0xO/KAaQScEQbvvL7cJ
         Zw7VpSzuHhdx6lES8lpl9S2eESDKXRLVSSANvzkvQLI+AuECun0D7WUq42fE8E2cteQC
         IAcN0Z+VOy7oAxICRYP6zKiReDjnyMCGD6VgmVRDSBZ2cI3e2KEH3snZ4LIvdC4qeXdK
         mKL+HXpRuvsfEKEJhmkto+GlQeXf64mNdhW+cvvRXEvkb5DXjjQVcY982ZAuJQVWRiZw
         Y9wg==
X-Gm-Message-State: AOAM530o6j88RxDG7+ZbIBlHeZ3OBMAwL5FsNAEG/iOrF4DXeadP2TWs
        a9E4XJEa/qHRNhMzg0g6YUCamjc85JXiF9lTL2Ycww==
X-Google-Smtp-Source: ABdhPJxejiVBTFHqJSReqWobCTdyXBoqP09rUgnZRGuUJ0BDPBL7l/yP5EGzb2L9O7fWjR1kVxCSdLoVbVmALPmrNdk=
X-Received: by 2002:a2e:a22c:: with SMTP id i12mr5959649ljm.267.1626210239553;
 Tue, 13 Jul 2021 14:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210601183002.26176586@canb.auug.org.au> <CACK8Z6Fp-_oRkC-dQ4U5y6ZUrr7Q3U084PiP+Q9daYstpps+aA@mail.gmail.com>
 <YLosn8r6pg4AUC14@kroah.com>
In-Reply-To: <YLosn8r6pg4AUC14@kroah.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 13 Jul 2021 14:03:23 -0700
Message-ID: <CACK8Z6GGXXv3G6po5Adfsw7=vHMij7Cpxu2mwjRmCDT70mkGhw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the usb tree
To:     Greg KH <greg@kroah.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+linux-doc@vger.kernel.org
+Jonathan Corbet

Hi Jonathan / kernel-docs people,

On Fri, Jun 4, 2021 at 6:37 AM Greg KH <greg@kroah.com> wrote:
>
> On Tue, Jun 01, 2021 at 10:39:42AM -0700, Rajat Jain wrote:
> > Hello,
> >
> >
> > On Tue, Jun 1, 2021 at 1:30 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > After merging the usb tree, today's linux-next build (htmldocs) produced
> > > this warning:
> > >
> > > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Unexpected indentation.
> > > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Block quote ends without a blank line; unexpected unindent.
> >
> > I'd be happy to send a patch to fix this, but I didn't really
> > understand what needs to be done.
> >
> > Here is the relevant documentation update in the patch:
> >
> > +What:          /sys/devices/.../removable
> > +Date:          May 2021
> > +Contact:       Rajat Jain <rajatxjain@gmail.com>
> > +Description:
> > +               Information about whether a given device can be removed from the
> > +               platform by the user. This is determined by its subsystem in a
> > +               bus / platform-specific way. This attribute is only present for
> > +               devices that can support determining such information:
> > +
> > +               "removable": device can be removed from the platform by the user
> > +               "fixed":     device is fixed to the platform / cannot be removed
> > +                            by the user.
> > +               "unknown":   The information is unavailable / cannot be deduced.
> > +
> > +               Currently this is only supported by USB (which infers the
> > +               information from a combination of hub descriptor bits and
> > +               platform-specific data such as ACPI).
> >
> > I'd be happy to send a patch if you can point me what needs to be done
> > (or let Stephen / Greg / some one else do it if it is easier to just
> > do it instead of guiding me).
>
> I do not know what the "right" thing to do here is, sorry.  Maybe one of
> the kerneldoc people know?

Can someone familiar with the documentation and html docs let me know
what is wrong with Documentation/ABI/testing/sysfs-devices-removable
that is resulting in this warning when doing "make htmldocs":

> > > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Unexpected indentation.
> > > Documentation/ABI/testing/sysfs-devices-removable:2: WARNING: Block quote ends without a blank line; unexpected unindent.

I looked at the file line number 2 and it just seems inline with other
similar files in that documentation folder.

Thanks,

Rajat

> >
>
> greg k-h
