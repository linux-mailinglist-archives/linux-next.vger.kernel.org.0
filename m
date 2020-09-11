Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A73265DA6
	for <lists+linux-next@lfdr.de>; Fri, 11 Sep 2020 12:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgIKKTJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Sep 2020 06:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725786AbgIKKSq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Sep 2020 06:18:46 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECFDC061757
        for <linux-next@vger.kernel.org>; Fri, 11 Sep 2020 03:18:45 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id n61so7866763ota.10
        for <linux-next@vger.kernel.org>; Fri, 11 Sep 2020 03:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DoNxlxNbIuPsWruQqDAefHo7eQS4OyQVKCYon5jAzns=;
        b=SGkhRnMnlbT74gOTMblp6PEac/FtvGU7/oCXI0PStfaFMAaiEYQeKZ+wZXDerFdgCq
         s0wf0Su5OlXjVaatpk7oyMOXE8eH1Tqqdrt6gbgyzcmgnyaW7K8jaSEQigDkew4Vgf8c
         RDaRHPnlUa1sthYmr3xrV+KD9APDUdRncCDKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DoNxlxNbIuPsWruQqDAefHo7eQS4OyQVKCYon5jAzns=;
        b=tUOV4EY8rkYApNTDTC25yCRpzgGDT2mQuESsaB0y3BcJPh6wUKUVTGp4vR36A+gt7j
         pxaTQ+eVS7f86uf40HUpwB1fvZw1GejO4UAVUIAoO76qG5EqJu9MnG7OZ4DVFbl2OgLV
         WXqaXZodTTVoFFWzF11Yat8efJnpp9vMVZAvNry0Kc1Kj4O7behc8coMfSjZ2//IRo/3
         EEya8WouPFm17lLZUB9l6fiZCUbVfv+7JuB8jXxb4NhxhWy1C3rxKiTEU2Nt65bT8rgG
         GLGupoRz7iABH8TNMIo8Enzy5XW8xLzrX/EcBpsMggvVZ8BMZofD5M6NRWh4vENcJAD6
         5PfQ==
X-Gm-Message-State: AOAM530dJ6o/eKjy2c1ZgrOccA9z/1Ds/t9Ox0IwvurVkPWT7LRSgUU6
        CVqqNVSHKvqvZYmFwTTlTdkA/0caVACZCc4aAm3MmoaondiOSQ==
X-Google-Smtp-Source: ABdhPJyHpz1BnSX7k/8JqYSfIdwi6r34xVtvgoPYKkXRT797jtCU9YqXMUbHaCGZtMtJP2mCAPuCm2/dd5v/pIZ1mkQ=
X-Received: by 2002:a05:6830:1d8a:: with SMTP id y10mr797377oti.92.1599819524962;
 Fri, 11 Sep 2020 03:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200911111731.48a324d0@canb.auug.org.au>
In-Reply-To: <20200911111731.48a324d0@canb.auug.org.au>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Fri, 11 Sep 2020 11:18:35 +0100
Message-ID: <CAM9ZRVuzw2a2DJF+L9OHCikkVz6A5Y7=DX507XOrobwoBqA-Bg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 11 Sep 2020 at 02:17, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>   drivers/net/dsa/microchip/ksz9477.c
>
> between commit:
>
>   edecfa98f602 ("net: dsa: microchip: look for phy-mode in port nodes")
>
> from the net tree and commit:
>
>   805a7e6f5388 ("net: dsa: microchip: Improve phy mode message")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/net/dsa/microchip/ksz9477.c
> index 2f5506ac7d19,b62dd64470a8..000000000000
> --- a/drivers/net/dsa/microchip/ksz9477.c
> +++ b/drivers/net/dsa/microchip/ksz9477.c
> @@@ -1229,12 -1229,15 +1229,15 @@@ static void ksz9477_port_setup(struct k
>                         ksz9477_set_gbit(dev, true, &data8);
>                         data8 &= ~PORT_RGMII_ID_IG_ENABLE;
>                         data8 &= ~PORT_RGMII_ID_EG_ENABLE;
>  -                      if (dev->interface == PHY_INTERFACE_MODE_RGMII_ID ||
>  -                          dev->interface == PHY_INTERFACE_MODE_RGMII_RXID)
>  +                      if (p->interface == PHY_INTERFACE_MODE_RGMII_ID ||
>  +                          p->interface == PHY_INTERFACE_MODE_RGMII_RXID)
>                                 data8 |= PORT_RGMII_ID_IG_ENABLE;
>  -                      if (dev->interface == PHY_INTERFACE_MODE_RGMII_ID ||
>  -                          dev->interface == PHY_INTERFACE_MODE_RGMII_TXID)
>  +                      if (p->interface == PHY_INTERFACE_MODE_RGMII_ID ||
>  +                          p->interface == PHY_INTERFACE_MODE_RGMII_TXID)
>                                 data8 |= PORT_RGMII_ID_EG_ENABLE;
> +                       /* On KSZ9893, disable RGMII in-band status support */
> +                       if (dev->features & IS_9893)
> +                               data8 &= ~PORT_MII_MAC_MODE;
>                         p->phydev.speed = SPEED_1000;
>                         break;
>                 }
> @@@ -1276,22 -1280,21 +1281,30 @@@ static void ksz9477_config_cpu_port(str
>                          * note the difference to help debugging.
>                          */
>                         interface = ksz9477_get_interface(dev, i);
>  -                      if (!dev->interface)
>  -                              dev->interface = interface;
>  -                      if (interface && interface != dev->interface) {
>  +                      if (!p->interface) {
>  +                              if (dev->compat_interface) {
>  +                                      dev_warn(dev->dev,
>  +                                               "Using legacy switch \"phy-mode\" property, because it is missing on port %d node. "
>  +                                               "Please update your device tree.\n",
>  +                                               i);
>  +                                      p->interface = dev->compat_interface;
>  +                              } else {
>  +                                      p->interface = interface;
>  +                              }
>  +                      }
> -                       if (interface && interface != p->interface)
> -                               dev_info(dev->dev,
> -                                        "use %s instead of %s\n",
> -                                         phy_modes(p->interface),
> -                                         phy_modes(interface));
> ++                      if (interface && interface != p->interface) {
> +                               prev_msg = " instead of ";
> +                               prev_mode = phy_modes(interface);
> +                       } else {
> +                               prev_msg = "";
> +                               prev_mode = "";
> +                       }
> +                       dev_info(dev->dev,
> +                                "Port%d: using phy mode %s%s%s\n",
> +                                i,
>  -                               phy_modes(dev->interface),
> ++                               phy_modes(p->interface),
> +                                prev_msg,
> +                                prev_mode);
>
>                         /* enable cpu port */
>                         ksz9477_port_setup(dev, i, true);

Looks good to me wrt my patch "net: dsa: microchip: Improve phy mode message".

Thanks,

-- 
Paul Barker
Konsulko Group
