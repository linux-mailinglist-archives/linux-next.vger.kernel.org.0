Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D223115B7
	for <lists+linux-next@lfdr.de>; Fri,  5 Feb 2021 23:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231380AbhBEWjV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Feb 2021 17:39:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbhBEOCL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Feb 2021 09:02:11 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E038BC061793;
        Fri,  5 Feb 2021 06:01:30 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id b17so3601853plz.6;
        Fri, 05 Feb 2021 06:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9mVRXJ1/m2Ab7utnhdbSusiRKnV59wpCtJPbJHx3VCk=;
        b=XztMZPDU58th5eKVyXGkC00fgRrKZery2vGPxOREgC14W+PUEVDSGLDwsjZ3pbtnIb
         VK5gp1AbMy7mYgt4Yqm6J4GA9C1jEZty2d5ivJ93u2V3At0j/aXiopwlr6JUEd0+wTmP
         vgR8ia4Eou83XBKtXoo5kWmJC6mwXExeiAfx2Ch9KMEisFmqTbUjmpyPAvzY5kU4YCv0
         waLHPzY2kaKLl0S8IRHw4IziqfcV0YMuYHZ3eObaLh/oR2J2WiA38y4wP/X6ABcqmyKb
         zPs1v+kHpaQ4vStCh4rGN4egOcLdT6LTfZ5Qb0xK5dmwgg7Ml+yvz7faVLRLN4TbeEun
         L0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9mVRXJ1/m2Ab7utnhdbSusiRKnV59wpCtJPbJHx3VCk=;
        b=K9DGH7qrzgyW6ggjJVt9naezcx5JLMGtooeCHlWuRDulPM5W+IaXyCDldQ7WEhOqhU
         q+El/UxBhlQG2DlyCAtQtyvGJuFzoiL13X/zSB+FEsaDAST9BfIa/sPvYBHvAixLETBH
         1DAVSRA6l4fkeQBb+HkdkQIrHzD7KMi1OoMN5YZBH75GBn7hppOfPovxqS1+/Zm+c51X
         ucexnp7Y3kmP//odTpccCifAQAvwaMDVC71kdJI9KhztTXC72sWhx1nRDIZNixDRUP6r
         vB2SR7ITqf6dYMolbO5fGruNFpqHDmNSF/0ss4Y/sKab+zlZK78WxsGfYn24AYPzg2m+
         F4Bw==
X-Gm-Message-State: AOAM530usJgPHrw0EjdXhNpAQyHK63vnFkpYRsm5+sak1SNrHQ9W7HzG
        ZRewRdJWR2lHOsRtPWi5u+Ks45s2r0WK4P7Ld6o=
X-Google-Smtp-Source: ABdhPJzn7icLqSpYWC8pI6O41q0nqM43UZ+wkg65n4fjCOQg3z1XI8OGZBa87lh+5WCg8R+RKOLLNMVPvzeSiQ5Q0mQ=
X-Received: by 2002:a17:90a:644a:: with SMTP id y10mr4470679pjm.129.1612533689048;
 Fri, 05 Feb 2021 06:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20210204155846.5aef94a8@canb.auug.org.au> <CAHp75Vct=jSQxu187hwz4Wrc_xRKiTmKFt_bgT-m-z=iW31drg@mail.gmail.com>
 <CAHp75Vc_xJFpUECZenOYEyJ6YDzfDFmJe9cTeGh0x-c_fKQPHw@mail.gmail.com>
 <CAMeQTsYK5GoL=VNB0CPrGi0Y-804N1q24dkii20OuV8=ckhmuA@mail.gmail.com> <CAKMK7uFSF0cHZh6KikMf2MmBykZazE5HGA1ejJU++GWyfuTmfQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFSF0cHZh6KikMf2MmBykZazE5HGA1ejJU++GWyfuTmfQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Feb 2021 16:01:12 +0200
Message-ID: <CAHp75VeeEutQB0nX3TAfbBSOuACREChaZaTtG9zmsjX9kfPBuQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the
 drm-misc tree
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>,
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

On Fri, Feb 5, 2021 at 3:05 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote=
:
> On Fri, Feb 5, 2021 at 12:14 PM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> >
> > On Fri, Feb 5, 2021 at 12:07 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Thu, Feb 4, 2021 at 11:04 AM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > >> Today's linux-next merge of the drivers-x86 tree got a conflict in=
:
> > > >
> > > > Thanks. I already asked Patrik yesterday day if DRM missed to pull =
an immutable tag I provided. I think they can pull and resolve conflicts th=
emselves. Alternatively it would be easy to resolve by Linus by removing Kc=
onfig lines along with mentioned files,
> > >
> > > Patrik, I have sent a PR again, so you may consider pulling it, thank=
s!
> >
> > Daniel, is this something you can pull into drm or ask one of the
> > drm-misc maintainers to do?
>
> We've already created the conflict, and my understanding is that Linus
> wants to have visibility into conflict-y stuff and doesn't mind at all
> resolving conflicts. Hence for 5.12 I think we're fine as-is.

Fine with me!

--=20
With Best Regards,
Andy Shevchenko
