Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809C8284286
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 00:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgJEWbW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 18:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgJEWbW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2020 18:31:22 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC79C0613A7
        for <linux-next@vger.kernel.org>; Mon,  5 Oct 2020 15:31:21 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id l4so6847643ota.7
        for <linux-next@vger.kernel.org>; Mon, 05 Oct 2020 15:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aGJPhjJnGizWZ9cjlMtyvbh4s8GPun/neUKltdZk0Y0=;
        b=E3BNLEwO4blu18AA9bBYPMj6KdaoOIvVuhzzTlO9SdwVRmMA2I1sF+4TC6R5gMuF/t
         70UA+qS/l9JVHRzuN/wPuWxJDfn8ax9yN4TA4/WDU/sxhXEIIfAvbsb9CcVOnvYEU0T2
         kHU/ZnYKgFMx6M0TDPusm2djOUMgcutEgfWz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aGJPhjJnGizWZ9cjlMtyvbh4s8GPun/neUKltdZk0Y0=;
        b=nI+9LwDP9NjLVDjF2b34We5UJCz1ft9netbFOp+nparlK66pZHsBXqX+/VdC32US6h
         CKax2uEjYpgPzyjbE8Yj3hElLH8G/Uxd5JPPDniEnw+kEEWte71VV3UMwza84DLi2V5x
         3vEmlwpm0LQ2JKa7cqyZIwgg10unRwtm1z4+Eos2fxUpUjHDBT5KokQKCozpo3lo8CZi
         4UPwru9twAHO1f/DQA3LWgH4XyYw7oiQJ5QKypjKi4iQogoJGuOgQ9cJudQwDJGIVg8+
         wq1+7Xnszy3EEPzYDpQ33gNjJl+DRJ+ngL1mWI7tKCOvQ5nOo4CkKpIask1vg5mMHfY6
         gb4g==
X-Gm-Message-State: AOAM531+sXUfwUuBqZy5B5dvBSn591uIiHnrRRu7BO19UU56ZmB4CgSF
        7/VMXG5gR9BZurD5D8JlKAO/ZiPJ8jGkH6wwEDWhkw==
X-Google-Smtp-Source: ABdhPJxnWbeNqcHTXdnaARCv/Zto+89buyW7FSld30l4eYbHTDn36gLjIFSYQDd9gbmM8YZlwLxRaLcHDFyluEPHV0o=
X-Received: by 2002:a05:6830:1e56:: with SMTP id e22mr967660otj.303.1601937081198;
 Mon, 05 Oct 2020 15:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200930165212.GA8833@lst.de> <20201004141758.1013317-1-paul@crapouillou.net>
 <20201004195921.GA556605@ravnborg.org> <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
 <20201005230150.5637fa42@canb.auug.org.au> <20201005140534.GT438822@phenom.ffwll.local>
 <B3HQHQ.7DOFKW9A9TEX1@crapouillou.net>
In-Reply-To: <B3HQHQ.7DOFKW9A9TEX1@crapouillou.net>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 6 Oct 2020 00:31:10 +0200
Message-ID: <CAKMK7uEB7xHgnSpnT=Hd3Cw2+uwkimF=4uQuw3NOYz1DsnMY7g@mail.gmail.com>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM buffers cached"
To:     Paul Cercueil <paul@crapouillou.net>,
        Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, od@zcrc.me,
        Dave Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 5, 2020 at 4:47 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi,
>
> Le lun. 5 oct. 2020 =C3=A0 16:05, Daniel Vetter <daniel@ffwll.ch> a =C3=
=A9crit :
> > On Mon, Oct 05, 2020 at 11:01:50PM +1100, Stephen Rothwell wrote:
> >>  Hi Paul,
> >>
> >>  On Sun, 04 Oct 2020 22:11:23 +0200 Paul Cercueil
> >> <paul@crapouillou.net> wrote:
> >>  >
> >>  > Pushed to drm-misc-next with the changelog fix, thanks.
> >>  >
> >>  > Stephen:
> >>  > Now it should build fine again. Could you remove the BROKEN flag?
> >>
> >>  Thanks for letting me know, but the fix has not appeared in any drm
> >>  tree included in linux-next yet ...
> >>
> >>  If it doesn't show up by the time I will merge the drm tree
> >> tomorrow, I
> >>  will apply this revert patch myself (instead of the patch marking
> >> the
> >>  driver BROKEN).
> >
> > Yeah it should have been pushed to drm-misc-next-fixes per
> >
> > https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.h=
tml#where-do-i-apply-my-patch
> >
> > Paul, can you pls git cherry-pick -x this over to drm-misc-next-fixes?
>
> I had a few commits on top of it in drm-misc-next, so the revert
> doesn't apply cleanly in drm-misc-next-fixes... I can revert it there,
> but then we'd have a different revert commit in drm-misc-next and
> drm-misc-next-next.
>
> Sorry for the mess. What should I do?

Hm not sure why, but the reply I thought I've typed didn't seem to
have gone out.

Cherry pick up, fix up conflict and then fix up the conflict when
rebuilding drm-tip. Please tell drm-misc maintainers, they probably
want to do a backmerge once the drm-next merge window pull is merged
in Linus tree.

If we don't fix this up then the drm-next pull goes nowhere.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
