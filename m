Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2116314CC5
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 11:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhBIKSn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 05:18:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231432AbhBIKQd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 05:16:33 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22244C061793
        for <linux-next@vger.kernel.org>; Tue,  9 Feb 2021 02:15:45 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id w2so30297668ejk.13
        for <linux-next@vger.kernel.org>; Tue, 09 Feb 2021 02:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zeO3sY4fbSBwh5uWv4Oqzo1Gi6tqlkYzvN/i5rqf3qU=;
        b=spw3R/IQ+ixH4qYVWy1fvUGlrOVdgInPdBvFjZeqyzbtEOqs1+X95sHl/HLLJ4VLLk
         f/zCWcsYsIGVxFo3DtWdh4loosYk4PDaki0Z66TJGdxEAn1X4uIO411xgU0w+TS32yES
         TgNwhsLlSeYp5zOMvXfik/iwxbNg17Iyfg06o/2vjPLVXLaoyrwuS7yL3HPnMSj+CEc3
         WCn62lyieJuwi6KV8qL+aBhCZ8EGrYKboHcc1VltCLlKjUceTsCqerLZaAod0AlBTQot
         bk/P7uysddwFDcJ+kmfogaC16xgoU6kBDC61vr+NFK0MDgPRUaQMOmzc5Xf+Fylvnazi
         WHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zeO3sY4fbSBwh5uWv4Oqzo1Gi6tqlkYzvN/i5rqf3qU=;
        b=EZetL2GV6BNrSz+sKKiK48lfya51Noi9lGth4yLMVkAFEAJm4d8FBdNsciwzXU9GtW
         7BT4erK/Xr/q0sCqbGzBQb7keF3kM+lqN96ZZ+8S0U7f+I6UQTUXYvadHGqCq5ekhNvw
         SbvSJub+ED0dkYFWtxC/RGoslPLgv9nDaiGkU+fs5u3DaQdePGYQi9mdZ9/U+ClTS+ET
         eUSr/WchPJXTquhSPEGtqyIl2LuNcO2Ltmdh+8SYCUa9/PuP4Ecg8d68sUH+1pwmjUaL
         bUjj3vfvz47PSzDDRTbBEh2JyGvVN7vXb7Dq+/1K6h+giGRiLPsI5EfxrtEU9ww/XyYR
         NyZQ==
X-Gm-Message-State: AOAM532zSU7FwUjo0wGmtEJYNiE6WoTJPw2aGYYJuGVzvuAaxsqUwhfL
        O+CE5heGitK3ymf1N3loGVtXE+UQ/I8wyraHXv/sYQ==
X-Google-Smtp-Source: ABdhPJyivaUoVOHT/b59A0UT7hjGtf3I5Gw7XQw0zN+7mKUdmfdZvWXnEWoEcRnJ8KO3EMcS0vOSEk4+NNJqOGmhDGk=
X-Received: by 2002:a17:906:d8ca:: with SMTP id re10mr1468224ejb.18.1612865743771;
 Tue, 09 Feb 2021 02:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20210104065503.199631-1-jasowang@redhat.com> <20210104065503.199631-17-jasowang@redhat.com>
In-Reply-To: <20210104065503.199631-17-jasowang@redhat.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 9 Feb 2021 15:45:32 +0530
Message-ID: <CA+G9fYteUN=s5Mp+BhdMPZt96B3qDa+2HwudmWgEmmrDELLPdw@mail.gmail.com>
Subject: Re: [PATCH V3 16/19] virtio-pci: introduce modern device module
To:     Jason Wang <jasowang@redhat.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        virtualization@lists.linux-foundation.org,
        open list <linux-kernel@vger.kernel.org>, shahafs@mellanox.com,
        lulu@redhat.com, sgarzare@redhat.com,
        Randy Dunlap <rdunlap@infradead.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jason,

On Mon, 4 Jan 2021 at 12:28, Jason Wang <jasowang@redhat.com> wrote:
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/virtio/Kconfig                 |  10 +-
>  drivers/virtio/Makefile                |   1 +
>  drivers/virtio/virtio_pci_common.h     |  27 +-
>  drivers/virtio/virtio_pci_modern.c     | 617 -------------------------
>  drivers/virtio/virtio_pci_modern_dev.c | 599 ++++++++++++++++++++++++
>  include/linux/virtio_pci_modern.h      | 111 +++++
>  6 files changed, 721 insertions(+), 644 deletions(-)
>  create mode 100644 drivers/virtio/virtio_pci_modern_dev.c
>  create mode 100644 include/linux/virtio_pci_modern.h
>
> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> index 7b41130d3f35..6b9b81f4b8c2 100644
> --- a/drivers/virtio/Kconfig
> +++ b/drivers/virtio/Kconfig
> @@ -12,6 +12,14 @@ config ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
>           This option is selected if the architecture may need to enforce
>           VIRTIO_F_ACCESS_PLATFORM
>
> +config VIRTIO_PCI_MODERN
> +       tristate "Modern Virtio PCI Device"
> +       depends on PCI
> +       help
> +         Modern PCI device implementation. This module implements the
> +         basic probe and control for devices which are based on modern
> +         PCI device with possible vendor specific extensions.
> +
>  menuconfig VIRTIO_MENU
>         bool "Virtio drivers"
>         default y
> @@ -20,7 +28,7 @@ if VIRTIO_MENU
>
>  config VIRTIO_PCI
>         tristate "PCI driver for virtio devices"
> -       depends on PCI
> +       depends on VIRTIO_PCI_MODERN

While booting Linux next tag 20210208 kernel on qemu_arm64 and qemu_arm
mount rootfs failed.  The root cause seems to be due to missing configs
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Then I have to force to enable this MODERN config
CONFIG_VIRTIO_PCI_MODERN=y
and which enabled
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y

and the qemu_arm64 and qemu_arm boot pass.


New build link,
https://builds.tuxbuild.com/1oEse4EFsoQr1FkKBfiLmhMCe7j/


-- 
Linaro LKFT
https://lkft.linaro.org
