Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD42F293A
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 09:35:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfKGIfk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 03:35:40 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45558 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfKGIfk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2019 03:35:40 -0500
Received: by mail-lj1-f193.google.com with SMTP id n21so1242926ljg.12
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2019 00:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XWbS4SdBYwL/ccROShNKX81fMjG6lxwrEjt2noFM/g4=;
        b=VL6srznpuYCV6D/0lZVlzDN+dlBUW4KvdMm/FC0QPAchGwVCGmPRjDRkZOrwPG+bUb
         mNYDV75Rh9xdzW2sxvyv3ZLhGTEliWMqctGp3AcrRZso3pAuFdFIZaQ8EAjHPdDBttto
         d5xpGBhs9szzSBHAxyLA1Ijgkm/emiQCBJprzDHKVgPRZ6UHUOugftCl7bhusCW5Sw+O
         anCvH2HLSKaTShd2wpaPlo3ztvLzJxsEW2rDXvluQx8Kzym4Slex22gz04piaWkfObU5
         paEuwRx3DOdxXNsfLj1qWXuKfJFLfh11I1KqhIh9IZCs3Yxq7rbejByObTbbHOs5Z9sT
         g6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XWbS4SdBYwL/ccROShNKX81fMjG6lxwrEjt2noFM/g4=;
        b=UEHbpNORHXTHwQ/qMz9Q5siAwlpIZkshXUeP0zZP++hgThU31S+4I2GRXCPJuZHZ6Y
         wBetDz59I3tF+DKmUFMYhXtDZWwRiCwLkLH4VQL95tPUdGzhwLF+beY/fm8DJSQo09DZ
         f/2AJQcC35M68qg5BnA6PX+XEBBHY9Qjc1ROmcdD2GykRbD7diG8dIU6sOtdzybzjY1x
         zLieMpyNPeZPkNxUiSZa4er+jsOwD8D7z8CP0BpnQz26psfdjmLcc2lB++majPx73ynM
         FOcL8BaWfsrNnExpzdkuINlsvUevJhcx/yC5v+0nHYljf7iuEShGpe+GQy+rP1Z7bQD9
         kMcg==
X-Gm-Message-State: APjAAAX2drlUESf6STV5QbYdsRzZF7/0jhNRtf3jyt0VdsPzprRvtDUA
        NwBicEXoqBlkeBUvs3jmiEKvG6JI68Cqti6psAT6jw==
X-Google-Smtp-Source: APXvYqzLDy5kAcOhUPus7hOmfrlIFJdTpXZx1CGpWRbjO0h59ftvmHkp6F8fGRO+IoMHNXYUgHfXo8+pTOKnk5Y6Zyk=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr1400915lji.191.1573115738391;
 Thu, 07 Nov 2019 00:35:38 -0800 (PST)
MIME-Version: 1.0
References: <20191105174359.01cb034f@canb.auug.org.au>
In-Reply-To: <20191105174359.01cb034f@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 09:35:27 +0100
Message-ID: <CACRpkdbhKF_N_ydVLPzCBnaV12fJWRSkmun9uaH1vhbxSwGmuA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the gpio tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 5, 2019 at 7:44 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the gpio tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> WARNING: vmlinux.o(.data+0xbd3f4): Section mismatch in reference from the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(unknown)
> The variable bcm_iproc_gpio_driver references
> the (unknown reference) __initconst (unknown)
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
>
> (and similar for x86_64 allmodconfig)
>
> Introduced by commit
>
>   6a41b6c5fc20 ("gpio: Add xgs-iproc driver")

Mark Brown finally hunted this down and fixed. It should be
fine in my for-next branch now.

Yours,
Linus Walleij
