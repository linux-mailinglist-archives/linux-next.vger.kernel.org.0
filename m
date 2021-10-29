Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B6E43FD83
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 15:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbhJ2NsU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Oct 2021 09:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhJ2NsU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Oct 2021 09:48:20 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642B3C061570;
        Fri, 29 Oct 2021 06:45:51 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id w15so38992797edc.9;
        Fri, 29 Oct 2021 06:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24MYBPQrlcyWu6iKYLYc69TS4W86uztfRC8L7A+W0Bk=;
        b=EiED0Ed9u66wgUVx8GbhGut3/tl6tbP4VfmRPk1SlWVSSA6VEcJfqHT2AdxkYN3I86
         6ffdsAPXnc5M4PqqSccYVvLQAl0/hcnKoxS3ajMdMUCsd+s1/y99AY/A6bNNAoB7n3bV
         3RvO3ZSygA9RGb4UuQnOYFY/VNQZSAsHrkoMA+YIUQ32bNsksgbe25m7aA0okaCwScVw
         oPOg87F16ivSeygw1PjuC2XlHJ7Jma2Eh7aAR71ISFrAX1db9l//7qFS3/YyE4ij/VH5
         32f2ZEg6m6VcOmWNn62dWtaSrvxw2765KUiHSqc1TkDHcUi1tBtkME0GbV6dG/8nlsIk
         VVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24MYBPQrlcyWu6iKYLYc69TS4W86uztfRC8L7A+W0Bk=;
        b=FW98CXHZevmU2pfBc5SyqTxr8KG6HmwcSnHvQHa2TOF2ipxCCfyWWzjRvt5fmV4kGa
         5vHiCf3HR0mN7OclF3WFd//hktvaKeNeMW8Rz4kllxvCMUqa3xCilnpo9M9cSAjBZEEK
         GclY9AhAC3/eBfMJ7S7JQ2DIa0ZyryAlEPnGcjrsYB6b4p731v1mFJQQEpNRxU5cuwCC
         C+eZb8X5M6Uowqv5ZJVjJDLw2rkCliT6uRP3zuKTQ572jJGcNG+51izR8q3pnbE3xyRv
         0MZr/T7Zbxv2jV5BT4QIQtnvc31emthOx8d83BLIAR2vE/hsyWsNOrhMIm60kynuIRHo
         mPDQ==
X-Gm-Message-State: AOAM533aG1GDqWEJtDsHkumkNeaMpNw5yRwbheYMb9dVdqk2zF+3TaOu
        tucyAQiOaV0ShVcmReljwpzNuVaZu/cbuaQEGg==
X-Google-Smtp-Source: ABdhPJxQ0/i0+sqvfHqwBXtJ3INT/8FY6Sk8/OPLgfBWlIgdzuGauSfJp6OoXg9HYSIVrgFlCp3VTbhn9uVJLS1lDc0=
X-Received: by 2002:a17:906:d553:: with SMTP id cr19mr13338966ejc.128.1635515149930;
 Fri, 29 Oct 2021 06:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211029132411.1bd856b0@canb.auug.org.au>
In-Reply-To: <20211029132411.1bd856b0@canb.auug.org.au>
From:   Rob Herring <robherring2@gmail.com>
Date:   Fri, 29 Oct 2021 08:45:37 -0500
Message-ID: <CAL_JsqKNsvc-JqTcTGM134rHzpaibnT21HpCwzhJNA8_a8Rydg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the pci tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Simon Xue <xxm@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 28, 2021 at 9:24 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>
>   Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
>
> between commit:
>
>   af7cda832f8a ("dt-bindings: rockchip: Add DesignWare based PCIe controller")
>
> from the pci tree and commit:
>
>   ad854f362e8c ("dt-bindings: rockchip: Add DesignWare based PCIe controller")
>
> from the devicetree tree.
>
> These were almost identical patches.  I went with the former one sonce
> it was dated later.

I've dropped it from my tree.

Rob
