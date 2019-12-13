Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4F511E195
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2019 11:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfLMKFl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Dec 2019 05:05:41 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45941 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfLMKFl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Dec 2019 05:05:41 -0500
Received: by mail-lj1-f194.google.com with SMTP id d20so1947785ljc.12
        for <linux-next@vger.kernel.org>; Fri, 13 Dec 2019 02:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oghGxm/Txk0ydLM4nCCqz7DnsmQdDf+yHTL2M4IdnQ4=;
        b=rieWzSbFKmC8n8c1EKomfpWiGNBNZOamuuF/BIH9a6QstQiu6xHzKvkOPMGxW2R5xk
         /DerBZzH/XnbtYU1ke2XupRADC/0Vsoqo37GYn+Gj0MPr/vK7UOcFrM97kDvIjSH2LVi
         dUALb7ggGS0+mIOsIp3GELyzxEbUMwcsRtaQjFGEm2UPfFhH54QNN3mldjStaUanzGZi
         AvZ9ygknSfvCrhEMaU7ntTNie9HXRapIWOYtCsbNFDXuFRM7H425lV+w5GJ0BhNo3NEU
         qVYteKoU86vXvsm5P/6GB4RclQrKXt2vTTXN0H1j7N9jm1BDBjB97IFkbwzW98F65ErX
         YmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oghGxm/Txk0ydLM4nCCqz7DnsmQdDf+yHTL2M4IdnQ4=;
        b=hliMejHQnt5ciuxTB77W/72hd9S4rdPIEP0G8dyuKtiyBBC13KG4fjzIMzJ+Lj+8f3
         uIllTaNjdMe7vX3g6COysIrmR9OLl/kSUe+FqCdZnalh33aoBJYmmmEwfJ3hg3smdtml
         RvQcLUvZtVIAii873mfe5Evg0e56FaX2vy9AGwxMhZBZrg2t93lOXOMx6HmMOkw7vjzI
         JYpzSeKLBieZvMfR7evi5Tg6pED6C7qlaMByEBKvlKwqL1uXfmrmwQLuVgWcJp5yIvt4
         ZDatRyrJ7HnRHlCSxsyl2C/bxcNpYUtMDyeb508q6y7m0k23ciqgqkqQ33iTJ06OC/mK
         p2wQ==
X-Gm-Message-State: APjAAAU3qdMD8WKYbpgIzEIb2aKkbAUEY0x3iQxc7fZeJjfArdiEy9YN
        H68juvT2fUZn+oYPnOPlioOOA97cINuJb8gD7dtP/A==
X-Google-Smtp-Source: APXvYqwRqbc5Uv+MaUhx8941W65wH+aMUFGZmpuTY3+LqoZli2TemQ+jVAOAjbDZ41EX0OqkMjz9VnJj/mMWpj88iLE=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr8822965ljm.233.1576231538948;
 Fri, 13 Dec 2019 02:05:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575514110.git.rahul.tanwar@linux.intel.com> <ba937f271d1a2173828a2325990d62cb36d61595.1575514110.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <ba937f271d1a2173828a2325990d62cb36d61595.1575514110.git.rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 11:05:27 +0100
Message-ID: <CACRpkdZnr7JfqTKksOnpTdLq=3g8nfPbeqidJrLu9+cG9ry7Xw@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: Modify Kconfig to fix linker error
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 5, 2019 at 4:01 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> Fix below linker error
>
>     ld: drivers/pinctrl/pinctrl-equilibrium.o: in function
>     `pinconf_generic_dt_node_to_map_all':
>     pinctrl-equilibrium.c:(.text+0xb): undefined reference
>     to `pinconf_generic_dt_node_to_map'
>
> Caused by below commit
>
>     1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a new SoC")
>
> by adding 'depends on OF' in Kconfig driver entry.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>

Patch applied for fixes, thanks!

Linus Walleij
