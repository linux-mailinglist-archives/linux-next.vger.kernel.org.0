Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19AC283D95
	for <lists+linux-next@lfdr.de>; Mon,  5 Oct 2020 19:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbgJERid (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 13:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729136AbgJERic (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2020 13:38:32 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E5BC0613CE
        for <linux-next@vger.kernel.org>; Mon,  5 Oct 2020 10:38:32 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 26so9498699ois.5
        for <linux-next@vger.kernel.org>; Mon, 05 Oct 2020 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K3fmY8B65FY8SIpToaxxUh/kyVCliYtzTy5qo1pqLfg=;
        b=JTTQVtC7DwMcbYUCGVCTcRciwOigUIvJI0cMNYyAFbt3RXhx8PLLjc8r/lYfIFXq/X
         rsMRB8k4Z14n7n8jGnhuqAg5L1Hn8tgb/IkzupoLZsnGF6l4ocfoun0gBDaU8+sN9WT1
         /nZXEsjtyNvejF3Dl6fft5EgPa1xIhheOt9Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K3fmY8B65FY8SIpToaxxUh/kyVCliYtzTy5qo1pqLfg=;
        b=D1tBpht5JkK6ThHhbz3gTnzDnwsJxSwLjJ4N9HM9zk1X2+2GY10VxF5W11caHd1gEG
         dfahJrqIUAwfexWEQeW54/Y1ilD5OMiP9YelWVSfTvKJwyQ3ZjYSHrc0pO0fLl/RqCCT
         dJMd6gLO6JWXZE8KjEMDPczOg9lgskX7qRgdV1ouN3zj2UKZ7miUi/pSjpCe8ZBXCm7W
         yi8Uk9Fchyq22RO4wA2kYM8jQuShV/vYdX5oD3EJFv78XC142FBq7VIBUhpI85dPG/cZ
         DuMaypIay4m4TvTBl4bzFuBtCqaw2FRWFhFhwoouxzhBgVukERFHlOO7/k+mTWNRA63C
         ctpw==
X-Gm-Message-State: AOAM531/xfjOL0lWQspzbf1zfjiYdQ6WjgFHv9jJ1eealQ4YuXQHKPr2
        ZD4IX8qYRHCf/6TKebaFfPYpHytV6RYvFskrob2B9ZmX31R17A==
X-Google-Smtp-Source: ABdhPJy1B5YA31ileropbZ/3QrFV3MxDor1CNYNEnSDq8FAOpeT9++wtKAh9+aWPxk78OTbq1tdOzW7C/9azhF+kzvw=
X-Received: by 2002:aca:c6cc:: with SMTP id w195mr253449oif.101.1601919512035;
 Mon, 05 Oct 2020 10:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200930165212.GA8833@lst.de> <20201004141758.1013317-1-paul@crapouillou.net>
 <20201004195921.GA556605@ravnborg.org> <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
 <20201005230150.5637fa42@canb.auug.org.au> <20201005140534.GT438822@phenom.ffwll.local>
 <B3HQHQ.7DOFKW9A9TEX1@crapouillou.net>
In-Reply-To: <B3HQHQ.7DOFKW9A9TEX1@crapouillou.net>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 5 Oct 2020 19:38:21 +0200
Message-ID: <CAKMK7uG4BQZ3YijZUfztiF_E=jq9ZGoNy6FFsyb2J6ZWUbFM8Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM buffers cached"
To:     Paul Cercueil <paul@crapouillou.net>
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

We need the revert in drm-misc-next-fixes or the drm-next pull request
doesn't work out. So cherry-pick over, fix up conflicts, push the
tree, and don't forget to fix up the conflicts when dim rebuilds
drm-tip. Also tell drm-misc maintainers what you've done, they
probably want to do a backmerge to clean this up a bit once the
drm-next pull request has landed.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
