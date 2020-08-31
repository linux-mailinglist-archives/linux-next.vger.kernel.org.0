Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C452C257354
	for <lists+linux-next@lfdr.de>; Mon, 31 Aug 2020 07:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbgHaFeB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Aug 2020 01:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgHaFd7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2020 01:33:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B36FC061573;
        Sun, 30 Aug 2020 22:33:58 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u18so4176802wmc.3;
        Sun, 30 Aug 2020 22:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZDEON+YiSW0YCSec5Nu5L0EktnuUvNjTc14NjRB7JKE=;
        b=LPN3jT/PTqKlR2lZSgNunOp1H6kJ1/4T1MhBuqtbUeNvDSvF40OX3bDD8E3k7FqntV
         zG2B4hBde0AW65QsIHGewoTGXbr/B6uJh6iDUNCFgVpuVFOztKcS9soSx6N9iOI7lim+
         kGeQrcpaYNzAtqc5oc2EOJ/itQ//L/sEBmhWR6KMO0C1P4etBYE0zdcSrytoeJSKg5r5
         BQqOxbA26wSnVJokGLEqNVaH43jCx3tx1YCDN8NB3PffyeAkjDT8yMlTwdp/TNiUhEJb
         iK/jutqDxQnnsbbno3A5ByYPPinpzVNfB2q1qrvK4JNNM6QnprM6rcD2bM9sIyVULPga
         VPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZDEON+YiSW0YCSec5Nu5L0EktnuUvNjTc14NjRB7JKE=;
        b=TZew1eDXkbScI1+BIw9c7hUTICdERA4VYX8e3cKenCmsVmcjI/hJPFdu8Ski5jhzqQ
         n+CyIMauEb07udDSj5fuw7tzKoW/Y4dgfZ3YlLaKZI1oeFMLNxPS27qngBuXzzUSNuDq
         kzdLoiLxVQzTeeDtWQvxOLArhDV5fWHGAGD6RPjjxo6zkIRYBuHgF4A6NvC+RcdX+Xo8
         gxD1yw6MMscCo95lmIq2AJ3Mxegwdz8mcHCpxK1HG4y147839nX+jmRb4al5EjcUPCTg
         kclIRSvkMulxWNpp/GclHHZtd3y1RozXk3Lqjh/kdEn6gU42fLTynCwin0EqIRGnyiR5
         Y2vw==
X-Gm-Message-State: AOAM532qfnDZZvKh7ipQJnH/eSeAPyjPXDC1uvhUzeUuJnF+nYOZmalC
        kbha0jwasMAG/6Nofi/RAFH64z1vVb2oZNGsM24=
X-Google-Smtp-Source: ABdhPJyJjEzdp5HeU3Ef2tiRuhk4m/xlRlX3jpGxweA9NEFIkrZlBPpBBfH8HNOxR/70yJAH5exQiNVdwbcoaeL6DUU=
X-Received: by 2002:a1c:f003:: with SMTP id a3mr88385wmb.170.1598852037062;
 Sun, 30 Aug 2020 22:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ1xhMUpqtKMuGUZdComskTqd0oOKCfDuVQT3+c13u=NSJLkBw@mail.gmail.com>
 <CACAvsv6zUi=3mZTg11Y_6CVYkpCSO0RY-5+GiBZz+2EXCDmD-g@mail.gmail.com>
In-Reply-To: <CACAvsv6zUi=3mZTg11Y_6CVYkpCSO0RY-5+GiBZz+2EXCDmD-g@mail.gmail.com>
From:   Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date:   Mon, 31 Aug 2020 08:33:20 +0300
Message-ID: <CAJ1xhMVOZAM=VwtNdYmjWY9NjVOpr0JJXi0Civ5Pgb9f4og49w@mail.gmail.com>
Subject: Re: nouveau PUSHBUFFER_ERR on 5.9.0-rc2-next-20200824
To:     Ben Skeggs <skeggsb@gmail.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        ML nouveau <nouveau@lists.freedesktop.org>,
        Linux-Next <linux-next@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 31, 2020 at 7:30 AM Ben Skeggs <skeggsb@gmail.com> wrote:
>
> On Tue, 25 Aug 2020 at 17:21, Alexander Kapshuk
> <alexander.kapshuk@gmail.com> wrote:
> >
> > Since upgrading to linux-next based on 5.9.0-rc1 and 5.9.0-rc2 I have
> > had my mouse pointer disappear soon after logging in, and I have
> > observed the system freezing temporarily when clicking on objects and
> > when typing text.
> > I have also found records of push buffer errors in dmesg output:
> > [ 6625.450394] nouveau 0000:01:00.0: disp: ERROR 1 [PUSHBUFFER_ERR] 02
> > [] chid 0 mthd 0000 data 00000400
> Hey,
>
> Yeah, I'm aware of this.  Lyude and I have both seen it, but it's been
> very painful to track down to what's actually causing it so far.  It
> likely is the commit you mentioned that's at fault, and I'm still
> working to find a proper solution before I revert it.
>
> Ben.
>
> >
> > I tried setting CONFIG_NOUVEAU_DEBUG=5 (tracing) to try and collect
> > further debug info, but nothing caught the eye.
> >
> > The error message in question comes from nv50_disp_intr_error in
> > drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:613,645.
> > And nv50_disp_intr_error is called from nv50_disp_intr in the
> > following while block:
> > drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:647,658
> > void
> > nv50_disp_intr(struct nv50_disp *disp)
> > {
> >         struct nvkm_device *device = disp->base.engine.subdev.device;
> >         u32 intr0 = nvkm_rd32(device, 0x610020);
> >         u32 intr1 = nvkm_rd32(device, 0x610024);
> >
> >         while (intr0 & 0x001f0000) {
> >                 u32 chid = __ffs(intr0 & 0x001f0000) - 16;
> >                 nv50_disp_intr_error(disp, chid);
> >                 intr0 &= ~(0x00010000 << chid);
> >         }
> > ...
> > }
> >
> > Could this be in any way related to this series of commits?
> > commit 0a96099691c8cd1ac0744ef30b6846869dc2b566
> > Author: Ben Skeggs <bskeggs@redhat.com>
> > Date:   Tue Jul 21 11:34:07 2020 +1000
> >
> >     drm/nouveau/kms/nv50-: implement proper push buffer control logic
> >
> >     We had a, what was supposed to be temporary, hack in the KMS code where we'd
> >     completely drain an EVO/NVD channel's push buffer when wrapping to the start
> >     again, instead of treating it as a ring buffer.
> >
> >     Let's fix that, finally.
> >
> >     Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> >
> > Here are my GPU details:
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
> > 210] (rev a1)
> >         Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8a93
> >         Kernel driver in use: nouveau
> >
> > The last linux-next kernel I built where the problem reported does not
> > manifest itself is 5.8.0-rc6-next-20200720.
> >
> > I would appreciate being given any pointers on how to further debug this.
> > Or is git bisect the only way to proceed with this?
> >
> > Thanks.
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

Thanks a lot for getting back to me about this.
Please let me know if there's anything else I can do to help track this down.

Alexander.
