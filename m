Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C27BD1985D9
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 22:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgC3Uxo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 16:53:44 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:35651 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbgC3Uxo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2020 16:53:44 -0400
Received: by mail-il1-f174.google.com with SMTP id 7so17297219ill.2;
        Mon, 30 Mar 2020 13:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=YObKUxfYW0zylUpa1+9jHO1hB3bhJSUNMPTlouupWFI=;
        b=MGUhDwIRFYRiH0IM+sBONn3B7kaD4w6MynsYnb2/DxeR4H1x1PQMemH2nrqsHqBc/n
         0FDatwUJKV+f8eX4oCXGc99IPKf+8aigih9OTuCFZMUxV3IXGJdenbmshsvLt33CFnf4
         6og9JqhIeU1p1rRpmWi+QdOjwg1evSVHNxoU4PBZsceF7zCzxjP3VyUH30iuIj+7ieby
         hQcbCHkPMJl2vzLhFJQ7cfFBxW6oeQ45p2e2texd6G9owMmnChjDAoxeT09s2IbzOEdZ
         ZXfdtg16VoZHMo5nB/2HYcEpBmZlEkAGV5XpeN7gP9qL88vdeTzsLV/VWNaQ0OY255T+
         Fhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=YObKUxfYW0zylUpa1+9jHO1hB3bhJSUNMPTlouupWFI=;
        b=sDUeXcyKdM+uzBz4MDltV7plx9a0VKz9WUorOL+YIGJVPy6HMleanCeJi+gweuo+9C
         kmUUESFy3V+3NPnoe4d1h06GbGdvW9eAE8Ya+w96h2hXV1bw/XF6sgvyWTYpu1sdKNNV
         Q5rGvCzZO2F2PFtX7eW06enPVGBWSoczB7IZSN9qfDBRVlRjopay4Tx3cLemfsAlH4G3
         g0o36T9LPHNK9V0iJn3gwXn36nywB29DHpwmfV7iZGDpxFz9oaqpR1uh1sLsoE87r3nH
         d4Fd2u08SjZpUMaSfhNDQCrjePtAy7PZKOATEWJ7u1iT9DU58KWnDQdGEcjPYRivyREb
         9TOQ==
X-Gm-Message-State: ANhLgQ1JtimhxdOY5bt8EhoOxQoMA2LZW54fbqsLhzSZB3IQkoZYXIuY
        f3fTU9wtU25MQ8MYTDv/TFgDBkU/n6VoRL39NOww5B4v
X-Google-Smtp-Source: ADFU+vtiCBj0YjO+xzy3BgIXZNpZQtB8oTRnzSIETu/cKAKHD7XqLMOcF7LdKdxP43fJ8s7Pe9P19ac+oqHuJboUVvE=
X-Received: by 2002:a92:49da:: with SMTP id k87mr9920124ilg.149.1585601622891;
 Mon, 30 Mar 2020 13:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200331073852.54e44b21@canb.auug.org.au>
In-Reply-To: <20200331073852.54e44b21@canb.auug.org.au>
Reply-To: bjorn@helgaas.com
From:   Bjorn Helgaas <bjorn.helgaas@gmail.com>
Date:   Mon, 30 Mar 2020 15:53:29 -0500
Message-ID: <CABhMZUUuCRAgSd7ar90v4AC4q7u-vC04YTnX7j=a=vNaKvEY_g@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the pci tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 30, 2020 at 3:39 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   fb3ffadca55a ("PCI: pciehp: Fix indefinite wait on sysfs requests")
>
> Fixes tag
>
>   Fixes: 54ecb8f7028c ("PCI: pciehp: Avoid returning prematurely from sysfs requests")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'
>
> Did you mean
>
> (probably not :-))
> Fixes: 54ecb8f7028c ("Linux 5.4-rc1")
>
> or
>
> Fixes: 157c1062fcd8 ("PCI: pciehp: Avoid returning prematurely from sysfs requests")

Fixed, thanks!
