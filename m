Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8D5392F5E
	for <lists+linux-next@lfdr.de>; Thu, 27 May 2021 15:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236319AbhE0NYZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 May 2021 09:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236159AbhE0NYZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 May 2021 09:24:25 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37F9C061760
        for <linux-next@vger.kernel.org>; Thu, 27 May 2021 06:22:50 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id b9so7971853ejc.13
        for <linux-next@vger.kernel.org>; Thu, 27 May 2021 06:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F6Le48yySUXtg5irh612DxJV0ThDpNjubmPh9ONRREU=;
        b=NrM6I3/GtRKc1jvexr9ipqUjAi2Zynre2XYX7INEQx3Ri0IqdPFXrnO7XRLZo8Ei+o
         PW8HiY5O8UEUH+5YBWHB2wINtenedRxAInj/8eZT3tiV7E8YGTQzMRj+aQ0ok3Hcns6O
         ih1JPtP7gTVFmyHXwQloyFYKMvXSJTA0jqIPoLH+HLn4h/iAtzYBbKSr/C7DyitUCQfE
         HGdJZLf8L+AWpIwqwtgu4/e81JpnNjGrQJgIdj/95IVOSJC2NgCUGidOuS+9MjHzD10d
         aaHigrLCHRyIkeqG3ucR4cWqGEQ0iLLc/Izwe0LzbDfsSxcbXz63sWVqaIGK0meTQBmk
         2O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F6Le48yySUXtg5irh612DxJV0ThDpNjubmPh9ONRREU=;
        b=nJs6RFgQA/9wiAd2LI21A1erFBbadZnh5fWsJ1GLvRHLqlhY/1H/eX505qJEjyF+wf
         uWaVVrvTyDceAkyojCYp3yFTviRUiUBBAGZtFfy9L03SeGqrw+vWAuweV462z9QRXDmW
         sWv58KBWJi/5CA3NzKUc4iNdxuuVd4ogrncMEBkGOij1HyPhybHBpKA6J119oYiImuBI
         k8zaEOsSXHDW+vfhl1QsX0t64QoUcsBEVkotwQYXqwvAL7seCuTAWjkK2Q14hNrO4TnL
         9lbV4rN6G5av59VeErxjhVKXVrhl/EqB26EU4nZTMkoFzmhwhZ5pqfdPEq2VOu5GXIBN
         6z+Q==
X-Gm-Message-State: AOAM533ZYV3mbzwUGw5UqbBBKiP1ZbQgwDuCYzs4Mo4vb8ENHS7CQ5vH
        GXZlKV27NA72jeRuQDUs1EyJ1e2z5omrh4A9lZufcA==
X-Google-Smtp-Source: ABdhPJxTWbMzx5XVop5RIt8d9sPGQtruNUl1KWBfD0Tb9KM4p2OAPXlG8yEY0Q5piIsqT6RYxL2VeMala/rkGX58DDM=
X-Received: by 2002:a17:907:9041:: with SMTP id az1mr1343151ejc.133.1622121769181;
 Thu, 27 May 2021 06:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210527152631.1e70fba2@canb.auug.org.au> <nycvar.YFH.7.76.2105271012430.28378@cbobk.fhfr.pm>
 <e5ee42f7-b0eb-40c7-e54f-8e16e8b97b68@redhat.com>
In-Reply-To: <e5ee42f7-b0eb-40c7-e54f-8e16e8b97b68@redhat.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 27 May 2021 18:52:36 +0530
Message-ID: <CA+G9fYtZxQKDjHQHAbcm9cG05WJtcuv2Ld+mVspe2QXed+r+PA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the hid tree
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

FYI,

On Thu, 27 May 2021 at 13:56, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 5/27/21 10:14 AM, Jiri Kosina wrote:
> > On Thu, 27 May 2021, Stephen Rothwell wrote:
> >
> >> After merging the hid tree, today's linux-next build (x86_64
> >> modules_install (on an allmodconfig build)) failed like this:
> >>
> >> depmod: ERROR: Cycle detected: hid -> usbhid -> hid
> >> depmod: ERROR: Found 2 modules in dependency cycles!

LKFT build system also found two types of build errors while building for arm
on today's Linux next-20210527 tag.

1)
arm-linux-gnueabihf-ld: drivers/hid/hid-core.o: in function `hid_is_usb_device':
hid-core.c:(.text+0x1f4): undefined reference to `usb_hid_driver'
make[1]: *** [/builds/linux/Makefile:1252: vmlinux] Error 1


2)
INSTALL_MOD_PATH=/home/tuxbuild/.cache/tuxmake/builds/current/modinstall
depmod: ERROR: Cycle detected: hid -> usbhid -> hid
depmod: ERROR: Found 2 modules in dependency cycles!
make[1]: *** [/builds/linux/Makefile:1875: modules_install] Error 1


> >>
> >> I could not easily figure out what caused this (it may not be the hid
> >> tree, but probably is), so all I could do was leave it broken.
> >
> > This is caused by Hans' patches (CCed). I will be dropping those today, as
> > the proper fix needs a bit more of rework.
>
> Ack, sorry about the trouble these patches are causing.

Thanks for investigating the root cause.

- Naresh
