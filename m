Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0754A454F5C
	for <lists+linux-next@lfdr.de>; Wed, 17 Nov 2021 22:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbhKQVca (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 16:32:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:49476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232742AbhKQVc2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Nov 2021 16:32:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71B9B61AD0;
        Wed, 17 Nov 2021 21:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637184569;
        bh=yczZOD+UYGVAHIW6mYc4tCBqxv2S/YOU4PbfztHpSww=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OdnWfP1NS3QkFNbDXPZmaHwQODAJgt9HoPQrDZJfr5F4Z1mmCGBkbBkc3ny5SbRUZ
         GuD0qLsi2/36cfVT5ZZHixdqKkNj3cb5yJF6jgVtCdRLYBymx8K3VY/rtFZhlI2Cf+
         YX3xCXDkYLJUmpBHMPNNi+Vur0pdznom4iTkqk8GHecevacBW64az2+naOyDG3wKXv
         m8jn5fuMsfv42J1vYSARs4bfEhodYlj67Msyf++vFPyQanUgqyf9ltt5xu6j9GE8hr
         EnsENjDTtzDBpxzFQJsZI40F6Xx05PzeIDbOlgs/7afbwRkJND6aOk04XNR0iWx1Qp
         awwrXOZqvuAqQ==
Received: by mail-ed1-f47.google.com with SMTP id y12so17127296eda.12;
        Wed, 17 Nov 2021 13:29:29 -0800 (PST)
X-Gm-Message-State: AOAM530d+uCQ/mQ+xFqcOmT+11Q5kXl9+QVFCe7ut031PPq9rSK3/kFn
        N0JpmIfKG3Vg46QnMdCr3eUSdYUsHfPpTekb5w==
X-Google-Smtp-Source: ABdhPJy41q7mQ5K1qxypSYLF0ZlM22uMN2eY7A2GUD5iYB1t8v9kj5HkzhhUBXkuBjqIt6vfoV/nUwJKLdpxosT+jzc=
X-Received: by 2002:a17:906:fcbb:: with SMTP id qw27mr25498207ejb.320.1637184567883;
 Wed, 17 Nov 2021 13:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20211116105112.4c99853d@canb.auug.org.au>
In-Reply-To: <20211116105112.4c99853d@canb.auug.org.au>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 17 Nov 2021 15:29:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL0bWTW_yYS8A8kE2Q5GxUZr-C8DV9bduDrwpZob1+1kw@mail.gmail.com>
Message-ID: <CAL_JsqL0bWTW_yYS8A8kE2Q5GxUZr-C8DV9bduDrwpZob1+1kw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio-brgl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 15, 2021 at 5:51 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the gpio-brgl tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpio/gpio-xlp.c:300:16: error: 'GPIO_VARIANT_VULCAN' undeclared here (not in a function)
>   300 |  { "BRCM9006", GPIO_VARIANT_VULCAN },
>       |                ^~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   ea708ac5bf41 ("gpio: xlp: Remove Netlogic XLP variants")

Here's the fix needed. Bartosz, let me know if you want a proper patch.

diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 814cc34aef97..c15ca977016c 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -297,8 +297,8 @@ static int xlp_gpio_probe(struct platform_device *pdev)

 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xlp_gpio_acpi_match[] = {
-       { "BRCM9006", GPIO_VARIANT_VULCAN },
-       { "CAV9006",  GPIO_VARIANT_VULCAN },
+       { "BRCM9006" },
+       { "CAV9006" },
        {},
 };
 MODULE_DEVICE_TABLE(acpi, xlp_gpio_acpi_match);
