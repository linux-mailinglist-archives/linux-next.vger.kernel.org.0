Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BE51ABDC1
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 12:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504752AbgDPKSu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 06:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504723AbgDPKSi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Apr 2020 06:18:38 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF10C061A0C
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 03:18:37 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id x18so4201777wrq.2
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 03:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bUgfZ1bVCEadOZTn6f1WciIfWFiFPg/98WcfAuR2O9Y=;
        b=neHbmbx5sAGir0PnAQ/D0CdHbHTYy41SFD1mfLHdYTdWZWXaf9HrZKS6E3TDFXLcjB
         iouvCxXn/CurBtMicgunwGwxGstfsW04hgoChvZS+ynuJAK3pwU4qeRJYNbEkXwgomaW
         cCEZ5jS0r8+mawov09ywm/xrFqxvFPH2JMzc+IfZpR+BMn0dJPOKh5hoit4bPs/Sugus
         b5x0y63Q5V2+oDmwcBTtpe/XKHY6imwAsXwYTXyeWjm1FsgkosvSOmFdkzRuJpd/6ayS
         HSjj/7oaEbBjpmJoMfeogug+l1hSkio/jdTmzwIogqi6ANdKBmYKriFLX5CYpCACquDD
         Vrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bUgfZ1bVCEadOZTn6f1WciIfWFiFPg/98WcfAuR2O9Y=;
        b=kQ+sKfumUpk/ZTj7DLGJzNEeAS4w/SqvisGSraCzOmSiW7vq67KVE09V7c2ZaicNto
         uO0vxhb74pQmdsBrO1Tw24jyriC5kxU8GNuaWgcGKITrJMuzofB37h8pIozH//UEpkue
         JuhkPEpfI1nRar8LWdfHNogYGJNh1J6DJtsx1AlOb9EvvvzYhFOK9tYRbrhmcuAuqe0u
         0pbZWSGFhdYFWXmI0nPBkcLG6tHL/aHyVpL/taoSUzVJvGfTWtQ0A27epHSDK1/sBImp
         OgJm0m8j6/Iy15XbmMhxj0OscP6MkyrwPK41fBTn375UgZZ4oeHNJ5f2t87kNV/mCp1y
         uQIw==
X-Gm-Message-State: AGi0PuadhFPe2E0hXSsSWMh6zKlJ51Ti1JagAw/BkygOTLxY9oNcZbLO
        jakiB6eAzIzuNV+c+YXItagRiLTopD4bd+6t3UB9/Q==
X-Google-Smtp-Source: APiQypIUpDnaOLHlAzMeJ5S8ccmu3GZXIYg78W8x4VUdLtn7ttxLAovX/kG1WJ9eOD0opjIOCDNjG6IVLuW8JkaHe8Y=
X-Received: by 2002:a5d:53c4:: with SMTP id a4mr32561971wrw.47.1587032316508;
 Thu, 16 Apr 2020 03:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <202004140833.632892C8@keescook> <dad3abd9-c890-eb7b-efa5-f662b096f78e@i2se.com>
In-Reply-To: <dad3abd9-c890-eb7b-efa5-f662b096f78e@i2se.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 16 Apr 2020 11:18:18 +0100
Message-ID: <CAPY8ntDa6HOUjTjOOLPd76d5q4fQUg0C25NtQDrsrpJ4pPtp=Q@mail.gmail.com>
Subject: Re: Coverity: mmal_setup_video_component(): Code maintainability issues
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     coverity-bot <keescook@chromium.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stefan

On Tue, 14 Apr 2020 at 17:49, Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> Hi,
>
> Am 14.04.20 um 17:33 schrieb coverity-bot:
> > Hello!
> >
> > This is an experimental semi-automated report about issues detected by
> > Coverity from a scan of next-20200414 as part of the linux-next scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> >
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by commits:
> >
> >   Sun Mar 29 14:44:58 2020 +0200
> >     1a59532382a6 ("staging: bcm2835-camera: Move video component setup in its own function")
> >
> > Coverity reported the following:
> >
> > *** CID 1492591:  Code maintainability issues  (UNUSED_VALUE)
> > /drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c: 1014 in mmal_setup_video_component()
> > 1008          if (overlay_enabled) {
> > 1009                  /* Need to disable the overlay before we can update
> > 1010                   * the resolution
> > 1011                   */
> > 1012                  ret = vchiq_mmal_port_disable(dev->instance, preview_port);
> > 1013                  if (!ret) {
> > vvv     CID 1492591:  Code maintainability issues  (UNUSED_VALUE)
> > vvv     Assigning value from "vchiq_mmal_port_connect_tunnel(dev->instance, preview_port, NULL)" to "ret" here, but that stored value is overwritten before it can be used.
> > 1014                          ret = vchiq_mmal_port_connect_tunnel(dev->instance,
> > 1015                                                               preview_port,
> > 1016                                                               NULL);
> > 1017                  }
> > 1018          }
> > 1019          preview_port->es.video.width = f->fmt.pix.width;
> >
> > If this is a false positive, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make
> > sure fixes get into linux-next. :) For patches fixing this, please
> > include these lines (but double-check the "Fixes" first):
>
> thanks for the report. The finding is correct, but the issue already
> exists before. The intention of my patch was to increase readibility,
> not to change the behavior.
>
> My problem is that i'm not aware how to handle the error case here.
>
> @Dave Should we bail out or ignore the error?

Neither vchiq_mmal_port_disable nor
vchiq_mmal_port_connect_tunnel(inst, src, NULL) should fail - that
would imply something seriously wrong within the firmware.
I'd suggest ignore the error - if something is seriously wrong then
it'll fail and bail later on.

Looking at vchiq_mmal_port_connect_tunnel, if dst is NULL (as in this
case) then the first thing it does is call port_disable, same as
vchiq_mmal_port_disable. The call to vchiq_mmal_port_disable can
therefore be removed. Same in vidioc_overlay.

  Dave

> Best regards
> Stefan
>
> >
> > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > Addresses-Coverity-ID: 1492591 ("Code maintainability issues")
> > Fixes: 1a59532382a6 ("staging: bcm2835-camera: Move video component setup in its own function")
> >
> > Thanks for your attention!
> >
>
