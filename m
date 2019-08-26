Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 565999CDE8
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 13:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730744AbfHZLQ6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 07:16:58 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40584 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfHZLQ4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Aug 2019 07:16:56 -0400
Received: by mail-lf1-f65.google.com with SMTP id b17so11975656lff.7
        for <linux-next@vger.kernel.org>; Mon, 26 Aug 2019 04:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BoFNGyhD/IpzgrNu/s4nyMOqx8vjiMZXotZwnxN0fmQ=;
        b=zsw9Nmnuox1dtcDek+VxNObd5JtV9AetPOXXNqU5QQAGc/yFDb721tTak0xA/y8yjr
         xanBopG8k/irYaRWOGZhFV2Czdtd8AClacur10EiFlexX0Ctwvd06HjML60yPoh7+f5m
         vywc5WoZKgTSX9lnv9kmRrWjoi/0ro0ift3DHfj5xDcNXiIqmoIQr5Ybyd280tQ+ZOsc
         kU8A44nndrz7I64UTBZVKNTb5R13C+0YjVX/KeMaUMevL0DpP7nv9DQokfIQLddQSRpn
         wcQbb7W1H5gnosf0fdBGQezB8WjDmAv8bl+x6LPG1WO4iwmwMin1I+fLwqWicY38+x1w
         6PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BoFNGyhD/IpzgrNu/s4nyMOqx8vjiMZXotZwnxN0fmQ=;
        b=E+Wmas3RKMokCU1KigfF8KphTEQNhBDc1GqA6ZhYrxE9Co+5Vdxujx7J24XYr1Gvwk
         Nwzm8KZ5wqhzW7eyn7tI2yOmybly0N05NwpiW/aR+1a98yP0l/tVdSMVR/EIfCeTu2BU
         QYIqe2LOLanDdc3nqOQ0RPJD7msgZHxWbXJ/Rpn/TuDGvv0QwRHfkD7iR2GxCwNtRqwl
         eHEDaGetD7SJIAVBmVNj5rgTU+rpW5O5YUdBvVJTzDj6E5AdxoC95Oo2raYF59qM2zkE
         nYFhMieGoIvvA0KRBxIdMpgNnNMu2ZkxOvtou6iguciKYDsevXmFUAu35XgaZnBp+oRl
         gixg==
X-Gm-Message-State: APjAAAWJmmTS1vTVXb+uIAiAQL6ftlcA8sgV1XVgqrVahYtAsBnBmkjE
        xPH2+bmJQvN5Um1AwkwZu4edkvQ1xABW7af8ix3B8Dhq+UE=
X-Google-Smtp-Source: APXvYqwq+n3IWbnz++AwYjY5hi9PwQS3DsryoTO85Roujdt6TlsqwVJGaCILrK7a/BuelN2HGE61Fz7GYYwHWJZ3XhQ=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr10463633lfy.141.1566818213972;
 Mon, 26 Aug 2019 04:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190826210252.20ca44ba@canb.auug.org.au>
In-Reply-To: <20190826210252.20ca44ba@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Aug 2019 13:16:42 +0200
Message-ID: <CACRpkdbfe+az-Cgymd0Y+-m1MqvdSNb-H1XO0923cQ7RwEWanA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pinctrl tree with the gpio tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 26, 2019 at 1:03 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the pinctrl tree got a conflict in:
>
>   drivers/pinctrl/bcm/pinctrl-bcm2835.c
>
> between commit:
>
>   82357f82ec69 ("pinctrl: bcm2835: Pass irqchip when adding gpiochip")
>
> from the gpio tree and commit:
>
>   e38a9a437fb9 ("pinctrl: bcm2835: Add support for BCM2711 pull-up functionality")
>
> from the pinctrl tree.

Ah that's so unnecessary. I will take the patch out of the GPIO
tree and put it into the pinctrl tree instead, thanks for noticing!

Yours,
Linus Walleij
