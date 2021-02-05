Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C996310A18
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 12:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhBELRS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Feb 2021 06:17:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbhBELPP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Feb 2021 06:15:15 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF92C0613D6;
        Fri,  5 Feb 2021 03:14:34 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id a25so7332398ljn.0;
        Fri, 05 Feb 2021 03:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jodvZXZJV/ktuYkXeYXaYKMnlFJkJCqmkyDrOT8X24s=;
        b=ZN+zXLUn5VPc3YjkaZtNDZEFmrBZTl3+BFCRaLRH2MBCUPMr4kH2YiWrUebhenNPdS
         lMglSCGlmEXkjJded4JC3sTkfCoP9oKgjrsU2yfKZHzAdNov5+A7Eh3EbFjT9hnVQy11
         vsg8TPoRC+2CU9oDe1WjYHyHzCgf2Qb8XP6d+Q9iFB0fD5VOB3d/9Nt0S8R0lfHOZOjx
         2wR4pij7Vao99UWQ7HGadIRtuwMzy+de7kazaiOgaD7XfsuvO3MeHDEGh0hrSFhq63wy
         B4yBuk5Gx+Jg9xZexvyq/qM9n4bxTAjylQt4279jGPAy/U3azN8q77P0bFLm/ZznTZjJ
         ENUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jodvZXZJV/ktuYkXeYXaYKMnlFJkJCqmkyDrOT8X24s=;
        b=R3lXwID9ewf3pIZ4xLFYF8ILIwtiaZMUd4TwSyaGrIMtls8EG3xZywaGEN6JSaFwbF
         ZfheDLbu1GE/qh7RKx3252t11s6clbwFV/qpeWufAyRIkjoWxK4z0UrqWUSt1JlmU6JD
         X0Jxlk87h6Q2eRWVhkDLXkavIMc0keOEEboj0qZVmmI7PKi0W+2QwNlE9++r4duKESpE
         ukQmsdPeJnMLqgme8i9g1ItEIgEfnGkWAl15mUfiRPpfpoaiO6Do+o7xiLI5emRKCbyh
         lOOBT5lSB1JnFMDYBgPIKQS/fQHtnh/fttevNMRua5o18MAt0gof3IUSaANpY0CovwpU
         5doA==
X-Gm-Message-State: AOAM532ybA6UzfCGJMgSNd58kjNAzXUwEmELu43bpUw2VdKevskc03P/
        7b9rwwxkDt/rH78+DUr/caV6c/7vzTakxoTyEMuD13EQYlc=
X-Google-Smtp-Source: ABdhPJxiIcmAg+6rvfRXrVJAwTv++V3HK7scgangGoU/StB/uTu2dCddy1o1UCYxLpfbZBSmMzcu//AII6B9tr1Cd5o=
X-Received: by 2002:a2e:a201:: with SMTP id h1mr2411016ljm.130.1612523672809;
 Fri, 05 Feb 2021 03:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20210204155846.5aef94a8@canb.auug.org.au> <CAHp75Vct=jSQxu187hwz4Wrc_xRKiTmKFt_bgT-m-z=iW31drg@mail.gmail.com>
 <CAHp75Vc_xJFpUECZenOYEyJ6YDzfDFmJe9cTeGh0x-c_fKQPHw@mail.gmail.com>
In-Reply-To: <CAHp75Vc_xJFpUECZenOYEyJ6YDzfDFmJe9cTeGh0x-c_fKQPHw@mail.gmail.com>
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Fri, 5 Feb 2021 12:14:21 +0100
Message-ID: <CAMeQTsYK5GoL=VNB0CPrGi0Y-804N1q24dkii20OuV8=ckhmuA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 drm-misc tree
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 5, 2021 at 12:07 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Feb 4, 2021 at 11:04 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >> Today's linux-next merge of the drivers-x86 tree got a conflict in:
> >
> > Thanks. I already asked Patrik yesterday day if DRM missed to pull an i=
mmutable tag I provided. I think they can pull and resolve conflicts themse=
lves. Alternatively it would be easy to resolve by Linus by removing Kconfi=
g lines along with mentioned files,
>
> Patrik, I have sent a PR again, so you may consider pulling it, thanks!

Daniel, is this something you can pull into drm or ask one of the
drm-misc maintainers to do?
