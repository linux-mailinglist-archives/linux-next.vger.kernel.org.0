Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C6F365EA7
	for <lists+linux-next@lfdr.de>; Tue, 20 Apr 2021 19:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbhDTRc4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Apr 2021 13:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbhDTRcy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Apr 2021 13:32:54 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91FDC06138A
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 10:32:22 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id r9so59485531ejj.3
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8gplG+9IWvQuoNRL+JXMPE+0PdJp+Z/VjGIXtau6h+I=;
        b=h11A4XqVQ5m+6C611s/dtODxxzHe4778dEl548tUa84MqdLN/1XV7WK1IMzUSSN9Od
         VnvgJdVbSHQ/ImL9hfmZeA/wPSbzQWrsgOeMqo4LrMFTgKVLQXo/kssnETIoiOSNqXF2
         +9CKxEzjfMwY19mG4Z7SY4V9KjsQEt4vbNotk2uwPu8nZYZW2of5Fu6ATNssl2Jl+ADN
         KprCeg0geSqGm1BuM/VAe8s2otgrvGsf50x9RNc8/FX5fX/n4m1wYTTYc3OgXUnis36k
         6JhVjFqzN1QdwciBjvJBIkgOj6l410ZvUVqd9RdJqPWewVChWgInz7coHNkFB8O18R2f
         UZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8gplG+9IWvQuoNRL+JXMPE+0PdJp+Z/VjGIXtau6h+I=;
        b=Eipzt3IKWa2z6ZqDfLoI2wep3m37/Oi6aHnKq2VT+IMpeiguuxAtcqnOiZtlbHskYW
         M7UYXA6mlNkxFPO8UxazAUe0U6UXh8XNGxLf1k+JoWWGBYoxzH36GLXeAh28NAUQYF7T
         OclU+M51YhzOz4oudgVvAmvpG3drcLT+jGQRtIx0MUvwFJJpr6Rtw4mxFO6+pojZIzKN
         oonzWoEacpHV+DNOR6sVdibk4lgN3SBTd+wQyRiyCN7Gw5HZQptegCL/X+cSU9YbLGe2
         p0dJZX44GP4/ogJj3mRNwYoviiqLm+nBdjh1po/Y46ukkUINpPlVCD6XXai4WO4xdjWA
         F8rA==
X-Gm-Message-State: AOAM5301yR1LZ0AAeScxUoOlDxRxjhuq28i/+LO9BoHA7pkLGndQ2EM6
        IlruZeJyywBuzU+peEEHL4ImGbN5Hfvlf926Kz6gEg==
X-Google-Smtp-Source: ABdhPJzOn7y5okWAFlw0xW1bqDHcjSKKZ3FzjRQhbt0MYpvhmlpKo3RbVc4qKURwgiYCMCk8hFP4aX57tXHPp1o0sM8=
X-Received: by 2002:a17:906:4e51:: with SMTP id g17mr14564426ejw.18.1618939941345;
 Tue, 20 Apr 2021 10:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYskw4f8GDnn+YngdXihFGs5vP5EekDNqECY7XKTd9cbRg@mail.gmail.com>
 <CANn89iKKXcuczM9XUbg3ntLUFMLdaJCO5ojNJ+UT4kaTVKuE+g@mail.gmail.com>
In-Reply-To: <CANn89iKKXcuczM9XUbg3ntLUFMLdaJCO5ojNJ+UT4kaTVKuE+g@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 20 Apr 2021 23:02:10 +0530
Message-ID: <CA+G9fYusGV=Qn45EvHU34VS=dkUh0DUPZkCffm=25tz+4_f3Yw@mail.gmail.com>
Subject: Re: BUG: KASAN: use-after-free in page_to_skb.isra.0+0x300/0x418
To:     Eric Dumazet <edumazet@google.com>
Cc:     virtualization@lists.linux-foundation.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jason Wang <jasowang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Alan Bennett <alan.bennett@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 20 Apr 2021 at 19:47, Eric Dumazet <edumazet@google.com> wrote:
>
> On Tue, Apr 20, 2021 at 3:45 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > Following kernel BUG reported on qemu-arm64 running linux next 20210420
> > the config is enabled with KASAN.
> >
> > steps to reproduce:
> > ----------------------------
> > - Build the arm64 kernel with KASAN enabled.
> > - boot it with below command and you will notice
> >  /usr/bin/qemu-system-aarch64 -cpu host -machine virt,accel=kvm
> > -nographic -net nic,model=virtio,macaddr=BA:DD:AD:CC:09:10 -net tap -m
> > 1024 -monitor none -kernel kernel/Image.gz --append "console=ttyAMA0
> > root=/dev/vda rw" -hda
> > rootfs/rpb-console-image-lkft-juno-20210414125244-133.rootfs.ext4 -m
> > 4096 -smp 4 -nographic
> >
> >
> > crash log:
> > -------------
> >
>
> This is the fifth report, have you tried the proposed fix ?
>
> https://patchwork.kernel.org/project/netdevbpf/patch/20210420094341.3259328-1-eric.dumazet@gmail.com/

I have tested your patch now and the reported issue got fixed.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Tested log link,
https://lkft.validation.linaro.org/scheduler/job/2555544#L208

- Naresh
