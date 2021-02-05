Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89733109F2
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 12:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhBELK1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Feb 2021 06:10:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbhBELH5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Feb 2021 06:07:57 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C761C061786;
        Fri,  5 Feb 2021 03:07:16 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id my11so6520568pjb.1;
        Fri, 05 Feb 2021 03:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nhU2mG//9BiHxfOHGEyX4R2P+B0rQePtnOzA7WvugBo=;
        b=ub0craqaAfA6SIaKFIUTQyc3gR/X3+ZokWLMxMtEG1CfDLWoaojnksd8bgR8Ukar8F
         KsVdeZfDqPwQ7QEMhlGkSw85OYOb/0qP1uDeqAjCLGnpHZnRYVfyVAPDZ8Qzwz07xVL+
         DQJLm1UNrypr0leMTBsZWJeq1jEU1fnHIGF2WqDiAYwAu8wmZ3TtfnSh8HzP8YdMYims
         +vxV6mFZfzkRzvuMydO91vbvlPKSpXMs+MA2XcsyozcA/n+eYTyxI/ZXf2WMTdcRgMto
         2aduFMoJMbUhlpxJGSvTPGggnAMvwIIRzHrjym+zP54h/N1DoM60dx85ucVKNQOFf3qN
         Q7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nhU2mG//9BiHxfOHGEyX4R2P+B0rQePtnOzA7WvugBo=;
        b=Ut/q6/jngQRBi1mmIQj3W26q7Z+Cl+sl1bSGU1FvWQrhrsSytG04SA8hHcEksBJ7Ja
         dUaQcDrfEpL6TFaFl2jxznLXRBbhp4smZTznYb4HAhUQRdWNL5C/qs3jhrzDr8xE6y67
         C2UTYlIPkgOFiTIBJNO86FhyUeVhV8seMYKzJC030nYjKP9x4SFQsx2Pk5QpOtvGIhe9
         snaPYCVA2/dI3mMSoz8aWNGpul7Klk3mrvxsaVshE+XI7VOG32MuAtAibqE+qDvqlfdR
         jsM2Td0oJQ9iU28QvKh5W6tkusklibSYHnbTYzwrv6HUnzlONhLvUkrkIxQrq7Qbowwa
         GY+g==
X-Gm-Message-State: AOAM5304ce32RXVna1MiP6UhSquUUGEyf5ggkpoiX0nUTtzOzgfWcmi5
        w3DEKas4XJYMrHHtL5s4Qo+/0B/9SFyH2CVdgmI=
X-Google-Smtp-Source: ABdhPJzIsiRDxMPtSxoHGSTBvJJCZvHfnres8cQ9vFRuI2omv6Pg/k51VMnFe3zrd/k0F4m0rL+DRnYivOm/mvw5i68=
X-Received: by 2002:a17:902:b190:b029:df:fff2:c345 with SMTP id
 s16-20020a170902b190b02900dffff2c345mr3486428plr.17.1612523235627; Fri, 05
 Feb 2021 03:07:15 -0800 (PST)
MIME-Version: 1.0
References: <20210204155846.5aef94a8@canb.auug.org.au> <CAHp75Vct=jSQxu187hwz4Wrc_xRKiTmKFt_bgT-m-z=iW31drg@mail.gmail.com>
In-Reply-To: <CAHp75Vct=jSQxu187hwz4Wrc_xRKiTmKFt_bgT-m-z=iW31drg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Feb 2021 13:06:59 +0200
Message-ID: <CAHp75Vc_xJFpUECZenOYEyJ6YDzfDFmJe9cTeGh0x-c_fKQPHw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 4, 2021 at 11:04 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>> Today's linux-next merge of the drivers-x86 tree got a conflict in:
>
> Thanks. I already asked Patrik yesterday day if DRM missed to pull an imm=
utable tag I provided. I think they can pull and resolve conflicts themselv=
es. Alternatively it would be easy to resolve by Linus by removing Kconfig =
lines along with mentioned files,

Patrik, I have sent a PR again, so you may consider pulling it, thanks!

--=20
With Best Regards,
Andy Shevchenko
