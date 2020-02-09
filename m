Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9E9E156C96
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2020 22:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbgBIVYk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Feb 2020 16:24:40 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41756 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727592AbgBIVYj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 9 Feb 2020 16:24:39 -0500
Received: by mail-lf1-f65.google.com with SMTP id m30so2745144lfp.8
        for <linux-next@vger.kernel.org>; Sun, 09 Feb 2020 13:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eSee5NK6rMwjcOB2vYpOQ3otLhrgERKcdaUqTAoj0vc=;
        b=Vq7OLj9qWUS+0Xf+qXZzIh79iP+ijjjlhTE3Myev+SZmQM0Vq7vODPSmjZMmWykhPi
         Qs7D+CQVo4yUs+Mh4IcTBeqpksFHFMA+3l9GsiSq7q4YIjm+scKGht1wY1Vb6Tu8b9CA
         1m0snQXIHcauCaYxJQgfR9difYFbGhRpxRxIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eSee5NK6rMwjcOB2vYpOQ3otLhrgERKcdaUqTAoj0vc=;
        b=avxbSK4s2GnMbwGfZWwL07TnDtDe/QoBm9vCJi1lGAv7nZOb0F7IIizla0gef45Ecf
         4zS8drL9KEIzqKXnd25TMQf1CKQpYd4iHqmVWDwQ7uAV/KnYqIVgGAgetHfg1+Nhir57
         jMIS6SLcdO8/MAmRx+bEenxTy82DCpGnqnlGvOg4Fszd6GBQl6UFooDJ8bB/keIHdqUL
         ZF2umvhPq/IXRFhJTLXarmOTChmvzcxPEf6DXVSWt0IiN7yTyQDL7Tu4MoutgdjZIwar
         jO23hsInZ/P5+KCl6jc/AyVpj3WS95zOEZQ8g4FgZvD1ZvEYjXm9ZF7D0M1AJTp+DQzN
         9MBg==
X-Gm-Message-State: APjAAAWZEfyTPhQgpaHMzJUGTn+Ewba6S/GLyeJ8/lVV+g/ZHMarex7x
        vXQnCBR7kpN+gth86RZLJdRZeiDxvwk=
X-Google-Smtp-Source: APXvYqxTS1k+nQD3zjwP0O5PH0eaWg4LS6extCf5zPpCiHCIGZfHwZI5FhYlfVcMYRNiODG1xXM0Kg==
X-Received: by 2002:a05:6512:7c:: with SMTP id i28mr4503706lfo.131.1581283475572;
        Sun, 09 Feb 2020 13:24:35 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id d22sm4302570lfi.49.2020.02.09.13.24.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2020 13:24:34 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id c23so2755422lfi.7
        for <linux-next@vger.kernel.org>; Sun, 09 Feb 2020 13:24:34 -0800 (PST)
X-Received: by 2002:ac2:4839:: with SMTP id 25mr4397561lft.192.1581283473980;
 Sun, 09 Feb 2020 13:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20200210080821.691261a8@canb.auug.org.au>
In-Reply-To: <20200210080821.691261a8@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 9 Feb 2020 13:24:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiM9gSf=EifmenHZOccd16xvFgQyV=V=9jEHR7_h3b0JA@mail.gmail.com>
Message-ID: <CAHk-=wiM9gSf=EifmenHZOccd16xvFgQyV=V=9jEHR7_h3b0JA@mail.gmail.com>
Subject: Re: linux-next: build failure in Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Zenghui Yu <yuzenghui@huawei.com>, Marc Zyngier <maz@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Feb 9, 2020 at 1:08 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Just building Linus' tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> arm-linux-gnueabi-ld: drivers/irqchip/irq-gic-v3-its.o: in function `its_vpe_irq_domain_alloc':
> irq-gic-v3-its.c:(.text+0x3d50): undefined reference to `__aeabi_uldivmod'
>
> Caused by commit
>
>   4e6437f12d6e ("irqchip/gic-v4.1: Ensure L2 vPE table is allocated at RD level")

Ahh. 64-bit divides without using do_div() and friends.

Is GICv4 even relevant for 32-bit ARM?

            Linus
