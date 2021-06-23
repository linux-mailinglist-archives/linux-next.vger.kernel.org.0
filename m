Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5BD3B1F68
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 19:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbhFWR3a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 13:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhFWR33 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2021 13:29:29 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB64C061574;
        Wed, 23 Jun 2021 10:27:10 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id t3so4545277edc.7;
        Wed, 23 Jun 2021 10:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+KZPiHeG/Rq1ZQLgxs4APyK8yr6SPbxpLROL4ArpvqE=;
        b=c2CgtmoF2XDF8s79vK5XcvoVAhZowxI6Lq803huU5yTmEyApOzwh5MCG2G3kpqSOpU
         P5AD/ip6ALvfVsON9fY6px4Bh0u6ta5zF1eU9WMpUVYxm+6iC9J0ZrcihSAqPe+kx3R5
         Rc/yz+SPf+0XxKXN5YbcAHkpbLB8WDvo20hzJxFIoCzP3wyegyiAOgkGGRgBCCS8DF0p
         xcvJrK7ETuRjN4+W7sjAjugL3PgzcfMbzRYEZHH6iBtXvbqRzJEk5um1qyeMKX0KfEvD
         ENzZs0kDaja2q58iZc7lRb5eM3tqwaZdhC0+8qWFjfcRQ3vG6B3a2y1m/g/8bVDg13hY
         jpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+KZPiHeG/Rq1ZQLgxs4APyK8yr6SPbxpLROL4ArpvqE=;
        b=MZTkqnltFDGTJcURe52y1enWik3s9VRgKj8BmZY6J10q531ZxvIYZu0B8uH1z6cArC
         yan9yZ/YUzj4iKOjpFD87kOiSCWs7r473ZmhfWDpUrhFXdSq6Cd92E0C+MvZZMYipJMt
         zL+AXJE0BUERomBUSoDphEenCSpl4M5iHrNIdWCoP2Kdw+i1M54mridfOJKJ4etr1aM0
         d/4aJX7jPuTJ94eHCsKNlQJbPEY7ml79ZI1c/lnLhckyVT4BBbQxh06DfOq9Ogqb8f+w
         fuHZ0P5O9unftG03tPbs+UUjxXoF9J0o5SR40tTuLZcmMZC9xgpAbaXFdsXAp7uw6iii
         zfYg==
X-Gm-Message-State: AOAM530N2rkxryZMeXSCNVA2N1SXQ5DI53S/1ym2TUZwib7GCMcSHDQW
        mObpNkrLYcWcbOQUBXKwvdNu4Oj8AJicUnXzZw==
X-Google-Smtp-Source: ABdhPJwxEKceuZts//aKP7vF++I/FLJ48EXaO8JiZiPxKXTTxsNfb4fm/QRD9iZNhHU0kuRZ9hX9UWPmAcG90dZ07HE=
X-Received: by 2002:a50:9345:: with SMTP id n5mr1178741eda.289.1624469228266;
 Wed, 23 Jun 2021 10:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210622181624.57527651@canb.auug.org.au>
In-Reply-To: <20210622181624.57527651@canb.auug.org.au>
From:   Rob Herring <robherring2@gmail.com>
Date:   Wed, 23 Jun 2021 11:26:56 -0600
Message-ID: <CAL_JsqL+4FqU=jexFiXVLN-782N+Qh6DJLYoXZGitTYY2ULRBw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the
 devicetree tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 22, 2021 at 2:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>
> between commit:
>
>   c601eef1e258 ("dt-bindings: clock: update ti,sci-clk.yaml references")
>
> from the devicetree tree and commit:
>
>   c830b87a761b ("dt-bindings: gpio: gpio-davinci: Convert to json-schema")
>
> from the gpio-brgl tree.
>
> I fixed it up (the latter removed the file, so I did that) and can
> carry the fix as necessary.

As the reference is gone in the schema, that is the correct resolution.

Rob
