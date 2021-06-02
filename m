Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F0B398356
	for <lists+linux-next@lfdr.de>; Wed,  2 Jun 2021 09:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhFBHo1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Jun 2021 03:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231649AbhFBHo0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Jun 2021 03:44:26 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF248C061574;
        Wed,  2 Jun 2021 00:42:42 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id cb9so1787994edb.1;
        Wed, 02 Jun 2021 00:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jqawwQnqmCH2L1JuHfDBRG28iyCx1ovlrnJvUUuZP0s=;
        b=JPLkJqtWBTNHqr9J8jmfvGIl8WJQ7ZxPG8qRmTnGQIQzyoZqhI4oIE0+4basDsc5Qy
         2vGJIhHFtKbwXyWRWUMJmmwPFUquejVF9dkkzd02uId2Mi2N+d6Zdx/7XiU/NhuidHxm
         pml73SHDhW8uH3UrTbb3Y/9f8FyzQydcYtM4NXsrnmRX+vMl2QaAiPe5aU5bnz+B2gUU
         OfrrqBel4bokpD0DSBgF1wvZukXEH8FNgiEvWsH6vl88Vg8t3iMxoQbzfMfS9/lsTIgU
         dSmp0g3kdW9d/EKRRcWNVl/qUC/oChzpOYMUxJzfGE2PNvGqS6wNGelV4IYBrB42cIdD
         6bHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jqawwQnqmCH2L1JuHfDBRG28iyCx1ovlrnJvUUuZP0s=;
        b=eLRbvI/j74t8sHHQ8FSHXZ9/VKSLiYg3LXsnknZifgA/54IBLroKlR9vhCbw6B41id
         ocQMISiITq469JKj+dWUNpfm3dKtlCR665mgexjUj6bu7U6GKeml2yoniG4sYouOb3iC
         LMoJzGFxLEoXHxN5pwkTS9lQ/0rgimhTGQcXoXUVkusyY4vJ+7AfLD4FkjRC5U7Am36l
         nKlp6Yq/kE5khdv4IDQ1xFLOXzc0W2FHggOR/JaO9qaOdpuK6oQkkTd/H396Yo96UzED
         sfT1UJ2H/ihNvp82TQhz29k4rMuJlaA/5g7QtJdSGNB2DQu6s5qCyNLNWxFK7ekcTX5h
         Ytpg==
X-Gm-Message-State: AOAM533/HCoUI/CRFTsPzjLxVE9oIOLSTnInRxOWWtPtGnrJCw7lla7G
        LBliqXZbknYJcVSluw0UBg2vHSv+EjVeglyJrWrWmHgjxKw8f+Ihero=
X-Google-Smtp-Source: ABdhPJzz+/WGQOrkjF6ycL1KkRictjTqcrb/NxRkjAq9YW4f20H4ughD1gldwssbn54OPSgHj/Add7UeuzbQlZL1GbU=
X-Received: by 2002:a05:6402:4c5:: with SMTP id n5mr36501854edw.322.1622619761531;
 Wed, 02 Jun 2021 00:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210602170946.37a2c6ec@canb.auug.org.au> <s5h8s3syaye.wl-tiwai@suse.de>
In-Reply-To: <s5h8s3syaye.wl-tiwai@suse.de>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Wed, 2 Jun 2021 15:42:15 +0800
Message-ID: <CAD-N9QUDnMsKA4jH2MSjiRHPYxdb_9ocay-0eTLFtR7Qsh6ojQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the sound-current tree
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 2, 2021 at 3:36 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 02 Jun 2021 09:09:46 +0200,
> Stephen Rothwell wrote:
> >
> > Hi all,
> >
> > In commit
> >
> >   b3531c648d87 ("ALSA: control led: fix memory leak in snd_ctl_led_register")
> >
> > Fixes tag
> >
> >   Fixes: a135dfb5de1 ("ALSA: led control - add sysfs kcontrol LED marking layer")
> >
> > has these problem(s):
> >
> >   - SHA1 should be at least 12 digits long
> >
> > This is probably not worth rebasing to fix, but can be avoided in the
> > future by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
> > just making sure it is not set (or set to "auto").
>
> My bad, I must have overlooked the warning at applying.

Hi Takashi,

I don't know why checkpatch.pl does not capture this warning for me.

./scripts/checkpatch.pl
0001-ALSA-control-led-fix-memory-leak-in-snd_ctl_led_regi.patch
total: 0 errors, 0 warnings, 89 lines checked

0001-ALSA-control-led-fix-memory-leak-in-snd_ctl_led_regi.patch has no
obvious style problems and is ready for submission.

Any idea?

>
> Since it's the top commit and quite fresh (just an hour old), I'll
> refresh the tree.
>
>
> thanks,
>
> Takashi
