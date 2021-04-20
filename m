Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1625A365B03
	for <lists+linux-next@lfdr.de>; Tue, 20 Apr 2021 16:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbhDTORe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Apr 2021 10:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbhDTORd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Apr 2021 10:17:33 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE93C06174A
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 07:17:00 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id i4so5598885ybe.2
        for <linux-next@vger.kernel.org>; Tue, 20 Apr 2021 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wWa/Pvzykr9jxpXsZVGAYuoX86X+fgUShL4fzcLfV1k=;
        b=rxkxBUOfV9PeFmI8f4UzV30pWj7o2G5EMnBAUucaJYciyE3r2PYkSbB4wBLA76+mVw
         g/ytbkuqljIFseX4QssJ1DniLoUd5DVTWewWzhuXEu3KH4JyvwR+8QOZJShwy+Op+rRF
         33b13XgoxWeypl0NcwLVSWifS/KBfCHUDEFa0uanALE6thx5yf7TpXO3OQpaTt0x0Uiq
         uIqErfEyGBUSkzG9guSsD+MNbHBUJ9JBBO6dBtWoTAikQZBgJgrEkvaJrfzrhZw5kT86
         bOFQyWv59mj0zPN3UBU6rXQtRGuhOggK0zUYJcpSlDluoc9Y06vSGd3JMrDLjuRJKcgC
         ZOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wWa/Pvzykr9jxpXsZVGAYuoX86X+fgUShL4fzcLfV1k=;
        b=dSG727PkPEEYRF7MDUwnQpEgfHlFrQ+o4QS7VBx0gCEzyFzh5wMXsKaW/zkQNp16Tz
         3OIrCysFMZFtDIxKfblxFS5iugQ2f0+SqN1uidDLTGE8ioXNtmHpZS+WH8tnKJnMhkaQ
         gzhQJ739cofVQp+Rdpqs3uLucqLfb52UkBPxe6O3rnak0PGmAS0YVQCQPiy131u84emP
         VShfyPj/hSVHcnt8JtwjR0cNhi0JH8a1xRfTAWn87XZq9omCw1FwjVTkB8LDmgrH+3zT
         ViwMkSbtK5tQPIRxQ2MoBz2TQFg314+XCl63BiuK0271t0yllK6/crppIqnN3kPcrgTs
         TC9g==
X-Gm-Message-State: AOAM530C97diFZmY9FyDRf/u0NRZIGwPzSyQoCfidh49QZz3Ylbf840K
        HhRZ89nYvjxoWtYBk3yqvTqVoMo2IfodPhLODAawuw==
X-Google-Smtp-Source: ABdhPJwcojOkAiBJUuT7EFTGaIOyskZb+NL+/fvTT6dzWoPHzaSCq09qM1Msn7okEt4IgVBpCc1Q9JnDUhsPdJVZJWU=
X-Received: by 2002:a25:4883:: with SMTP id v125mr23500327yba.253.1618928219291;
 Tue, 20 Apr 2021 07:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYskw4f8GDnn+YngdXihFGs5vP5EekDNqECY7XKTd9cbRg@mail.gmail.com>
In-Reply-To: <CA+G9fYskw4f8GDnn+YngdXihFGs5vP5EekDNqECY7XKTd9cbRg@mail.gmail.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Tue, 20 Apr 2021 16:16:48 +0200
Message-ID: <CANn89iKKXcuczM9XUbg3ntLUFMLdaJCO5ojNJ+UT4kaTVKuE+g@mail.gmail.com>
Subject: Re: BUG: KASAN: use-after-free in page_to_skb.isra.0+0x300/0x418
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
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

On Tue, Apr 20, 2021 at 3:45 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Following kernel BUG reported on qemu-arm64 running linux next 20210420
> the config is enabled with KASAN.
>
> steps to reproduce:
> ----------------------------
> - Build the arm64 kernel with KASAN enabled.
> - boot it with below command and you will notice
>  /usr/bin/qemu-system-aarch64 -cpu host -machine virt,accel=kvm
> -nographic -net nic,model=virtio,macaddr=BA:DD:AD:CC:09:10 -net tap -m
> 1024 -monitor none -kernel kernel/Image.gz --append "console=ttyAMA0
> root=/dev/vda rw" -hda
> rootfs/rpb-console-image-lkft-juno-20210414125244-133.rootfs.ext4 -m
> 4096 -smp 4 -nographic
>
>
> crash log:
> -------------
>

This is the fifth report, have you tried the proposed fix ?

https://patchwork.kernel.org/project/netdevbpf/patch/20210420094341.3259328-1-eric.dumazet@gmail.com/
